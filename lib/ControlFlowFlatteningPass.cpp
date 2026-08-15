#include "llvm/IR/PassManager.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/BasicBlock.h"
#include "llvm/IR/Instructions.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/IR/Instructions.h" 
#include "ControlFlowFlatteningPass.h"

using namespace llvm;

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

static void splitBB(BasicBlock &BB, Argument *lastArg){
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
            splitBB(*secondBlock,lastArg);
            return;
        }

        //Will check 2 type of blocks: 
        //  1. if is conditional which means that there is an IF stmt -> it will split 
        // it and seperate the code block before the if stmt and the if stmt itself. then it will 
        //traversal onto the block from the True side (which is getSuccessor(0)). If nested it will go
        //deep until it reaches to an uncoditional brance (see 2 below). then, it will go back and go
        //check the False side and do the same. If stmt? -> then split
        // 2. for uncoditional basic blocks it will just stop here for now. It will stop the recursion
        if(isa<BranchInst>(I)){ 
            auto *BI = dyn_cast<BranchInst>(I);
            if (!BI->isConditional()) {
                errs() << "[branch] unconditional, skipping: " << *BI << "\n";
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
                splitBB(*br->getSuccessor(0),lastArg);
                splitBB(*br->getSuccessor(1),lastArg);
            }
            errs() << "[branch-split] no earliest instruction found\n";
            return;
        }
    }
}
static void flattenFunction(Function& F){
    splitBB(F.getEntryBlock(), getlastArg(F));
}
PreservedAnalyses ControlFlowFlatteningPass::run(Module &M, ModuleAnalysisManager &MAM) {
    for (Function &F : M) {
        if(F.isDeclaration() || F.getName() == "main") continue;
        errs() << "Function: " << F.getName() << "\n\n";
        flattenFunction(F);
            
    }
    return PreservedAnalyses::none();
}