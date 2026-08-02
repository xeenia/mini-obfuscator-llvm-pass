#include "SignatureObfuscatorAnalysis.h"

#include "llvm/IR/Function.h"
#include "llvm/IR/Module.h"
#include "llvm/Support/CommandLine.h"

using namespace llvm;

AnalysisKey SignatureObfuscatorAnalysis::Key;

SignatureObfuscatorAnalysis::Result SignatureObfuscatorAnalysis::run(Module &M, ModuleAnalysisManager &AM){
    Result R;
    unsigned maxArgs{0};
    for(Function &F:M){
        CandidateInfo candInfo{&F};
        //declarations do not have a body here, and main is left unchanged
        //because it is the program entry point
        if(F.isDeclaration() || F.getName() == "main")
            continue;
        if(!F.hasAddressTaken() && !F.isVarArg()){
            candInfo.dummyAllowed = true;
            if(F.arg_size() > maxArgs){
                maxArgs = F.arg_size();
            }
        }
            
        R.Candidates.push_back(candInfo);
    }
    R.MaxArgs = maxArgs;
    return R;
}