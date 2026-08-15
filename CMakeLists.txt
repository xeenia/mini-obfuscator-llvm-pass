cmake_minimum_required(VERSION 3.20)
project(miniObfuscator)

find_package(LLVM REQUIRED CONFIG)
list(APPEND CMAKE_MODULE_PATH ${LLVM_CMAKE_DIR})
include(AddLLVM)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

add_definitions(${LLVM_DEFINITIONS})
include_directories(${LLVM_INCLUDE_DIRS} include)

add_llvm_library(miniObfuscator MODULE
lib/SignatureObfuscatorPass.cpp
lib/SignatureObfuscatorAnalysis.cpp
lib/ControlFlowFlatteningPass.cpp
lib/Plugin.cpp
PLUGIN_TOOL
opt
)