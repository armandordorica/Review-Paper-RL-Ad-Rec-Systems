# Paper-Wide Audit Master: Reviewer-Risk Orchestrator

Scope: `paper.tex` end-to-end. This file is the single entry point for prioritizing revisions across the entire manuscript. It does not duplicate per-section detail; it aggregates and ranks reviewer-flag risks that survive across sections, points to the relevant per-section audit, and predicts the recommendation each reviewer would issue against the current state.

Latest refresh: May 30, 2026 (second pass, after a full read-through of every section audit). All eleven section audits plus the abstract and acknowledgments audits were re-read and reconciled against the current `paper.tex`; the dashboard scores below now match each audit's latest self-reported score. This read corrected one material error: the specific citation misalignment Reviewer 1 named in Major Comment 5 (a reference supporting "ads underperform relative to organic content" that actually discussed user-generated reviews vs commercial messaging) was already resolved during the introduction pass (I1: `danescu2010competing` removed, confirmed absent from `paper.tex`). The master previously still listed that named example as an open Tier 1 blocker; it is now reclassified, and the surviving citation work is the lower-risk orphan-claim / weak-anchor sweep (history C5/C6/C10/C11, methodology `russell2016artificial`). This pass also applied four zero-risk cleanups directly: consolidated the duplicate Hohnhold 2015 key (`43887` -> `hohnhold2015focusing`, dead bib entry removed), removed the two surviving em-dashes (lines 244, 430), fixed a double space in the methodology, and deleted a leftover commented-out paragraph before the history section.

First-pass (earlier May 30) work, retained: (1) R1's named "REINFORCE barely described" depth gap, answered with a per-family policy-gradient paragraph (Section 4.4); (2) the Thompson Sampling duplicated-sentence/broken-equation defect (Section 4.5); (3) the RegCB table-vs-prose inconsistency, resolved by restoring a source-disciplined RegCB subsection; (4) two unreferenced floats (the exploration comparison table and the action-set figure), now referenced, with the figure relocated to Section 4.2; (5) R2's named "note under Figure 1" item, folded into the caption; verified by a clean compile (44 pages, zero undefined references/citations/labels). The remaining recommendation-changing work is concentrated in two places: the Section 4.5 exploration ad-policy reframing + industry-claim verification, and the Section 5 evaluation evidence verification. See the Action Plan at the end of this file for the time-boxed sequence.

## Reviewer Calibration Anchor

All reviewer quotes used in this file come from `docs/agent/reviewers.txt`, which responds to `original_submission_paper.pdf` (workspace root). Before claiming reviewer alignment for any item below, apply the three-state check from `/revise-rl-ad-paper` ("Reviewer–Submission Calibration"):

1. **Present in submission and reviewer-flagged.** Revision is reviewer-aligned.
2. **Present in submission and not flagged.** Revision is internal-style only, label as such.
3. **Not present in submission.** New content, full author responsibility.

Items below carry a calibration tag: `[F]` (flagged in submission), `[T]` (tolerated, present but not flagged), `[N]` (new content added after submission). Internal-style items use `[S]`.

## Section Status Dashboard

Each row links to the authoritative per-section audit. Scores are reviewer-aligned scores from the section audits as of their latest refresh.


