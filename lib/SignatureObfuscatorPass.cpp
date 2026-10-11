#include "SignatureObfuscatorPass.h"
#include "SignatureObfuscatorAnalysis.h"
#include "ObfuscationAttributes.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/InstrTypes.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/Support/FormatVariadic.h"
#include "llvm/IR/Verifier.h"
#include "llvm/Support/CommandLine.h"
#include "llvm/ADT/StringExtras.h" 
#include "llvm/Transforms/Utils/Cloning.h"

#include <random>
#include <algorithm>
#include <string>

using namespace llvm;

namespace{
    enum class SignatureDiagnostics { None, Summary, byFunction, byTechnique, Table};

    cl::OptionCategory SIGCategory("Signature Obfuscation Options", "Options for configuring the Signature Obfuscation pass.");
    
    static cl::opt<uint64_t> seed("sig-seed", 
           cl::init(0xC0FFEE),
           cl::desc("Seed for deterministic name/shuffle generation"),
           cl::cat(SIGCategory));

    static cl::opt<bool> DisableRename(
    "sig-dis-rename",
    cl::init(false),
    cl::desc("Disable function renaming"),
    cl::cat(SIGCategory));

    static cl::opt<bool> DisableDummy(
        "sig-dis-dummy",
        cl::init(false),
        cl::desc("Disable dummy parameter insertion"),
        cl::cat(SIGCategory));

    static cl::opt<bool> DisableShuffle(
        "sig-dis-shuffle",
        cl::init(false),
        cl::desc("Enable parameter shuffling"),
        cl::cat(SIGCategory));

    cl::opt<unsigned> dummyCount("sig-dummy-count",
    cl::init(0),
    cl::desc(  "Number of dummy parameters to add; 0 selects automatic sizing"),
    cl::cat(SIGCategory));

    cl::opt<SignatureDiagnostics> Diagnostics("sig-dump-diag",
    cl::init(SignatureDiagnostics::None),
    cl::values(
        clEnumValN(SignatureDiagnostics::None, "none", "Disable diagnostic output"),
        clEnumValN(SignatureDiagnostics::Summary, "summary", "Print a concise summary of transformation results for each function"),
        clEnumValN(SignatureDiagnostics::byFunction, "function", "Print diagnostic results grouped by function, including per-technique statuses and skip reasons"),
        clEnumValN(SignatureDiagnostics::byTechnique, "technique", "Print diagnostic results grouped by technique, including transformed, skipped, and unchanged functions")
    ),
    cl::desc("Select the diagnostic output format for signature obfuscation"),
    cl::cat(SIGCategory));
struct FunctionContext {
        Function *originalF = nullptr; 
        Function *currentF=nullptr;
        Function *replacementF=nullptr;
        std::string originalFName;
        SmallVector<unsigned,10> perm;
        
        explicit FunctionContext(Function *F):originalF(F),currentF(F),originalFName(F->getName()){}

        void applyRename();
        void applyDummyParameters(unsigned count);
        bool applyShuffle();
        void rewriteCallSites();
        
    private:
        void appendDummyParams(unsigned N);
        void shuffleSlots();
    };
    struct DiagnosticContext{
        FunctionContext *FC;
        SignatureObfuscatorAnalysis::FunctionAnalysisInfo *FI;
        enum class DiagStatus { Success, Skip, Disabled, Unknown};
        explicit DiagnosticContext(FunctionContext *F,SignatureObfuscatorAnalysis::FunctionAnalysisInfo *fi):FC(F),FI(fi){}
        void printDiagnostics();
        void diagSummary();
        void diagByFunction();
        void diagByTechnique();
        void diagTable();
        void diagReport();
        DiagStatus getRenameStatus();
        DiagStatus getDummyStatus();
        DiagStatus getShuffleStatus();
        std::string getStatusName(DiagStatus status);
        int getDummyCount();
    };
    

    int DiagnosticContext::getDummyCount(){
        const unsigned originalArgCount = FC->originalF->arg_size();
        const unsigned finalArgCount = FC->currentF->arg_size();
        if (finalArgCount < originalArgCount) report_fatal_error("SignatureObfuscatorPass: unexpected parameter removal");
        return finalArgCount - originalArgCount;
    }
    std::string DiagnosticContext::getStatusName(DiagStatus status){
        switch(status){
            case DiagStatus::Success: return "SUCCESS";
            case DiagStatus::Skip: return "SKIP";
            case DiagStatus::Disabled: return "DISABLED";
            default: return "UNKNOWN";
        }
    }

