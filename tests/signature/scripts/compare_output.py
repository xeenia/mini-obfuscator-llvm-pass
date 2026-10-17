#!/usr/bin/env python3

import subprocess
import sys
from pathlib import Path

SCRIPT_DIR = Path(__file__).resolve().parent
IR_DIR = (SCRIPT_DIR / "../technique").resolve()
CLANG = "clang"
TIMEOUT = 10


def run_cmd(command, timeout=TIMEOUT):
    try:
        proc = subprocess.run(
            command,
            capture_output=True,
            text=True,
            timeout=timeout,
        )
        return proc.returncode, proc.stdout, proc.stderr
    except subprocess.TimeoutExpired:
        return -1, "", f"TIMEOUT after {timeout} seconds"
    except OSError as error:
        return -1, "", str(error)


def find_pairs():
    if not IR_DIR.is_dir():
        sys.exit(f"Error: directory not found: {IR_DIR}")

    befores = {}
    afters = {}

    for path in IR_DIR.rglob("*.ll"):
        relative_parent = path.relative_to(IR_DIR).parent

        if path.stem.endswith(".before"):
            base = path.stem[:-len(".before")]
            befores[relative_parent / base] = path

        elif path.stem.endswith(".after"):
            base = path.stem[:-len(".after")]
            afters[relative_parent / base] = path

    before_keys = set(befores)
    after_keys = set(afters)

    for key in sorted(before_keys - after_keys):
        print(f"[WARN] No matching after file: {befores[key]}")

    for key in sorted(after_keys - before_keys):
        print(f"[WARN] No matching before file: {afters[key]}")

    return [
        (key.as_posix(), befores[key], afters[key])
        for key in sorted(before_keys & after_keys)
    ]


def parse_output(stdout):
    output = stdout.strip()

    if not output:
        raise ValueError("Program produced no output; expected an integer.")

    try:
        return int(output)
    except ValueError:
        raise ValueError(
            f"Expected a single integer, got: {output!r}"
        ) from None


def compile_ir(ll_file, executable):
    rc, stdout, stderr = run_cmd([
        CLANG,
        str(ll_file),
        "-o",
        str(executable),
    ])

    if rc != 0:
        return False, stderr.strip() or stdout.strip() or "No compiler output."

    return True, ""


def run_program(executable):
    rc, stdout, stderr = run_cmd([str(executable)])

    if rc != 0:
        details = stderr.strip() or stdout.strip() or "No output."
        return None, f"Program failed (exit code {rc}): {details}"

    try:
        return parse_output(stdout), None
    except ValueError as error:
        return None, str(error)


def test_pair(name, before_ll, after_ll):
    before_exe = before_ll.with_name(before_ll.stem + ".test-exe")
    after_exe = after_ll.with_name(after_ll.stem + ".test-exe")

    before_result = None
    after_result = None
    errors = []

    try:
        for variant, ll_file, executable in (
            ("BEFORE", before_ll, before_exe),
            ("AFTER", after_ll, after_exe),
        ):
            success, error = compile_ir(ll_file, executable)

            if not success:
                errors.append(f"{variant} COMPILE FAILED:\n{error}")
                continue

            result, error = run_program(executable)

            if error:
                errors.append(f"{variant} RUN FAILED:\n{error}")
            elif variant == "BEFORE":
                before_result = result
            else:
                after_result = result

        passed = (
            not errors
            and before_result is not None
            and after_result is not None
            and before_result == after_result
        )

        print(f"[{'OK' if passed else 'FAIL'}] {name}")

        if not passed:
            print(f"    Before: {before_result!r}")
            print(f"    After:  {after_result!r}")

            if (
                not errors
                and before_result is not None
                and after_result is not None
                and before_result != after_result
            ):
                print("    Output mismatch!")

            for error in errors:
                print(f"    {error}")

        return passed

    finally:
        before_exe.unlink(missing_ok=True)
        after_exe.unlink(missing_ok=True)


def main():
    pairs = find_pairs()

    if not pairs:
        sys.exit(f"No .before.ll/.after.ll pairs found in {IR_DIR}")

    display_dir = Path("..") / "technique"

    print(
        f"Found {len(pairs)} pair(s) in '{display_dir.as_posix()}'"
    )

    passed = 0

    for name, before_ll, after_ll in pairs:
        if test_pair(name, before_ll, after_ll):
            passed += 1

    failed = len(pairs) - passed

    print(f"\n{passed}/{len(pairs)} passed, {failed} failed")

    sys.exit(0 if failed == 0 else 1)


if __name__ == "__main__":
    main()
