# Tables / Figures Hygiene: Revision And Reviewer-Risk Audit

Scope: global `paper.tex` float, caption, label, reference, placement, and readability hygiene.

Latest refresh: May 30, 2026. Reviewed against the current `paper.tex` during the pre-submission ROI pass. Three reviewer-flagged items are now resolved and verified by a clean compile (44 pages, zero undefined references/citations/labels): cross-reference integrity (TF1), the note under Figure 1 folded into the caption (TF5), and the previously unreferenced/misplaced action-set figure relocated to Section 4.2 with an explicit reference (TF9). The exploration comparison table is now referenced in prose as well. Two floats were previously completely unreferenced (the exploration comparison table and Figure~\ref{fig:detailed_ad_policy}); both now have text references. The remaining work is readability/density (TF4/TF6) and the boldface check (TF7), which require visual inspection of the compiled PDF.

Prior refresh: May 25, 2026. Opened as the missing global audit for reviewer-flagged table and figure presentation issues. Source-level references and labels were mostly present, but visual placement and readability still needed a compile-and-inspect pass.

## Reviewer Context Used

Anchored to direct quotes from `docs/agent/reviewers.txt`, which responds to `original_submission_paper.pdf`. Three-state calibration: table/figure presentation was explicitly reviewer-flagged in the original submission. The current paper has added several new tables after submission, so those new floats carry full author responsibility and must be checked for labels, placement, readability, and text walkthrough.

- **Reviewer 2:** `"Revisit the tables and figures: Tables 3-4 are referred but there are no such tables in the paper, and figures 3-4 looks to be tables but are mentioned as figures."` -> TF1, TF2, TF3.
- **Reviewer 2:** `"Make sure the text in the figures are readable and not too small. Also for notes under figure 1 use footnotes or include in the figure caption"` -> TF4, TF5.
- **Reviewer 2:** `"Position tables in the texts where they are mentioned or referred to will make it easier for the readers. (eg: Tables are at the end of the paper, but mentioned in earlier sections)"` -> TF2, TF6.
- **Associate Editor:** `"please use bold-face text sparingly"` -> TF7.
- **Reviewer 1 Major Comment 3:** `"Quantitative results from existing studies could also be summarized to help readers understand real-world performance and trade-offs."` -> TF8.
- **`revision_rules.md`:** Section 15 table/figure handling, Section 16 document-wide consistency, Section 17.2 evaluation-metric and trade-off discussion.

## Current Overall Assessment

The current manuscript is substantially better organized than the submission likely was: every float found in source has a `\caption{...}` and `\label{...}`, and most major tables are introduced before they appear. The notation table now directly answers Reviewer 2's MDP-formulation request, and the new comparison tables support the reviewer's request for deeper comparison.

The remaining risk is that source-level correctness is not the same as PDF-level correctness. Several tables are `table*` floats and may move away from first reference. Some tables are dense, especially `tab:utility-comparison` and `tab:exploration-exploitation-comparison`, which use minipages or many narrow columns. The exploration/exploitation table includes RegCB even though the RegCB prose is commented out. Figure~\ref{fig:detailed_ad_policy} appears in the exploration/exploitation section but its caption describes an action set, so it may belong in action-space material or need removal. The figure readability concerns cannot be closed until the current PDF is compiled and visually inspected.

Estimated reviewer-aligned score: **8.0 / 10** (up from 7.2 after TF1/TF5/TF9 landed and the compile confirmed zero undefined references). The old "Tables 3-4 / figures 3-4" label failure is confirmed gone, every float now has a text reference, and the Figure 1 note is in the caption. The remaining reviewer-facing risk is purely rendered readability and table density (TF4/TF6), which can only be closed by visually inspecting the compiled PDF.

## Legend

Priority and status are color-coded using inline HTML. Colors render in Cursor / VS Code markdown preview and most rich markdown viewers; on GitHub the text labels remain readable even if colors are stripped.

