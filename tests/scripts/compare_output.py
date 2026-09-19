#!/usr/bin/env python3
"""
Differential IR tester.

Recursively searches subfolders in ../cff/ir/ for pairs of:
  [name]_before.ll / [name]_after.ll
  
  1. compiles each to an executable [name]_before / [name]_after in its subfolder
  2. runs both with the same command-line arguments
  3. compares their (single-integer) outputs
  4. prints an [OK] if identical, an [X ] otherwise

Usage:
    python3 diff_test.py            # default input: 4
    python3 diff_test.py 5          # input value 5
    python3 diff_test.py 5 -3 20    # multiple inputs, all tested
"""

import subprocess
import sys
from pathlib import Path

IR_DIR = Path("../cff/ir")
CC = "clang"
EXE_SUFFIX = ""  


def run_cmd(cmd, timeout=10):
    """Run a command, return (returncode, stdout, stderr)."""
    try:
        proc = subprocess.run(
            cmd,
            capture_output=True,
            text=True,
            timeout=timeout,
        )
        return proc.returncode, proc.stdout, proc.stderr
    except subprocess.TimeoutExpired:
        return -1, "", "TIMEOUT"


def find_pairs():
    """Return sorted list of (rel_display_name, before_path, after_path)."""
    if not IR_DIR.is_dir():
        print(f"error: IR directory '{IR_DIR}' not found")
        sys.exit(1)

    befores = {}
    afters = {}

    # Recursive search through all subdirectories
    for f in IR_DIR.rglob("*.ll"):
        rel_parent = f.relative_to(IR_DIR).parent
        
        if f.stem.endswith("_before"):
            base = f.stem[:-len("_before")]
            key = rel_parent / base
            befores[key] = f
        elif f.stem.endswith("_after"):
            base = f.stem[:-len("_after")]
            key = rel_parent / base
            afters[key] = f

    names = sorted(set(befores) & set(afters))

    orphans_before = set(befores) - set(afters)
    orphans_after = set(afters) - set(befores)
    for k in sorted(orphans_before):
        print(f"warning: '{befores[k]}' has no matching _after file, skipped")
    for k in sorted(orphans_after):
        print(f"warning: '{afters[k]}' has no matching _before file, skipped")

    return [(str(k), befores[k], afters[k]) for k in names]


def parse_int_output(stdout):
    """Parse the single-integer output produced by the test executable."""
    lines = stdout.strip().splitlines()
    if not lines:
        raise ValueError("no output")
    return int(lines[-1].strip())


def test_pair(rel_name, before_ll, after_ll, inputs):
    """Compile and compare one before/after pair. Returns True on success."""
    results = {}
    ok = True
    detail_lines = []

    for variant, ll_file in (
        ("before", before_ll),
        ("after", after_ll),
    ):
        # Place temporary executable in the same directory as the .ll file
        exe_path = ll_file.with_suffix(EXE_SUFFIX)

        # --- compile ---
        rc, _, stderr = run_cmd([CC, str(ll_file), "-o", str(exe_path)])
        if rc != 0:
            detail_lines.append(f"    {variant}: COMPILE FAILED:\n{stderr.strip()}")
            ok = False
            results[variant] = None
            continue

        # --- run with each input ---
        variant_results = []
        for inp in inputs:
            rc, stdout, stderr = run_cmd([str(exe_path)] + [str(i) for i in inp])
            if rc != 0:
                detail_lines.append(
                    f"    {variant}: RUN FAILED (input {inp}, rc={rc}): {stderr.strip()}"
                )
                ok = False
                variant_results.append(None)
                continue
            try:
                variant_results.append(parse_int_output(stdout))
            except ValueError as e:
                detail_lines.append(
                    f"    {variant}: BAD OUTPUT (input {inp}): {stdout.strip()!r} ({e})"
                )
                ok = False
                variant_results.append(None)

        results[variant] = variant_results

    # --- compare ---
    all_match = (
        ok
        and results["before"] is not None
        and results["after"] is not None
        and results["before"] == results["after"]
    )

    print(f"[{'OK' if all_match else 'X '}] {rel_name}")
    if not all_match:
        print(f"    before: {results['before']}")
        print(f"    after:  {results['after']}")
        for line in detail_lines:
            print(line)

    return all_match


def main():
    # Each argument list becomes one input vector: "5" -> [5], "5 -3" -> [5, -3]
    if len(sys.argv) > 1:
        inputs = [[int(t) for t in arg.split()] for arg in sys.argv[1:]]
    else:
        inputs = [[4]]

    pairs = find_pairs()
    if not pairs:
        print(f"no before/after .ll pairs found in '{IR_DIR}'")
        sys.exit(1)

    print(f"found {len(pairs)} pair(s) in '{IR_DIR}', inputs: {inputs}\n")

    passed = 0
    for rel_name, before_ll, after_ll in pairs:
        if test_pair(rel_name, before_ll, after_ll, inputs):
            passed += 1

    total = len(pairs)
    failed = total - passed
    print(f"\n{passed}/{total} passed, {failed} failed")

    # Clean up compiled executables
    for _, before_ll, after_ll in pairs:
        before_ll.with_suffix(EXE_SUFFIX).unlink(missing_ok=True)
        after_ll.with_suffix(EXE_SUFFIX).unlink(missing_ok=True)

    sys.exit(0 if failed == 0 else 1)


if __name__ == "__main__":
    main()