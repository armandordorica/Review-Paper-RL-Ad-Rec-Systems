# Review: RL for Ad Policy Optimization (LaTeX build)

This repo contains the LaTeX source for the paper in `paper.tex`.

The paper is set up to optionally print a build stamp inside the PDF (right under the title):

- `Compiled: <YYYY-MM-DD HH:MM>`

---

## Current revision status

> Short resume pointer. Detailed per-edit guidance lives in `SKILL.md` and the reviewer feedback under `docs/agent/`.

**Active work:** Revising `\subsection{State Space Representation}` in `paper.tex` (currently lines 712–744).

**Target structure for the subsection** (established by the intro paragraph at line 725):

1. Intro: design question, authorial property taxonomy, section map
2. Formal definition of the state space
3. Property: Markovianity
4. Property: Expressiveness
5. Property: Stability under distribution shift
6. Property: Sample efficiency
7. Property: Interpretability
8. Comparison table across representative systems
9. Closing synthesis + transition to Policy Learning

### Ordered change log (State Space Representation)

| # | Change | Status | Commit |
|---|---|---|---|
| 9 | Intro paragraph with property taxonomy + section map | done | `5875be4` |
| 6 | Rewrite formal-definition paragraph (drop FrozenLake, add MDP components + ad signals) | done | `5875be4` |
| 7 | Dedicated Markovianity property paragraph | done | `9def388` |
| 5 | Delete "In contrast… tabular + embeddings ≈ Markov" paragraph | done | `d53ae5c` |
| 8 | Remove CF / MF / two-tower / Transformer historical lineage | done | `7a77226` |
| 1 | Remove em dashes in State Space subsection | no-op (removed implicitly by #8) | — |
| 2 | Remove unnecessary bolds in offline/online embeddings paragraph | done | `adeb313` |
| 3 | Fix ambiguous latency claim (Option A: latency → real-time → size) | done | `adeb313` |
| 4 | Delete YouTube thumbs-up/down tangent (4a: delete, no replacement) | done | `adeb313` |
| 10 | Comparison table across representative systems | pending | — |
| 11 | Closing synthesis sentence + transition to Policy Learning | pending | — |

### Current structural gap

The subsection's intro paragraph promises five property paragraphs (Markovianity, Expressiveness, Stability under distribution shift, Sample efficiency, Interpretability), but only **Markovianity** currently exists. Between the Markovianity paragraph and `\subsection{Policy Learning}` there are four surviving paragraphs (offline/online embeddings, concatenation/integration, user embeddings, item embeddings) that do not map cleanly onto any promised property and are therefore orphaned from the new section structure.

### Immediate next decision (resume here)

Three options, in order of preference:

- **A. (recommended)** Draft the four missing property paragraphs (Expressiveness, Stability under distribution shift, Sample efficiency, Interpretability), folding content from the orphan paragraphs where it naturally fits:
  - offline/online embeddings → **Stability under distribution shift** (already cites `gama2014survey`, `Sutton1998` for distribution shift)
  - concatenation / integration paragraph → **Expressiveness**
  - user/item embedding typology → **Expressiveness** (or cut if redundant with formal-definition paragraph)
  Then execute Changes #10 and #11.
- **B.** Do Changes #10 (table) and #11 (synthesis) first against the current incomplete state. Dispreferred: the table's rows/columns depend on what the four missing property paragraphs decide.
- **C.** Delete the orphan paragraphs now and rebuild bottom-up via A. Dispreferred: makes the section visibly broken while mid-revision.

### Working rules (enforced by `SKILL.md`)

- **Incremental + approval-gated.** Propose diffs before applying; wait for explicit approval per change. See the user's 🏫 skill preamble in `SKILL.md`.
- **Avoid pedagogical overemphasis.** Every sentence must earn its space: does it advance the ad-recsys argument, or explain RL? If the latter, cut or compress and cite a textbook. Reviewer-cited examples to avoid: FrozenLake, RNN→Transformer lineage, generic embedding lineage, thumbs-up/down YouTube surveys.
- **Ad-specific framing.** Generic recsys / generic RL claims should either be removed or rewritten to anchor in monetization-aware ranking.

### Orphaned bibliography keys (after Change #8)

The following `.bib` entries are no longer cited anywhere in `paper.tex` and are candidates for removal during bibliography cleanup (not yet done):

`koren2008factorization`, `bennett2007netflix`, `gomez2015netflix`, `van2013deep`, `he2014practical`, `Bengio1994`, `Pascanu2013`, `shim2022comparison`, `linden2003amazon`.

### Deferred housekeeping

- **Build-artifact cleanup in git history.** Commit `68f31b3` ("Sync build artifacts, dated PDF snapshots, and Jupyter checkpoints") committed LaTeX aux files, dated PDF snapshots, and `.ipynb_checkpoints/*` that should not be tracked. User deferred cleanup until structural revisions settle. When resumed, the fix is: add patterns to `.gitignore`, `git rm --cached` the offending files, and commit.

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