**Priority:**
<span style="background:#7c1d1d;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P0</span> critical / cannot ship
&nbsp;
<span style="background:#dc3545;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P1</span> blocker / must-fix
&nbsp;
<span style="background:#fd7e14;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P2</span> should-fix
&nbsp;
<span style="background:#6c757d;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P3</span> nice-to-have

**Status:**
<span style="background:#6c757d;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">TODO</span> not started
&nbsp;
<span style="background:#0d6efd;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">IN PROGRESS</span> being edited
&nbsp;
<span style="background:#ffc107;color:black;padding:2px 8px;border-radius:4px;font-weight:bold">PENDING REVIEW</span> awaiting user sign-off
&nbsp;
<span style="background:#198754;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">DONE</span> applied and committed

## Pending Revision Items

### Cross-Reference And Label Integrity

- <span style="background:#dc3545;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P1</span> <span style="background:#198754;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">DONE</span> **TF1.** Verified May 30, 2026. Full `latexmk` rebuild produced 44 pages with zero undefined references, citations, or labels. Also fixed two previously unreferenced floats: the exploration comparison table (`tab:exploration-exploitation-comparison`) and Figure~\ref{fig:detailed_ad_policy}, both of which now have explicit text references. Reviewer 2's "Tables 3-4 / figures 3-4" failure does not exist in the current source.

- <span style="background:#dc3545;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P1</span> <span style="background:#6c757d;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">TODO</span> **TF2.** Verify that each table or figure is introduced before it appears in the rendered PDF. Source placement is mostly near first reference, but `table*` floats can move. Prioritize `tab:action-space-comparison`, `tab:state-space-comparison`, `tab:offline-online-policy-learning`, `tab:policy-learning-comparison`, `tab:exploration-exploitation-comparison`, and `tab:evaluation-evidence`.

- <span style="background:#fd7e14;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P2</span> <span style="background:#6c757d;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">TODO</span> **TF3.** Confirm that captions and labels use consistent naming style. Current captions vary between title case and sentence case, and some captions are long analytical captions while others are shorter labels. Prefer descriptive sentence-style captions that state the table's role without becoming mini-paragraphs.

### Readability And Float Density

- <span style="background:#dc3545;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P1</span> <span style="background:#6c757d;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">TODO</span> **TF4.** Inspect figure readability in the compiled PDF. Reviewer 2 explicitly said figure text was too small. Check `fig:ad_timeline` and `fig:detailed_ad_policy`; if either has unreadable text, enlarge, simplify, or replace with prose/table content.

- <span style="background:#fd7e14;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P2</span> <span style="background:#198754;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">DONE</span> **TF5.** Fixed May 30, 2026. The `\begin{flushleft}...\footnotesize{\textit{Note:}...}` block under Figure 1 was removed and its content folded into the `\caption{...}`, exactly as Reviewer 2 requested. (Any notes embedded inside the timeline PNG itself remain a TF4 readability check.)

- <span style="background:#dc3545;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P1</span> <span style="background:#6c757d;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">TODO</span> **TF6.** Simplify dense tables that are hard to read in the PDF. Highest-risk tables are `tab:utility-comparison` (narrow columns and equations in minipages) and `tab:exploration-exploitation-comparison` (minipages, nested itemize, and a RegCB row without active prose support). Medium-risk tables are the large `table*` comparison tables in Sections 4.2-4.5.

### Consistency With Section Audits

- <span style="background:#fd7e14;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P2</span> <span style="background:#6c757d;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">TODO</span> **TF7.** Reduce excessive boldface inside tables if it looks visually heavy. The Associate Editor asked to use bold sparingly. Header bolding is fine; repeated bold labels inside dense proxy tables or comparison tables should be checked in the PDF.

- <span style="background:#fd7e14;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P2</span> <span style="background:#6c757d;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">TODO</span> **TF8.** Ensure the evaluation-evidence table supports, rather than replaces, prose synthesis. Reviewer 1 asked for quantitative results and evaluation practice; `tab:evaluation-evidence` should be source-verified and walked through in prose so the reader does not have to infer the takeaway.

