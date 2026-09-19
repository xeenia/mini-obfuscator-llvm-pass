#include "llvm/IR/PassManager.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/BasicBlock.h"
#include "llvm/IR/Instructions.h"
#include "llvm/Support/raw_ostream.h"
#include <llvm/Transforms/Utils/Local.h>
#include <llvm/Transforms/Utils/BasicBlockUtils.h> 
#include "llvm/IR/Verifier.h"
#include "ControlFlowFlatteningPass.h"
#include "llvm/Transforms/Utils/PromoteMemToReg.h"
#include "llvm/Analysis/AssumptionCache.h"
#include "llvm/ADT/STLExtras.h"
#include "llvm/Support/RandomNumberGenerator.h"


using namespace llvm;

namespace{
    cl::OptionCategory CFFCategory("Control Flow Flattening Options", "Options for configuring the Control Flow Flattening (CFF) pass.");
    enum class PromoteKind { None, Phis, Values, All };
    enum class DiagVerbosity { None, CrossValues, DynAlloca, All, Quick };
    enum class ObfLevel { None, Shuffle};

    cl::opt<PromoteKind> CFFPromote(
        "cff-promote",
        cl::init(PromoteKind::None),
        cl::values(
            clEnumValN(PromoteKind::None,   "none",   "Do not promote any values to SSA (keep all demoted to stack)"),
            clEnumValN(PromoteKind::Phis,   "phis",   "Promote PHI nodes that were demoted to SSA registers only"),
            clEnumValN(PromoteKind::Values, "values", "Promote cross-basic-block values that were demoted to SSA registers only"),
            clEnumValN(PromoteKind::All,    "all",    "Promote all values and PHI nodes that were demoted to SSA registers")
        ),
        cl::desc("Specify the SSA register promotion mode for flattened variables"),
        cl::cat(CFFCategory));

    cl::opt<DiagVerbosity> CFFDumpDiagnostics(
        "cff-dump-diag",
        cl::init(DiagVerbosity::None),
        cl::values(
            clEnumValN(DiagVerbosity::None,        "none",       "Disable diagnostic output"),
            clEnumValN(DiagVerbosity::CrossValues, "cross",      "Print detailed info on cross-basic-block value dependencies"),
            clEnumValN(DiagVerbosity::DynAlloca,    "dyn-alloca", "Print detailed info on dynamic memory allocations (alloca)"),
            clEnumValN(DiagVerbosity::All,         "all",        "Print comprehensive details for both cross-block values and dynamic allocas"),
            clEnumValN(DiagVerbosity::Quick,       "quick",      "Print a single-line summary listing 'CROSS', 'ALLOCA' or 'BOTH' per function")
        ),
        cl::desc("Configure diagnostic verbosity level for analyzing control flow constructs (only for original cfg)"),
        cl::cat(CFFCategory));

    cl::opt<ObfLevel> CFFLevel(
        "cff-level",
        cl::init(ObfLevel::None),
        cl::values(
            clEnumValN(ObfLevel::None,        "0",       "Basic CFF without additional transformations (sequential case states, unshuffled)"),
            clEnumValN(ObfLevel::Shuffle, "1",      "Basic CFF with randomized/shuffled case order")
        ),
        cl::desc("Specify the obfuscation level for Control Flow Flattening (CFF)"),
        cl::cat(CFFCategory));

    cl::opt<bool> CFFNoDispatch(
        "cff-no-dispatch",
        cl::init(false),
        cl::desc("Split basic blocks without inserting the central switch dispatcher."),
        cl::cat(CFFCategory));

    cl::opt<unsigned> CFFMaxBlocks(
        "cff-max-blocks",
        cl::init(0),
        cl::desc("Maximum number of original basic blocks permitted in a function to apply flattening (0 = unlimited)"),
        cl::cat(CFFCategory));

    cl::opt<unsigned> CFFMinBlocks(
        "cff-min-blocks",
        cl::init(3),
        cl::desc("Minimum number of original basic blocks required in a function to trigger flattening"),
        cl::cat(CFFCategory));
    struct DispatcherBuilder {
        Function &F;
        IRBuilder<> builder;
        AllocaInst *stateVar = nullptr;
        BasicBlock *switchBB = nullptr;
        BasicBlock *defaultBB = nullptr; //added it for future implementations
        BasicBlock *loopBB = nullptr;
        BasicBlock *firstBlock = nullptr;

