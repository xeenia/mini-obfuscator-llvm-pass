#include "SignatureObfuscatorPass.h"
#include "SignatureObfuscatorAnalysis.h"

#include "llvm/IR/Function.h"
#include "llvm/IR/InstrTypes.h"
#include "llvm/IR/Module.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/IR/Verifier.h"
#include "llvm/Support/CommandLine.h"
#include "llvm/ADT/StringExtras.h" 

#include <random>
#include <string>

using namespace llvm;

static cl::opt<uint64_t> Seed(
    "rename-seed", cl::init(0xC0FFEE),
    cl::desc("Seed for deterministic name/shuffle generation"));

static void printSignature(raw_ostream &OS, Function *F){
    OS << F->getName() << " (";
    unsigned i = 0;
    for (Argument &Arg : F->args()) {
        if (i++) OS << ", ";
        OS << *Arg.getType();
        if (Arg.hasName())
        OS << " " << Arg.getName();
    }
    OS << ")";
}
// builds names like _fACF62A35728C77E0
static std::string makeOpaqueName(std::mt19937_64 &Rng) {
    std::string S;
    raw_string_ostream OS(S);
    OS << "_f" << utohexstr(Rng());
    return OS.str();
}
static Function *symbolRenaming(Function *F){
    std::mt19937_64 Rng(Seed ^ hash_value(F->getName()));
    std::string oldName = F->getName().str();
    F->setName(makeOpaqueName(Rng));
    errs() << "     (1) function-name obfuscation: " << oldName << " -> " << F->getName() << "\n";
    return F;
}
PreservedAnalyses SignatureObfuscatorPass::run(Module &M, ModuleAnalysisManager &AM) {

    auto &analysisResult = AM.getResult<SignatureObfuscatorAnalysis>(M);
    auto &candidates = analysisResult.Candidates;
    bool Changed{false};

    errs() << "=== Module: " << M.getName() << " ===\n\n";


    for(SignatureObfuscatorAnalysis::CandidateInfo Info : candidates){
        Function *curFn = Info.Fn;
         // prints original signature, before any transform touches it
        errs() << "--- ";
        printSignature(errs(), curFn);
        errs() << " ---\n";

        curFn = symbolRenaming(curFn);
        Changed = true;
    }

    if (Changed && verifyModule(M, &errs()))
    report_fatal_error("SignatureObfuscatorPass produced an invalid module");

    return Changed ? PreservedAnalyses::none() : PreservedAnalyses::all();
}