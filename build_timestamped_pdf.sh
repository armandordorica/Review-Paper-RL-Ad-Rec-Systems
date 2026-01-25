#!/usr/bin/env bash
set -euo pipefail

# Builds a timestamped PDF in US/Eastern time (EST/EDT).
# Output: paper_YYYY-MM-DD_HHMM.pdf

TZ_NAME="America/New_York"

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$REPO_ROOT"

# Prefer an active env, but also work with a default conda install layout.
if command -v tectonic >/dev/null 2>&1; then
  :
elif [[ -x "$HOME/miniconda3/envs/texbuild/bin/tectonic" ]]; then
  export PATH="$HOME/miniconda3/envs/texbuild/bin:$PATH"
fi

if ! command -v tectonic >/dev/null 2>&1; then
  echo "ERROR: tectonic not found. Create the env via: conda env create -f environment.yml" >&2
  exit 1
fi

ts_file=$(TZ=$TZ_NAME date +"%Y-%m-%d_%H%M")
ts_display=$(TZ=$TZ_NAME date +"%Y-%m-%d %H:%M %Z")
job="._build_${ts_file}"
wrapper="${job}.tex"

{
  echo "\\def\\BuildTimestamp{${ts_display}}"
  echo "\\input{paper.tex}"
} > "$wrapper"

tectonic -X compile "$wrapper" --outdir .

mv "${job}.pdf" "paper_${ts_file}.pdf"

# Clean wrapper/intermediates (keep the timestamped PDF)
rm -f "$wrapper" "${job}.aux" "${job}.log" "${job}.out" "${job}.toc" "${job}.xdv" "${job}.bbl" "${job}.blg"

echo "Wrote paper_${ts_file}.pdf (Compiled: ${ts_display})"
