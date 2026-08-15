#include "llvm/IR/PassManager.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/BasicBlock.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/Instructions.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/IR/Instructions.h" 
#include "ControlFlowFlatteningPass.h"

using namespace llvm;



static void createDispatcher(BasicBlock *BB, AllocaInst *allocaIns){
    Function *F = BB->getParent();

    //dispatcher block -> while
    BasicBlock *dispatcherBB = BasicBlock::Create(F->getContext(), "dispatcher", F);
    IRBuilder<> dispatcherBuilder(dispatcherBB);
    
    //default block
    BasicBlock *defaultBB = BasicBlock::Create(F->getContext(), "default", F);
    IRBuilder<> defaultBuilder(defaultBB);
    defaultBuilder.CreateBr(dispatcherBB);

    //switch block
    BasicBlock *switchBB = BasicBlock::Create(F->getContext(), "swicth", F);
    IRBuilder<> switchBuilder(switchBB);
    Value *stateVal = switchBuilder.CreateLoad(switchBuilder.getInt32Ty(), allocaIns, "b");
    SwitchInst *switchIns = switchBuilder.CreateSwitch(stateVal, defaultBB, 1);
    dispatcherBuilder.CreateBr(switchBB);


    auto *BBTerm = dyn_cast<BranchInst>(BB->getTerminator());
    BasicBlock *nextBB = BBTerm->getSuccessor(0);

    switchIns->addCase(switchBuilder.getInt32(0), nextBB);   

    BBTerm->setSuccessor(0, dispatcherBB);
}

//static updateDispatcher(){}
static int getCounter(bool restore){
    static int counter=0;
    if(restore) {
        counter=0;
        return counter;
    }
    return counter++;
}
static void addStateInstruction(BasicBlock &BB, bool isDeclared, AllocaInst *&allocaIns){
    IRBuilder<> builder(BB.getTerminator());
    if(!isDeclared){
       // AllocaInst * llvm::IRBuilderBase::CreateAlloca(Type *	Ty,Value *	ArraySize = nullptr,const Twine &	Name = "" )
        allocaIns = builder.CreateAlloca(builder.getInt32Ty(), nullptr); 
    }
    //StoreInst * llvm::IRBuilderBase::CreateStore(Value *	Val,Value *	Ptr,bool	isVolatile = false )
    builder.CreateStore(builder.getInt32(getCounter(false)), allocaIns);
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

    errs() << "  [slice] added: " << *I << "\n";

    for (Use &U : I->operands()) {
        if (auto *OpInst = dyn_cast<Instruction>(U.get())) {
            doZigZag(BB, OpInst, slice);
        }
    }
}

static void splitBB(BasicBlock &BB, Argument *lastArg, AllocaInst *&allocaIns){
    for(auto It = BB.begin(), End = BB.end(); It != End; ++It){
        Instruction *I=&*It;
        if(isa<AllocaInst>(I)){
            for (User *U : lastArg->users()) {
                if (auto *SI = dyn_cast<StoreInst>(U)) {
                    I=SI;
                    break;
                }
            }
            errs() << "[alloca-split] splitting after: " << *I << "\n";
            BasicBlock *secondBlock = BB.splitBasicBlock(I->getNextNode());
            BasicBlock *firstBlock = &BB;
            addStateInstruction(*firstBlock, false, allocaIns);
            createDispatcher(firstBlock, allocaIns);
            splitBB(*secondBlock,lastArg, allocaIns);
            return;
        }

        //Will check 2 type of blocks: 
        //  1. if is conditional which means that there is an IF stmt -> it will split 
        // it and seperate the code block before the if stmt and the if stmt itself. then it will 
        //traversal onto the block from the True side (which is getSuccessor(0)). If nested it will go
        //deep until it reaches to an uncoditional brance (see 2 below). then, it will go back and go
        //check the False side and do the same. If stmt? -> then split
        // 2. for uncoditional basic blocks it will add the state counter, for example b=2 which means go to case 2
        if(isa<BranchInst>(I)){ 
            auto *BI = dyn_cast<BranchInst>(I);
            if (!BI->isConditional()) {
                errs() << "[branch] unconditional, skipping: " << *BI << "\n";
                addStateInstruction(BB, true,allocaIns);
                return ;
            }

            Value *condVal = BI->getCondition();
            auto *condInst = dyn_cast<Instruction>(condVal);
            if (!condInst) {
                errs() << "[branch] condition is not an instruction, skipping\n";
                return;
            }

            errs() << "[branch] found conditional branch: " << *BI << "\n";
            errs() << "[branch] walking slice starting from: " << *condInst << "\n";

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
                errs() << "[branch-split] earliest instruction in slice: " << *earliestI << "\n";
                BasicBlock *firstBlock = BB.splitBasicBlockBefore(earliestI);
                errs() << "FirstBlock: " << *firstBlock << "\n";
                auto *br = dyn_cast<BranchInst>(firstBlock->getTerminator());
                BasicBlock *secondBlock = br->getSuccessor(0);
                errs() << "secondBlock: " << *secondBlock << "\n";
                br = dyn_cast<BranchInst>(secondBlock->getTerminator());
                splitBB(*br->getSuccessor(0),lastArg, allocaIns);
                splitBB(*br->getSuccessor(1),lastArg, allocaIns);
            }
            errs() << "[branch-split] no earliest instruction found\n";
            return;
        }
    }
}
static void flattenFunction(Function& F){
    AllocaInst *allocaIns = nullptr;
    splitBB(F.getEntryBlock(), getlastArg(F),allocaIns);
}
PreservedAnalyses ControlFlowFlatteningPass::run(Module &M, ModuleAnalysisManager &MAM) {
    for (Function &F : M) {
        if(F.isDeclaration() || F.getName() == "main") continue;
        errs() << "Function: " << F.getName() << "\n\n";
        flattenFunction(F);
        getCounter(true);
    }
    return PreservedAnalyses::none();
}