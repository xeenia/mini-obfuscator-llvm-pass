#include "llvm/IR/PassManager.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/BasicBlock.h"
#include "llvm/IR/Instructions.h"
#include "llvm/Support/raw_ostream.h"
#include <llvm/Transforms/Utils/Local.h>
#include <llvm/Transforms/Utils/BasicBlockUtils.h> 
#include "llvm/IR/Verifier.h"
#include "ControlFlowFlatteningPass.h"
//#include "llvm/Transforms/Utils/DemoteRegToMemory.h"

using namespace llvm;

static cl::opt<bool> OnlySplitted(
    "only-splitted",
    cl::init(false),
    cl::desc("apply only splitted version"));

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
            DemotePHIToStack(phi);
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

//NOTE: for now lets assume that the conditions dont have && and ||
static void splitCodeBlockfromCondition(BasicBlock *BB, Instruction *I, SmallPtrSetImpl<Instruction*> &slice){ 
    //zigzag logic
    if (!I || I->getParent() != BB)
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
    AllocaInst *allocaIns = nullptr;
    if(argSize){ //args in a function
        std::advance(it, argSize);
        IRBuilder<> entryBuilder(&*it);
        allocaIns = entryBuilder.CreateAlloca(entryBuilder.getInt32Ty(), nullptr, "b");
        for (; it != EntryBB->end(); ++it) {
            if (llvm::isa<llvm::StoreInst>(*it)) {
                std::advance(it, argSize);
                entryBuilder.SetInsertPoint(&*it);
                entryBuilder.CreateStore(entryBuilder.getInt32(0), allocaIns);
                break; 
            }
        }
    }else{ //no args in a function
        IRBuilder<> entryBuilder(&*it);
        allocaIns = entryBuilder.CreateAlloca(entryBuilder.getInt32Ty(), nullptr, "b");
        for (; it != EntryBB->end(); ++it) {
            if (!llvm::isa<llvm::AllocaInst>(*it)) {
                entryBuilder.SetInsertPoint(&*it);
                break;
            }
        }
        entryBuilder.CreateStore(entryBuilder.getInt32(0), allocaIns);
    }
    return allocaIns;
}

static void createAndBuildDispatcher(Function &F,  SmallVector<BasicBlock*, 20> &BBtoFlatten) {
    LLVMContext &Ctx = F.getContext();
    BasicBlock *EntryBB = &F.getEntryBlock();
    auto *BI = dyn_cast<BranchInst>(EntryBB->getTerminator());
    bool isConditional = BI && BI->isConditional();
    if(isConditional){
        BasicBlock *newEntryBB = BasicBlock::Create(Ctx, "entry", &F, EntryBB); //adding the new BB before the entry
        IRBuilder<> entryBuilder(newEntryBB);
        entryBuilder.CreateBr(EntryBB);
        EntryBB = newEntryBB;
    }
    AllocaInst *allocaIns = addStateVarToEntryBB(EntryBB, F.arg_size());
    
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
            //for uncoditional blocks is very straighforward, we just find the index that its successor points, to which case in teh switch
            //and then we create store for the b variable 
            int nextState = findIndex(BI->getSuccessor(0));
            if (nextState == -1) report_fatal_error("Target block not in flatten set.");
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
            if (trueB == -1 || falseB == -1) report_fatal_error("Target block not in flatten set.");

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
    auto *entryTerm = dyn_cast<BranchInst>(EntryBB->getTerminator());
    if (entryTerm) {
        entryTerm->setSuccessor(0, whileBB);
    }
}

static void createNewEntryBlock(Function &F){
    LLVMContext &Ctx = F.getContext();
    BasicBlock *EntryBB = &F.getEntryBlock();
    BasicBlock *newEntryBB = BasicBlock::Create(Ctx, "entry", &F);
    IRBuilder<> entryBuilder(newEntryBB);
    entryBuilder.CreateBr(EntryBB);
    newEntryBB->moveBefore(EntryBB);
    SmallVector<AllocaInst*, 16> Allocas;
    for (Instruction &I : *EntryBB) {
        if (AllocaInst *AI = dyn_cast<AllocaInst>(&I))
            Allocas.push_back(AI);
    }
    if(!Allocas.empty())
        for (AllocaInst *AI : Allocas) {
            AI->moveBefore(*newEntryBB, newEntryBB->getFirstInsertionPt());
        }
}
static void prepareBlocksForFlattening(Function &F, SmallVector<BasicBlock*, 20> &BBtoFlatten){
    createNewEntryBlock(F);
    for (BasicBlock &BB : make_range(std::next(F.begin()), F.end())) {
        Instruction *I = BB.getTerminator();;
        if(isa<BranchInst>(I)){ 
            auto *BI = dyn_cast<BranchInst>(I);
            if (!BI->isConditional()) { //br with only 1 successor
                BBtoFlatten.push_back(&BB);
            }else{
                Value *condVal = BI->getCondition();
                auto *condInst = dyn_cast<Instruction>(condVal);
                if (!condInst) { 
                    errs() << "cond\n";
                    BBtoFlatten.push_back(&BB);
                    continue;
                }
                SmallPtrSet<Instruction*, 15> slice;
                splitCodeBlockfromCondition(&BB, condInst, slice);

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
                        BBtoFlatten.push_back(firstBlock);
                    } else {
                        firstBlock = BB.splitBasicBlockBefore(earliestI);
                        auto *br = dyn_cast<BranchInst>(firstBlock->getTerminator());
                        BasicBlock *secondBlock = br->getSuccessor(0);

                        BBtoFlatten.push_back(firstBlock);
                        BBtoFlatten.push_back(secondBlock);     
                    }
                }
            }
        }
    }
}

static bool flattenFunction(Function& F){
    SmallVector<BasicBlock*, 20> BBtoFlatten;
    demotePhiNodes(F); 
    prepareBlocksForFlattening(F,BBtoFlatten);
    for (auto BB : BBtoFlatten) {
        errs() << "BB to Flatten: " << getSimpleNodeLabel(BB)<< "\n";
    }
    
    if(!OnlySplitted){
        createAndBuildDispatcher(F, BBtoFlatten);
    }
    return true; //to fix
    
}
bool isCFFCandidate(Function &F){
    if(F.isDeclaration()) return false;
    if(F.size() < 3) return false;
    errs() << "Function " << F.getName() << ": " << F.size() << "\n";
    bool toSkip = false;
    for(BasicBlock &BB: F){
        Instruction *I = BB.getTerminator();
        if(isa<InvokeInst>(I) || \
        isa<IndirectBrInst>(I) || \
        isa<CallBrInst>(I) || \
        isa<ResumeInst>(I) || \
        isa<CatchSwitchInst>(I) || \
        isa<CatchReturnInst>(I) || \
        isa<CleanupReturnInst>(I)) {
            toSkip = true; 
            break;
        }
    }
    if(toSkip) return false;
    return true;
}
PreservedAnalyses ControlFlowFlatteningPass::run(Module &M, ModuleAnalysisManager &MAM) {
    bool Changed{false};
    for (Function &F : M) {
        if(!isCFFCandidate(F)) continue;
        
        Changed = flattenFunction(F);
        if (verifyFunction(F, &errs()))
            report_fatal_error("ControlFlowFlatteningPass produced an invalid function");
    }
    if (Changed && verifyModule(M, &errs()))
        report_fatal_error("ControlFlowFlatteningPass produced an invalid module");
    return Changed ? PreservedAnalyses::none() : PreservedAnalyses::all();
}