        DenseMap<BasicBlock *, unsigned> StateForBlock;

        explicit DispatcherBuilder(Function &F, BasicBlock *EntryBB, BasicBlock *firstBlock) 
            : F(F), builder(EntryBB), firstBlock(firstBlock) {}

        void addstateVarToEntryBB(); 
        void rewriteUnconditionalBranch(BranchInst *BI); 
        void rewriteConditionalBranch(BranchInst *BI);
        void rewriteSwitch(SwitchInst *SI);
        int findStateForBlock(BasicBlock *Target) const; 
    };

    void printSkipMessage(llvm::StringRef FuncName, const Twine &reason) {
        errs() << "[CFF] "<< llvm::format("%-40s", FuncName.str().c_str())<< " -> [SKIPPED]  " << reason.str() << "\n";
    }
    void printFlattenedSplittedMessage(llvm::StringRef FuncName, bool noDispatch) {
        errs() << "[CFF] "<< llvm::format("%-40s", FuncName.str().c_str()) << " -> [" << (noDispatch ? "SPLIT" : "FLATTENED") << "]\n";
    }  

    //this function is from repo: https://github.com/samrussell/obfus
    std::string getSimpleNodeLabel(const BasicBlock *Node) {
        if (!Node->getName().empty())
            return Node->getName().str();

        std::string Str;
        raw_string_ostream OS(Str);

        Node->printAsOperand(OS, false);
        return OS.str();
    }

    void printDiagnostic(Function &F) {
        if (CFFDumpDiagnostics == DiagVerbosity::Quick) {
            bool HasCrossBlockUse = false;
            bool HasDynAlloca = false;

            //checks for cross-block uses
            for (BasicBlock &UserBB : F) {
                for (Instruction &User : UserBB) {
                    if (isa<PHINode>(User))
                        continue;
                    for (Value *Op : User.operands()) {
                        auto *Def = dyn_cast<Instruction>(Op);
                        if (!Def || isa<PHINode>(Def))
                            continue;
                        BasicBlock *DefBB = Def->getParent();
                        if (DefBB == &UserBB)
                            continue;
                        auto *AI = dyn_cast<AllocaInst>(Def);
                        if (AI && AI->isStaticAlloca() && DefBB == &F.getEntryBlock())
                            continue;

                        HasCrossBlockUse = true;
                        break;
                    }
                    if (HasCrossBlockUse) break;
                }
                if (HasCrossBlockUse) break;
            }

            //checks for dynamic allocas
            for (BasicBlock &BB : F) {
                for (Instruction &I : BB) {
                    auto *AI = dyn_cast<AllocaInst>(&I);
                    if (AI && !AI->isStaticAlloca()) {
                        HasDynAlloca = true;
                        break;
                    }
                }
                if (HasDynAlloca) break;
            }

            
            if (HasCrossBlockUse && HasDynAlloca) {
                errs() << "[CFFDiagnostic] "<< llvm::format("%-40s", F.getName().str().c_str())<< " -> [BOTH]\n";
            } else if(HasCrossBlockUse){
                errs() << "[CFFDiagnostic] "<< llvm::format("%-40s", F.getName().str().c_str())<< " -> [CROSS]\n";
            }else if(HasDynAlloca){
                errs() << "[CFFDiagnostic] "<< llvm::format("%-40s", F.getName().str().c_str())<< " -> [ALLOCA]\n";
            }
            return;
        }

        if (CFFDumpDiagnostics == DiagVerbosity::CrossValues || CFFDumpDiagnostics == DiagVerbosity::All) {
            errs() << "\n========== CFF Diagnostics: " << F.getName() << " ==========\n";
            errs() << "\n[DOMINANCE CROSS-BLOCK USES]\n";
            bool FoundCrossBlockUse = false;
            for (BasicBlock &UserBB : F) {
                for (Instruction &User : UserBB) {
                    if (isa<PHINode>(User))
                        continue;
                    for (Value *Op : User.operands()) {
                        auto *Def = dyn_cast<Instruction>(Op);
                        if (!Def)
                            continue;
                        if (isa<PHINode>(Def))
                            continue;
                        BasicBlock *DefBB = Def->getParent();
                        if (DefBB == &UserBB)
                            continue;
                        auto *AI = dyn_cast<AllocaInst>(Def);
                        if (AI && AI->isStaticAlloca() &&
                            DefBB == &F.getEntryBlock()) {
                            continue;
                        }
                        FoundCrossBlockUse = true;
                        errs() << "  User: ";
                        User.printAsOperand(errs(), false);
                        errs() << "\n    block: ";
                        errs() << getSimpleNodeLabel(&UserBB);
                        errs() << "\n    uses value: ";
                        Def->printAsOperand(errs(), false);
                        errs() << "\n    defined in: ";
                        errs() << getSimpleNodeLabel(DefBB);
                        errs() << "\n\n";
                    }
                }
            }
            if (!FoundCrossBlockUse)
                errs() << "  None\n";
        }
        if (CFFDumpDiagnostics == DiagVerbosity::DynAlloca || CFFDumpDiagnostics == DiagVerbosity::All) {
            errs() << "\n[DYNAMIC ALLOCA]\n";
            bool FoundDynamicAlloca = false;
            for (BasicBlock &BB : F) {
                for (Instruction &I : BB) {
                    auto *AI = dyn_cast<AllocaInst>(&I);
                    if (!AI || AI->isStaticAlloca())
                        continue;
                    FoundDynamicAlloca = true;
                    errs() << "  Alloca: ";
                    AI->printAsOperand(errs(), false);
                    errs() << "\n    defined in: " << getSimpleNodeLabel(&BB) << "\n";
                    errs() << "    used in blocks:\n";
                    SmallPtrSet<BasicBlock *, 8> UsedBlocks;
                    for (User *U : AI->users()) {
                        auto *UserI = dyn_cast<Instruction>(U);
                        if (!UserI)
                            continue;
                        UsedBlocks.insert(UserI->getParent());
                    }
                    if (UsedBlocks.empty()) {
                        errs() << "      None\n";
                    } else {
                        for (BasicBlock *UserBB : UsedBlocks) {
                            errs() << "      " << getSimpleNodeLabel(UserBB) << "\n";
                        }
                    }
                    errs() << "\n";
                }
            }
            if (!FoundDynamicAlloca) errs() << "  None\n";
        }
        errs() << "\n";
    }

