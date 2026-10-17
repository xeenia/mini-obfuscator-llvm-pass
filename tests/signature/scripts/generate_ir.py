from pathlib import Path
import subprocess
import sys
import argparse

SCRIPT_DIR = Path(__file__).resolve().parent
TECHNIQUE_ROOT = (SCRIPT_DIR / "../technique").resolve()
PLUGIN_PATH = (SCRIPT_DIR / "../../../build/miniObfuscator.so").resolve()

CLANG = "clang"
OPT = "opt"
LLVM_LINK = "llvm-link"

DISABLED_FLAGS = {
    "rename": ["-sig-dis-dummy", "-sig-dis-shuffle"],
    "dummy": ["-sig-dis-rename", "-sig-dis-shuffle"],
    "shuffle": ["-sig-dis-dummy", "-sig-dis-rename"],
}

REPORT_ROOT = (SCRIPT_DIR / "../diagnostics").resolve()

DIAGNOSTIC_MODES = ["summary", "table", "technique", "function"]


def run_command(command, cwd):
    subprocess.run(command, cwd=cwd, check=True)


def parse_args():
    parser = argparse.ArgumentParser(
        description="Generate LLVM IR and signature-pass diagnostics."
    )

    modes = parser.add_mutually_exclusive_group()
    modes.add_argument(
        "--summary", action="store_const",
        const="summary", dest="diag_mode"
    )
    modes.add_argument(
        "--function", action="store_const",
        const="function", dest="diag_mode"
    )
    modes.add_argument(
        "--technique", action="store_const",
        const="technique", dest="diag_mode"
    )
    modes.add_argument(
        "--table", action="store_const",
        const="table", dest="diag_mode"
    )
    modes.add_argument(
        "--all", action="store_const",
        const="all", dest="diag_mode"
    )

    parser.set_defaults(diag_mode="none")
    return parser.parse_args()


def get_opt_flags(folder):
    name = folder.name.lower()

    # These tests enable all signature transformations.
    if "combined" in name or "ineligible" in name or name == "06_link":
        return []

    # Technique-specific tests disable the other transformations.
    for technique, flags in DISABLED_FLAGS.items():
        if technique in name:
            return flags

    raise ValueError(f"Could not determine technique for {folder}")


def get_report_path(folder, mode):
    report_dir = REPORT_ROOT / mode
    report_name = f"{folder.name}_{mode}.txt"
    return report_dir / report_name


def run_opt(input_file, output_file, folder, mode):
    # Save the transformed IR only when output_file is provided.
    output_target = output_file if output_file else "/dev/null"

    command = [
        OPT,
        f"-load-pass-plugin={PLUGIN_PATH}",
        "-passes=SIGpass",
        f"-sig-dump-diag={mode}",
        *get_opt_flags(folder),
        "-S", input_file,
        "-o", output_target,
    ]

    result = subprocess.run(
        command,
        cwd=folder,
        capture_output=True,
        text=True,
    )

    output = result.stdout + result.stderr

    if result.returncode != 0:
        report_path = get_report_path(folder, "error")
        report_path.parent.mkdir(parents=True, exist_ok=True)

        report_path.write_text(
            f"Command failed with exit code {result.returncode}:\n"
            f"{' '.join(map(str, command))}\n\n"
            f"{output or 'No error output captured.'}\n",
            encoding="utf-8",
        )

        print(f"  FAILED: opt (details: {report_path})")
        raise subprocess.CalledProcessError(result.returncode, command)

    if mode != "none":
        report_path = get_report_path(folder, mode)
        report_path.parent.mkdir(parents=True, exist_ok=True)

        report_path.write_text(
            output if output.strip() else "No diagnostic output.\n",
            encoding="utf-8",
        )

        print(f"  Diagnostics: {report_path.relative_to(REPORT_ROOT)}")

    if output_file:
        print(f"  Generated: {output_file}")


def delete_bitcode(folder, bitcode_files):
    # Remove intermediate bitcode silently.
    for filename in bitcode_files:
        path = folder / filename
        if path.exists():
            path.unlink()


