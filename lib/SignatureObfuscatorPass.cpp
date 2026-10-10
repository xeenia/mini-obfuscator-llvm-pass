#include "SignatureObfuscatorPass.h"
#include "SignatureObfuscatorAnalysis.h"
#include "ObfuscationAttributes.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/InstrTypes.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/IR/Verifier.h"
#include "llvm/Support/CommandLine.h"
#include "llvm/ADT/StringExtras.h" 
#include "llvm/Transforms/Utils/Cloning.h"

#include <random>
#include <algorithm>
#include <string>

using namespace llvm;

namespace{
    enum class SignatureMode { All, Rename, Dummy, Shuffle};

    cl::OptionCategory SIGCategory("Signature Obfuscation Options", "Options for configuring the Signature Obfuscation pass.");
    
    static cl::opt<uint64_t> seed("sig-seed", 
           cl::init(0xC0FFEE),
           cl::desc("Seed for deterministic name/shuffle generation"),
           cl::cat(SIGCategory));

    cl::opt<SignatureMode> SIGMode("sig-mode",
    cl::init(SignatureMode::All),
    cl::values(
        clEnumValN(SignatureMode::All,   "all",   "Apply all signature transformations (rename, dummy parameters, and argument shuffle)"),
        clEnumValN(SignatureMode::Rename,   "rename",   "Rename candidate functions only"),
        clEnumValN(SignatureMode::Dummy, "dummy", "Inject dummy parameters only to candidate functions"),
        clEnumValN(SignatureMode::Shuffle,    "shuffle",    "Shuffle function parameter ordering only to candidate functions")
    ),
    cl::desc("Specify which signature obfuscation transformations to apply"),
    cl::cat(SIGCategory));

    cl::opt<unsigned> dummyCount("sig-dummy-count",
    cl::init(0),
    cl::desc(  "Number of dummy parameters to add; 0 selects automatic sizing"),
    cl::cat(SIGCategory));

    struct FunctionContext {
        Function *originalF = nullptr; 
        Function *currentF=nullptr;
        Function *replacementF=nullptr;
            
        SmallVector<unsigned,10> perm;

        explicit FunctionContext(Function *originalF) : originalF(originalF) {
            currentF = originalF;
        }

        void applyRename();
        void applyDummyParameters(unsigned count);
        bool applyShuffle();
        void rewriteCallSites();

    private:
        void appendDummyParams(unsigned N);
        void shuffleSlots();
    };

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

        if (finalArgCount < originalArgCount) report_fatal_error("SignatureObfuscatorPass: unexpected parameter removal");

        const unsigned dummyCount = finalArgCount - originalArgCount;

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
        FunctionContext Context(functionInfo.Fn);
        if (functionInfo.canRename && (SIGMode == SignatureMode::All || SIGMode == SignatureMode::Rename)) 
            Context.applyRename();
        
        if (functionInfo.canAddDummy && (SIGMode == SignatureMode::All || SIGMode == SignatureMode::Dummy)) {
            unsigned padCount = 0;
            if (dummyCount == 0)
                padCount = analysisResult.MaxArgs - Context.currentF->arg_size() + 1;
            else
                padCount = dummyCount;
            Context.applyDummyParameters(padCount);
            changed =true;
        }

        if (functionInfo.canShuffle && (SIGMode == SignatureMode::All || SIGMode == SignatureMode::Shuffle)) {
            if (Context.replacementF != nullptr) {
                    Context.currentF = Context.replacementF;
                    Context.replacementF = nullptr;
                }
            changed = Context.applyShuffle();
        }

        if (Context.replacementF != nullptr) {
            Function *finalF = Context.replacementF;
            Function *intermediateF = Context.currentF != Context.originalF?Context.currentF:nullptr;
            Context.rewriteCallSites();
            if (!Context.originalF->use_empty()) report_fatal_error("SignatureObfuscatorPass could not replace all original uses");
        
            Context.originalF->eraseFromParent();
            if (intermediateF != nullptr) {
                if (!intermediateF->use_empty()) {
                    errs() << "Error: intermediate function still has users: " << intermediateF->getName() << '\n';
                    report_fatal_error( "SignatureObfuscatorPass could not remove intermediate function");
                }
                intermediateF->eraseFromParent();
            }
            Context.currentF = finalF;
            Context.replacementF = nullptr;
        }
      
    }
    
    if (changed && verifyModule(M, &errs())) report_fatal_error("SignatureObfuscatorPass produced an invalid module");

    return changed ? PreservedAnalyses::none() : PreservedAnalyses::all();
}