| Section                      | Lines     | Audit file                          | Latest score           | Predicted AE / R1 / R2            | Audit gap                                   |
| ---------------------------- | --------- | ----------------------------------- | ---------------------- | --------------------------------- | ------------------------------------------- |
| Abstract                     | 57-81     | `abstract_revision_todo.md`         | **9.0 / 10**           | Good / Good / Good                | none                                        |
| 1. Introduction              | 89-117    | `introduction_audit.md`             | **9.5 / 10**           | Excellent / Good / Good           | none                                        |
| 2. Methodology               | 119-152   | `methodology_audit.md`              | **8.8 / 10**           | Excellent / Excellent / Excellent | reviewer-praised; smaller hygiene items only |
| 3. History (3.1 + 3.2)       | 155-268   | `history_audit.md`                  | **8.5 / 10**           | Good / Good / Good                | none                                        |
| 4.0 RL Formulation opener    | 270-282   | `rl_formulation_opener_audit.md`    | **8.5 / 10**           | Good / Good / Good                | O7/O8 follow-ups only                       |
| 4.1 Reward Design            | 284-606   | `reward_design_citation_audit.md`   | **8.2 / 10**           | Good / Good / Good                | proxy-table support, offline-RL wording, reported-results verification |
| 4.2 Action Space             | 607-661   | `action_space_audit.md`             | **8.4 / 10**           | Good / Good–Fair / Good           | A5 partial: LinkedIn and Zhang table notation checks remain |
| 4.3 State Space              | 662-744   | `state_space_citation_audit.md`     | **8.0 / 10**           | Good / Good / Good                | table-cell verification, ad-policy specificity, reported-results wording |
| 4.4 Policy Learning          | ~745-860   | `policy_learning_citation_audit.md` | **8.0 / 10**           | Good / Fair / Good           | reported-results evidence (P6); Horizon/actor-critic framing check (P7); policy-gradient depth now DONE |
| 4.5 Exploration/Exploitation | ~860-1050  | `exploration_exploitation_audit.md` | **7.4 / 10**           | Fair / Fair–Poor / Fair           | mechanical + equation/RegCB framing fixed; E15 industry-claim misalignment fixed (`tang2013ad`/`agarwal2014budget`/`gao2022bidding` synthesis); E16 line-878 redundancy/over-claim fixed + line-882 "cost of regret" corrected; no open P0/P1 citation defect; open P1: ad-policy reframing E1-E3 |
| 5. Evaluation                | ~1055-1110 | `evaluation_audit.md`               | **8.0 / 10**           | Good / Major-to-Minor / Good      | verify reported evidence (E8/E15)       |
| 6. Conclusions               | ~1110-1120 | `conclusions_audit.md`              | **8.0 / 10**           | Good / Fair–Good / Good           | source-alignment verification for synthesized properties |
| Acknowledgments              | ~1122-1125 | `acknowledgments_audit.md`          | **9.4 / 10**           | Good / n/a / n/a                  | final submission hygiene only               |
| Tables / Figures hygiene     | global    | `tables_figures_audit.md`           | **8.0 / 10**           | Good / n/a / Good                  | ref integrity + Fig 1 note + Fig 2 placement DONE; remaining: PDF readability/density (TF4/TF6) |


The **biggest remaining gap** is no longer presentation mechanics or method depth; the pre-submission pass closed the cheap, unambiguous defects (policy-gradient depth, Thompson Sampling defect, RegCB consistency, unreferenced floats, Figure 1 note) and confirmed reference integrity by compile. What survives is **substantive verification and focus**, concentrated in two reviewer-recommendation-changing areas: (1) Section 4.5 still reads as a method-by-method bandit tutorial and carries unverified industry claims (R1 Reject anchor + AE focus critique), and (2) Section 5's evaluation evidence is still qualitative and unverified against sources (R1 Major 3 + AE). A targeted citation-alignment sweep on the specific R1-flagged misalignments is the third lever. These are the items that still move a recommendation; everything else is quality polish.

## Predicted Recommendation By Reviewer

What each reviewer would issue against the current `paper.tex` if it were resubmitted today, with the single most-cited blocker per reviewer.


| Reviewer             | Original       | Predicted now                | Primary blocker (specific quote)                                                                                                                                                                                                                                                 | Section to target            |
| -------------------- | -------------- | ---------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------- |
| **Associate Editor** | Major Revision | **Major Revision (leaning Minor after evaluation verification + 4.5 focus)** | *"Questions of evaluating the described methods are missing as well ... at least some overview of common evaluation aspects, e.g., typical KPIs or outcomes of real-world studies, could be added."* Status: structurally addressed by Section 5 and the conclusion; the remaining AE-facing risks are evaluation evidence verification and the "not specific to ad policies" critique that Section 4.5 still invites. | evaluation verification + 4.5 focus |
| **Reviewer 1**       | Reject         | **Major Revision (upgrade)** | *"many important methods are barely described, if at all (e.g. policy gradient methods such as REINFORCE)."* This specific anchor is now answered (Section 4.4 policy-gradient family paragraph). The surviving R1 blockers are the evaluation quantitative-evidence ask and the "lists methods without comparison / pedagogical" critique that still applies to Section 4.5, plus the flagged citation misalignment. | evaluation E8/E15 + 4.5 reframing + citation sweep |
| **Reviewer 2**       | Major Revision | **Minor Revision (likely)**  | *"Tables 3-4 are referred but there are no such tables ... figures 3-4 looks to be tables."* Verified clean: 44-page compile, zero undefined refs, every float referenced, Figure 1 note in caption. Residual R2 risk is only rendered table density / figure readability (needs PDF inspection). | tables/figures TF4/TF6 (visual) |


