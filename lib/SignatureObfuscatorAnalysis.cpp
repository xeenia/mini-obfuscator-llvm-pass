#include "SignatureObfuscatorAnalysis.h"

#include "llvm/IR/Function.h"
#include "llvm/IR/Module.h"
#include "llvm/Support/CommandLine.h"


llvm::AnalysisKey SignatureObfuscatorAnalysis::Key;
enum class Reason{
    None,
    Declaration,
    MainFunction,
    Variadic,
    AddressTaken,
    NonLocalLinkage,
    NotEnoughArgs
};
const char *getReasonMessage(Reason reason) {
    switch (reason) {
        case Reason::None: return "";
        case Reason::Declaration: return "function is a declaration";
        case Reason::MainFunction: return "function is main";
        case Reason::Variadic: return "function is variadic";
        case Reason::AddressTaken: return "function address is taken";
        case Reason::NonLocalLinkage: return "function has non-local linkage";
        default: return "unknown reason";
    }
}
SignatureObfuscatorAnalysis::Result SignatureObfuscatorAnalysis::run(llvm::Module &M, llvm::ModuleAnalysisManager &AM){
    Result R;
    unsigned maxArgs{0};
    for(llvm::Function &F:M){
        FunctionAnalysisInfo fnAnInfo{&F};
        auto setAllReasons = [&](Reason reason) {
            const std::string message = getReasonMessage(reason);
            fnAnInfo.renameReason = message;
            fnAnInfo.dummyReason = message;
            fnAnInfo.shuffleReason = message;
        };

        auto setSignatureReasons = [&](Reason reason) {
            const std::string message = getReasonMessage(reason);
            fnAnInfo.dummyReason = message;
            fnAnInfo.shuffleReason = message;
        };

        if (F.isDeclaration()) setAllReasons(Reason::Declaration);
        else if (F.getName() == "main") setAllReasons(Reason::MainFunction);
        else {
            fnAnInfo.canRename = true;
            if (F.hasAddressTaken()) setSignatureReasons(Reason::AddressTaken);
            else if (F.isVarArg()) setSignatureReasons(Reason::Variadic);
            else {
                fnAnInfo.canAddDummy = true;
                fnAnInfo.canShuffle = true;
                maxArgs = std::max(maxArgs,static_cast<unsigned>(F.arg_size()));
            }
        }
        R.functionAnalysisInfo.push_back(fnAnInfo);
    }
    R.MaxArgs = maxArgs;
    return R;
}