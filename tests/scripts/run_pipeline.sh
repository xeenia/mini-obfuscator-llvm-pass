#!/usr/bin/env bash

# Exit immediately if a command fails
set -e

SOURCE_DIR="../cff/supported"
DEST_DIR="../ir"
PLUGIN_PATH="../../../build/miniObfuscator.so"

# Ensure source directory exists
if [ ! -d "$SOURCE_DIR" ]; then
    echo "Error: Source directory '$SOURCE_DIR' does not exist."
    exit 1
fi

# Create destination directory if it doesn't exist
mkdir -p "$DEST_DIR"

# Navigate to the target directory
cd "$SOURCE_DIR"

# Collect targets: if arguments are passed, gather matching files; otherwise process all .c files
files=()
if [ $# -gt 0 ]; then
    for arg in "$@"; do
        matches=( *"$arg"*.c )
        if [ -e "${matches[0]}" ]; then
            files+=("${matches[@]}")
        else
            echo "Warning: No file matching '*$arg*.c' found."
        fi
    done
    if [ ${#files[@]} -eq 0 ]; then
        echo "Error: No matching C files found for provided argument(s)."
        exit 1
    fi
else
    files=( *.c )
fi

# Process each C file
for file in "${files[@]}"; do
    # Handle case where no .c files exist
    [ -e "$file" ] || continue

    # Extract filename without extension
    name="${file%.c}"
    echo "=== Processing $file ==="

    # 1. Generate [name]_before.ll
    clang -S -emit-llvm -O0 "$file" -o "${name}_before.ll"

    # 2. Generate bitcode for plugin passes
    clang -flto -c "$file" -o "${name}.bc"

    # 3. Generate [name]_splitting.ll
    opt -load-pass-plugin="$PLUGIN_PATH" -passes="CFFPass" -cff-no-dispatch -S "${name}.bc" -o "${name}_splitting.ll"

    # 4. Generate [name]_after.ll
    opt -load-pass-plugin="$PLUGIN_PATH" -passes="CFFPass" -S "${name}.bc" -o "${name}_after.ll"

    # 5. Clean up temporary bitcode
    rm -f "${name}.bc"

    # 6. Move generated IR files to destination directory
    mv "${name}_before.ll" "${name}_splitting.ll" "${name}_after.ll" "$DEST_DIR/"

    echo "Finished $name"
    echo ""
done

echo "All files processed successfully! Outputs moved to $DEST_DIR"