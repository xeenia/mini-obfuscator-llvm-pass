#!/usr/bin/env python3

import os
import re
import shutil
import subprocess
import sys
import tempfile
from pathlib import Path

SCRIPT_DIR = Path(__file__).resolve().parent
SOURCE_DIR = (SCRIPT_DIR / "../ir").resolve()
TARGET_BASE_DIR = (SCRIPT_DIR / "../CFGs").resolve()

LEVELS = {
    "level0-base": "lvl 0 - base",
    "level1-shuffle": "lvl 1 - shuffle",
    "level2-dummy": "lvl 2 - dummy",
}


def die(message):
    sys.exit(f"Error: {message}")


def run_command(command, cwd=None):
    try:
        return subprocess.run(
            command,
            cwd=cwd,
            capture_output=True,
            text=True,
            encoding="utf-8",
            errors="replace",
            check=True,
        )
    except FileNotFoundError as error:
        die(f"Command not found: {command[0]} ({error})")
    except subprocess.CalledProcessError as error:
        details = error.stderr.strip() or error.stdout.strip()
        raise RuntimeError(
            f"Command failed (exit code {error.returncode}): "
            f"{' '.join(command)}\n{details}"
        ) from error


def get_core_name(path):
    name = path.stem

    for suffix in ("_splitted", "_before", "_after"):
        if name.endswith(suffix):
            return name[:-len(suffix)]

    return name


def get_output_dir(level_dir, core_name):
    if core_name != "_05_for_obf_levels":
        return TARGET_BASE_DIR / f"{core_name}_CFGs"

    level_label = LEVELS.get(level_dir.name)

    if level_label is None:
        level_label = f"lvl - {level_dir.name}"

    return TARGET_BASE_DIR / (
        f"{core_name}_CFGs - {level_label}"
    )


def get_dot_files(directory):
    return sorted(directory.glob("*.dot")) + sorted(
        directory.glob(".*.dot")
    )


def main():
    if not SOURCE_DIR.is_dir():
        die(f"Source directory does not exist: {SOURCE_DIR}")

    target_names = {
        name.lower() for name in sys.argv[1:]
    }

    level_dirs = sorted(
        path for path in SOURCE_DIR.iterdir()
        if path.is_dir()
    )

    if not level_dirs:
        die(f"No level subdirectories found in {SOURCE_DIR}")

    try:
        subprocess.run(
            ["opt", "--version"],
            capture_output=True,
            text=True,
            check=True,
        )
    except FileNotFoundError:
        die("'opt' not found on PATH.")
    except subprocess.CalledProcessError:
        die("'opt' could not run successfully.")

    try:
        subprocess.run(
            ["dot", "-V"],
            capture_output=True,
            text=True,
            check=True,
        )
    except FileNotFoundError:
        die("'dot' (Graphviz) not found on PATH.")
    except subprocess.CalledProcessError as error:
        # Graphviz can print its version to stderr and return
        # a nonzero status on some installations.
        if error.returncode != 0:
            die("'dot' (Graphviz) could not run successfully.")

    ir_files = []

    for level_dir in level_dirs:
        ir_files.extend(
            path for path in sorted(level_dir.glob("*.ll"))
            if path.is_file()
        )

    if not ir_files:
        die(f"No .ll files found in level subdirectories of {SOURCE_DIR}")

    if target_names:
        ir_files = [
            path for path in ir_files
            if get_core_name(path).lower() in target_names
        ]

        if not ir_files:
            die(
                "No matching IR files found for: "
                + ", ".join(sys.argv[1:])
            )

    TARGET_BASE_DIR.mkdir(parents=True, exist_ok=True)

    passed = 0
    failed = 0

    print(f"IR directory:  {SOURCE_DIR}")
    print(f"CFG directory: {TARGET_BASE_DIR}")
    print(f"IR files:      {len(ir_files)}")
    print()

    for ll_file in ir_files:
        core_name = get_core_name(ll_file)
        output_dir = get_output_dir(ll_file.parent, core_name)
        output_dir.mkdir(parents=True, exist_ok=True)

        print(f"[{ll_file.parent.name}] {ll_file.name}")
        print(f"  Output: {output_dir}")

        try:
            # Generate this IR file's CFGs in isolation, preventing
            # dot-cfg output from different files from colliding.
            with tempfile.TemporaryDirectory(
                prefix="cfg_"
            ) as temp_dir:
                temp_path = Path(temp_dir)

                run_command(
                    [
                        "opt",
                        "-passes=dot-cfg",
                        str(ll_file),
                    ],
                    cwd=temp_path,
                )

                dot_files = get_dot_files(temp_path)

                if not dot_files:
                    raise RuntimeError(
                        "opt succeeded but generated no .dot files."
                    )

                for dot_file in dot_files:
                    # LLVM commonly names these .function.dot.
                    if dot_file.name.startswith("."):
                        function_name = dot_file.name[1:-4]
                    else:
                        function_name = dot_file.stem

                    # Keep the IR variant in the image name so that
                    # before, splitting, and after remain distinct.
                    variant = ll_file.stem[len(core_name):]
                    if variant == "_splitting":
                        variant = "_splitted"

                    png_name = f"{function_name}{variant}.png"
                    png_path = output_dir / png_name

                    run_command([
                        "dot",
                        "-Tpng",
                        str(dot_file),
                        "-o",
                        str(png_path),
                    ])

                    print(f"  Generated: {png_name}")

            passed += 1

        except RuntimeError as error:
            failed += 1
            print(f"  [FAIL] {error}")

        print()

    print("========== SUMMARY ==========")
    print(f"IR files processed: {len(ir_files)}")
    print(f"Passed:             {passed}")
    print(f"Failed:             {failed}")

    sys.exit(1 if failed else 0)


if __name__ == "__main__":
    main()
