import subprocess
import glob
import os
import sys

if len(sys.argv) != 2:
    sys.exit(f"Usage: python3 {sys.argv[0]} <file.ll>")

ll_file = sys.argv[1]
stem = os.path.splitext(os.path.basename(ll_file))[0].lower()

if "before" in stem:
    suffix = "_before"
elif "after" in stem:
    suffix = "_after"
elif "splitting" in stem:
    suffix = "_splitted"
else:
    suffix = ""

try:
    subprocess.run(["opt", "-passes=dot-cfg", ll_file], check=True)
except FileNotFoundError:
    sys.exit("Error: 'opt' not found on PATH.")
except subprocess.CalledProcessError as e:
    sys.exit(f"Error: opt failed with exit code {e.returncode}")

dot_files = glob.glob(".*.dot")
if not dot_files:
    sys.exit("No .dot files found — opt may not have produced output.")

for dot_file in dot_files:
    base = dot_file[:-4] if dot_file.endswith(".dot") else dot_file
    base = base.lstrip(".")
    png_file = base + suffix + ".png"
    new_dot_file = base + suffix + ".dot"

    os.replace(dot_file, new_dot_file)

    try:
        subprocess.run(["dot", "-Tpng", new_dot_file, "-o", png_file], check=True)
        print(f"Generated {png_file}")
    
        os.remove(new_dot_file) 
        
    except FileNotFoundError:
        sys.exit("Error: 'dot' (Graphviz) not found on PATH.")
    except subprocess.CalledProcessError as e:
        print(f"Warning: failed to convert {new_dot_file} (exit code {e.returncode})")