    SmallVector<AllocaInst *, 16> demotePHIs(Function& F) {
        SmallVector<PHINode *, 16> phiNodes;
        SmallVector<AllocaInst *, 16> AllocasFromPhis;
        do {
            phiNodes.clear();
            for (auto& BB : F) {
                for (auto& I : BB.phis()) {
                    phiNodes.push_back(&I);
                }
            }
            for (PHINode* phi : phiNodes) {
                AllocaInst *Slot = DemotePHIToStack(phi);
                if (Slot)
                    AllocasFromPhis.push_back(Slot);
            }
        } while (!phiNodes.empty());
        
        return AllocasFromPhis;
    }

    SmallVector<AllocaInst *, 16> demoteFunction(Function& F) {
        SmallVector<AllocaInst *, 16> AllocasFromValues;
        SmallPtrSet<Instruction *, 32> ValuesToDemote;

        for (BasicBlock &UserBB : F) {
            for (Instruction &User : UserBB) {
                if (isa<PHINode>(User))
                    continue;

                for (Value *Op : User.operands()) {
                    auto *Def = dyn_cast<Instruction>(Op);
                    if (!Def)
                        continue;

                    if (isa<PHINode>(Def))
                        continue;

                    BasicBlock *DefBB = Def->getParent();

                    if (DefBB == &UserBB)
                        continue;
                    auto *AI = dyn_cast<AllocaInst>(Def);
                    if (AI && AI->isStaticAlloca() && DefBB == &F.getEntryBlock())
                        continue;

                    ValuesToDemote.insert(Def);
                }
            }
        }

        for (Instruction *I : ValuesToDemote) {
            AllocaInst *Slot = DemoteRegToStack(*I);

            if (Slot)
                AllocasFromValues.push_back(Slot);
        }
        
        return AllocasFromValues;
    }

    bool promoteFunction(DominatorTree &DT, AssumptionCache &AC, ArrayRef<AllocaInst *> AllocasToPromote) {
        SmallVector<AllocaInst *, 16> Promotable;
        for (AllocaInst *AI : AllocasToPromote)
            if (isAllocaPromotable(AI))
                Promotable.push_back(AI);

        if (Promotable.empty())
            return false;

        PromoteMemToReg(Promotable, DT, &AC);
        return true;
    }

