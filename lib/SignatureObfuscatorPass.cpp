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
    struct DiagnosticReport{
        std::string functionName;
        std::string renameResult;
        std::string dummyResult;
        std::string shuffleResult;
        unsigned dummyCount=0;
        unsigned renameStatus;
        unsigned dummyStatus;
        unsigned shuffleStatus;
    };
    struct DiagnosticContext{
        FunctionContext *FC;
        SignatureObfuscatorAnalysis::FunctionAnalysisInfo *FI;
        SmallVector<DiagnosticReport,10> report;
        enum class DiagStatus { Success, Skip, Disabled, Unknown};
        void collectDiagnostics();
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
    
    void DiagnosticContext::collectDiagnostics(){
        DiagnosticReport DR;
        DR.functionName = FC->originalFName;
        DR.renameStatus = static_cast<unsigned>(getRenameStatus());
        DR.dummyStatus = static_cast<unsigned>(getDummyStatus());
        DR.shuffleStatus =  static_cast<unsigned>(getShuffleStatus());

        DR.dummyCount = getDummyCount();
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
        auto getMessage = [&](DiagStatus DS, std::string successMessage, StringRef skipReason) -> std::string{
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
            return message;
        };
        DR.renameResult = getMessage(getRenameStatus(),((FC->replacementF!=nullptr)?FC->replacementF->getName():FC->originalF->getName()).str(),FI->renameReason);
        DR.dummyResult =getMessage(getDummyStatus(),getDummyParameterTypes(),FI->dummyReason);
        DR.shuffleResult =getMessage(getShuffleStatus(), "[" + join(map_range(FC->perm, [](unsigned I) {return std::to_string(I);}), ", ") + "]", FI->shuffleReason);
        report.push_back(std::move(DR));
    }
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
        errs() << "[Signature] Summary Diagnostics\n"
        << "================================================================================================\n";
        for (const DiagnosticReport &DR : report) {
            errs() << "[Signature] " << formatv("{0,-24}", DR.functionName)
                << " rename=" << formatv("{0,-12}", getStatusName(static_cast<DiagStatus>(DR.renameStatus)))
                << " dummy=" << formatv("{0,-12}", getStatusName(static_cast<DiagStatus>(DR.dummyStatus)) + "(+" + std::to_string(DR.dummyCount) + ")")
                << " shuffle=" << getStatusName( static_cast<DiagStatus>(DR.shuffleStatus))
                << '\n';
        }
    }
    void DiagnosticContext::diagByFunction(){
        errs() << "[Signature] by Function Diagnostics\n"
        << "================================================================================================\n";
        for (const DiagnosticReport &DR : report) {
            errs() << "\n[Signature] " << DR.functionName << '\n';
            errs() << formatv("  {0,-10} {1,-10} {2}\n", "Rename", getStatusName(static_cast<DiagStatus>(DR.renameStatus)), DR.renameResult);
            errs() << formatv("  {0,-10} {1,-10} {2}\n", "Dummy", getStatusName(static_cast<DiagStatus>(DR.dummyStatus)), ((DR.dummyCount!=0)? ("(+" + std::to_string(DR.dummyCount) + ") ") : "") + DR.dummyResult);
            errs() << formatv("  {0,-10} {1,-10} {2}\n", "Shuffle", getStatusName(static_cast<DiagStatus>(DR.shuffleStatus)), DR.shuffleResult);
        }
    }
    
    void DiagnosticContext::diagByTechnique(){
         errs() << "[Signature] Technique Diagnostics\n"
        << "================================================================================================\n";
        auto printTechniqueSection = [&](StringRef title, auto statusGetter, auto resultGetter, bool showDummyCount, bool showExcludedFunctions) {
            errs() << "\n" << title << '\n' << "------------------------------------------------------------\n";

            std::string success;
            std::string skipped;
            std::string disabled;
            std::string unknown;
            std::string excludedFunctions;

            for (const DiagnosticReport &DR : report) {
                const auto status = statusGetter(DR);
                const std::string &result = resultGetter(DR);
                if (static_cast<DiagStatus>(DR.renameStatus) == DiagStatus::Skip &&
                    static_cast<DiagStatus>(DR.dummyStatus) == DiagStatus::Skip &&
                    static_cast<DiagStatus>(DR.shuffleStatus) == DiagStatus::Skip) {
                    excludedFunctions += "  - " + DR.functionName + ": " + result + "\n";    
                    continue;
                }

                std::string entry = "  - " + DR.functionName + ": ";

                if (showDummyCount && status == DiagStatus::Success)
                    entry += "+" + std::to_string(DR.dummyCount) + " -> ";

                entry += result + '\n';

                switch (status) {
                case DiagStatus::Success:
                    success += entry;
                    break;
                case DiagStatus::Skip:
                    skipped += entry;
                    break;
                case DiagStatus::Disabled:
                    disabled += entry;
                    break;
                case DiagStatus::Unknown:
                    unknown += entry;
                    break;
                }
            }
            if(!showExcludedFunctions){
                if (!success.empty()) errs() << "SUCCESS:\n" << success << '\n';
                if (!skipped.empty()) errs() << "SKIPPED:\n" << skipped << '\n';
                if (!disabled.empty()) errs() << "DISABLED:\n" << disabled << '\n';
                if (!unknown.empty()) errs() << "UNKNOWN:\n" << unknown << '\n'; 
            }else{
                errs() << excludedFunctions << '\n';
            }
        };

        printTechniqueSection( "1. Function Renaming",
            [](const DiagnosticReport &DR) { return static_cast<DiagStatus>(DR.renameStatus); },
            [](const DiagnosticReport &DR) -> const std::string & { return DR.renameResult; },
            false,false);

        printTechniqueSection( "2. Dummy Parameter Insertion",
            [](const DiagnosticReport &DR) { return static_cast<DiagStatus>(DR.dummyStatus); },
            [](const DiagnosticReport &DR) -> const std::string & { return DR.dummyResult; },
            true,false);

        printTechniqueSection( "3. Parameter Shuffling",
            [](const DiagnosticReport &DR) { return static_cast<DiagStatus>(DR.shuffleStatus); },
            [](const DiagnosticReport &DR) -> const std::string & { return DR.shuffleResult; },
            false,false);
        
        printTechniqueSection( "4. Functions Excluded from All Techniques",
            [](const DiagnosticReport &DR) { return static_cast<DiagStatus>(DR.renameStatus); },
            [](const DiagnosticReport &DR) -> const std::string & { return DR.renameResult; },
            false,true);
        
    }
    void DiagnosticContext::printDiagnostics(){
        switch(Diagnostics){
            case SignatureDiagnostics::Summary:
                diagSummary();
                break;
            case SignatureDiagnostics::byFunction: 
                diagByFunction();
                break;
            case SignatureDiagnostics::byTechnique: 
                diagByTechnique();
            break;
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
    DiagnosticContext DC;
    for(SignatureObfuscatorAnalysis::FunctionAnalysisInfo functionInfo : functionAnalysisInfos){ //NOTE: BETTER NAMES
        FunctionContext FC(functionInfo.Fn);
        DC.FC = &FC;
        DC.FI = &functionInfo;
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

        if(Diagnostics != SignatureDiagnostics::None) DC.collectDiagnostics();
        
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

    if(Diagnostics != SignatureDiagnostics::None) DC.printDiagnostics();
    if (changed && verifyModule(M, &errs())) report_fatal_error("SignatureObfuscatorPass produced an invalid module");

    return changed ? PreservedAnalyses::none() : PreservedAnalyses::all();
}