- <span style="background:#fd7e14;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P2</span> <span style="background:#198754;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">DONE</span> **TF9.** Fixed May 30, 2026. Moved `fig:detailed_ad_policy` from the end of Section 4.5 into Section 4.2 (Action Space), where the action-set content belongs, and added a one-sentence textual walkthrough plus an explicit `Figure~\ref` before the float. The unused `\definecolor{darkgreen}` that sat above the old float location was also removed.

### Final Compile Checks

- <span style="background:#dc3545;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P1</span> <span style="background:#6c757d;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">TODO</span> **TF10.** Run a final timestamped compile after table/figure edits and inspect the PDF for float order, page breaks, overfull boxes, tiny fonts, and unresolved references. This should happen before any final commit/push workflow.

## Float Inventory From Current Source

| Float | Label | Current risk |
|---|---|---|
| Notation guide table | `tab:comparison` | Useful and reviewer-aligned; verify placement near MDP opener. |
| Historical timeline figure | `fig:ad_timeline` | Reviewer specifically flagged figure readability/notes; inspect rendered image. |
| Historical evolution table | `tab:evolution-tracks` | Large `table*`; verify placement and readability. |
| Revenue proxy metrics table | `tab:proxy-metrics-revenue` | Dense but local; citation support tracked in reward audit. |
| Engagement proxy metrics table | `tab:proxy-metrics-engagement` | Long table nested in same float as revenue table; inspect page fit. |
| Ad fatigue proxy metrics table | `tab:proxy-metrics-fatigue` | Local and likely readable; inspect placement. |
| Utility formulation table | `tab:utility-comparison` | High density and equations in narrow columns; likely needs simplification. |
| Action-space comparison table | `tab:action-space-comparison` | Useful new synthesis table; source verification tracked in action-space audit; inspect `table*` placement. |
| State-space comparison table | `tab:state-space-comparison` | Useful new synthesis table; source verification tracked in state-space audit; inspect `table*` placement. |
| Offline/online policy-learning table | `tab:offline-online-policy-learning` | Useful; inspect placement relative to first reference. |
| Policy-learning comparison table | `tab:policy-learning-comparison` | Useful; check whether it duplicates the offline/online table. |
| Exploration/exploitation comparison table | `tab:exploration-exploitation-comparison` | High density; RegCB row inconsistent with commented-out prose; simplify. |
| Detailed ad-policy action-set figure | `fig:detailed_ad_policy` | Placement/topic mismatch risk; decide whether it belongs in Section 4.5. |
| Evaluation evidence table | `tab:evaluation-evidence` | Reviewer-aligned but source-sensitive; verify evidence and placement. |

## Citation Adequacy Scores

| Citation | Current Use In Tables/Figures Hygiene | Adequacy | Assessment |
|---|---|---:|---|
| None | This global audit concerns presentation mechanics rather than citation support. | n/a | Citation support for table contents belongs in section audits. This file tracks labels, placement, readability, and consistency. |

## Resolved Revision Items

- <span style="background:#dc3545;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P1</span> <span style="background:#198754;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">DONE</span> **TF11.** Source search shows the current manuscript uses explicit `\label{...}` commands for the visible tables and figures found in `paper.tex`.
- <span style="background:#dc3545;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P1</span> <span style="background:#198754;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">DONE</span> **TF12.** The MDP notation table exists and is referenced from the methodology and RL-formulation opener, addressing Reviewer 2's request for a notation table at the source level.

## Out Of Scope For This File

- Verifying each table cell's scientific support, which belongs in the relevant section audit.
- Rewriting table prose or captions beyond hygiene recommendations.
- Figure redesign unless a rendered PDF inspection confirms unreadable or misplaced figures.
- Bibliography cleanup unrelated to floats.

## Working Rules

- Check source-level references first, then PDF-level rendered placement and readability.
- Do not remove a synthesis table only because it is large; first ask whether it carries reviewer-facing comparison value that prose cannot carry as compactly.
- If a table repeats nearby prose without adding comparison value, fold it into prose.
- Keep every table or figure close to first reference where LaTeX allows, and walk the reader through the takeaway before or immediately after the float.
