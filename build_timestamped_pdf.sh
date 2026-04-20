#!/usr/bin/env bash
set -euo pipefail

# Builds a timestamped PDF in US/Eastern time (EST/EDT) using latexmk + pdflatex.
# Output: paper_YYYY-MM-DD_HHMM.pdf
#
# Requirements (macOS, already present if TeX Live is installed):
#   latexmk   — /Library/TeX/texbin/latexmk
#   pdflatex  — /Library/TeX/texbin/pdflatex
#   bibtex    — /Library/TeX/texbin/bibtex

TZ_NAME="America/New_York"

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$REPO_ROOT"

# Verify required tools
for cmd in latexmk pdflatex bibtex; do
  if ! command -v "$cmd" >/dev/null 2>&1; then
    echo "ERROR: '$cmd' not found. Install TeX Live: https://tug.org/texlive/" >&2
    exit 1
  fi
done

ts_file=$(TZ=$TZ_NAME date +"%Y-%m-%d_%H%M")
ts_display=$(TZ=$TZ_NAME date +"%Y-%m-%d %H:%M %Z")
job="_build_${ts_file}"
wrapper="${job}.tex"

# Write a thin wrapper that injects the timestamp and inputs the real source
{
  echo "\\def\\BuildTimestamp{${ts_display}}"
  echo "\\input{paper.tex}"
} > "$wrapper"

# Run latexmk: pdflatex + bibtex, up to 6 passes, non-interactive
latexmk -pdf \
  -pdflatex="pdflatex -interaction=nonstopmode %O %S" \
  -bibtex \
  -jobname="$job" \
  "$wrapper"

mv "${job}.pdf" "paper_${ts_file}.pdf"

# Clean wrapper and all intermediates (keep only the timestamped PDF)
latexmk -c -jobname="$job" "$wrapper" 2>/dev/null || true
rm -f "$wrapper" "${job}.aux" "${job}.log" "${job}.out" "${job}.toc" \
      "${job}.bbl" "${job}.blg" "${job}.synctex.gz" "${job}.fls" "${job}.fdb_latexmk"

echo "Wrote paper_${ts_file}.pdf (Compiled: ${ts_display})"
