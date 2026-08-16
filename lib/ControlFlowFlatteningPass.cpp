#include "llvm/IR/PassManager.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/BasicBlock.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/Instructions.h"
#include "llvm/Support/raw_ostream.h"
#include <llvm/Transforms/Utils/Local.h>
#include <llvm/Transforms/Utils/BasicBlockUtils.h>
#include "llvm/IR/Instructions.h" 
#include "ControlFlowFlatteningPass.h"

using namespace llvm;

static std::string getSimpleNodeLabel(const BasicBlock *Node) {
    if (!Node->getName().empty())
        return Node->getName().str();

    std::string Str;
    raw_string_ostream OS(Str);

    Node->printAsOperand(OS, false);
    return OS.str();
}

static Argument* getlastArg(Function &F){
    Argument *lastArg = nullptr;
    for (Argument &Arg : F.args()) {
        lastArg = &Arg;
    }
    return lastArg;
}


//NOTE: for now lets assume that the conditions dont have && and ||
static void doZigZag(BasicBlock &BB, Instruction *I, SmallPtrSetImpl<Instruction*> &slice){ //needs a better name
    if (!I || I->getParent() != &BB)
        return;
    if (!slice.insert(I).second)
        return;

    for (Use &U : I->operands()) {
        if (auto *OpInst = dyn_cast<Instruction>(U.get())) {
            doZigZag(BB, OpInst, slice);
        }
    }
}

static BasicBlock* createAndBuildDispatcher(Function &F,  SmallVector<BasicBlock*, 20> &BBtoFlatten) {
    LLVMContext &Ctx = F.getContext();
    BasicBlock &EntryBB = F.getEntryBlock();

    //we add the b variable in the entry block
    IRBuilder<> entryBuilder(&EntryBB, EntryBB.begin());
    AllocaInst *allocaIns = entryBuilder.CreateAlloca(entryBuilder.getInt32Ty(), nullptr, "b");
    entryBuilder.CreateStore(entryBuilder.getInt32(0), allocaIns);

    BasicBlock *defaultBB = BasicBlock::Create(Ctx, "default", &F);
    IRBuilder<>(defaultBB).CreateUnreachable();

    
    //creating the dispatcher using 3 blocks: while loop, switch, and break
    //all cases point to the break block, which points back to the loop
    BasicBlock *switchBB = BasicBlock::Create(Ctx, "switch", &F);
    IRBuilder<> switchBuilder(switchBB);
    Value *stateVal = switchBuilder.CreateLoad(switchBuilder.getInt32Ty(), allocaIns, "b");
    SwitchInst *switchIns = switchBuilder.CreateSwitch(stateVal, defaultBB, BBtoFlatten.size());

    BasicBlock *whileBB = BasicBlock::Create(Ctx, "while", &F);
    IRBuilder<> whileBuilder(whileBB);
    whileBuilder.CreateBr(switchBB);

    BasicBlock *breakBB = BasicBlock::Create(Ctx, "break", &F);
    IRBuilder<> breakBuilder(breakBB);
    breakBuilder.CreateBr(whileBB);

    //immediately we create all the cases and makes them point to all the blocks from the vector
    for (size_t i = 0; i < BBtoFlatten.size(); i++) {
        switchIns->addCase(switchBuilder.getInt32(i), BBtoFlatten[i]);
    }

    //now, since all the cases are created and fixed we just visit each block again and for each type 
    //(uncoditional, return and conditional) we do different transformations
    for (size_t i = 0; i < BBtoFlatten.size(); i++) {
        BasicBlock *BB = BBtoFlatten[i];
        Instruction *Term = BB->getTerminator();

        //since in my design i add every block to a case, the end point of the function will also be here
        //and since the program closes we do nothing
        //need to check if it will work with multiple returns (will do it for the next commit)
        if (isa<ReturnInst>(Term)) {  
            continue;  
        }

        auto *BI = dyn_cast<BranchInst>(Term);
        if (!BI) continue;

        IRBuilder<> builder(BI);   

        if (!BI->isConditional()) {
            //for uncoditional blocks is very straighforward, we just go to the next case
            //and we create store for the b variable 
            int nextState = i + 1;
            builder.CreateStore(builder.getInt32(nextState), allocaIns);
            BI->setSuccessor(0, breakBB);
        } else {
            //we need them in order to find later in which case they currently are
            BasicBlock *trueTarget  = BI->getSuccessor(0);
            BasicBlock *falseTarget = BI->getSuccessor(1);

            //creating also the new BBs to replace later as successors
            BasicBlock *trueBB = BasicBlock::Create(Ctx, "true", &F);
            BasicBlock *falseBB = BasicBlock::Create(Ctx, "false", &F);
            BasicBlock *breakConBB = BasicBlock::Create(Ctx, "break_con", &F);
            
            IRBuilder<> trueBuilder(trueBB);
            IRBuilder<> falseBuilder(falseBB);
            IRBuilder<> breakConBuilder(breakConBB);
        
            //a simple lambda function to find in which case the target BB is
            auto findIndex = [&](BasicBlock *Target) -> int {
                auto it = std::find(BBtoFlatten.begin(), BBtoFlatten.end(), Target);
                return (it != BBtoFlatten.end()) ? (int)std::distance(BBtoFlatten.begin(), it) : -1;
            };
            int trueB  = findIndex(trueTarget);
            int falseB = findIndex(falseTarget);

            //now we just update the new BBs with the corrected indexes
            trueBuilder.CreateStore(builder.getInt32(trueB), allocaIns);
            falseBuilder.CreateStore(builder.getInt32(falseB), allocaIns);
            //and finally we connect the new BBs toward the break BB
            falseBuilder.CreateBr(breakConBB);
            trueBuilder.CreateBr(breakConBB);
            breakConBuilder.CreateBr(breakBB);
            //replacement
            BI->setSuccessor(0,trueBB);
            BI->setSuccessor(1,falseBB);
        }
    }

    //connecting the entry point with the dispatcher
    auto *entryTerm = dyn_cast<BranchInst>(EntryBB.getTerminator());
    if (entryTerm) {
        entryTerm->setSuccessor(0, whileBB);
    }

    return switchBB;
}