def process_single(folder, modes):
    sources = sorted(folder.glob("*.c"))

    if len(sources) != 1:
        raise ValueError(
            f"Expected exactly one C file, found {len(sources)}"
        )

    source = sources[0]
    name = source.stem
    bitcode_name = f"{name}.bc"
    before_ir = f"{name}.before.ll"
    after_ir = f"{name}.after.ll"

    print(f"\n[{folder.name}] {source.name}")

    try:
        # Compile once to bitcode for the signature pass.
        run_command([
            CLANG, "-O0", "-flto", "-c",
            source.name, "-o", bitcode_name
        ], folder)

        # Save the original IR once.
        run_command([
            CLANG, "-S", "-emit-llvm", "-O0",
            source.name, "-o", before_ir
        ], folder)

        print(f"  Generated: {before_ir}")

        # Run the pass once per requested diagnostic mode.
        # Save transformed IR on the first run only.
        for index, mode in enumerate(modes):
            output_file = after_ir if index == 0 else None
            run_opt(bitcode_name, output_file, folder, mode)

    finally:
        delete_bitcode(folder, [bitcode_name])


def process_link(folder, modes):
    sources = sorted(folder.glob("*.c"))

    expected_sources = {"main.c", "utils.c"}
    actual_sources = {source.name for source in sources}

    if actual_sources != expected_sources:
        raise ValueError(
            f"Expected main.c and utils.c; found: {sorted(actual_sources)}"
        )

    bitcode_files = [f"{source.stem}.bc" for source in sources]
    merged_bitcode = "merged.bc"
    before_ir = f"{folder.name}.before.ll"
    after_ir = f"{folder.name}.after.ll"

    print(f"\n[{folder.name}] {', '.join(sorted(expected_sources))}")

    try:
        # Compile each translation unit once.
        for source, bitcode_name in zip(sources, bitcode_files):
            run_command([
                CLANG, "-O0", "-flto", "-c",
                source.name, "-o", bitcode_name
            ], folder)

        # Link once so the pass sees both translation units together.
        run_command([
            LLVM_LINK, *bitcode_files, "-o", merged_bitcode
        ], folder)

        # Save the original linked IR once.
        run_command([
            CLANG, "-S", "-emit-llvm", "-O0",
            merged_bitcode, "-o", before_ir
        ], folder)

        print(f"  Generated: {before_ir}")

        # Save transformed IR on the first run only.
        for index, mode in enumerate(modes):
            output_file = after_ir if index == 0 else None
            run_opt(merged_bitcode, output_file, folder, mode)

    finally:
        delete_bitcode(folder, [*bitcode_files, merged_bitcode])


def main():
    requested_mode = parse_args().diag_mode

    modes = (
        DIAGNOSTIC_MODES
        if requested_mode == "all"
        else [requested_mode]
    )

    if not TECHNIQUE_ROOT.is_dir():
        sys.exit(f"Technique directory not found: {TECHNIQUE_ROOT}")

    if not PLUGIN_PATH.is_file():
        sys.exit(f"LLVM pass plugin not found: {PLUGIN_PATH}")

    # Every immediate subfolder is a test case.
    test_folders = sorted(
        path for path in TECHNIQUE_ROOT.iterdir()
        if path.is_dir()
    )

    if not test_folders:
        sys.exit(f"No test folders found under {TECHNIQUE_ROOT}")

    REPORT_ROOT.mkdir(parents=True, exist_ok=True)

    failures = []
    passed = 0
    total = len(test_folders)
    files_created = 0

    print(
        f"Tests: {total} | "
        f"Modes: {', '.join(modes)}"
    )

    # Process each folder only once.
    for folder in test_folders:
        try:
            if folder.name.lower() == "06_link":
                process_link(folder, modes)
            else:
                process_single(folder, modes)

            passed += 1
            # Two saved IR files per successfully processed folder.
            files_created += 2

        except (subprocess.CalledProcessError, ValueError) as error:
            print(f"  FAILED: {error}")
            failures.append(folder)

    print("\n========== SUMMARY ==========")
    print(f"Folders visited: {total}")
    print(f"IR files created: {files_created}")
    print(f"Passed: {passed}/{total}")
    print(f"Failed: {len(failures)}/{total}")

    if failures:
        print("\nFailed folders:")
        for folder in failures:
            print(f"  - {folder.name}")

        sys.exit(1)

    print("All tests completed successfully.")


if __name__ == "__main__":
    main()
