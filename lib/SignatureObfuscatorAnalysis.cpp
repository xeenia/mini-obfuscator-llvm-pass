#include "SignatureObfuscatorAnalysis.h"

#include "llvm/IR/Attributes.h"
#include "llvm/IR/CallingConv.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/InstIterator.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/Module.h"
#include "llvm/ADT/SmallPtrSet.h"

#include <algorithm>
#include <string>

llvm::AnalysisKey SignatureObfuscatorAnalysis::Key;

enum class Reason {
    None,
    Declaration,
    MainFunction,
    Variadic,
    AddressTaken,
    NotEnoughArgs,
    NoArgs,
    Intrinsic,
    MustTail,
    UnsupportedCallingConvention,
    ABIAttribute,
    WeakOrComdatLinkage,
    SpecialFunctionABI
};

const char *getReasonMessage(Reason reason) {
    switch (reason) {
        case Reason::None: return "";
        case Reason::Declaration: return "function is a declaration";
        case Reason::MainFunction: return "function is main";
        case Reason::Variadic: return "function is variadic";
        case Reason::AddressTaken: return "function address is taken";
        case Reason::NotEnoughArgs: return "function has too few arguments to shuffle";
        case Reason::NoArgs: return "function has no arguments to shuffle";
        case Reason::Intrinsic: return "function is an LLVM intrinsic";
        case Reason::MustTail: return "function participates in a musttail call";
        case Reason::UnsupportedCallingConvention: return "function uses an unsupported calling convention";
        case Reason::ABIAttribute: return "function has ABI-sensitive parameter attributes";
        case Reason::WeakOrComdatLinkage: return "function has weak, link-once, available_externally, or COMDAT linkage";
        case Reason::SpecialFunctionABI: return "function has a special ABI attribute";
    }
    return "unknown reason";
}

namespace {

bool hasSensitiveABIAttribute(const llvm::Function &F) {
    for (unsigned i = 0; i < F.arg_size(); ++i) {
        if (F.hasParamAttribute(i, llvm::Attribute::StructRet) ||
            F.hasParamAttribute(i, llvm::Attribute::ByVal) ||
            F.hasParamAttribute(i, llvm::Attribute::InAlloca) ||
            F.hasParamAttribute(i, llvm::Attribute::Preallocated)) {
            return true;
        }
    }
    return false;
}

bool hasSpecialFunctionABI(const llvm::Function &F) {
    return F.hasFnAttribute(llvm::Attribute::Naked) ||
           F.hasFnAttribute("interrupt");
}

bool hasSpecialLinkage(const llvm::Function &F) {
    return F.hasWeakLinkage() ||
           F.hasLinkOnceLinkage() ||
           F.hasAvailableExternallyLinkage() ||
           F.hasComdat();
}

llvm::SmallPtrSet<llvm::Function *, 16>
findMustTailFunctions(llvm::Module &M) {
    llvm::SmallPtrSet<llvm::Function *, 16> result;

    for (llvm::Function &F : M) {
        if (F.isDeclaration()) continue;
        for (llvm::Instruction &I : llvm::instructions(F)) {
            auto *CI = llvm::dyn_cast<llvm::CallInst>(&I);

            if (!CI || !CI->isMustTailCall()) continue;
            result.insert(&F);
            llvm::Value *calledOperand = CI->getCalledOperand();
            calledOperand = calledOperand->stripPointerCasts();

            if (auto *callee = llvm::dyn_cast<llvm::Function>(calledOperand))
                result.insert(callee);
        }
    }
    return result;
}

} //namespace

SignatureObfuscatorAnalysis::Result
SignatureObfuscatorAnalysis::run(
    llvm::Module &M,
    llvm::ModuleAnalysisManager &AM) {

    Result R;
    unsigned maxArgs = 0;

    const auto mustTailFunctions = findMustTailFunctions(M);

    for (llvm::Function &F : M) {
        FunctionAnalysisInfo fnAnInfo{&F};

        auto setReason = [&](Reason reason, bool toRename = true, bool toDummy = true, bool toShuffle = true) {
            const std::string message = getReasonMessage(reason);
            if (toRename) fnAnInfo.renameReason = message;
            if (toDummy) fnAnInfo.dummyReason = message;
            if (toShuffle) fnAnInfo.shuffleReason = message;
        };

        //restrictions that exclude all 3 techniques
        if (F.isIntrinsic()) {
            setReason(Reason::Intrinsic);
            R.functionAnalysisInfo.push_back(fnAnInfo);
            continue;
        }
        if (F.isDeclaration()) {
            setReason(Reason::Declaration);
            R.functionAnalysisInfo.push_back(fnAnInfo);
            continue;
        }
        if (F.getName() == "main") {
            setReason(Reason::MainFunction);
            R.functionAnalysisInfo.push_back(fnAnInfo);
            continue;
        }
        //this is a policy choice, not an LLVM requirement
        if (hasSpecialLinkage(F)) {
            setReason(Reason::WeakOrComdatLinkage);
            R.functionAnalysisInfo.push_back(fnAnInfo);
            continue;
        }
        fnAnInfo.canRename = true;
        fnAnInfo.renameReason = getReasonMessage(Reason::None);
        //restrictions for dummy insertion and parameter shuffling.
        if (F.hasAddressTaken()) {
            setReason(Reason::AddressTaken, false, true, true);
            R.functionAnalysisInfo.push_back(fnAnInfo);
            continue;
        }
        if (F.isVarArg()) {
            setReason(Reason::Variadic, false, true, true);
            R.functionAnalysisInfo.push_back(fnAnInfo);
            continue;
        }
        if (mustTailFunctions.contains(&F)) { //NOTE: implement support for musttail calls in the future
            setReason(Reason::MustTail, false, true, true);
            R.functionAnalysisInfo.push_back(fnAnInfo);
            continue;
        }
        if (F.getCallingConv() != llvm::CallingConv::C) {
            setReason(Reason::UnsupportedCallingConvention,
                      false, true, true);
            R.functionAnalysisInfo.push_back(fnAnInfo);
            continue;
        }
        if (hasSensitiveABIAttribute(F)) {
            setReason(Reason::ABIAttribute, false, true, true);
            R.functionAnalysisInfo.push_back(fnAnInfo);
            continue;
        }
        if (hasSpecialFunctionABI(F)) {
            setReason(Reason::SpecialFunctionABI, false, true, true);
            R.functionAnalysisInfo.push_back(fnAnInfo);
            continue;
        }
        fnAnInfo.canAddDummy = true;
        fnAnInfo.dummyReason = getReasonMessage(Reason::None);

        if (F.arg_size() == 0) {
            setReason(Reason::NoArgs, false, false, true);
        } else if (F.arg_size() == 1) {
            setReason(Reason::NotEnoughArgs, false, false, true);
        } else {
            fnAnInfo.canShuffle = true;
            fnAnInfo.shuffleReason = getReasonMessage(Reason::None);
            maxArgs = std::max(maxArgs, static_cast<unsigned>(F.arg_size()));
        }
        fnAnInfo.renameReason = getReasonMessage(Reason::None);
        R.functionAnalysisInfo.push_back(fnAnInfo);
    }

    R.MaxArgs = maxArgs;
    return R;
}
