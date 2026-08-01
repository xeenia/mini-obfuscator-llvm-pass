#include "SignatureObfuscatorPass.h"

#include "llvm/IR/Function.h"
#include "llvm/IR/InstrTypes.h"
#include "llvm/IR/Module.h"
#include "llvm/Support/raw_ostream.h"

using namespace llvm;

PreservedAnalyses SignatureObfuscatorPass::run(Module &M, ModuleAnalysisManager &AM) {
    errs() << "=== Module: " << M.getName() << " ===\n";

    for(Function &F: M){
        errs() << "Function: " << F.getName() << "\n";
        errs() << "Return type: " << *F.getReturnType() << "\n";

        if(F.arg_empty())
            errs() << "Args: none\n";
        else{
            errs() << "  Args:\n";
            unsigned Idx = 0;
            for (Argument &A : F.args()) {
                errs() << "    [" << Idx++ << "] " << *A.getType();
                if (A.hasName())
                errs() << "   (" << A.getName() << ")";
                errs() << "\n";
            }
        }
    }

    return PreservedAnalyses::all();
}