    DiagnosticContext::DiagStatus DiagnosticContext::getRenameStatus(){
        if(FC->originalFName != FC->currentF->getName()) return DiagStatus::Success;
        else if(DisableRename) return DiagStatus::Disabled;
        else if(!FI->canRename) return DiagStatus::Skip;
        else return DiagStatus::Unknown;
    }
    DiagnosticContext::DiagStatus DiagnosticContext::getDummyStatus(){
        if(DisableDummy) return DiagStatus::Disabled;
        else if(getDummyCount() != 0) return DiagStatus::Success;
        else if(!FI->canAddDummy) return DiagStatus::Skip;
        else return DiagStatus::Unknown;
    }
    DiagnosticContext::DiagStatus DiagnosticContext::getShuffleStatus(){
        if(DisableShuffle) return DiagStatus::Disabled;
        else if(!FC->perm.empty()) return DiagStatus::Success;
        else if(!FI->canShuffle) return DiagStatus::Skip;
        else return DiagStatus::Unknown;
    }
    void DiagnosticContext::diagSummary(){
        errs() << "[Signature] "
        << format("%-24s", FC->originalFName.c_str())
        << " rename=" << format("%-12s", getStatusName(getRenameStatus()).c_str())
        << " dummy=" << format("%-12s", (getStatusName(getDummyStatus()) + std::string("(+") + std::to_string(getDummyCount()) + ")").c_str())
        << " shuffle=" << getStatusName(getShuffleStatus())
        << '\n';
    }
    void DiagnosticContext::diagByFunction(){
        auto getDummyParameterTypes = [&]() -> std::string {
            std::string Types;
            raw_string_ostream OS(Types);
            OS << "(";
            bool First = true;
            for (const Argument &Arg : FC->currentF->args()) {
                if (!FC->currentF->getAttributes().hasParamAttr(Arg.getArgNo(), "obf.dummy.role")) continue;
                if (!First) OS << ",";
                Arg.getType()->print(OS);
                First = false;
            }
            OS << ")";
            return OS.str();
        };
        auto printOperation = [&](StringRef technique, DiagStatus DS, std::string successMessage, StringRef skipReason) {
            std::string message;
            switch (DS) {
                case DiagStatus::Success:
                    message = std::move(successMessage);
                    break;
                case DiagStatus::Skip:
                    message = skipReason.str();
                    break;
                case DiagStatus::Disabled:
                    message = "disabled by command-line option";
                    break;
                default:
                    message = "unknown reason";
                    break;
            }
            errs() << formatv("  {0,-10} {1,-10} {2}\n", technique, getStatusName(DS), message);
        };
        errs() << "[Signature] " << format("%-24s", FC->originalFName.c_str()) << "\n";
        printOperation("Rename",getRenameStatus(),FC->originalFName + " -> " + ((FC->replacementF!=nullptr)?FC->replacementF->getName():FC->originalF->getName()).str(),FI->renameReason);
        printOperation("Dummies",getDummyStatus(),"+" + std::to_string(getDummyCount()) +" " + getDummyParameterTypes(),FI->dummyReason);
        printOperation("Shuffle",getShuffleStatus(), "[" + join(map_range(FC->perm, [](unsigned I) {return std::to_string(I);}), ", ") + "]", FI->shuffleReason);
        errs() << "\n";
    }
    
    void DiagnosticContext::printDiagnostics(){
        switch(Diagnostics){
            case SignatureDiagnostics::Summary:
                diagSummary();
                break;
            case SignatureDiagnostics::byFunction: 
                diagByFunction();
                break;
            case SignatureDiagnostics::byTechnique: break;
            case SignatureDiagnostics::Table: break;
        }
    }
    static void keepFunctionOrder(Function &Old, Function &New) {
        Module &M = *Old.getParent();
        M.getFunctionList().splice(
            Old.getIterator(),
            M.getFunctionList(),
            New.getIterator());
    }

    //==================== RENAME TECHNIQUE ====================

    // builds names like _fACF62A35728C77E0
    static std::string makeOpaqueName(std::mt19937_64 &Rng) {
        std::string S;
        raw_string_ostream OS(S);
        OS << "_f" << utohexstr(Rng());
        return OS.str();
    }

    void FunctionContext::applyRename() {
        std::mt19937_64 RNG(seed ^ hash_value(currentF->getName()));
        const std::string newName = makeOpaqueName(RNG);
        currentF->setName(newName);
    }

    //====================   ADD DUMMY PARAMS TECHNIQUE   ====================

    void FunctionContext::applyDummyParameters(unsigned count) {
        appendDummyParams(count);
        keepFunctionOrder(*currentF, *replacementF);
        replacementF->takeName(currentF);
    }

