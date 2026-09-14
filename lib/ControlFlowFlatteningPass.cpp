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
#include "llvm/Transforms/Utils/Mem2Reg.h"
#include "llvm/Transforms/Utils/PromoteMemToReg.h"
#include "llvm/Analysis/AssumptionCache.h"

using namespace llvm;
static cl::OptionCategory CFFCategory("Control Flow Flattening Options", "Options for configuring the Control Flow Flattening (CFF) pass.");
enum class PromoteMode { None, Phis, Values, All };
enum class DiagnosticMode { None, CrossValues, DynAlloca, All, Quick };

static cl::opt<PromoteMode> CFFPromote(
    "cff-promote",
    cl::init(PromoteMode::None),
    cl::values(
        clEnumValN(PromoteMode::None,   "none",   "Do not promote any values to SSA (keep all demoted to stack)"),
        clEnumValN(PromoteMode::Phis,   "phis",   "Promote PHI nodes that were demoted to SSA registers only"),
        clEnumValN(PromoteMode::Values, "values", "Promote cross-basic-block values that were demoted to SSA registers only"),
        clEnumValN(PromoteMode::All,    "all",    "Promote all values and PHI nodes that were demoted to SSA registers")
    ),
    cl::desc("Specify the SSA register promotion mode for flattened variables"),
    cl::cat(CFFCategory));

static cl::opt<DiagnosticMode> CFFPrintDiagnostics(
    "cff-diagnostics",
    cl::init(DiagnosticMode::None),
    cl::values(
        clEnumValN(DiagnosticMode::None,        "none",       "Disable diagnostic output"),
        clEnumValN(DiagnosticMode::CrossValues, "cross",      "Print detailed info on cross-basic-block value dependencies"),
        clEnumValN(DiagnosticMode::DynAlloca,    "dyn-alloca", "Print detailed info on dynamic memory allocations (alloca)"),
        clEnumValN(DiagnosticMode::All,         "all",        "Print comprehensive details for both cross-block values and dynamic allocas"),
        clEnumValN(DiagnosticMode::Quick,       "quick",      "Print a single-line summary listing 'CROSS', 'ALLOCA' or 'BOTH' per function")
    ),
    cl::desc("Configure diagnostic verbosity level for analyzing control flow constructs (only for original cfg)"),
    cl::cat(CFFCategory));

static cl::opt<bool> CFFNoDispatch(
    "cff-no-dispatch",
    cl::init(false),
    cl::desc("Split basic blocks without inserting the central switch dispatcher."),
    cl::cat(CFFCategory));

static cl::opt<unsigned> CFFMaxBlocks(
    "cff-max-blocks",
    cl::init(100),
    cl::desc("Maximum number of original basic blocks permitted in a function to apply flattening (0 = unlimited)"),
    cl::cat(CFFCategory));

static cl::opt<unsigned> CFFMinBlocks(
    "cff-min-blocks",
    cl::init(3),
    cl::desc("Minimum number of original basic blocks required in a function to trigger flattening"),
    cl::cat(CFFCategory));




void printSkipMessage(llvm::StringRef FuncName, llvm::StringRef reason) {
    errs() << "[CFF] "<< llvm::format("%-40s", FuncName.str().c_str())<< " -> [SKIPPED]  " << reason << "\n";
}
void printFlattenedSplittedMessage(llvm::StringRef FuncName, bool noDispatch) {
    errs() << "[CFF] "<< llvm::format("%-40s", FuncName.str().c_str()) << " -> [" << (noDispatch ? "SPLITTED" : "FLATTENED") << "]\n";
}  

//this function is from repo: https://github.com/samrussell/obfus
static std::string getSimpleNodeLabel(const BasicBlock *Node) {
    if (!Node->getName().empty())
        return Node->getName().str();

    std::string Str;
    raw_string_ostream OS(Str);

    Node->printAsOperand(OS, false);
    return OS.str();
}

