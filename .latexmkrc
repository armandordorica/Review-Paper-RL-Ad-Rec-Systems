# .latexmkrc — latexmk configuration for paper.tex
# Usage:
#   latexmk -pvc paper.tex        # continuous preview (recompiles on save)
#   latexmk paper.tex             # single build
#   latexmk -c                    # clean aux files
#   latexmk -C                    # clean aux files + PDF

# Use pdflatex (system TeX Live)
$pdf_mode = 1;
$pdflatex = 'pdflatex -interaction=nonstopmode -synctex=1 %O %S';

# Open PDF in Skim (auto-reloads on recompile — no manual refresh needed)
$pdf_previewer = 'open -a Skim';

# Keep aux files in the project root alongside the source
$out_dir = '.';

# Run bibtex when .bib files change
$bibtex_use = 1;

# Number of extra pdflatex passes to ensure cross-references converge
$max_repeat = 6;

# Files to clean with latexmk -c / -C
@generated_exts = (@generated_exts, 'synctex.gz', 'bbl', 'nav', 'snm', 'vrb');