Reviewer 1's upgrade from Reject to Major Revision is driven by the cumulative effect of resolved items: Major 2 (RNN-to-Transformer pedagogy), Major 4 (terminology defined through Table 1 and the Section 4 opener), Major 5 (citation alignment, partially), Major 6 (joint optimization through-line), Major 7 (long-term metrics via reward design Section 4.1), Major 3 (dedicated evaluation section), the conclusion synthesis, and now the policy-gradient depth paragraph that answers R1's single most concrete soundness complaint. What survives for R1 is (a) the quantitative-results part of Major 3 (evaluation evidence still qualitative) and (b) the "reads as a list of loosely connected references / pedagogical" critique that Section 4.5 still invites. The specific citation misalignment R1 named in Major 5 (a reference for "ads underperform organic" that actually discussed user-generated reviews vs commercial messaging) is already resolved (`danescu2010competing` removed; confirmed absent from `paper.tex`), so only the broader, lower-risk orphan-claim cleanup remains there. Closing (a) and (b) is what could move R1 from Major Revision toward Accept-after-revision.

Reviewer 2's named asks (MDP formulation/notation table, table/figure references, Figure 1 note) are now resolved at the source level and confirmed by compile. The only remaining Reviewer 2 risk is rendered readability of the densest tables and the two PNG figures, which requires opening the compiled PDF.

## Cross-Section Priority Queue (Highest Leverage First)

Ranked by leverage = (reviewer specificity × number of reviewers raising it × recommendation impact) / cost-to-fix. Each item carries a calibration tag and the section + audit ID where the work lives.

### Tier 1: Recommendation-changing reviewer-flag risks


| Rank | Item                                                                                                                                                                                                                                                                                                                                                                                                                                                     | Tag | Reviewers         | Section                                              | Audit-ID                                            | Cost       | Leverage                 |
| ---- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --- | ----------------- | ---------------------------------------------------- | --------------------------------------------------- | ---------- | ------------------------ |
| 1    | **Section 4.5 exploration: reframe around ad-policy decisions + verify/soften industry claims.** Largest surviving concentration of R1's Reject rationale (*"reads more as a list of loosely connected references"*; *"approaches are listed with[out] explanation or any comparisons"*) and the AE's *"not specific to ad policies"* critique. Make each method answer a concrete ad question (when to explore new ads, vary ad load, test placement), source-verify or narrow the LinkedIn/Microsoft/Meta UCB claims, and add one short bandit-based ad-selection worked example (R1 requested it by name). | [F] | R1 + AE + R2      | 4.5                                                  | `exploration_exploitation_audit.md` E1/E2/E3/E4/E5/E6/E7 | Medium     | **Highest**              |
| 2    | **Evaluation evidence verification.** Section 5 covers the requested modalities (metrics/guardrails, RecSim, IPS/DR, online/holdout), but `tab:evaluation-evidence` is qualitative. Verify exact reported metrics for the representative systems, quote magnitudes only where public, and avoid implying production gains a source does not report. | [N] | AE + R1           | 5                                                    | `evaluation_audit.md` E8/E15     | Medium     | **High**                 |
| 3    | **Residual citation-alignment sweep (named R1 example already fixed).** R1 Major 5's one concrete example (a citation for "ads underperform relative to organic content" that actually discussed user reviews vs commercial messaging) is resolved: `danescu2010competing` was removed in the intro pass and is confirmed absent from `paper.tex`. What remains is the lower-risk cleanup of orphan claims and over-broad anchors: history C5/C6 (uncited fixed-slot + commercial-intent claims), C10/C11 (independence overclaim + weak `Sutton1998` bandit-limitation anchor), and methodology `russell2016artificial` (cited as a foundation for off-policy learning / offline replay). | [F] | R1 + R2           | 2 + 3                                               | `history_audit.md` C5/C6/C10/C11; `methodology_audit.md` M4 | Low–Medium | **Medium** (named item already done) |
| 4    | **Rendered readability pass on densest floats (visual).** Open the compiled PDF and inspect `tab:utility-comparison`, `tab:exploration-exploitation-comparison`, and the two PNG figures for tiny fonts and overfull boxes. R2 explicitly flagged figure text size; only fixable by viewing the PDF. | [F] | R2                | global                                               | `tables_figures_audit.md` TF4/TF6        | Low–Medium | **Medium**               |
| 5    | **Conclusion source-alignment check.** Verify each synthesized property in Section 6 (reward-proxy orthogonality, logged-data support, staged evaluation) is explicitly developed earlier. | [F] | R1 (overall) + AE | 6                                                    | `conclusions_audit.md` C5/C8           | Low | Low–Medium |

