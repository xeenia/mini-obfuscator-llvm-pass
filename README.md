# mini-obfuscator-llvm-pass

An ongoing educational project for learning LLVM IR transformations and exploring software obfuscation techniques.

The project contains two LLVM passes:

* **Signature Obfuscator** — transforms function names and signatures through function-name obfuscation, dummy-parameter insertion, and parameter shuffling.
* **Control Flow Flattening (CFF)** — transforms function control flow using basic-block splitting and a central switch dispatcher.

The project uses LLVM 17, C++17, CMake, and Ninja.

## Signature Obfuscator

The Signature Obfuscator experiments with transforming LLVM functions and their signatures, including their associated call sites.

Current transformations:

* Function-name obfuscation.
* Dummy-parameter insertion.
* Parameter shuffling.

This pass is intended to explore how LLVM functions, signatures, cloned functions, and call sites can be transformed on the module level.

It is an educational implementation and is not intended to provide production-grade obfuscation.

## Control Flow Flattening (CFF)

The CFF pass is an ongoing implementation of control-flow obfuscation at the LLVM IR level.

It processes functions individually, splitting basic blocks where needed and replacing the original branch-based control flow with a central `switch` dispatcher. Each flattened block is assigned a state, and branches update the state to determine the next block executed by the dispatcher.

The pass also handles SSA dependencies that can be affected by the transformation by demoting PHI nodes and selected cross-basic-block values to stack storage. Optional promotion back to SSA is available.

### Currently supported 

* Conditional and unconditional branches.
* Return and unreachable terminators.
* Common control-flow patterns such as `if` statements, loops, `goto`-based flow and `switch`, when represented using supported LLVM IR constructs.
* Basic-block splitting before dispatcher construction.
* Configurable minimum and maximum basic-block limits.
* Diagnostic output for cross-basic-block value dependencies and dynamic allocas.
* Optional SSA promotion for demoted PHI nodes and cross-block values.
* Functions outside the configured basic-block limits are skipped.
* Case block shuffling hardening: randomizes switch case block ordering instead of keeping sequential layout.

### Limitations

Again, this is an experimental pass, not a production-ready obfuscator.

* Functions with unsupported terminators are skipped.
* Exception-handling blocks and block addresses are not supported.
* Dynamic allocas remain at their original location during entry-block reconstruction. Their cross-basic-block uses may be handled by the pass’s generic demotion logic.
* The current implementation focuses on LLVM IR generated around `-O0`; behavior with other optimization levels has not been fully established.
* Testing covers the included programs and input cases, not every possible LLVM IR pattern.

## Building

### Requirements

* LLVM 17
* C++17
* CMake
* Ninja
* Clang

Configure the project with CMake and Ninja:

```bash
cmake -G Ninja \
  -DLLVM_DIR=/path/to/llvm/lib/cmake/llvm \
  /path/to/mini-obfuscator-llvm-pass
```

Then build with:

```bash
ninja
```

The `LLVM_DIR` path should point to the LLVM CMake package directory.

The project can also be configured and built using other CMake-supported workflows and generators. The commands above describe the setup used during development.

The build is expected to produce `miniObfuscator.so` in the configured build directory. Use LLVM 17-compatible versions of `llvm-config`, `opt`, `clang`, and the LLVM CMake package.


## Running the CFF pass

The CFF pass is invoked through LLVM's `opt` tool using the `CFFPass` pipeline name.

```bash
opt \
  -load-pass-plugin=./build/miniObfuscator.so \
  -passes=CFFPass \
  input.bc -S -o output.ll
```

### CFF options

| Option                  | Default | Description                                                                         |
| ----------------------- | ------: | ----------------------------------------------------------------------------------- |
| `-cff-min-blocks=N`     |     `3` | Minimum number of original basic blocks required for flattening.                    |
| `-cff-max-blocks=N`     |   `100` | Maximum number of original basic blocks allowed. `0` means unlimited.               |
| `-cff-no-dispatch`      | `false` | Split basic blocks without creating the central dispatcher.                         |
| `-cff-promote=MODE`     |  `none` | Selects which demoted values to attempt to promote back to SSA.                     |
| `-cff-diagnostics=MODE` |  `none` | Prints diagnostics about the original CFG instead of performing the transformation. |