    bool sliceConditionInstructions(BasicBlock *BB, Instruction *I, SmallPtrSetImpl<Instruction *> &Slice) { 
        if (!I || I->getParent() != BB)
            return true;
        if (!Slice.insert(I).second)
            return true;

        for (Use &U : I->operands()) {
            if (auto *OpInst = dyn_cast<Instruction>(U.get())) {
                if (OpInst->mayHaveSideEffects()) {
                    Slice.clear();
                    return false; 
                }
                if (!sliceConditionInstructions(BB, OpInst, Slice))
                    return false;
            }
        }
        return true;
    }

    void DispatcherBuilder::addstateVarToEntryBB(){ 
        Instruction *Term = F.getEntryBlock().getTerminator();
        builder.SetInsertPoint(Term); 
        stateVar = builder.CreateAlloca(builder.getInt32Ty(), nullptr, "b");
        uint32_t index = findStateForBlock(firstBlock);
        builder.CreateStore(builder.getInt32(index), stateVar);
    }
    int DispatcherBuilder::findStateForBlock(BasicBlock *Target) const{
        auto It = StateForBlock.find(Target);
        return (It != StateForBlock.end()) ? static_cast<int>(It->second) : -1;
    }

    void DispatcherBuilder::rewriteUnconditionalBranch(BranchInst *BI){
        builder.SetInsertPoint(BI);
        uint32_t index = findStateForBlock(BI->getSuccessor(0));
        if(index == -1) report_fatal_error("Target block not in flatten set.");
        builder.CreateStore(builder.getInt32(index), stateVar);
        BI->setSuccessor(0, loopBB);
        BI->dropUnknownNonDebugMetadata();
    }

    void DispatcherBuilder::rewriteConditionalBranch(BranchInst *BI){
        builder.SetInsertPoint(BI);
        BasicBlock *trueTarget  = BI->getSuccessor(0);
        BasicBlock *falseTarget = BI->getSuccessor(1);

        uint32_t trueB  = findStateForBlock(trueTarget);
        uint32_t falseB = findStateForBlock(falseTarget);
        if (trueB == -1 || falseB == -1) report_fatal_error("Target block not in flatten set.");
        Value *SV = builder.CreateSelect(BI->getCondition(), builder.getInt32(trueB), builder.getInt32(falseB));
        builder.CreateStore(SV, stateVar);
        builder.CreateBr(loopBB);

        BI->eraseFromParent();
    }

    void DispatcherBuilder::rewriteSwitch(SwitchInst *SI){
        LLVMContext &Ctx = F.getContext();
        for (unsigned s = 0; s < SI->getNumSuccessors(); ++s) {
            int nextState = findStateForBlock(SI->getSuccessor(s));
            if (nextState == -1) 
                report_fatal_error("Switch target block not found in flatten set.");
            BasicBlock *caseBB = BasicBlock::Create(Ctx, "case", &F);
            builder.SetInsertPoint(caseBB);
            builder.CreateStore(builder.getInt32(nextState), stateVar);
            builder.CreateBr(loopBB);
            SI->setSuccessor(s, caseBB);
        }
    }