> **Resolved in the May 30 pass (moved out of Tier 1):** REINFORCE / policy-gradient depth (Section 4.4 P1, R1's named soundness anchor); Thompson Sampling defect, RegCB table-vs-prose consistency, two unreferenced floats, Figure 1 note in caption, and reference-integrity compile (Section 4.5 E8/E9/E10; tables/figures TF1/TF5/TF9). Resolution notes live in the section audits.


### Tier 2: Open per-section reviewer-flag risks aggregated from existing audits

These items are detailed in the section audits below and are reviewer-aligned but lower in leverage than Tier 1 because each only addresses one secondary concern.


| Item                                                                                                         | Tag | Section | Audit-ID                        | Notes                                                                                                            |
| ------------------------------------------------------------------------------------------------------------ | --- | ------- | ------------------------------- | ---------------------------------------------------------------------------------------------------------------- |
| C5, C6: orphan claims at line 277 (fixed-slot historical practice; commercial-intent displacement reversal)  | [N] | 3.2     | history_audit C5, C6            | R2 "Several statements ... not sufficiently backed by literature"                                                |
| C10: Plan-to-Goal overclaim ("ranking decisions ... treated as independent events") at line 283              | [F] | 3.2     | history_audit C10               | R1 Major 5 (citation alignment)                                                                                  |
| C11: weak `Sutton1998` anchor for bandit-limitation claim at line 287                                        | [F] | 3.2     | history_audit C11               | R2 "Some of the cited work on these claims are on general RL research, not specific to ad-policies/recommenders" |
| H15: ad-marketplace constraints (advertiser value, budget pacing, reserve prices, auction/relevance scoring) | [N] | 3       | history_audit H15               | R2 "Emphasis on Ad-policies is insufficient"                                                                     |
| H22: soften closing-paragraph overclaim ("transcend the myopic focus of bandits") at line 287                | [N] | 3.2     | history_audit H22               | `/write-rl-paper` Section 4 (precision); AE "critical discussion"                                                |
| H23: dedicated evaluation section source verification                                                       | [N] | 5       | evaluation_audit E8/E15         | structural section landed; verify evidence and compile                                                          |
| A5: action-space table source verification                                                                 | [N] | 4.2     | action_space_audit A5           | DEAR and SlateQ verified; LinkedIn exact threshold notation and Zhang binary slot-vector notation remain pending |
| `russell2016artificial` cited as foundation for off-policy learning + offline replay at line 122             | [F] | 2       | methodology_audit (M1)          | R1 Major 5 citation alignment                                                                                    |
| Reward-design proxy-table rows missing direct citations                                                      | [N] | 4.1     | reward_design_citation_audit    | R1 Major 7 specificity                                                                                           |
| State-space general framing still reads as recsys-with-ad-examples                                           | [T] | 4.3     | state_space_citation_audit      | R2 "Emphasis on Ad-policies is insufficient"                                                                     |
| Policy-learning formal exposition and reported-results gaps                                                 | [F] | 4.4     | policy_learning_citation_audit P1/P2/P6 | AE "policy learning ... not sufficiently emphasized [for ad-related aspects]"; R1 policy-gradient depth critique |
| Exploration/exploitation reads as a generic bandit tutorial with source-sensitive industry examples          | [F] | 4.5     | exploration_exploitation_audit E1/E3/E5/E8/E9 | R1 Major 2 requested focused bandit-based ad-selection examples; R2 ad-policy emphasis critique |
| Conclusion synthesized properties need final source-alignment check                                             | [F] | 6       | conclusions_audit C5/C8 | R1 "list of loosely connected references"; AE "critical discussion and comparison" |
| Tables/figures need current-PDF placement and readability verification                                      | [F] | global  | tables_figures_audit TF1/TF2/TF4/TF6 | R2 table/figure reference, placement, and readability critiques |


### Tier 3: Internal-style cleanup (not reviewer-flag, but improves overall quality)

These items are quality improvements under `/write-rl-paper` discipline. They do not change reviewer recommendations if left undone.


| Item                                                                                            | Tag | Section  | Audit-ID                  | Notes                                        |
| ----------------------------------------------------------------------------------------------- | --- | -------- | ------------------------- | -------------------------------------------- |
| C9: paragraph-283 redundancy (`li2010contextual` x2, `bubeck2012regret` + `Sutton1998` x2 each) | [T] | 3.2      | history_audit C9          | Section 7F over-citation                     |
| C9b: paragraph-281 `agarwal2016statistical` x2 (was tolerated in submission)                    | [T] | 3.2      | history_audit C9b         | Section 7F over-citation, defensible         |
| C12-C16: seminal-vs-SOTA gaps and per-claim mapping                                             | [T] | 3.2      | history_audit C12-C16     | Section 7D + 7B internal standard            |
| H12: Yahoo/Overture corporate chronology, `wikipedia-cpm` removal                               | [T] | 3.1      | history_audit H12         | weak-source cleanup                          |
| ~~H21: em-dashes (utility-functions + unit-conversion paragraphs)~~ DONE May 30                  | [T] | 3 / 4.1  | history_audit H21         | both surviving em-dashes (lines 244, 430) replaced with commas |
| ~~H13: residual commented-out paragraph before history section~~ DONE May 30                     | [T] | 3        | history_audit H13         | dead "good vs poor ad policy" comment deleted |
| ~~R4: duplicate Hohnhold 2015 key (`43887` vs `hohnhold2015focusing`)~~ DONE May 30              | [T] | 4.1      | reward_design_citation_audit R4 | consolidated to `hohnhold2015focusing`; duplicate bib entry removed |
| ~~M14: double space in methodology keyword-search sentence~~ DONE May 30                          | [T] | 2        | methodology_audit M14     | submission-hygiene                           |
| I8, I9, I10, I11: introduction phrasing polish + bibliography duplication                       | [N] | 1        | introduction_audit I8-I11 | none of these would prompt reviewer pushback |
| Two minor abstract redundancy and whitespace items                                              | [N] | abstract | abstract_revision_todo P3 | none of these would prompt reviewer pushback |


## Recommended Next Action Plan (Time-Boxed, ~5 Hours To Deadline)

The May 30 pass already executed the cheap, high-certainty fixes (policy-gradient depth, Section 4.5 mechanical defects, unreferenced floats, Figure 1 note, compile verification). The sequence below spends the remaining time on the highest-leverage *substantive* work first, so that if time runs out the most recommendation-changing items are done. Each move is independent enough to stop after.

| #   | Move (time box)                                                                                                                                                                                                                                                                                                                                                                  | Target reviewer   | Estimated impact                                                                                                                                                                 | Audit follow-up                                                                            |
| --- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------ |
| 1   | **Section 4.5 exploration reframing + claim verification (~110 min).** Convert the method-by-method tutorial into a comparison organized around ad-policy decisions; add a single short bandit-based ad-selection worked example (R1 asked for this by name); source-verify or narrow the LinkedIn/Microsoft/Meta UCB sentences and the broad "well-suited" claims. This is the largest remaining slice of R1's Reject rationale and the AE focus critique. | R1 + AE + R2      | The single biggest remaining lever on R1's recommendation. Directly attacks *"list of loosely connected references"* and *"not specific to ad policies."* | `exploration_exploitation_audit.md` E1/E2/E3/E4/E5/E6/E7 |
| 2   | **Evaluation evidence verification (~75 min).** Check the representative ad-policy systems for publicly reported magnitudes; quote them where safe, otherwise state that exact magnitudes are not disclosed. Ensure `tab:evaluation-evidence` is walked through in prose and supports rather than replaces synthesis. | R1 + AE           | Shortest path to downgrading the AE/R1 evaluation concern from "underdeveloped" to "addressed." | `evaluation_audit.md` E8/E15                                |
| 3   | **Residual citation-alignment sweep (~35 min).** The specific R1-flagged misalignment is already fixed (`danescu2010competing` removed). Remaining: anchor or hedge the history orphan claims (C5/C6), hedge the independence overclaim (C10), replace the weak `Sutton1998` bandit-limitation anchor (C11), and narrow the methodology `russell2016artificial` foundational-topic list (M4). | R1 + R2           | Closes the remaining "statements not sufficiently backed by literature" surface R2 flagged. | `history_audit.md` C5/C6/C10/C11; `methodology_audit.md` M4 |
| 4   | **Open the PDF and do a readability pass (~30 min).** Inspect the densest tables and the two PNG figures for tiny fonts / overfull boxes; enlarge or simplify as needed. Then run the README timestamped build for the submission artifact. | R2                | Closes R2's last open item (figure text size / table density). | `tables_figures_audit.md` TF4/TF6/TF10 |

After moves 1–3, the predicted reviewer state shifts to: **AE: Major leaning Minor Revision; R1: Major Revision trending toward Accept-after-revision; R2: Minor Revision or Accept.** Move 4 protects the R2 upgrade. If only one move is possible before the deadline, do Move 1.

> **Decision needed from the author (cannot be made unilaterally):** the AE suggested *"re-framing of the work in the title and introductory sections, highlighting the introductory/tutorial nature of the work, ... targeted at practitioners in industry."* The abstract and introduction already say "aimed at industry practitioners," but the **title** does not signal the tutorial/practitioner framing. Changing the title is high-impact for the AE but is an author judgment call; flag, do not auto-edit.

## Sync Protocol

This file is the synthesis layer; the per-section audits remain authoritative for their respective sections. To keep the master in sync:

1. **On every section-audit refresh.** Update this file's Section Status Dashboard row for the affected section, and re-rank the cross-section priority queue if any Tier 1 or Tier 2 item changed status. Add a Latest-Refresh note here.
2. **On every paper.tex commit.** Verify that no Tier 1 item was resolved without updating both the section audit and this master.
3. **On every reviewer-context recalibration.** Re-anchor reviewer quotes via the procedure in `/revise-rl-ad-paper` ("Extracting text from the original submission") and re-classify affected items against the three-state check.
4. **On opening a new section audit.** Replace the corresponding "MISSING" row in the Section Status Dashboard with the new audit file path and current score.
5. **On closing a Tier 1 item.** Move it from this file's priority queue to the corresponding section audit's "Resolved Revision Items" list. Do not leave closed items in the master.

## Working Rules

- Treat reviewer quotes as load-bearing. Every Tier 1 and Tier 2 item must carry a verifiable reviewer quote, paired with the page or section in `original_submission_paper.pdf` it describes.
- Distinguish reviewer-flag risk from internal-style cleanup at every priority decision. Internal-style items go to Tier 3; do not let them displace Tier 1 work.
- Apply `/write-rl-paper` Section 5F three-rule check when proposing revisions: pair quote with submitted text, classify against three-state, structure the revision as Premise / Conclusion / Assumption.
- Apply `/revise-rl-ad-paper` Editing Workflow before edits and Audit Workflow before opening or refreshing any audit file.
- Preserve `paper.tex` paragraph style unless reflow is explicitly requested.
- Keep this file short. Detail belongs in section audits; cross-section synthesis belongs here.

## Out Of Scope For This File

- Section-level citation tables (live in per-section audits).
- Detailed per-paragraph revision plans (live in per-section audits).
- Bibliography hygiene outside the citations used in Section 3 and Section 4 (deferred until a dedicated bibliography sweep).
- Figure redesign work (deferred until `tables_figures_audit.md` is opened).

