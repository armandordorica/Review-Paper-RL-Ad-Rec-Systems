# Review: RL for Ad Policy Optimization (LaTeX build)

This repo contains the LaTeX source for the paper in `paper.tex`.

The paper is set up to optionally print a build stamp inside the PDF (right under the title):

- `Compiled: <YYYY-MM-DD HH:MM>`

---

## One-time machine setup (fresh Mac)

### 1) SSH key for GitHub

If this machine doesn't already have an SSH key:

```bash
ssh-keygen -t ed25519 -C "your@email.com"
cat ~/.ssh/id_ed25519.pub   # copy this output
```

Add the public key at: **GitHub → Settings → SSH and GPG keys → New SSH key**

Then add the `github-personal` alias to `~/.ssh/config`:

```
Host github-personal
  HostName github.com
  User git
  IdentitiesOnly yes
  IdentityFile ~/.ssh/id_ed25519
```

Verify it works:

```bash
ssh -T github-personal
# Expected: Hi armandordorica! You've successfully authenticated...
```

### 2) Install TeX Live

Required for running the build script (`latexmk`, `pdflatex`, `bibtex`).

**macOS (recommended):** Install [MacTeX](https://tug.org/mactex/) — includes all required tools.

```bash
# Via Homebrew (recommended)
brew install --cask mactex-no-gui
# Then reload your shell so /Library/TeX/texbin is on your PATH:
source ~/.zshrc
```

Or download the full installer from https://tug.org/mactex/

Verify the tools are available:

```bash
latexmk --version
pdflatex --version
bibtex --version
```

### 3) Clone the repo

```bash
git clone git@github-personal:armandordorica/Review-Paper-RL-Ad-Rec-Systems.git
cd Review-Paper-RL-Ad-Rec-Systems
```

---

## Daily workflow: edit → compile → push

### Option A — Continuous preview while writing (recommended)

Uses `latexmk -pvc` with system TeX Live. Recompiles automatically every time you save `paper.tex` and auto-reloads the PDF in **Skim** (installed via `brew install --cask skim`). No manual recompile needed.

```bash
cd /path/to/Review-Paper-RL-Ad-Rec-Systems
latexmk -pvc paper.tex
```

Or run the **"LaTeX: Watch (latexmk -pvc)"** VS Code task (`Cmd+Shift+B`).

**Tip:** In Skim, go to **Skim → Preferences → Sync** and enable *"Check for file changes"* → *"Automatically"*. The PDF will update in place as you type.

Other useful `latexmk` commands:
```bash
latexmk paper.tex    # single build (no watch)
latexmk -c           # clean aux files (keeps PDF)
latexmk -C           # clean aux files + PDF
```

The `.latexmkrc` in the repo root configures the build: pdflatex + bibtex, up to 6 passes, SyncTeX enabled for click-to-source navigation.

---

### Option B — Timestamped PDF for commits

Uses system TeX Live (`latexmk` + `pdflatex` + `bibtex`). Produces a `paper_YYYY-MM-DD_HHMM.pdf` in US/Eastern time for traceability. No conda environment needed.

```bash
# 1. Edit paper.tex

# 2. Compile to a timestamped PDF
cd /path/to/Review-Paper-RL-Ad-Rec-Systems
./build_timestamped_pdf.sh
# Output: paper_YYYY-MM-DD_HHMM.pdf

# 3. Commit and push
git add paper.tex paper_YYYY-MM-DD_HHMM.pdf
git commit -m "Describe your changes"
git push
```

> **Tip:** The script requires `latexmk`, `pdflatex`, and `bibtex` — all included with TeX Live. If any are missing, install TeX Live: https://tug.org/texlive/

---

## Build details

The build script (`build_timestamped_pdf.sh`):
- Uses `latexmk` with `pdflatex` and `bibtex` (system TeX Live)
- Embeds a timestamp in the PDF via `\BuildTimestamp`
- Writes output to `paper_YYYY-MM-DD_HHMM.pdf` (US/Eastern time)
- Automatically cleans up all intermediate build files after compilation

**Expected build time:** ~1–2 minutes. `latexmk` runs up to 6 TeX passes (TeX → BibTeX → TeX × 4) to converge cross-references and the bibliography.

If you prefer to run the steps manually without the script:

```bash
TZ_NAME=America/New_York
TS_FILE=$(TZ=$TZ_NAME date +"%Y-%m-%d_%H%M")
TS_DISPLAY=$(TZ=$TZ_NAME date +"%Y-%m-%d %H:%M %Z")
JOB="_build_${TS_FILE}"
WRAPPER="${JOB}.tex"

{
  echo "\\def\\BuildTimestamp{${TS_DISPLAY}}"
  echo "\\input{paper.tex}"
} > "$WRAPPER"

latexmk -pdf \
  -pdflatex="pdflatex -interaction=nonstopmode %O %S" \
  -bibtex \
  -jobname="$JOB" \
  "$WRAPPER"

mv "${JOB}.pdf" "paper_${TS_FILE}.pdf"
latexmk -c -jobname="$JOB" "$WRAPPER" 2>/dev/null || true
rm -f "$WRAPPER" "${JOB}.aux" "${JOB}.log" "${JOB}.out" "${JOB}.toc" \
      "${JOB}.bbl" "${JOB}.blg" "${JOB}.synctex.gz" "${JOB}.fls" "${JOB}.fdb_latexmk"

ls -lh "paper_${TS_FILE}.pdf"
```

---

## Notes

- Timestamped PDFs (e.g. `paper_2026-01-25_1943.pdf`) are committed to the repo for traceability.
- Temporary build intermediates are ignored via `.gitignore`.
- Git commits from a new machine may auto-detect your name/email from the hostname. Set them explicitly to avoid the warning:
  ```bash
  git config --global user.name "Armando Ordorica"
  git config --global user.email "your@email.com"
  ```
