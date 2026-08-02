#include "SignatureObfuscatorPass.h"
#include "SignatureObfuscatorAnalysis.h"

#include "llvm/IR/Function.h"
#include "llvm/IR/InstrTypes.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/IR/Verifier.h"
#include "llvm/Support/CommandLine.h"
#include "llvm/ADT/StringExtras.h" 
#include "llvm/Transforms/Utils/Cloning.h"

#include <random>
#include <algorithm>
#include <string>

using namespace llvm;

static cl::opt<uint64_t> Seed(
    "rename-seed", cl::init(0xC0FFEE),
    cl::desc("Seed for deterministic name/shuffle generation"));

static cl::opt<bool> OnlyRename(
    "only-rename",
    cl::init(false),
    cl::desc("apply only function-name obfuscation"));

static cl::opt<bool> OnlyDummy(
    "only-dummy",
    cl::init(false),
    cl::desc("apply only dummy-parameter insertion"));

static void printSignature(raw_ostream &OS, Function *F){
    OS << F->getName() << " (";
    unsigned i = 0;
    for (Argument &Arg : F->args()) {
        if (i++) OS << ", ";
        OS << *Arg.getType();
        if (Arg.hasName())
        OS << " " << Arg.getName();
    }
    OS << ")";
}
// builds names like _fACF62A35728C77E0
static std::string makeOpaqueName(std::mt19937_64 &Rng) {
    std::string S;
    raw_string_ostream OS(S);
    OS << "_f" << utohexstr(Rng());
    return OS.str();
}
static Function *symbolRenaming(Function *F){
    std::mt19937_64 Rng(Seed ^ hash_value(F->getName()));
    std::string oldName = F->getName().str();
    F->setName(makeOpaqueName(Rng));
    errs() << "     (1) function-name obfuscation: " << oldName << " -> " << F->getName() << "\n";
    return F;
}
Function *appendDummyParams(Function &Old, unsigned N){
    Module &M = *Old.getParent();
    FunctionType *OldTy = Old.getFunctionType();
    SmallVector<Type *, 8> NewParams(OldTy->param_begin(), OldTy->param_end());
    Type *I32Ty = Type::getInt32Ty(M.getContext());
    for(unsigned i = 0; i < N; i++){
        NewParams.push_back(I32Ty);
    }
    FunctionType *NewTy = FunctionType::get(OldTy->getReturnType(), NewParams, false);
    Function *newF = Function::Create(NewTy, Old.getLinkage(), Old.getAddressSpace(), Old.getName(), &M);
    newF->copyAttributesFrom(&Old);

    //mapping
    ValueToValueMapTy VMap;
    auto NewArgIt = newF->arg_begin();
    for (Argument &OldArg : Old.args()) {
        NewArgIt->setName(OldArg.getName());
        VMap[&OldArg] = &*NewArgIt;
        ++NewArgIt;
    }
    for (unsigned i = 0; i < N; ++i, ++NewArgIt)
    NewArgIt->setName("dummy" + Twine(i));

    SmallVector<ReturnInst *, 4> Returns;
    CloneFunctionInto(newF, &Old, VMap, CloneFunctionChangeType::LocalChangesOnly, Returns);
    return newF;
}

static void keepFunctionOrder(Function &Old, Function &New) {
    Module &M = *Old.getParent();
    M.getFunctionList().splice(
        Old.getIterator(),
        M.getFunctionList(),
        New.getIterator());
}

void rewriteDummyCallSites(Function &Old, Function &newF, unsigned N) {
  for (User *U : make_early_inc_range(Old.users())) {
    auto *CB = dyn_cast<CallBase>(U);
    if (!CB || CB->getCalledFunction() != &Old)
      continue; 
    
    SmallVector<Value *, 8> NewArgs(CB->args());
    Type *I32Ty = Type::getInt32Ty(Old.getContext());
    for (unsigned I = 0; I < N; ++I)
      NewArgs.push_back(ConstantInt::get(I32Ty, 0));

    IRBuilder<> B(CB);
    CallInst *NC = B.CreateCall(&newF, NewArgs);
    NC->setCallingConv(CB->getCallingConv());
    CB->replaceAllUsesWith(NC);
    CB->eraseFromParent();
  }
}

static Function *addDummies(Function *F, unsigned padCount){
    Function *newF = appendDummyParams(*F, padCount);
    rewriteDummyCallSites(*F, *newF, padCount);
    keepFunctionOrder(*F, *newF);
    newF->takeName(F);
    F->eraseFromParent();
    errs() << "     (2) dummy parameters:  +" << padCount << " (now " << newF->arg_size() << " total args)\n";
    return newF;
}

PreservedAnalyses SignatureObfuscatorPass::run(Module &M, ModuleAnalysisManager &AM) {

    auto &analysisResult = AM.getResult<SignatureObfuscatorAnalysis>(M);
    auto &candidates = analysisResult.Candidates;
    bool Changed{false};

    errs() << "=== Module: " << M.getName() << " ===\n\n";


    for(SignatureObfuscatorAnalysis::CandidateInfo Info : candidates){
        Function *curFn = Info.Fn;
         // prints original signature, before any transform touches it
        errs() << "--- ";
        printSignature(errs(), curFn);
        errs() << " ---\n";

        if(!OnlyDummy)
            curFn = symbolRenaming(curFn);
        if(Info.dummyAllowed && !OnlyRename){
            unsigned padCount = analysisResult.MaxArgs - curFn->arg_size();
            curFn = addDummies(curFn, padCount+1); //we add +1 so even functions with max args can have at least 1 dummy 
        }
            
        Changed = true;
    }

    if (Changed && verifyModule(M, &errs()))
    report_fatal_error("SignatureObfuscatorPass produced an invalid module");

    return Changed ? PreservedAnalyses::none() : PreservedAnalyses::all();
}