    void createDummyParameterAllocasAndStores(Function &F) {
        BasicBlock &Entry = F.getEntryBlock();
        auto InsertPt = Entry.getFirstInsertionPt();

        if (InsertPt == Entry.end()) report_fatal_error( "No valid insertion point in function entry block");
        IRBuilder<> Builder(&*InsertPt);
        for (Argument &Arg : F.args()) {
            Attribute RoleAttr = F.getAttributes().getParamAttr(Arg.getArgNo(), obfAttributes::dummyRoleAttr);

            if(!RoleAttr.isValid()) continue;
            
            AllocaInst *Alloca = Builder.CreateAlloca(Arg.getType(), nullptr, Arg.getName() + ".addr");
            Builder.CreateStore(&Arg, Alloca);
        }
    }

    void FunctionContext::appendDummyParams(unsigned N){
        Module &M = *currentF->getParent();
        FunctionType *OldTy = currentF->getFunctionType();
        
        SmallVector<Type *, 8> NewParams(OldTy->param_begin(), OldTy->param_end());
        Type *I32Ty = Type::getInt32Ty(M.getContext());

        for(unsigned i = 0; i < N; i++){
            NewParams.push_back(I32Ty);
        }

        FunctionType *NewTy = FunctionType::get(OldTy->getReturnType(), NewParams, false);

        replacementF = Function::Create(NewTy, currentF->getLinkage(), currentF->getAddressSpace(), currentF->getName(), &M);
        replacementF->copyAttributesFrom(currentF);

        //mapping
        ValueToValueMapTy VMap;
        auto NewArgIt = replacementF->arg_begin();
        for (Argument &OldArg : currentF->args()) {
            NewArgIt->setName(OldArg.getName());
            VMap[&OldArg] = &*NewArgIt;
            ++NewArgIt;
        }
        
        SmallVector<ReturnInst *, 4> returns;
        CloneFunctionInto( replacementF, currentF, VMap, CloneFunctionChangeType::LocalChangesOnly, returns);

        if (N > 0) {
            Attribute NoUndefAttr = Attribute::get(M.getContext(), Attribute::NoUndef);
            Attribute DummyRole = Attribute::get( M.getContext(), obfAttributes::dummyRoleAttr, obfAttributes::toString(obfAttributes::DummyRole::Generic));

            for (unsigned i = currentF->arg_size(); i < replacementF->arg_size(); ++i) {
                Argument *DummyArg = replacementF->getArg(i);
                
                DummyArg->setName("dummy" + std::to_string(i - currentF->arg_size()));

                replacementF->addParamAttr(i, NoUndefAttr);
                replacementF->addParamAttr(i, DummyRole);
            }
            replacementF->addFnAttr(obfAttributes::dummyFunctionAttr);
        }
        createDummyParameterAllocasAndStores(*replacementF);
    }

    //====================   SHUFFLE PARAMS TECHNIQUE   ====================

    void FunctionContext::shuffleSlots() {
        Module &M = *currentF->getParent();
        unsigned N = currentF->arg_size();

        SmallVector<Type *,10> OldTypes;
        for (Argument &Arg : currentF->args())
            OldTypes.push_back(Arg.getType());

        //perm[i] = new slot that old arg i goes to. start as identity then shuffle
        perm.resize(N);
        for (unsigned i = 0; i < N; ++i)
            perm[i] = i;
        // for exactly 2 args, always swap. otherwise shuffle randomly
        if (N == 2) {
            perm[0] = 1;
            perm[1] = 0;
        } else {
            uint64_t LocalSeed = seed ^ hash_value(currentF->getName());
            std::mt19937_64 RNG(LocalSeed);
            std::shuffle(perm.begin(), perm.end(), RNG);
        }

        //put each old type at its shuffled slot
        SmallVector<Type *,10> newTypes(N);
        for (unsigned i = 0; i < N; ++i)
            newTypes[perm[i]] = OldTypes[i];

        FunctionType *NewTy = FunctionType::get(currentF->getReturnType(), newTypes, false);
        replacementF = Function::Create(NewTy, currentF->getLinkage(), currentF->getAddressSpace(), currentF->getName(), &M);
        replacementF->copyAttributesFrom(currentF);
        SmallVector<Argument *, 8> newArgs;

        for (Argument &NA : replacementF->args())
            newArgs.push_back(&NA);

        ValueToValueMapTy VMap;
        unsigned i = 0;

        for (Argument &OldArg : currentF->args()) {
            unsigned target = perm[i++];
            newArgs[target]->setName(OldArg.getName());
            VMap[&OldArg] = newArgs[target];
        }
        SmallVector<ReturnInst *, 8> returns;
        CloneFunctionInto(replacementF, currentF, VMap, CloneFunctionChangeType::LocalChangesOnly, returns);
    }

    bool FunctionContext::applyShuffle() {
        if (currentF->arg_size() < 2) return false;

        shuffleSlots();
        keepFunctionOrder(*currentF, *replacementF);
        replacementF->takeName(currentF);
        return true;
    }