static void splitBB(BasicBlock &BB, Argument *lastArg, SmallVector<BasicBlock*, 20>* BBtoFlatten){
    for(auto It = BB.begin(), End = BB.end(); It != End; ++It){
        Instruction *I=&*It;
        if(isa<AllocaInst>(I)){
            for (User *U : lastArg->users()) {
                if (auto *SI = dyn_cast<StoreInst>(U)) {
                    I=SI;
                    break;
                }
            }
            BasicBlock *secondBlock = BB.splitBasicBlock(I->getNextNode());
            BasicBlock *firstBlock = &BB;
            splitBB(*secondBlock,lastArg,BBtoFlatten);
            return;
        }
        if (isa<ReturnInst>(I)) {
            BBtoFlatten->push_back(&BB); 
            return;
        }

        //Will check 2 type of blocks: 
        //  1. if is conditional which means that there is an IF stmt -> it will split 
        // it and seperate the code block before the if stmt and the if stmt itself. then it will 
        //traversal onto the block from the True side (which is getSuccessor(0)). If nested it will go
        //deep until it reaches to an uncoditional brance (see 2 below). then, it will go back and go
        //check the False side and do the same. If stmt? -> then split
        // 2. for uncoditional basic blocks it will just push it to the vector
        if(isa<BranchInst>(I)){ 
            auto *BI = dyn_cast<BranchInst>(I);
            if (!BI->isConditional()) {
                //errs() << "Uncoditional Block: " << BB << "\n";
                BBtoFlatten->push_back(&BB);
                /*
                BBtoFlatten->push_back(&BB);  
                splitBB(*BI->getSuccessor(0), lastArg, BBtoFlatten);
                */
                return;
            }

            Value *condVal = BI->getCondition();
            auto *condInst = dyn_cast<Instruction>(condVal);
            if (!condInst) {
                errs() << "[branch] condition is not an instruction, skipping\n";
                return;
            }

            SmallPtrSet<Instruction*, 16> slice;
            doZigZag(BB, condInst, slice);

            Instruction *earliestI = nullptr;
            for (Instruction &sliceSearchI : BB) {
                if (slice.count(&sliceSearchI)) {
                    earliestI = &sliceSearchI;
                    break;
                }
            }

            if (earliestI) {
                BasicBlock *firstBlock = nullptr;
                if (earliestI == &*BB.begin()) {
                    firstBlock = &BB;
                     BBtoFlatten->push_back(firstBlock);
                    auto *br = dyn_cast<BranchInst>(firstBlock->getTerminator());
                    splitBB(*br->getSuccessor(0), lastArg,BBtoFlatten);
                    splitBB(*br->getSuccessor(1), lastArg,BBtoFlatten);
                } else {
                    firstBlock = BB.splitBasicBlockBefore(earliestI);
                     //errs() << "FirstBlock: " << *firstBlock << "\n";
                     BBtoFlatten->push_back(firstBlock);
                    auto *br = dyn_cast<BranchInst>(firstBlock->getTerminator());
                    BasicBlock *secondBlock = br->getSuccessor(0);
                    BBtoFlatten->push_back(secondBlock);
                   //errs() << "secondBlock: " << *secondBlock << "\n";
                    
                    br = dyn_cast<BranchInst>(secondBlock->getTerminator());
                    //errs() << "Going T: \n";
                    splitBB(*br->getSuccessor(0), lastArg,BBtoFlatten);
                    //errs() << "Going F: \n";
                    splitBB(*br->getSuccessor(1), lastArg,BBtoFlatten);
                }

               
            }
            return;
        }
    }
}


static void flattenFunction(Function& F){
    SmallVector<BasicBlock*, 20> BBtoFlatten;
    splitBB(F.getEntryBlock(), getlastArg(F),&BBtoFlatten);
    for (auto BB : BBtoFlatten) {
        errs() << "BB to Flatten: " << getSimpleNodeLabel(BB) << "\n";
    }
    createAndBuildDispatcher(F, BBtoFlatten);
    
}
PreservedAnalyses ControlFlowFlatteningPass::run(Module &M, ModuleAnalysisManager &MAM) {
    for (Function &F : M) {
        if(F.isDeclaration() || F.getName() == "main" ) continue;
        errs() << "Function: " << F.getName() << "\n\n";
        flattenFunction(F);
    }
    return PreservedAnalyses::none();
}