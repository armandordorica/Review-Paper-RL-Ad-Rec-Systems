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

### 2) Install Miniconda (if not already installed)

```bash
# Apple Silicon (M1/M2/M3)
curl -fsSL https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-arm64.sh -o /tmp/miniconda.sh

# Intel Mac
# curl -fsSL https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-x86_64.sh -o /tmp/miniconda.sh

bash /tmp/miniconda.sh -b -p ~/miniconda3
source ~/miniconda3/etc/profile.d/conda.sh
```

> To make `conda` available automatically in future terminals, run `conda init zsh` (or `conda init bash`).

### 3) Create the `texbuild` environment

Use `--override-channels` to avoid Anaconda default channel ToS prompts:

```bash
conda create -y -n texbuild -c conda-forge --override-channels tectonic
```

This only needs to be done once per machine.

### 4) Clone the repo

```bash
git clone git@github-personal:armandordorica/Review-Paper-RL-Ad-Rec-Systems.git
cd Review-Paper-RL-Ad-Rec-Systems
```

---

## Daily workflow: edit → compile → push

```bash
# 1. Source conda if it's not initialized in your shell
source ~/miniconda3/etc/profile.d/conda.sh

# 2. Activate the build environment
conda activate texbuild

# 3. Edit paper.tex with your changes (e.g. in VS Code)

# 4. Compile to a timestamped PDF
cd /path/to/Review-Paper-RL-Ad-Rec-Systems
./build_timestamped_pdf.sh
# Output: paper_YYYY-MM-DD_HHMM.pdf

# 5. Commit and push
git add paper.tex paper_YYYY-MM-DD_HHMM.pdf
git commit -m "Describe your changes"
git push
```

> **Tip:** The build script auto-detects common conda paths. If `tectonic` is not found, make sure you ran `conda activate texbuild` first.

---

## Build details

The build script:
- Embeds a timestamp in the PDF via `\BuildTimestamp`
- Writes output to `paper_YYYY-MM-DD_HHMM.pdf` (US/Eastern time)

If you prefer to run the steps manually without the script:

```bash
source ~/miniconda3/etc/profile.d/conda.sh
conda activate texbuild

TZ=America/New_York
TS_FILE=$(TZ=$TZ date +"%Y-%m-%d_%H%M")
TS_DISPLAY=$(TZ=$TZ date +"%Y-%m-%d %H:%M %Z")
JOB="._build_${TS_FILE}"

WRAPPER="${JOB}.tex"
{
  echo "\\def\\BuildTimestamp{${TS_DISPLAY}}"
  echo "\\input{paper.tex}"
} > "$WRAPPER"

tectonic -X compile "$WRAPPER" --outdir .
mv "${JOB}.pdf" "paper_${TS_FILE}.pdf"
rm -f "$WRAPPER" "${JOB}.aux" "${JOB}.log" "${JOB}.out" "${JOB}.toc" "${JOB}.xdv" "${JOB}.bbl" "${JOB}.blg"

ls -lh "paper_${TS_FILE}.pdf"
```

---

## Alternative build (Linux / system TeX Live)

```bash
sudo apt-get update
sudo apt-get install -y texlive-latex-base texlive-latex-recommended texlive-latex-extra texlive-fonts-recommended texlive-bibtex-extra

pdflatex paper.tex
bibtex paper
pdflatex paper.tex
pdflatex paper.tex
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
