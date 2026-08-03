# mini-obfuscator-llvm-pass

This is an ongoing educational project for learning LLVM module-level IR transformations and getting a first look at software obfuscation techniques.

The pass currently experiments with:

- function-name obfuscation
- dummy-parameter insertion
- parameter shuffling

It has several limitations and is not intended to be a production-ready obfuscator. It is mainly a way for me to understand more how LLVM functions, signatures, cloned functions, and call sites can be transformed.

Also the project currently uses LLVM 17, C++17, CMake and ninja.

## future plans

- learn and apply better LLVM transformation practices
- improve the current obfuscation techniques
- support more realistic dummy parameter types and values
- test the generated binaries with Ghidra
- learn more about reverse engineering and ABI-related issues
- improve the pass so the transformations work better with optimization
- add more tests 

This project is still being developed, and the design may change as I learn more about LLVM and reverse engineering.
