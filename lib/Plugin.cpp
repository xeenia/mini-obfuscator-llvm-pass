#include "SignatureObfuscatorAnalysis.h"
#include "ControlFlowFlatteningPass.h"
#include "SignatureObfuscatorPass.h"
#include "llvm/Passes/PassBuilder.h"
#include "llvm/Passes/PassPlugin.h"
#include "llvm/IR/PassManager.h"

using namespace llvm;

PassPluginLibraryInfo getPluginInfo(){
    return {LLVM_PLUGIN_API_VERSION, "miniObfuscator", LLVM_VERSION_STRING,
            [](PassBuilder &PB) {
                PB.registerAnalysisRegistrationCallback(
                    [](ModuleAnalysisManager &MAM) {
                        MAM.registerPass([] { return SignatureObfuscatorAnalysis(); });
                    }
                );

                PB.registerPipelineParsingCallback(
                    [](StringRef Name, ModulePassManager &MPM, ArrayRef<PassBuilder::PipelineElement>){
                        if(Name == "obfpass") {
                            MPM.addPass(SignatureObfuscatorPass());
                            return true;
                        }
                        if(Name == "CFFPass"){
                            MPM.addPass(
                                createModuleToFunctionPassAdaptor(
                                    ControlFlowFlatteningPass()
                                )
                            );
                            return true;
                        }  
                        return false;
                    }
                );
            }  
    };
}

extern "C" LLVM_ATTRIBUTE_WEAK PassPluginLibraryInfo llvmGetPassPluginInfo(){
    return getPluginInfo();
}