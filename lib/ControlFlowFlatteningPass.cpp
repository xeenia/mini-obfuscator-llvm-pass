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

//got this function 'demotePhiNodes' from this repo: https://github.com/samrussell/obfus
static void demotePhiNodes(Function& F) {
    std::vector<PHINode*> phiNodes;
    do {
        phiNodes.clear();
        for (auto& BB : F) {
            for (auto& I : BB.phis()) {
                phiNodes.push_back(&I);
            }
        }
        for (PHINode* phi : phiNodes) {
            DemotePHIToStack(phi, F.begin()->getTerminator());
        }
    } while (!phiNodes.empty());
}
//this too from repo: https://github.com/samrussell/obfus
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
static void splitCodeBlockfromCondition(BasicBlock &BB, Instruction *I, SmallPtrSetImpl<Instruction*> &slice){ 
    //zigzag logic
    if (!I || I->getParent() != &BB)
        return;
    if (!slice.insert(I).second)
        return;

    for (Use &U : I->operands()) {
        if (auto *OpInst = dyn_cast<Instruction>(U.get())) {
            splitCodeBlockfromCondition(BB, OpInst, slice);
        }
    }
}

static AllocaInst* addStateVarToEntryBB(BasicBlock *EntryBB, size_t argSize){
    auto it = EntryBB->begin();
    std::advance(it, argSize);
    IRBuilder<> entryBuilder(&*it);
    AllocaInst *allocaIns = entryBuilder.CreateAlloca(entryBuilder.getInt32Ty(), nullptr, "b");
    for (; it != EntryBB->end(); ++it) {
        if (llvm::isa<llvm::StoreInst>(*it)) {
            std::advance(it, argSize);
            entryBuilder.SetInsertPoint(&*it);
            entryBuilder.CreateStore(entryBuilder.getInt32(0), allocaIns);
            break; 
        }
    }
    return allocaIns;
}

static BasicBlock* createAndBuildDispatcher(Function &F,  SmallVector<BasicBlock*, 20> &BBtoFlatten) {
    LLVMContext &Ctx = F.getContext();
    BasicBlock &EntryBB = F.getEntryBlock();

    AllocaInst *allocaIns = addStateVarToEntryBB(&EntryBB, F.arg_size());
    
    BasicBlock *defaultBB = BasicBlock::Create(Ctx, "default", &F);
    IRBuilder<> defaultBuilder(defaultBB);
    
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
    defaultBuilder.CreateBr(breakBB);

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
        //a simple lambda function to find in which case the target BB is
        auto findIndex = [&](BasicBlock *Target) -> int {
            auto it = std::find(BBtoFlatten.begin(), BBtoFlatten.end(), Target);
            return (it != BBtoFlatten.end()) ? (int)std::distance(BBtoFlatten.begin(), it) : -1;
        };

        if (!BI->isConditional()) {
            //for uncoditional blocks is very straighforward, we just go to the next case
            //and we create store for the b variable 
            int nextState = findIndex(BI->getSuccessor(0));
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

static void splitAndGetBB(BasicBlock &BB, Argument *lastArg, SmallVector<BasicBlock*, 20>* BBtoFlatten){
    Instruction *I = &BB.front();
    if(isa<AllocaInst>(I)){
        for (User *U : lastArg->users()) {
            if (auto *SI = dyn_cast<StoreInst>(U)) {
                I=SI;
                break;
            }
        }
        BasicBlock *secondBlock = BB.splitBasicBlock(I->getNextNode());
        BasicBlock *firstBlock = &BB;
        splitAndGetBB(*secondBlock,lastArg,BBtoFlatten);
        return;
    }
    I = BB.getTerminator();
    if (isa<ReturnInst>(I)) {
            if(!is_contained(*BBtoFlatten, &BB)) BBtoFlatten->push_back(&BB);
        return;
    }

    if(isa<BranchInst>(I)){ 
        auto *BI = dyn_cast<BranchInst>(I);
        if (!BI->isConditional()) {
            if(!is_contained(*BBtoFlatten, &BB))  BBtoFlatten->push_back(&BB);
            splitAndGetBB(*BI->getSuccessor(0),lastArg,BBtoFlatten);
        }else{
            Value *condVal = BI->getCondition();
            auto *condInst = dyn_cast<Instruction>(condVal);
            if (!condInst) {
                errs() << "[branch] condition is not an instruction, skipping\n";
                return;
            }

            SmallPtrSet<Instruction*, 15> slice;
            splitCodeBlockfromCondition(BB, condInst, slice);

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
                    if(!is_contained(*BBtoFlatten, firstBlock))  BBtoFlatten->push_back(firstBlock);
                    auto *br = dyn_cast<BranchInst>(firstBlock->getTerminator());
                    splitAndGetBB(*br->getSuccessor(0), lastArg,BBtoFlatten);
                    splitAndGetBB(*br->getSuccessor(1), lastArg,BBtoFlatten);
                } else {
                    firstBlock = BB.splitBasicBlockBefore(earliestI);
                    auto *br = dyn_cast<BranchInst>(firstBlock->getTerminator());
                    BasicBlock *secondBlock = br->getSuccessor(0);

                    if(!is_contained(*BBtoFlatten, firstBlock))  BBtoFlatten->push_back(firstBlock);
                    if(!is_contained(*BBtoFlatten, secondBlock))  BBtoFlatten->push_back(secondBlock);     

                    br = dyn_cast<BranchInst>(secondBlock->getTerminator());
                    splitAndGetBB(*br->getSuccessor(0), lastArg,BBtoFlatten);
                    splitAndGetBB(*br->getSuccessor(1), lastArg,BBtoFlatten);
                }
            }
        }
        return;
    }
}

static void flattenFunction(Function& F){
    SmallVector<BasicBlock*, 20> BBtoFlatten;
    splitAndGetBB(F.getEntryBlock(), getlastArg(F),&BBtoFlatten);
    for (auto BB : BBtoFlatten) {
        errs() << "BB to Flatten: " << getSimpleNodeLabel(BB)<< "\n";
    }
    demotePhiNodes(F);
    createAndBuildDispatcher(F, BBtoFlatten);
}

PreservedAnalyses ControlFlowFlatteningPass::run(Module &M, ModuleAnalysisManager &MAM) {
    for (Function &F : M) {
        if(F.isDeclaration()) continue;
        errs() << "Function: " << F.getName() << "\n\n";
        flattenFunction(F);
    }
    return PreservedAnalyses::none();
}