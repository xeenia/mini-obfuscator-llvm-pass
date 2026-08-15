#include "llvm/IR/PassManager.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/BasicBlock.h"
#include "llvm/IR/Instructions.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/IR/Instructions.h" 
#include "ControlFlowFlatteningPass.h"

using namespace llvm;

static Argument* getLastArg(Function &F){
    Argument *LastArg = nullptr;
    for (Argument &Arg : F.args()) {
        LastArg = &Arg;
    }
    return LastArg;
}
static void splitBB(Function &F){
    BasicBlock &firstBB = F.getEntryBlock();

    for(auto It = firstBB.begin(), End = firstBB.end(); It != End; ++It){
        Instruction *I=&*It;
        if(isa<AllocaInst>(I)){
            Argument *LastArg = getLastArg(F);
            for (User *U : LastArg->users()) {
                if (auto *SI = dyn_cast<StoreInst>(U)) {
                    I=SI;
                    break;
                }
            }
            //BasicBlock * 	splitBasicBlockBefore (Instruction *I, const Twine &BBName="")
             BasicBlock* pSecondBB = firstBB.splitBasicBlockBefore(I->getNextNode()); //splitting happens from the next instruction, since we need to keep the one we found to its original/first block
             return;
        }
    }
}
static void flattenFunction(Function& F){
    splitBB(F);
}
PreservedAnalyses ControlFlowFlatteningPass::run(Module &M, ModuleAnalysisManager &MAM) {
    for (Function &F : M) {
        if(F.isDeclaration() || F.getName() == "main") continue;
        flattenFunction(F);
        break;
            
    }
    return PreservedAnalyses::none();
}