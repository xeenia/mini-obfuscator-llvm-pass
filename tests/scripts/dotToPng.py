import glob
import os
import subprocess
import sys

# Define relative source and target base paths
SOURCE_DIR = os.path.abspath(os.path.join(os.getcwd(), "..", "cff", "ir"))
TARGET_BASE_DIR = os.path.abspath(os.path.join(os.getcwd(), "..", "cff", "CFGs"))

if not os.path.exists(SOURCE_DIR):
    sys.exit(f"Error: Source directory non-existent -> {SOURCE_DIR}")

# Targets passed via CLI arguments (case-insensitive matching)
target_names = [name.lower() for name in sys.argv[1:]]

# Find all .ll files in the source directory
ll_files = glob.glob(os.path.join(SOURCE_DIR, "*.ll"))

if not ll_files:
    sys.exit(f"No .ll files found in {SOURCE_DIR}")

processed_count = 0

for ll_file in ll_files:
    filename = os.path.basename(ll_file)
    filename_lower = filename.lower()
    stem = os.path.splitext(filename)[0]

    # Determine suffix and extract core [name]
    if filename_lower.endswith("_before.ll"):
        suffix = "_before"
        core_name = stem[:-7]
    elif filename_lower.endswith("_after.ll"):
        suffix = "_after"
        core_name = stem[:-6]
    elif filename_lower.endswith("_splitting.ll"):
        suffix = "_splitted"
        core_name = stem[:-10]
    else:
        # Fallback when no pattern matches: [name] is the full stem,
        # resulting in output format [function_name]_[name].png
        suffix = f"_{stem}"
        core_name = stem

    # Skip file if target names were specified and this file doesn't match any
    if target_names and core_name.lower() not in target_names:
        continue

    processed_count += 1

    # Define target output folder: ../cff/CFGs/[name]/
    cfg_dir = os.path.join(TARGET_BASE_DIR, f"{core_name}_CFGs")
    os.makedirs(cfg_dir, exist_ok=True)

    # Run opt inside target directory
    try:
        subprocess.run(["opt", "-passes=dot-cfg", ll_file], cwd=cfg_dir, check=True)
    except FileNotFoundError:
        sys.exit("Error: 'opt' not found on PATH.")
    except subprocess.CalledProcessError as e:
        print(f"Warning: opt failed for {ll_file} with exit code {e.returncode}")
        continue

    dot_files = glob.glob(os.path.join(cfg_dir, ".*.dot"))
    if not dot_files:
        print(f"Warning: No hidden .dot files found for {ll_file}")
        continue

    # Process generated .dot files into .png
    for dot_file in dot_files:
        dot_filename = os.path.basename(dot_file)
        # Extract function name from hidden .dot file (e.g., '.main.dot' -> 'main')
        base_func = dot_filename[1:-4] if dot_filename.endswith(".dot") else dot_filename.lstrip(".")

        png_file = os.path.join(cfg_dir, base_func + suffix + ".png")
        new_dot_file = os.path.join(cfg_dir, base_func + suffix + ".dot")

        os.replace(dot_file, new_dot_file)

        try:
            subprocess.run(["dot", "-Tpng", new_dot_file, "-o", png_file], check=True)
            print(f"Generated {png_file}")
            os.remove(new_dot_file)
        except FileNotFoundError:
            sys.exit("Error: 'dot' (Graphviz) not found on PATH.")
        except subprocess.CalledProcessError as e:
            print(f"Warning: failed to convert {new_dot_file} (exit code {e.returncode})")

if target_names and processed_count == 0:
    print(f"No matching files found for target name(s): {', '.join(sys.argv[1:])}")