    void createAndBuildDispatcher(Function &F,  SmallVector<BasicBlock*, 20> &BBtoFlatten) {
        DispatcherBuilder DBuilder(F,&F.getEntryBlock(), BBtoFlatten[0]);

        LLVMContext &Ctx = DBuilder.F.getContext();

        DBuilder.defaultBB = BasicBlock::Create(Ctx, "default", &F);
        DBuilder.builder.SetInsertPoint(DBuilder.defaultBB);
        DBuilder.builder.CreateUnreachable();
        
        DBuilder.switchBB = BasicBlock::Create(Ctx, "switch", &F);
        DBuilder.builder.SetInsertPoint(DBuilder.switchBB);
        Value *tempVal = DBuilder.builder.getInt32(0);
        SwitchInst *SI = DBuilder.builder.CreateSwitch(tempVal, DBuilder.defaultBB, BBtoFlatten.size());

        if(CFFLevel==ObfLevel::Shuffle){
            std::mt19937 Gen(std::random_device{}());
            llvm::shuffle(BBtoFlatten.begin(), BBtoFlatten.end(), Gen);
        }

        for (size_t i = 0; i < BBtoFlatten.size(); i++) {
            SI->addCase(DBuilder.builder.getInt32(i), BBtoFlatten[i]);
        }
        DBuilder.StateForBlock.reserve(BBtoFlatten.size());
        for (unsigned i = 0; i < BBtoFlatten.size(); ++i)
            DBuilder.StateForBlock[BBtoFlatten[i]] = i;

        DBuilder.loopBB = BasicBlock::Create(Ctx, "loop", &F);
        DBuilder.builder.SetInsertPoint(DBuilder.loopBB);
        DBuilder.builder.CreateBr(DBuilder.switchBB);


        DBuilder.addstateVarToEntryBB();
        for (size_t i = 0; i < BBtoFlatten.size(); i++) {
            BasicBlock *BB = BBtoFlatten[i];
            Instruction *Term = BB->getTerminator();
            if (isa<ReturnInst>(Term)) continue;  
            else if(auto *SI = dyn_cast<SwitchInst>(Term)) 
                DBuilder.rewriteSwitch(SI);
            else if(auto *BI = dyn_cast<BranchInst>(Term)){  
                if (!BI->isConditional()) 
                    DBuilder.rewriteUnconditionalBranch(BI);
                else 
                    DBuilder.rewriteConditionalBranch(BI);
            }        
        }

    //update switch condition
    DBuilder.builder.SetInsertPoint(SI);
    Value *stateVal = DBuilder.builder.CreateLoad(DBuilder.builder.getInt32Ty(), DBuilder.stateVar, "b");
    SI->setCondition(stateVal);
    //connecting the entry point with the dispatcher
    auto *entryTerm = dyn_cast<BranchInst>(DBuilder.F.getEntryBlock().getTerminator());
    if (entryTerm) {
        entryTerm->setSuccessor(0, DBuilder.switchBB);
    }
}

     void createNewEntryBlock(Function &F){
        LLVMContext &Ctx = F.getContext();
        BasicBlock *EntryBB = &F.getEntryBlock();
        BasicBlock *newEntryBB = BasicBlock::Create(Ctx, "entry", &F);
        IRBuilder<> entryBuilder(newEntryBB);
        entryBuilder.CreateBr(EntryBB);
        newEntryBB->moveBefore(EntryBB);
        SmallVector<AllocaInst*, 16> Allocas;
        for (Instruction &I : *EntryBB) {
            if (AllocaInst *AI = dyn_cast<AllocaInst>(&I))
                Allocas.push_back(AI);
        }
        Instruction *InsertPt = &*newEntryBB->getFirstInsertionPt();
        if(!Allocas.empty())
        for (AllocaInst *AI : Allocas) {
            if (!isa<ConstantInt>(AI->getArraySize()))   
                continue;    // dynamic alloca — leave it in place 
            AI->moveBefore(InsertPt);
            InsertPt = AI->getNextNode();  
        }
    }
    void prepareBlocksForFlattening(Function &F, SmallVector<BasicBlock*, 20> &BBtoFlatten){
        createNewEntryBlock(F);
        SmallVector<BasicBlock *, 32> OriginalBlocks;
        for (auto It = std::next(F.begin()), End = F.end(); It != End; ++It)
            OriginalBlocks.push_back(&*It);
        for (BasicBlock *BB : OriginalBlocks) {
            Instruction *I = BB->getTerminator();
            if(isa<BranchInst>(I)){ 
                auto *BI = dyn_cast<BranchInst>(I);
                if (!BI->isConditional()) { //br with only 1 successor
                    BBtoFlatten.push_back(BB);
                }else{
                    Value *condVal = BI->getCondition();
                    auto *condInst = dyn_cast<Instruction>(condVal);
                    if (!condInst) { 
                        BBtoFlatten.push_back(BB);
                        continue;
                    }
                    SmallPtrSet<Instruction*, 15> slice;
                    sliceConditionInstructions(BB, condInst, slice);

                    Instruction *earliestI = nullptr;
                    for (Instruction &I : *BB) {
                        if (slice.count(&I)) {
                            earliestI = &I;
                            break;
                        }
                    }
                    if (earliestI) {
                        BasicBlock *firstBlock = nullptr;
                        if (earliestI == &*BB->begin()) {
                            firstBlock = BB;
                            BBtoFlatten.push_back(firstBlock);
                        } else {
                            firstBlock = BB->splitBasicBlockBefore(earliestI);
                            auto *br = dyn_cast<BranchInst>(firstBlock->getTerminator());
                            BasicBlock *secondBlock = br->getSuccessor(0);

                            BBtoFlatten.push_back(firstBlock);
                            BBtoFlatten.push_back(secondBlock);     
                        }
                    }
                }
            }else{
                BBtoFlatten.push_back(BB);
            }
        }
    }