### SSA promotion modes

| Mode     | Description                                          |
| -------- | ---------------------------------------------------- |
| `none`   | Keep demoted values in stack form.                   |
| `phis`   | Attempt to promote demoted PHI nodes.                |
| `values` | Attempt to promote demoted cross-basic-block values. |
| `all`    | Attempt to promote both groups.                      |

Example:

```bash
opt \
  -load-pass-plugin=./build/miniObfuscator.so \
  -passes=CFFPass \
  -cff-promote=values \
  input.bc -S -o output.ll
```

### Diagnostic modes

| Mode         | Description                                                                   |
| ------------ | ----------------------------------------------------------------------------- |
| `none`       | Disable diagnostic output.                                                    |
| `quick`      | Print a one-line summary of detected cross-block uses and/or dynamic allocas. |
| `cross`      | Print detailed cross-basic-block value dependency information.                |
| `dyn-alloca` | Print information about dynamic allocas and their users.                      |
| `all`        | Print both categories of detailed diagnostics.                                |

Example:

```bash
opt \
  -load-pass-plugin=./build/miniObfuscator.so \
  -passes=CFFPass \
  -cff-diagnostics=all \
  input.bc -disable-output
```

Diagnostics analyze the original CFG and do not perform flattening.

## Test suite

The CFF test suite is organized into four C source files:

| File          | Focus                          |
| ------------- | ------------------------------ |
| `_01_ifs.c`   | `if`-based control flow        |
| `_02_loops.c` | Loop-based control flow        |
| `_03_goto.c`  | `goto`-based control flow      |
| `_04_all.c`   | Combined control-flow patterns |

Each file contains multiple test functions, and also include arrays, pointers, and complicated conditions. Its `main` function calls the test functions, sums their return values, and prints the final result.

The comparison script compiles and runs the original and transformed LLVM IR using the same test inputs, then compares their final printed integer results.

Matching results show that the observed outputs agree for the tested inputs. They do not prove full semantic equivalence.

## Scripts

### `run_pipeline.sh`

Runs the CFF pipeline for the test source files and generates:

* `_before.ll` — original LLVM IR.
* `_splitting.ll` — IR after block splitting, without dispatcher construction.
* `_after.ll` — IR after CFF flattening.

The generated IR files are collected in the test IR directory.

### `dotToPng.py`

Generates CFG visualizations from LLVM IR files using `opt` and Graphviz.

It supports the generated before, splitting, and after IR files, and stores PNGs in per-test CFG directories. Processing can also be filtered by test name.

### `compare_output.py`

Compiles and runs paired original and transformed IR files, then compares their final printed integer outputs.

Run with the default input vector:

```bash
python3 compare_output.py
```

Run with a custom single program argument:

```bash
python3 compare_output.py 5
```

Run with multiple program arguments in one input vector:

```bash
python3 compare_output.py "5 -3 20"
```

Each quoted string represents one input vector. Multiple input vectors can be supplied as separate arguments.

The script reports pass/fail results and returns a nonzero exit status if any comparison fails.

**Note:** The scripts use relative paths and expect to be run from their intended working directory.

## Future plans

* Improve LLVM transformation practices and correctness.
* Improve the current obfuscation techniques.
* Harden the CFF pass with additional state-obfuscation techniques, including:

  * Shuffle the order of cases in the CFF dispatcher.
  * Integrate the CFF and Signature Obfuscator passes so that, when a function has a dummy parameter, it can be used as the dispatcher state entry point instead of introducing a state variable initialized to a fixed value in the entry block.
  * Develop formula/expression templates to further obscure the dispatcher state. These expressions could be inserted before the dispatcher, in the switch condition, and at state-update points in flattened blocks.
* Support more realistic dummy-parameter types and values.
* Expand the test suite.
* Investigate behavior with optimization.
* Test generated binaries with Ghidra.
* Learn more about reverse engineering and ABI-related issues.

This project is still under development, and its design and supported features may change as I learn more about LLVM and reverse engineering.
