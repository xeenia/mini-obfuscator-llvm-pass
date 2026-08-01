#pragma once
#include "llvm/IR/PassManager.h"

struct SignatureObfuscatorPass : public llvm::PassInfoMixin<SignatureObfuscatorPass> {
    llvm::PreservedAnalyses run(llvm::Module &M, llvm::ModuleAnalysisManager &AM);
    static bool isRequired() { return true;}
};