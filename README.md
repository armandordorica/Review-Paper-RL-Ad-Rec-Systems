# Review: RL for Ad Policy Optimization (LaTeX build)

This repo contains the LaTeX source for the paper in `paper.tex`.

The paper is set up to optionally print a build stamp inside the PDF (right under the title):

- `Compiled: <YYYY-MM-DD HH:MM>`

## Build on a fresh machine (recommended: conda + Tectonic)

This is the most reproducible approach because it avoids relying on a system-wide TeX installation.

### 1) Clone

```bash
git clone git@github.com:armandordorica/Review-Paper-RL-Ad-Rec-Systems.git
cd Review-Paper-RL-Ad-Rec-Systems
```

### 2) Create a minimal LaTeX build environment

Requires: `conda` (Miniconda/Anaconda).

```bash
conda env create -f environment.yml
```

If you prefer the explicit one-liner instead of `environment.yml`:

```bash
conda create -y -n texbuild -c conda-forge tectonic
```

### 3) Produce a timestamped PDF (minute precision)

This command:
- embeds a timestamp in the PDF via `\\BuildTimestamp`
- writes an output file named `paper_YYYY-MM-DD_HHMM.pdf`

```bash
ENV_BIN="$HOME/miniconda3/envs/texbuild/bin"
export PATH="$ENV_BIN:$PATH"

TS_FILE=$(date +"%Y-%m-%d_%H%M")
TS_DISPLAY=$(date +"%Y-%m-%d %H:%M")
JOB="._build_${TS_FILE}"  # temporary wrapper base name

# Create a tiny wrapper so we can inject the timestamp without editing paper.tex
WRAPPER="${JOB}.tex"
{
  echo "\\def\\BuildTimestamp{${TS_DISPLAY}}"
  echo "\\input{paper.tex}"
} > "$WRAPPER"

tectonic -X compile "$WRAPPER" --outdir .

# Rename output to the desired artifact name
mv "${JOB}.pdf" "paper_${TS_FILE}.pdf"

# Optional: clean wrapper/intermediates (keep the timestamped PDF)
rm -f "$WRAPPER" "${JOB}.aux" "${JOB}.log" "${JOB}.out" "${JOB}.toc" "${JOB}.xdv" "${JOB}.bbl" "${JOB}.blg"

ls -lh "paper_${TS_FILE}.pdf"
```

## Alternative build (system TeX Live)

If you prefer system packages (Linux), install TeX Live and compile with `pdflatex` + `bibtex`:

```bash
sudo apt-get update
sudo apt-get install -y texlive-latex-base texlive-latex-recommended texlive-latex-extra texlive-fonts-recommended texlive-bibtex-extra

pdflatex paper.tex
bibtex paper
pdflatex paper.tex
pdflatex paper.tex
```

## Notes

- Timestamped PDFs (e.g. `paper_2026-01-25_1943.pdf`) are intended to be committed to the repo for traceability.
- Temporary build intermediates are ignored via `.gitignore`.
