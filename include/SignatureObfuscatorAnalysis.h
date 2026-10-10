#pragma once
#include "llvm/ADT/StringSet.h"
#include "llvm/IR/PassManager.h"
#include "ObfuscationAttributes.h"


struct SignatureObfuscatorAnalysis : public llvm::AnalysisInfoMixin<SignatureObfuscatorAnalysis>{
    struct FunctionAnalysisInfo{
            llvm::Function *Fn;
            bool canRename = false; 
            bool canAddDummy = false; 
            bool canShuffle = false; 

            std::string renameReason;
            std::string dummyReason;
            std::string shuffleReason;
    };

    struct Result {
        llvm::SmallVector<FunctionAnalysisInfo, 10> functionAnalysisInfo;
        unsigned MaxArgs = 0; //we will save the max arg_size among dummy eligible functions
    };

    Result run(llvm::Module &M, llvm::ModuleAnalysisManager &AM);
    private:
        friend llvm::AnalysisInfoMixin<SignatureObfuscatorAnalysis>;
        static llvm::AnalysisKey Key;
        
};