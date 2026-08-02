#pragma once
#include "llvm/ADT/StringSet.h"
#include "llvm/IR/PassManager.h"
#include <vector>




struct SignatureObfuscatorAnalysis : public llvm::AnalysisInfoMixin<SignatureObfuscatorAnalysis>{
    struct CandidateInfo{
            llvm::Function *Fn;
            bool dummyAllowed = false; 
    };
    struct Result {
        std::vector<CandidateInfo> Candidates;
        unsigned MaxArgs = 0; //we will save the max arg_size among dummy eligible functions
    };

    Result run(llvm::Module &M, llvm::ModuleAnalysisManager &AM);
    private:
        friend llvm::AnalysisInfoMixin<SignatureObfuscatorAnalysis>;
        static llvm::AnalysisKey Key;
        
};