
#!/usr/bin/env bash

set -Eeuo pipefail
shopt -s nullglob

# ==================================================
# Paths and defaults
# ==================================================

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"

SOURCE_DIR="$SCRIPT_DIR/../supported"
DEST_ROOT="$SCRIPT_DIR/../ir"
PLUGIN_PATH="$SCRIPT_DIR/../../../build/miniObfuscator.so"

LEVEL=0
PASSES="CFFpass"
LEVEL_FLAG=()
SIG_FLAG=()

# Temporary directory used by the cleanup trap.
CURRENT_TMPDIR=""

cleanup() {
    if [[ -n "$CURRENT_TMPDIR" && -d "$CURRENT_TMPDIR" ]]; then
        rm -rf -- "$CURRENT_TMPDIR"
    fi
}

trap cleanup EXIT

# ==================================================
# Helpers
# ==================================================

die() {
    echo "Error: $*" >&2
    exit 1
}

usage() {
    cat <<'EOF'
Usage:
  ./run_pipeline.sh
  ./run_pipeline.sh --lvl 1
  ./run_pipeline.sh --lvl 2
  ./run_pipeline.sh -h

Modes:
  Default       Run CFFpass without extra opt flags.
                Input:  all .c files in ../supported/
                Output: ../ir/level0-base/

  --lvl 1       Run CFFpass with -cff-level=1.
                Input:  *05_for_obf_levels.c only
                Output: ../ir/level1-shuffle/

  --lvl 2       Run SIGpass,CFFpass with -cff-level=2
                and -sig-dis-rename.
                Input:  *05_for_obf_levels.c only
                Output: ../ir/level2-dummy/

Each processed file generates:
  <filename>_before.ll
  <filename>_splitting.ll
  <filename>_after.ll
EOF
}

# ==================================================
# Parse arguments
# ==================================================

while (($# > 0)); do
    case "$1" in
        --lvl)
            (($# >= 2)) || die "Missing level after --lvl."

            case "$2" in
                1|2)
                    LEVEL="$2"
                    ;;
                *)
                    die "Invalid level '$2'. Use --lvl 1 or --lvl 2."
                    ;;
            esac

            shift 2
            ;;

        -h|--help)
            usage
            exit 0
            ;;

        *)
            die "Unknown argument '$1'. Use --help for usage."
            ;;
    esac
done

# ==================================================
# Select level and output directory
# ==================================================

case "$LEVEL" in
    0)
        DEST_DIR="$DEST_ROOT/level0-base"
        LEVEL_FLAG=()
        PASSES="CFFpass"
        SIG_FLAG=()
        ;;

    1)
        DEST_DIR="$DEST_ROOT/level1-shuffle"
        LEVEL_FLAG=("-cff-level=1")
        PASSES="CFFpass"
        SIG_FLAG=()
        ;;

    2)
        DEST_DIR="$DEST_ROOT/level2-dummy"
        LEVEL_FLAG=("-cff-level=2")
        PASSES="SIGpass,CFFpass"
        SIG_FLAG=("-sig-dis-rename")
        ;;
esac

# ==================================================
# Validate configuration
# ==================================================

[[ -d "$SOURCE_DIR" ]] ||
    die "Source directory not found: $SOURCE_DIR"

[[ -f "$PLUGIN_PATH" ]] ||
    die "Plugin not found: $PLUGIN_PATH"

command -v clang >/dev/null 2>&1 ||
    die "'clang' was not found in PATH."

command -v opt >/dev/null 2>&1 ||
    die "'opt' was not found in PATH."

# ==================================================
# Select input files
# ==================================================

ALL_FILES=("$SOURCE_DIR"/*.c)
FILES=()

if ((${#ALL_FILES[@]} == 0)); then
    die "No .c files found in $SOURCE_DIR"
fi

if ((LEVEL == 0)); then
    FILES=("${ALL_FILES[@]}")
else
    for file in "${ALL_FILES[@]}"; do
        filename="$(basename -- "$file")"

        if [[ "$filename" == *05_for_obf_levels.c ]]; then
            FILES+=("$file")
        fi
    done

    if ((${#FILES[@]} == 0)); then
        die "No '*05_for_obf_levels.c' file found in $SOURCE_DIR"
    fi
fi

# ==================================================
# Prepare output directory
# ==================================================

mkdir -p "$DEST_DIR"

# ==================================================
# Display configuration
# ==================================================

echo "=========================================="
echo "LLVM CFF Pass Runner"
echo "=========================================="
echo "Source:   $SOURCE_DIR"
echo "Output:   $DEST_DIR"
echo "Plugin:   $PLUGIN_PATH"
echo "Pipeline: $PASSES"
echo "Level:    $LEVEL"

if ((${#LEVEL_FLAG[@]} > 0 || ${#SIG_FLAG[@]} > 0)); then
    echo "Opt flags: ${LEVEL_FLAG[*]} ${SIG_FLAG[*]}"
else
    echo "Opt flags: (none)"
fi

echo "Files:    ${#FILES[@]}"
echo "=========================================="

# ==================================================
# Process files
# ==================================================

TOTAL=${#FILES[@]}
PROCESSED=0

for filepath in "${FILES[@]}"; do
    filename="$(basename -- "$filepath")"
    name="${filename%.c}"

    before="$DEST_DIR/${name}_before.ll"
    splitting="$DEST_DIR/${name}_splitting.ll"
    after="$DEST_DIR/${name}_after.ll"

    CURRENT_TMPDIR="$(mktemp -d)"
    bitcode="$CURRENT_TMPDIR/${name}.bc"

    echo
    echo "[$((PROCESSED + 1))/$TOTAL] $filename"

    # --------------------------------------------------
    # 1. Generate original LLVM IR
    # --------------------------------------------------

    echo "  [1/4] Generating original IR..."

    clang -S -emit-llvm -O0 \
        "$filepath" \
        -o "$before"

    echo "        Created: $before"

    # --------------------------------------------------
    # 2. Compile source to bitcode
    # --------------------------------------------------

    echo "  [2/4] Compiling to bitcode..."

    clang -O0 -flto -c \
        "$filepath" \
        -o "$bitcode"

    # --------------------------------------------------
    # 3. Generate splitting IR
    # --------------------------------------------------

    echo "  [3/4] Generating splitting IR..."

    opt \
        "-load-pass-plugin=$PLUGIN_PATH" \
        "-passes=$PASSES" \
        "${LEVEL_FLAG[@]}" \
        "${SIG_FLAG[@]}" \
        -cff-no-dispatch \
        -S "$bitcode" \
        -o "$splitting"

    echo "        Created: $splitting"

    # --------------------------------------------------
    # 4. Generate final IR
    # --------------------------------------------------

    echo "  [4/4] Generating final IR..."

    opt \
        "-load-pass-plugin=$PLUGIN_PATH" \
        "-passes=$PASSES" \
        "${LEVEL_FLAG[@]}" \
        "${SIG_FLAG[@]}" \
        -S "$bitcode" \
        -o "$after"

    echo "        Created: $after"

    # --------------------------------------------------
    # Finish this file
    # --------------------------------------------------

    cleanup
    CURRENT_TMPDIR=""

    ((PROCESSED += 1))

    echo "  [OK] $filename"
done

# ==================================================
# Summary
# ==================================================

echo
echo "=========================================="
echo "All files processed successfully."
echo "Level:     $LEVEL"
echo "Processed: $PROCESSED/$TOTAL"
echo "Output:    $DEST_DIR"
echo "=========================================="
