#pragma once
#include "llvm/IR/PassManager.h"
using namespace llvm;
struct ControlFlowFlatteningPass : public llvm::PassInfoMixin<ControlFlowFlatteningPass> {
    llvm::PreservedAnalyses run(Function &F, FunctionAnalysisManager &AM);
    static bool isRequired() { return true;}
};