    //====================   REWRITING CALL SITES   ====================

    void FunctionContext::rewriteCallSites() {
        if (!replacementF) return;

        const unsigned originalArgCount = originalF->arg_size();
        const unsigned finalArgCount = replacementF->arg_size();

        const unsigned dummyCount = finalArgCount - originalArgCount; //NOTE: TO FIX

        if (!perm.empty() && perm.size() != finalArgCount) report_fatal_error("SignatureObfuscatorPass: permutation size mismatch");
        
        for (User *U : make_early_inc_range(originalF->users())) {
            auto *CB = dyn_cast<CallBase>(U);

            if (!CB) continue;
            if (CB->getCalledFunction() != originalF) continue;
            if (CB->arg_size() != originalArgCount) report_fatal_error("SignatureObfuscatorPass: unexpected call argument count");

            SmallVector<Value *, 8> newArgs(finalArgCount, nullptr);

            for (unsigned i = 0; i < originalArgCount; ++i) {
                const unsigned finalIndex = perm.empty() ? i : perm[i];
                if (finalIndex >= finalArgCount) report_fatal_error("SignatureObfuscatorPass: invalid permutation index");
                newArgs[finalIndex] = CB->getArgOperand(i);
            }
            // Fill the slots belonging to the appended dummy arguments.
            Type *I32Ty = Type::getInt32Ty(originalF->getContext());

            for (unsigned i = 0; i < dummyCount; ++i) {
                const unsigned oldIndex = originalArgCount + i;
                const unsigned finalIndex = perm.empty() ? oldIndex : perm[oldIndex];

                if (finalIndex >= finalArgCount) report_fatal_error("SignatureObfuscatorPass: invalid dummy permutation index");
                if (newArgs[finalIndex] != nullptr) report_fatal_error("SignatureObfuscatorPass: duplicate argument position");

                newArgs[finalIndex] = ConstantInt::get(I32Ty, 0);
            }

            for (unsigned i = 0; i < newArgs.size(); ++i) 
                if (!newArgs[i]) report_fatal_error("SignatureObfuscatorPass: unassigned call argument");

            IRBuilder<> B(CB);
            CallInst *NC = B.CreateCall(replacementF, newArgs);
            NC->setCallingConv(CB->getCallingConv());

            CB->replaceAllUsesWith(NC);
            CB->eraseFromParent();
        }

    }
} //namespace

//====================   RUN   ====================
PreservedAnalyses SignatureObfuscatorPass::run(Module &M, ModuleAnalysisManager &AM) {
    auto &analysisResult = AM.getResult<SignatureObfuscatorAnalysis>(M);
    auto &functionAnalysisInfos = analysisResult.functionAnalysisInfo;
    bool changed{false};
    for(SignatureObfuscatorAnalysis::FunctionAnalysisInfo functionInfo : functionAnalysisInfos){ //NOTE: BETTER NAMES
        FunctionContext FC(functionInfo.Fn);
        if (functionInfo.canRename && !DisableRename){
            FC.applyRename();
        }
        if (functionInfo.canAddDummy && !DisableDummy) {
            unsigned padCount = 0;
            if (dummyCount == 0)
                padCount = analysisResult.MaxArgs - FC.currentF->arg_size() + 1;
            else
                padCount = dummyCount;
            FC.applyDummyParameters(padCount);
            changed =true;
        }

        if (functionInfo.canShuffle && !DisableShuffle) {
            if (FC.replacementF != nullptr) {
                    FC.currentF = FC.replacementF;
                    FC.replacementF = nullptr;
                }
            changed = FC.applyShuffle();
        }

        if(Diagnostics != SignatureDiagnostics::None){
            DiagnosticContext DC{&FC, &functionInfo};
            DC.printDiagnostics();
        }
        if (FC.replacementF != nullptr) {
            Function *finalF = FC.replacementF;
            Function *intermediateF = FC.currentF != FC.originalF?FC.currentF:nullptr;
            FC.rewriteCallSites();
            if (!FC.originalF->use_empty()) report_fatal_error("SignatureObfuscatorPass could not replace all original uses");

            FC.originalF->eraseFromParent();
            if (intermediateF != nullptr) {
                if (!intermediateF->use_empty()) {
                    errs() << "Error: intermediate function still has users: " << intermediateF->getName() << '\n';
                    report_fatal_error( "SignatureObfuscatorPass could not remove intermediate function");
                }
                intermediateF->eraseFromParent();
            }
            FC.currentF = finalF;
            FC.replacementF = nullptr;
        }
    }

    
    if (changed && verifyModule(M, &errs())) report_fatal_error("SignatureObfuscatorPass produced an invalid module");

    return changed ? PreservedAnalyses::none() : PreservedAnalyses::all();
}