    void flattenFunction(Function& F){
        SmallVector<BasicBlock*, 20> BBtoFlatten;
        prepareBlocksForFlattening(F,BBtoFlatten);
        SmallPtrSet<BasicBlock *, 32> FlattenSet;
        for (BasicBlock *BB : BBtoFlatten) {
            if (!FlattenSet.insert(BB).second)
                report_fatal_error("CFF: duplicate block in flatten set");
        }
        for (BasicBlock *BB : BBtoFlatten) {
            for (BasicBlock *Succ : successors(BB)) {
                if (!FlattenSet.contains(Succ))
                    report_fatal_error("CFF: successor missing from flatten set");
            }
        }
        if (!CFFNoDispatch)
            createAndBuildDispatcher(F, BBtoFlatten);
        printFlattenedSplittedMessage(F.getName(),CFFNoDispatch);
    }

    bool isSupportedTerminator(const Instruction *I) {
        return isa<BranchInst>(I) ||
            isa<ReturnInst>(I) ||
            isa<UnreachableInst>(I) ||
            isa<SwitchInst>(I);
    }



    bool isCFFCandidate(Function &F){
        if(F.isDeclaration()) {
            printSkipMessage(F.getName(), "function declaration");
            return false;
        }
        if(F.size() < CFFMinBlocks) {
            printSkipMessage(F.getName(), "fewer than " + Twine(CFFMinBlocks.getValue()) + " basic blocks");
            return false;
        }
        for(BasicBlock &BB: F){
            if(!isSupportedTerminator(BB.getTerminator())) {
                printSkipMessage(F.getName(), Twine(BB.getTerminator()->getOpcodeName()) + " instruction is not supported");
                return false;
            }
            if (BB.isEHPad()){
                printSkipMessage(F.getName(), "exception handling block is not supported");
                return false;
            }
            for (User *U : BB.users())
                if (isa<BlockAddress>(U)){
                    printSkipMessage(F.getName(), "block address is not supported");
                    return false;
                }
                    
        }
        return true;
    }
    bool exceedsBlockLimits(Function &F) {
        unsigned N = F.size();  
        if (CFFMaxBlocks != 0 && N > CFFMaxBlocks) {
            printSkipMessage(F.getName(), Twine(N) + " basic blocks exceeds the maximum of " + Twine(CFFMaxBlocks.getValue()));
            return true;
        } 
        return false;
    }
}//end namespace
PreservedAnalyses ControlFlowFlatteningPass::run(Function &F, FunctionAnalysisManager &AM) {
    if (!isCFFCandidate(F))  return PreservedAnalyses::all();
    if (exceedsBlockLimits(F)) return PreservedAnalyses::all();
    
    if (CFFDumpDiagnostics != DiagVerbosity::None) {
        printDiagnostic(F);
        return PreservedAnalyses::all();
    }
    SmallVector<AllocaInst *,16> AllocasFromPhis = demotePHIs(F);
    SmallVector<AllocaInst *, 16> AllocasFromValues = demoteFunction(F);
    flattenFunction(F);

    if (verifyFunction(F, &errs()))
        report_fatal_error("ControlFlowFlatteningPass produced an invalid function");

    if (CFFPromote != PromoteKind::None) {
        DominatorTree DT(F);
        auto &AC = AM.getResult<AssumptionAnalysis>(F);

        switch (CFFPromote) {
        case PromoteKind::Phis:
            promoteFunction(DT, AC, AllocasFromPhis);
            break;
        case PromoteKind::Values:
            promoteFunction(DT, AC, AllocasFromValues);
            break;
        case PromoteKind::All:
            promoteFunction(DT, AC, AllocasFromPhis);
            promoteFunction(DT, AC, AllocasFromValues);
            break;
        }
        if (verifyFunction(F, &errs()))
        report_fatal_error("ControlFlowFlatteningPass produced an invalid function");
    }
    return PreservedAnalyses::none();
}