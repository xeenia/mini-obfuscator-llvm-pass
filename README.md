# mini-obfuscator-llvm-pass

## Table of Contents

- [Signature Obfuscator](#signature-obfuscator)
  - [Current Transformations](#current-transformations)
  - [Dummy Parameter Attributes](#dummy-parameter-attributes)
  - [Signature Options](#signature-options)
  - [Signature Diagnostic Modes](#signature-diagnostic-modes)
  - [Signature Diagnostic Examples](#signature-diagnostic-examples)
- [Control Flow Flattening (CFF)](#control-flow-flattening-cff)
  - [Currently Supported](#currently-supported)
  - [Limitations](#limitations)
  - [Running the CFF Pass](#running-the-cff-pass)
  - [CFF Options](#cff-options)
  - [SSA Promotion Modes](#ssa-promotion-modes)
  - [Diagnostic Modes](#diagnostic-modes)
  - [CFF Obfuscation Levels](#cff-obfuscation-levels)
- [Test Suite](#test-suite)
  - [CFG and IR Outputs](#cfg-and-ir-outputs)
- [Scripts](#scripts)
  - [`run_pipeline.sh`](#run_pipeline-sh)
  - [`dotToPng.py`](#dottopngpy)
  - [`compare_output.py`](#compare_outputpy)
- [Future Plans](#future-plans)
    
An ongoing educational project for learning LLVM IR transformations and exploring software obfuscation techniques.

The project contains two LLVM passes:

* **Signature Obfuscator** — transforms function names and signatures through function-name obfuscation, dummy-parameter insertion, and parameter shuffling.
* **Control Flow Flattening (CFF)** — transforms function control flow by doing basic-block splitting and a creating central switch dispatcher. **See demonstrated examples (original code, high-level CFF view, and CFGs before/after) in [`cff-examples.md`](tests/cff/cff-examples.md)**.

The project uses LLVM 17, C++17, CMake, and Ninja.

## Signature Obfuscator

The Signature Obfuscator experiments with transforming LLVM functions and their signatures, including their associated call sites.

### Current Transformations

- **Function-name obfuscation:** Renames eligible functions using generated names.
- **Dummy-parameter insertion:** Adds dummy parameters to eligible function signatures and updates their associated call sites. The pass adds function attributes and parameter attributes to identify functions and dummy parameters for later transformations.
- **Parameter shuffling:** Changes the order of function parameters and updates the corresponding call sites.

The pass supports also configurable dummy-parameter counts and diagnostic output for inspecting transformation results.

### Dummy Parameter Attributes

The pass uses LLVM attributes to identify functions and dummy parameters:

- **Function attribute `obf.dummy`:** Marks functions that have undergone dummy-parameter insertion.
- **Parameter attribute `obf.dummy.role`:** Marks individual dummy parameters. The attribute stores a numeric role value that subsequent passes can inspect to determine the parameter's purpose.

The currently defined roles are:

| Role | Value | Description |
|---|---:|---|
| `DummyRole::Generic` | `0` | A generic dummy parameter inserted from the Signature pass. |
| `DummyRole::CFFState` | `1` | A dummy parameter designated to carry the control-flow state used by the CFF pass. |

These attributes allow other transformations, including the CFF pass, to identify functions and parameters associated with dummy-based hardening without relying solely on parameter names. The role can also be updated when a dummy parameter is repurposed for a specific transformation.

### Signature Options

The Signature Obfuscator provides the following LLVM command-line options.

| Option | Default | Description |
| --- | --- | --- |
| `-sig-seed=N` | `0xC0FFEE` | Seed for deterministic function-name generation and parameter shuffling. |
| `-sig-dis-rename` | `false` | Disables function renaming. |
| `-sig-dis-dummy` | `false` | Disables dummy-parameter insertion. |
| `-sig-dis-shuffle` | `false` | Disables parameter shuffling. |
| `-sig-dummy-count=N` | `0` | Number of dummy parameters to add. `0` selects automatic sizing. |
| `-sig-dump-diag=MODE` | `none` | Selects the diagnostic output format. |

Example:

```bash
opt \
  -load-pass-plugin=./build/miniObfuscator.so \
  -passes=SIGpass \
  -sig-seed=12345 \
  -sig-dummy-count=3 \
  -S input.ll -o output.ll
```

To disable parameter shuffling:

```bash
opt \
  -load-pass-plugin=./build/miniObfuscator.so \
  -passes=SIGpass \
  -sig-dis-shuffle \
  -S input.ll -o output.ll
```

The `-sig-dis-*` options independently disable the corresponding transformations.

### Signature Diagnostic Modes

The `-sig-dump-diag` option selects how transformation results are reported.

| Mode | Description |
| --- | --- |
| `none` | Disables diagnostic output. |
| `summary` | Prints a concise summary of transformation statuses for each function. |
| `function` | Groups diagnostic results by function, including transformation details and skip reasons. |
| `technique` | Groups results by technique, listing transformed, skipped, and unchanged functions. |
| `table` | Prints a table summarizing the results of each technique for each function. |

Example:

```bash
opt \
  -load-pass-plugin=./build/miniObfuscator.so \
  -passes=SIGpass \
  -sig-dump-diag=summary \
  -S input.ll -o output.ll
```

### Signature Diagnostic Examples

The following examples illustrate the diagnostic formats produced by the pass.

#### Summary

Reports the status of each transformation for each function. Dummy insertion also reports the number of parameters added.

```text
[Signature] Summary Diagnostics
================================================================================================
[Signature] multiply                 rename=SUCCESS      dummy=SUCCESS(+3)  shuffle=SUCCESS
[Signature] pack_color               rename=SUCCESS      dummy=SUCCESS(+1)  shuffle=SUCCESS
[Signature] build_record             rename=SUCCESS      dummy=SUCCESS(+1)  shuffle=SUCCESS
[Signature] negate                   rename=SUCCESS      dummy=SUCCESS(+4)  shuffle=SUCCESS
[Signature] constant_answer          rename=SUCCESS      dummy=SKIP(+0)     shuffle=SKIP
[Signature] factorial                rename=SUCCESS      dummy=SUCCESS(+4)  shuffle=SUCCESS
[Signature] square                   rename=SUCCESS      dummy=SKIP(+0)     shuffle=SKIP
[Signature] triple                   rename=SUCCESS      dummy=SKIP(+0)     shuffle=SKIP
[Signature] sum_all                  rename=SUCCESS      dummy=SKIP(+0)     shuffle=SKIP
[Signature] sub                      rename=SUCCESS      dummy=SUCCESS(+3)  shuffle=SUCCESS
[Signature] main                     rename=SKIP         dummy=SKIP(+0)     shuffle=SKIP
[Signature] printf                   rename=SKIP         dummy=SKIP(+0)     shuffle=SKIP
```

#### By Function

Reports each function's transformation results and additional details, such as its generated name, inserted dummy parameter types, parameter permutation, or reason for skipping a transformation.

```text
[Signature] multiply
  Rename     SUCCESS    _f69BD862F9C6ABBF5
  Dummy      SUCCESS    (+3) (i32,i32,i32)
  Shuffle    SUCCESS    [4, 1, 0, 2, 3]

[Signature] pack_color
  Rename     SUCCESS    _fAD1F15246AF46C2
  Dummy      SUCCESS    (+1) (i32)
  Shuffle    SUCCESS    [2, 4, 1, 0, 3]

[Signature] main
  Rename     SKIP       function is main
  Dummy      SKIP       function is main
  Shuffle    SKIP       function is main

[Signature] printf
  Rename     SKIP       function is a declaration
  Dummy      SKIP       function is a declaration
  Shuffle    SKIP       function is a declaration

[Signature] sum_all
  Rename     SUCCESS    _fACF62A35728C77E0
  Dummy      SKIP       function is variadic
  Shuffle    SKIP       function is variadic
```

#### By Technique

Groups results by transformation, making it easier to inspect which functions were changed or skipped by a particular technique.

```text
[Signature] Technique Diagnostics
================================================================================================

1. Function Renaming
------------------------------------------------------------
SUCCESS:
  - multiply: _f69BD862F9C6ABBF5
  - pack_color: _fAD1F15246AF46C2
  - build_record: _fE3D0F16670BA0BE8
  - negate: _f8861D07D75508871
  - constant_answer: _fB5CF40918AE80198
  - factorial: _f2527BF8B46247DF8
  - square: _fC9B3BC07489DB4DC
  - triple: _f3C5416404CD17CA0
  - sum_all: _fACF62A35728C77E0
  - sub: _f8F5CAE3EEC1FCD41

2. Dummy Parameter Insertion
------------------------------------------------------------
SUCCESS:
  - multiply: +3 -> (i32,i32,i32)
  - pack_color: +1 -> (i32)
  - build_record: +1 -> (i32)
  - negate: +4 -> (i32,i32,i32,i32)
  - factorial: +4 -> (i32,i32,i32,i32)
  - sub: +3 -> (i32,i32,i32)

SKIPPED:
  - constant_answer: function has no arguments
  - square: function address is taken
  - triple: function address is taken
  - sum_all: function is variadic

3. Parameter Shuffling
------------------------------------------------------------
SUCCESS:
  - multiply: [4, 1, 0, 2, 3]
  - pack_color: [2, 4, 1, 0, 3]
  - build_record: [0, 1, 2, 4, 3]
  - negate: [1, 4, 2, 3, 0]
  - factorial: [0, 2, 4, 3, 1]
  - sub: [0, 2, 1, 3, 4]

SKIPPED:
  - constant_answer: function has no arguments
  - square: function address is taken
  - triple: function address is taken
  - sum_all: function is variadic

4. Functions Excluded from All Techniques
------------------------------------------------------------
  - main: function is main
  - printf: function is a declaration
```

#### Transformation Summary Table

Provides a compact overview of all techniques and their results, with skip reasons grouped in the notes column.

```text
[Signature] Transformation Summary
========================================================================================================================================
Function                       | Rename              | Dummy Parameters       | Parameter Shuffle       | Notes
----------------------------------------------------------------------------------------------------------------------------------------
multiply                       | SUCCESS             | SUCCESS (+3)           | SUCCESS                 | -
pack_color                     | SUCCESS             | SUCCESS (+1)           | SUCCESS                 | -
build_record                   | SUCCESS             | SUCCESS (+1)           | SUCCESS                 | -
negate                         | SUCCESS             | SUCCESS (+4)           | SUCCESS                 | -
constant_answer                | SUCCESS             | SKIP                   | SKIP                    | D,S: function has no arguments
factorial                      | SUCCESS             | SUCCESS (+4)           | SUCCESS                 | -
square                         | SUCCESS             | SKIP                   | SKIP                    | D,S: function address is taken
triple                         | SUCCESS             | SKIP                   | SKIP                    | D,S: function address is taken
sum_all                        | SUCCESS             | SKIP                   | SKIP                    | D,S: function is variadic
sub                            | SUCCESS             | SUCCESS (+3)           | SUCCESS                 | -
main                           | SKIP                | SKIP                   | SKIP                    | R,D,S: function is main
printf                         | SKIP                | SKIP                   | SKIP                    | R,D,S: function is a declaration
========================================================================================================================================
```

This is an educational implementation and is not intended to provide production-grade obfuscation.

## Control Flow Flattening (CFF)

The CFF pass is an experimental implementation of control-flow obfuscation at the LLVM IR level.

It processes functions individually, splitting basic blocks where needed and replacing the original branch-based control flow with a central `switch` dispatcher. Each flattened block is assigned a state, and branches update the state to determine which block executes next.

The pass also handles SSA dependencies affected by the transformation by demoting PHI nodes and selected cross-basic-block values to stack storage. Optional promotion back to SSA is available.

### Currently supported

- Conditional and unconditional branches.
- Return and unreachable terminators.
- Common control-flow patterns such as `if` statements, loops, `goto`-based flow, and `switch`, when represented using supported LLVM IR constructs.
- Basic-block splitting before dispatcher construction.
- Configurable minimum and maximum basic-block limits. Functions outside these limits are skipped.
- Diagnostic output for cross-basic-block value dependencies and dynamic allocas.
- Optional SSA promotion for demoted PHI nodes and cross-block values.
- Dynamic allocas remain at their original location during entry-block reconstruction. Their cross-basic-block uses are handled by the pass's generic demotion logic.
- **Case-block shuffling (level 1):** Randomizes the ordering of the dispatcher switch cases rather than retaining sequential layout.
- **Dummy-parameter hardening (level 2):** Reuses a specially marked dummy parameter as the dispatcher's initial state entry point when a suitable parameter is available, rather than relying solely on a separate state variable initialized to a fixed value in the entry block. This integrates with the Signature Obfuscator's `obf.dummy` and `obf.dummy.role` attributes.

### Limitations

This is an experimental pass, not a production-ready obfuscator.

- Functions with unsupported terminators are skipped.
- Exception-handling blocks and block addresses are not supported.
- The current implementation focuses on LLVM IR generated around `-O0`; behavior with other optimization levels has not been fully established.
- Testing covers the included programs and input cases, not every possible LLVM IR pattern.
- Level 2 provides a basic form of dummy-parameter-based state hardening. It does not yet implement the additional state-obfuscation techniques planned for future development.

## Running the CFF pass

The CFF pass is invoked through LLVM's `opt` tool using the `CFFPass` pipeline name.

```bash
opt \
  -load-pass-plugin=./build/miniObfuscator.so \
  -passes=CFFPass \
  input.bc -S -o output.ll
```

### CFF options

| Option | Default | Description |
|---|---:|---|
| `-cff-min-blocks=N` | `3` | Minimum number of original basic blocks required for flattening. |
| `-cff-max-blocks=N` | `100` | Maximum number of original basic blocks allowed. `0` means unlimited. |
| `-cff-no-dispatch` | `false` | Split basic blocks without creating the central dispatcher. |
| `-cff-promote=MODE` | `none` | Selects which demoted values to attempt to promote back to SSA. |
| `-cff-diagnostics=MODE` | `none` | Prints diagnostics about the original CFG instead of performing the transformation. |
| `-cff-level=N` | `0` | Selects the CFF obfuscation level: `0` for base flattening, `1` for shuffled dispatcher cases, or `2` for dummy-parameter state hardening. |

### SSA promotion modes

| Mode | Description |
|---|---|
| `none` | Keep demoted values in stack form. |
| `phis` | Attempt to promote demoted PHI nodes. |
| `values` | Attempt to promote demoted cross-basic-block values. |
| `all` | Attempt to promote both groups. |

Example:

```bash
opt \
  -load-pass-plugin=./build/miniObfuscator.so \
  -passes=CFFPass \
  -cff-promote=values \
  input.bc -S -o output.ll
```

### Diagnostic modes

The CFF diagnostic modes analyze the original control-flow graph (CFG). They do not perform flattening.

| Mode | Description |
|---|---|
| `none` | Disable diagnostic output. |
| `quick` | Print a one-line summary identifying functions with cross-block uses, dynamic allocas, or both. |
| `cross` | Print detailed cross-basic-block value dependency information. |
| `dyn-alloca` | Print information about dynamic allocas and the blocks containing their users. |
| `all` | Print both categories of detailed diagnostics. |

Run diagnostics with:

```bash
opt \
  -load-pass-plugin=./build/miniObfuscator.so \
  -passes=CFFPass \
  -cff-diagnostics=all \
  input.bc -disable-output
```

#### Diagnostic output examples


**1. `cross` — cross-basic-block value dependencies**

```text
========== CFF Diagnostics: _62_dynamic_alloca ==========

[DOMINANCE CROSS-BLOCK USES]
  User: %31
    block: %25
    uses value: %20
    defined in: %15

  User: %34
    block: %25
    uses value: %20
    defined in: %15


========== CFF Diagnostics: _64_dynamic_alloca_nested ==========

[DOMINANCE CROSS-BLOCK USES]
  User: %33
    block: %27
    uses value: %22
    defined in: %17

  User: %49
    block: %46
    uses value: %22
    defined in: %17
```

This mode reports instructions that use values defined in other basic blocks, along with the defining and using blocks.

**2. `dyn-alloca` — dynamic alloca usage**

```text
========== CFF Diagnostics: _62_dynamic_alloca ==========

[DYNAMIC ALLOCA]
  Alloca:
    defined in: %15
    used in blocks:
      %25


========== CFF Diagnostics: _63_dynamic_alloca_pointer ==========

[DYNAMIC ALLOCA]
  Alloca:
    defined in: %17
    used in blocks:
      %17


========== CFF Diagnostics: _64_dynamic_alloca_nested ==========

[DYNAMIC ALLOCA]
  Alloca:
    defined in: %17
    used in blocks:
      %46
      %27
```

This mode identifies dynamic allocas and lists the blocks containing their uses.

**3. `all` — both detailed diagnostic categories**

```text
========== CFF Diagnostics: _62_dynamic_alloca ==========

[DOMINANCE CROSS-BLOCK USES]
  User: %31
    block: %25
    uses value: %20
    defined in: %15

  User: %34
    block: %25
    uses value: %20
    defined in: %15


[DYNAMIC ALLOCAS]
  Alloca: %20
    defined in: %15
    used in blocks:
      %25


========== CFF Diagnostics: _63_dynamic_alloca_pointer ==========

[DYNAMIC ALLOCAS]
  Alloca: %22
    defined in: %17
    used in blocks:
      %17


========== CFF Diagnostics: _64_dynamic_alloca_nested ==========

[DOMINANCE CROSS-BLOCK USES]
  User: %33
    block: %27
    uses value: %22
    defined in: %17

  User: %49
    block: %46
    uses value: %22
    defined in: %17


[DYNAMIC ALLOCAS]
  Alloca: %22
    defined in: %17
    used in blocks:
      %46
      %27
```

**4. `quick` — concise per-function summary**

```text
[CFFDiagnostic] _62_dynamic_alloca                       -> [BOTH]
[CFFDiagnostic] _63_dynamic_alloca_pointer               -> [ALLOCA]
[CFFDiagnostic] _64_dynamic_alloca_nested                -> [BOTH]
```

`BOTH` indicates that both diagnostic categories were detected, while `ALLOCA` indicates dynamic-alloca findings without cross-basic-block dependency findings.

### CFF obfuscation levels

| Level | Description |
|---:|---|
| `0` | Base CFF with sequential case states and unshuffled dispatcher case order. |
| `1` | CFF with randomized/shuffled dispatcher case order. |
| `2` | CFF with randomized/shuffled dispatcher case order and dummy-parameter state hardening, reusing a suitable marked dummy parameter as the dispatcher's initial state entry point. |

Example:

```bash
opt \
  -load-pass-plugin=./build/miniObfuscator.so \
  -passes=CFFPass \
  -cff-level=2 \
  input.bc -S -o output.ll
```

Level 2 is the current basic implementation of dummy-parameter hardening. **One additional hardening technique remains under development**, alongside broader improvements to obscure the dispatcher state and its updates.

## Test suite

The CFF test suite includes the following C source files:

| File | Focus |
|---|---|
| `_00_all.c` | Combined control-flow patterns. |
| `_01_ifs.c` | `if`-based control flow. |
| `_02_loops.c` | Loop-based control flow. |
| `_03_goto.c` | `goto`-based control flow. |
| `_04_switch.c` | `switch`-based control flow. |
| `_05_for_obf_levels.c` | Tests for CFF obfuscation levels 0, 1, and 2. |

The test programs contain multiple functions and exercise patterns involving arrays, pointers, loops, and compound conditions. Their `main` functions call the test functions, aggregate their return values, and print the final result.

The [comparison script](#compare_outputpy) compiles and runs the original and transformed LLVM IR using the same test inputs, then compares their final printed integer results.

Matching results show that the observed outputs agree for the tested inputs. They do not prove full semantic equivalence.

### CFG and IR outputs

The `CFGs` directory contains CFG visualizations from the test programs, including the before, split, and after transformation stages.

For `_05_for_obf_levels.c`, CFG outputs are provided for all three obfuscation levels:

- **Level 0:** Base flattening with sequential case states.
- **Level 1:** Flattening with shuffled case order.
- **Level 2:** Flattening with shuffled case order and dummy-parameter state hardening.

The `ir` directory contains the corresponding LLVM IR outputs, organized by level:

- `level0-base`
- `level1-shuffle`
- `level2-dummy`

## Scripts

### `run_pipeline.sh`

Runs the CFF pipeline for the test source files and generates:

- `_before.ll` — original LLVM IR.
- `_splitting.ll` — IR after block splitting, without dispatcher construction.
- `_after.ll` — IR after CFF flattening.

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

Example output:

```text
found 8 pair(s) in '../cff/ir', inputs: [[4]]

[OK] level0-base/_00_all
[OK] level0-base/_01_ifs
[OK] level0-base/_02_loops
[OK] level0-base/_03_goto
[OK] level0-base/_04_switch
[OK] level0-base/_05_for_obf_levels
[OK] level1-shuffle/_05_for_obf_levels
[OK] level2-dummy/_05_for_obf_levels

8/8 passed, 0 failed
```

This example shows all eight tested pairs passing for the displayed input vector. It demonstrates agreement for those executions, not proof of full semantic equivalence.

**Note:** The scripts use relative paths and expect to be run from their intended working directory.

## Future plans

- Improve LLVM transformation practices and correctness.
- Improve and further harden the existing obfuscation techniques.
- Explore additional obfuscation techniques, including **bogus control-flow insertion**, instruction substitution, and other forms of code diversification.
- Investigate different SSA promotion strategies and determine when promoting demoted values back to SSA is beneficial, considering correctness, optimization opportunities, and the resulting obfuscated IR.
- Make the Signature Obfuscator smarter and more robust, including exploring improvements to function eligibility analysis, transformation decisions, and combinations of signature transformations.
- Explore additional ways to use dummy parameters as building blocks for hardening, including different roles, state encodings, and interactions with future obfuscation passes.
- Integrate dummy-parameter metadata more deeply across obfuscation passes so that later transformations can identify and reuse suitable dummy parameters.
- Support more realistic dummy-parameter types and values.
- Expand the test suite, particularly for the Signature Obfuscator and interactions between passes.
- Investigate behavior with optimization.
- Test generated binaries with Ghidra.
- Learn more about reverse engineering and ABI-related issues.

This project is still under development, and its design and supported features may change as I learn more about LLVM and reverse engineering.
