#include "SignatureObfuscatorPass.h"
#include "SignatureObfuscatorAnalysis.h"

#include "llvm/IR/Function.h"
#include "llvm/IR/InstrTypes.h"
#include "llvm/IR/Module.h"
#include "llvm/Support/raw_ostream.h"

using namespace llvm;

PreservedAnalyses SignatureObfuscatorPass::run(Module &M, ModuleAnalysisManager &AM) {

    auto &analysisResult = AM.getResult<SignatureObfuscatorAnalysis>(M);
    auto &candidates = analysisResult.Candidates;

    errs() << "=== Module: " << M.getName() << " ===\n";

    for(SignatureObfuscatorAnalysis::CandidateInfo Info : candidates){
        Function *curFn = Info.Fn;
        errs() << "Function: " << curFn->getName() << "\n";
        errs() << "Return type: " << *curFn->getReturnType() << "\n";

        if(curFn->arg_empty())
            errs() << "Args: none\n";
        else{
            errs() << "  Args:\n";
            unsigned Idx = 0;
            for (Argument &A : curFn->args()) {
                errs() << "    [" << Idx++ << "] " << *A.getType();
                if (A.hasName())
                errs() << "   (" << A.getName() << ")";
                errs() << "\n";
            }
        }
    }

    return PreservedAnalyses::all();
}