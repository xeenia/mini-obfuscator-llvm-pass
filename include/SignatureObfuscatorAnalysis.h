#pragma once
#include "llvm/ADT/StringSet.h"
#include "llvm/IR/PassManager.h"
#include <vector>

struct SignatureObfuscatorAnalysis : public llvm::AnalysisInfoMixin<SignatureObfuscatorAnalysis>{
    //i'm thinking of having a struct because it will help later with the selection proccess
    //of the obfuscation techniques by storing extra information for each candidate function
    struct CandidateInfo{
            llvm::Function *Fn;
    };
    struct Result {
        std::vector<CandidateInfo> Candidates;
    };

    Result run(llvm::Module &M, llvm::ModuleAnalysisManager &AM);
    private:
        friend llvm::AnalysisInfoMixin<SignatureObfuscatorAnalysis>;
        static llvm::AnalysisKey Key;
        
};