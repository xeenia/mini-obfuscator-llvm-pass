#pragma once
#include "llvm/IR/PassManager.h"

struct ControlFlowFlatteningPass : public llvm::PassInfoMixin<ControlFlowFlatteningPass> {
    llvm::PreservedAnalyses run(llvm::Function &F, llvm::FunctionAnalysisManager &AM);
    static bool isRequired() { return true;}
};