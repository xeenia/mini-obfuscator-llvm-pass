#pragma once
#include "llvm/IR/PassManager.h"
using namespace llvm;
struct ControlFlowFlatteningPass : public llvm::PassInfoMixin<ControlFlowFlatteningPass> {
    llvm::PreservedAnalyses run(llvm::Module &M, llvm::ModuleAnalysisManager &AM);
    static bool isRequired() { return true;}
};