void printDiagnostic(Function &F) {
    if (CFFPrintDiagnostics == DiagnosticMode::Quick) {
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

    if (CFFPrintDiagnostics == DiagnosticMode::CrossValues || CFFPrintDiagnostics == DiagnosticMode::All) {
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
    if (CFFPrintDiagnostics == DiagnosticMode::DynAlloca || CFFPrintDiagnostics == DiagnosticMode::All) {
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

static SmallVector<AllocaInst *, 16> demotePHIs(Function& F) {
    std::vector<PHINode*> phiNodes;
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

static SmallVector<AllocaInst *, 16> demoteFunction(Function& F) {
    SmallVector<AllocaInst *, 16> AllocasFromValues;
    SmallPtrSet<Instruction *, 32> ValuesToDemote;

    for (BasicBlock &UserBB : F) {
        for (Instruction &User : UserBB) {
            // Skip PHIs.
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

                // Store the actual SSA value/definition.
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

static bool promoteFunction(DominatorTree &DT, AssumptionCache &AC, ArrayRef<AllocaInst *> AllocasToPromote) {
    SmallVector<AllocaInst *, 16> Promotable;
    for (AllocaInst *AI : AllocasToPromote)
        if (isAllocaPromotable(AI))
            Promotable.push_back(AI);

    if (Promotable.empty())
        return false;

    PromoteMemToReg(Promotable, DT, &AC);
    return true;
}

static void splitCodeBlockfromCondition(BasicBlock *BB, Instruction *I, SmallPtrSetImpl<Instruction*> &slice){ 
    //zigzag logic
    if (!I || I->getParent() != BB)
        return;
    if (!slice.insert(I).second)
        return;

    for (Use &U : I->operands()) {
        if (auto *OpInst = dyn_cast<Instruction>(U.get())) {
            if (OpInst->mayHaveSideEffects()) {
                slice.clear();
                return; 
            }
            splitCodeBlockfromCondition(BB, OpInst, slice);
        }
    }
}

static AllocaInst* addStateVarToEntryBB(BasicBlock *EntryBB){ 
    Instruction *Term = EntryBB->getTerminator();
    IRBuilder<> Builder(Term); 
    AllocaInst *allocaIns = Builder.CreateAlloca(Builder.getInt32Ty(), nullptr, "b");
    Builder.CreateStore(Builder.getInt32(0), allocaIns);
    return allocaIns;
}

static void createAndBuildDispatcher(Function &F,  SmallVector<BasicBlock*, 20> &BBtoFlatten) {
    LLVMContext &Ctx = F.getContext();
    BasicBlock *EntryBB = &F.getEntryBlock();

    AllocaInst *allocaIns = addStateVarToEntryBB(EntryBB);
    
    BasicBlock *defaultBB = BasicBlock::Create(Ctx, "default", &F);
    IRBuilder<> defaultBuilder(defaultBB);
    defaultBuilder.CreateUnreachable();
    
    //creating the dispatcher using 3 blocks: while loop, switch, and break
    //all cases point to the break block, which points back to the loop
    BasicBlock *switchBB = BasicBlock::Create(Ctx, "switch", &F);
    IRBuilder<> switchBuilder(switchBB);
    Value *stateVal = switchBuilder.CreateLoad(switchBuilder.getInt32Ty(), allocaIns, "b");
    SwitchInst *switchIns = switchBuilder.CreateSwitch(stateVal, defaultBB, BBtoFlatten.size());

    BasicBlock *breakBB = BasicBlock::Create(Ctx, "break", &F);
    IRBuilder<> breakBuilder(breakBB);
    breakBuilder.CreateBr(switchBB);
    //defaultBuilder.CreateBr(breakBB);

    //immediately we create all the cases and makes them point to all the blocks from the vector
    for (size_t i = 0; i < BBtoFlatten.size(); i++) {
        switchIns->addCase(switchBuilder.getInt32(i), BBtoFlatten[i]);
    }
    DenseMap<BasicBlock *, unsigned> StateForBlock;
    StateForBlock.reserve(BBtoFlatten.size());
    for (unsigned i = 0; i < BBtoFlatten.size(); ++i)
        StateForBlock[BBtoFlatten[i]] = i;

    auto findIndex = [&](BasicBlock *Target) -> int {
        auto It = StateForBlock.find(Target);
        return (It != StateForBlock.end()) ? (int)It->second : -1;
    };

    //now, since all the cases are created and fixed we just visit each block again and for each type 
    //(uncoditional, return and conditional) we do different transformations
    for (size_t i = 0; i < BBtoFlatten.size(); i++) {
        BasicBlock *BB = BBtoFlatten[i];
        Instruction *Term = BB->getTerminator();

        //since in my design i add every block to a case, the end point of the function will also be here
        //and since the program closes we do nothing
        if (isa<ReturnInst>(Term)) {  
            continue;  
        }

        auto *BI = dyn_cast<BranchInst>(Term);
        if (!BI) continue;

        IRBuilder<> builder(BI);   
        if (!BI->isConditional()) {
            //for uncoditional blocks is very straighforward, we just find the index that its successor points, to which case in teh switch
            //and then we create store for the b variable 
            int nextState = findIndex(BI->getSuccessor(0));
            if (nextState == -1) report_fatal_error("Target block not in flatten set.");
            builder.CreateStore(builder.getInt32(nextState), allocaIns);
            BI->setSuccessor(0, breakBB);
            BI->dropUnknownNonDebugMetadata();
        } else {
            //we need them in order to find later in which case they currently are
            BasicBlock *trueTarget  = BI->getSuccessor(0);
            BasicBlock *falseTarget = BI->getSuccessor(1);

            //creating also the new BBs to replace later as successors
            BasicBlock *trueBB = BasicBlock::Create(Ctx, "true", &F);
            BasicBlock *falseBB = BasicBlock::Create(Ctx, "false", &F);
            BasicBlock *breakConBB = BasicBlock::Create(Ctx, "break_con", &F);
            
            IRBuilder<> trueBuilder(trueBB);
            IRBuilder<> falseBuilder(falseBB);
            IRBuilder<> breakConBuilder(breakConBB);
        
            int trueB  = findIndex(trueTarget);
            int falseB = findIndex(falseTarget);
            if (trueB == -1 || falseB == -1) report_fatal_error("Target block not in flatten set.");

            //now we just update the new BBs with the corrected indexes
            trueBuilder.CreateStore(builder.getInt32(trueB), allocaIns);
            falseBuilder.CreateStore(builder.getInt32(falseB), allocaIns);
            //and finally we connect the new BBs toward the break BB
            falseBuilder.CreateBr(breakConBB);
            trueBuilder.CreateBr(breakConBB);
            breakConBuilder.CreateBr(breakBB);
            //replacement
            BI->setSuccessor(0,trueBB);
            BI->setSuccessor(1,falseBB);
            BI->dropUnknownNonDebugMetadata();
        }
    }

    //connecting the entry point with the dispatcher
    auto *entryTerm = dyn_cast<BranchInst>(EntryBB->getTerminator());
    if (entryTerm) {
        entryTerm->setSuccessor(0, switchBB);
    }
}

static void createNewEntryBlock(Function &F){
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
static void prepareBlocksForFlattening(Function &F, SmallVector<BasicBlock*, 20> &BBtoFlatten){
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
                splitCodeBlockfromCondition(BB, condInst, slice);

                Instruction *earliestI = nullptr;
                for (Instruction &sliceSearchI : *BB) {
                    if (slice.count(&sliceSearchI)) {
                        earliestI = &sliceSearchI;
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

static void flattenFunction(Function& F){
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

static bool isSupportedTerminator(const Instruction *I) {
    return isa<BranchInst>(I) ||
           isa<ReturnInst>(I) ||
           isa<UnreachableInst>(I);
}



bool isCFFCandidate(Function &F){
    if(F.isDeclaration()) {
        printSkipMessage(F.getName(), "function declaration");
        return false;
    }
    if(F.size() < CFFMinBlocks) {
        printSkipMessage(F.getName(), "fewer than " + std::to_string(CFFMinBlocks.getValue()) + " basic blocks");
        return false;
    }
    for(BasicBlock &BB: F){
        if(!isSupportedTerminator(BB.getTerminator())) {
            printSkipMessage(F.getName(), std::string(BB.getTerminator()->getOpcodeName()) + " instruction is not supported");
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
static bool exceedsBlockLimits(Function &F) {
    unsigned N = F.size();  
    if (CFFMaxBlocks != 0 && N > CFFMaxBlocks) {
        printSkipMessage(F.getName(), std::to_string(N) + " basic blocks exceeds the maximum of " + std::to_string(CFFMaxBlocks.getValue()));
        return true;
    } 
    return false;
}
PreservedAnalyses ControlFlowFlatteningPass::run(Function &F, FunctionAnalysisManager &AM) {
    if (!isCFFCandidate(F))  return PreservedAnalyses::all();
    if (exceedsBlockLimits(F)) return PreservedAnalyses::all();
    
    if (CFFPrintDiagnostics != DiagnosticMode::None) {
        printDiagnostic(F);
        return PreservedAnalyses::all();
    }
    SmallVector<AllocaInst *,16> AllocasFromPhis = demotePHIs(F);
    SmallVector<AllocaInst *, 16> AllocasFromValues = demoteFunction(F);
    flattenFunction(F);

    if (verifyFunction(F, &errs()))
        report_fatal_error("ControlFlowFlatteningPass produced an invalid function");

    if (CFFPromote != PromoteMode::None) {
        DominatorTree DT(F);
        auto &AC = AM.getResult<AssumptionAnalysis>(F);

        switch (CFFPromote) {
        case PromoteMode::Phis:
            promoteFunction(DT, AC, AllocasFromPhis);
            break;
        case PromoteMode::Values:
            promoteFunction(DT, AC, AllocasFromValues);
            break;
        case PromoteMode::All:
            promoteFunction(DT, AC, AllocasFromPhis);
            promoteFunction(DT, AC, AllocasFromValues);
            break;
        case PromoteMode::None:
            break;
        }
    }
    if (verifyFunction(F, &errs()))
        report_fatal_error("ControlFlowFlatteningPass produced an invalid function");
    return PreservedAnalyses::none();
}