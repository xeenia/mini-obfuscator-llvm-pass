#include "SignatureObfuscatorAnalysis.h"

#include "llvm/IR/Function.h"
#include "llvm/IR/Module.h"
#include "llvm/Support/CommandLine.h"

using namespace llvm;

AnalysisKey SignatureObfuscatorAnalysis::Key;

SignatureObfuscatorAnalysis::Result SignatureObfuscatorAnalysis::run(Module &M, ModuleAnalysisManager &AM){
    Result R;
    unsigned MaxArgs{0};
    for(Function &F:M){
        CandidateInfo candInfo{&F};
        //declarations do not have a body here, and main is left unchanged
        //because it is the program entry point
        if(F.isDeclaration() || F.getName() == "main")
            continue;
        R.Candidates.push_back(candInfo);
    }
    return R;
}