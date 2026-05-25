# Paper-Wide Audit Master: Reviewer-Risk Orchestrator

Scope: `paper.tex` end-to-end. This file is the single entry point for prioritizing revisions across the entire manuscript. It does not duplicate per-section detail; it aggregates and ranks reviewer-flag risks that survive across sections, points to the relevant per-section audit, and predicts the recommendation each reviewer would issue against the current state.

Latest refresh: May 25, 2026 (2:00 PM). Refreshed after the dedicated evaluation section landed as current Section 5. The paper now contains a compact evaluation framework covering metric roles, offline replay, IPS, doubly robust estimation, RecSim/SlateQ-style simulation evidence, online A/B testing, long-term holdouts, and a mechanism-oriented evaluation evidence table. The main recommendation-changing blocker has shifted from "evaluation section absent" to "evaluation section needs source verification and compilation."

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
| 4.1 Reward Design            | 284-606   | `reward_design_citation_audit.md`   | n/a (citation-focused) | Good / Good / Good                | section-level prose audit not opened        |
| 4.2 Action Space             | 607-662   | **MISSING**                         | n/a                    | Fair / Fair–Poor / Fair           | open an `action_space_audit.md`             |
| 4.3 State Space              | 663-745   | `state_space_citation_audit.md`     | n/a (citation-focused) | Good / Good / Good                | section-level prose audit not opened        |
| 4.4 Policy Learning          | 746-847   | `policy_learning_citation_audit.md` | n/a (citation-focused) | Fair / Fair–Poor / Fair           | section-level prose audit not opened        |
| 4.5 Exploration/Exploitation | 848-1067  | **MISSING**                         | n/a                    | Good / Fair / Fair                | open an `exploration_exploitation_audit.md` |
| 5. Evaluation                | 1068-1117 | `evaluation_audit.md`               | **8.0 / 10**           | Good / Major-to-Minor / Good      | verify reported evidence and compile        |
| 6. Conclusions               | 1119-1124 | **MISSING**                         | n/a                    | Fair / Poor / Fair                | open a `conclusions_audit.md`               |
| Acknowledgments              | 1127-1129 | **MISSING**                         | n/a                    | Good / n/a / n/a                  | resolved; no audit file needed              |
| Tables / Figures hygiene     | global    | **MISSING**                         | n/a                    | Good / n/a / Unverified           | open a `tables_figures_audit.md`            |


The **biggest structural gap** in audit coverage is now split between Section 4 prose and the conclusion. Sections 4.2 and 4.5 have no audit file at all, and Sections 4.1, 4.3, 4.4 have only citation-focused audits, not prose-level audits. The new Section 5 evaluation audit is active, but it still needs source verification for reported evidence. Section 6 (Conclusions) has no audit despite being the section R1 would most likely cite as evidence for the "very little added value beyond web searches" critique.

## Predicted Recommendation By Reviewer

What each reviewer would issue against the current `paper.tex` if it were resubmitted today, with the single most-cited blocker per reviewer.


| Reviewer             | Original       | Predicted now                | Primary blocker (specific quote)                                                                                                                                                                                                                                                 | Section to target            |
| -------------------- | -------------- | ---------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------- |
| **Associate Editor** | Major Revision | **Major Revision (leaning Minor after verification)** | *"Questions of evaluating the described methods are missing as well ... at least some overview of common evaluation aspects, e.g., typical KPIs or outcomes of real-world studies, could be added."* Status: structurally addressed by Section 5; evidence verification and compile remain. | evaluation verification + conclusions |
| **Reviewer 1**       | Reject         | **Major Revision (upgrade)** | *"Quantitative results from existing studies could also be summarized..."* The dedicated evaluation section now covers metrics, RecSim, IPS/DR, and workflow; the remaining blocker is unverified or qualitative reported evidence plus weak conclusions. | evaluation E8/E15 + conclusions |
| **Reviewer 2**       | Major Revision | **Minor Revision (likely)**  | *"Tables 3-4 are referred but there are no such tables in the paper, and figures 3-4 looks to be tables but are mentioned as figures."* Status still needs current-paper verification.                                                                                           | tables/figures audit         |


Reviewer 1's upgrade from Reject to Major Revision is driven by the cumulative effect of resolved items: Major 2 (RNN-to-Transformer pedagogy via H9+H10), Major 4 (terminology now defined through Table 1 and the Section 4 opener), Major 5 (citation alignment via the C-series and the I1-I6 introduction pass), Major 6 (joint optimization through-line via H14), Major 7 (long-term metrics via reward design Section 4.1), and now Major 3 (dedicated evaluation section). What survives are Major 1 (depth, still partial in 4.2 and 4.4), the quantitative-results part of Major 3, and the weak conclusion. The evaluation gap is no longer structural absence; it is whether the reported-evidence table and online/offline workflow are source-verified enough to withstand reviewer scrutiny.

Reviewer 2's named MDP-formulation ask is now substantially resolved. The remaining Reviewer 2 risk is presentation hygiene, especially table/figure references and placement.

## Cross-Section Priority Queue (Highest Leverage First)

Ranked by leverage = (reviewer specificity × number of reviewers raising it × recommendation impact) / cost-to-fix. Each item carries a calibration tag and the section + audit ID where the work lives.

### Tier 1: Recommendation-changing reviewer-flag risks


| Rank | Item                                                                                                                                                                                                                                                                                                                                                                                                                                                     | Tag | Reviewers         | Section                                              | Audit-ID                                            | Cost       | Leverage                 |
| ---- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --- | ----------------- | ---------------------------------------------------- | --------------------------------------------------- | ---------- | ------------------------ |
| 1    | **Evaluation evidence verification and compile.** Section 5 now exists and covers the requested modalities, but the table remains qualitative and uncompiled. Verify exact reported metrics/evidence for the representative systems, avoid unsupported A/B or rollout claims, and confirm table placement/cross-references. | [N] | AE + R1           | 5                                                    | `evaluation_audit.md` E8/E15; history_audit H23     | Medium     | **Highest**              |
| 2    | **Conclusions rewrite.** Current Section 6 is three short paragraphs with vague future directions ("enhancing interpretability, refining reward functions, decentralized approaches") and does not synthesize the new evaluation section. R1's overall Reject motivation *"very little added value to the survey beyond what web searches would provide"* finds its strongest evidence here. Rewrite into critical synthesis: what RL-for-ads has solved, what remains open, what reviewers can recommend tomorrow. | [F] | R1 (overall) + AE | 6                                                    | new audit, suggest `conclusions_audit.md`           | Low–Medium | **High**                 |
| 3    | **REINFORCE / large-action-space depth (Section 4.4 + 4.2).** R1 Soundness Poor: *"many important methods are barely described, if at all (e.g. policy gradient methods such as REINFORCE, or methods to deal with extremely large action spaces)."* The policy-gradient paragraph still lists REINFORCE, PPO, TRPO, and actor-critic together before the ad-policy synthesis, and Section 4.2 still needs a prose audit for large action spaces. | [F] | R1                | 4.2 + 4.4                                            | open prose audit for both                           | Medium     | **High**                 |
| 4    | **Tables and figures consistency.** R2: *"Tables 3-4 are referred but there are no such tables in the paper, and figures 3-4 looks to be tables but are mentioned as figures."* Status unverified against current `paper.tex`. Cheap to verify, may already be partially resolved.                                                                                                                                                                       | [F] | R2                | global                                               | new audit, suggest `tables_figures_audit.md`        | Low        | **High** (cost-adjusted) |


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
| `russell2016artificial` cited as foundation for off-policy learning + offline replay at line 122             | [F] | 2       | methodology_audit (M1)          | R1 Major 5 citation alignment                                                                                    |
| Reward-design proxy-table rows missing direct citations                                                      | [N] | 4.1     | reward_design_citation_audit    | R1 Major 7 specificity                                                                                           |
| State-space general framing still reads as recsys-with-ad-examples                                           | [T] | 4.3     | state_space_citation_audit      | R2 "Emphasis on Ad-policies is insufficient"                                                                     |
| Value/policy formal exposition block before ad-policy synthesis                                              | [T] | 4.4     | policy_learning_citation_audit  | AE "policy learning ... not sufficiently emphasized [for ad-related aspects]"                                    |


### Tier 3: Internal-style cleanup (not reviewer-flag, but improves overall quality)

These items are quality improvements under `/write-rl-paper` discipline. They do not change reviewer recommendations if left undone.


| Item                                                                                            | Tag | Section  | Audit-ID                  | Notes                                        |
| ----------------------------------------------------------------------------------------------- | --- | -------- | ------------------------- | -------------------------------------------- |
| C9: paragraph-283 redundancy (`li2010contextual` x2, `bubeck2012regret` + `Sutton1998` x2 each) | [T] | 3.2      | history_audit C9          | Section 7F over-citation                     |
| C9b: paragraph-281 `agarwal2016statistical` x2 (was tolerated in submission)                    | [T] | 3.2      | history_audit C9b         | Section 7F over-citation, defensible         |
| C12-C16: seminal-vs-SOTA gaps and per-claim mapping                                             | [T] | 3.2      | history_audit C12-C16     | Section 7D + 7B internal standard            |
| H12: Yahoo/Overture corporate chronology, `wikipedia-cpm` removal                               | [T] | 3.1      | history_audit H12         | weak-source cleanup                          |
| H21: em-dash at line 269 (CPM/CPC/CPA paragraph)                                                | [T] | 3.1      | history_audit H21         | project no-em-dash style rule                |
| H13: residual source comment at line 189                                                        | [T] | 3        | history_audit H13         | submission-hygiene                           |
| I8, I9, I10, I11: introduction phrasing polish + bibliography duplication                       | [N] | 1        | introduction_audit I8-I11 | none of these would prompt reviewer pushback |
| Two minor abstract redundancy and whitespace items                                              | [N] | abstract | abstract_revision_todo P3 | none of these would prompt reviewer pushback |


## Recommended Next Action Plan (3-Move Sequence)

This is the leverage-optimized sequence for the next revision cycle after the acks and Section 4 opener fixes. Each move is sized for a single working session and ordered so that the most reviewer-recommendation-changing work happens first.


| #   | Move                                                                                                                                                                                                                                                                                                                                                                                                                                                        | Target reviewer   | Estimated impact                                                                                                                                                                 | Audit follow-up                                                                            |
| --- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------ |
| 1   | **Verify and compile the new Evaluation section.** Check exact reported evidence for the direct ad-policy systems, decide whether quantitative magnitudes can be quoted safely, and compile to inspect Table~\ref{tab:evaluation-evidence} placement and cross-references. | R1 + AE           | Converts the evaluation section from a strong draft into reviewer-ready evidence. This is now the shortest path to downgrading the AE's evaluation concern. | `evaluation_audit.md` E8/E15; update `history_audit.md` H23                                |
| 2   | **Rewrite Section 6 Conclusions** as a critical synthesis with three components: (i) what RL-for-ads has resolved that SL cannot, (ii) what remains open with specific named gaps from each section, (iii) concrete research trajectories with named methodological anchors. Use `/write-rl-paper` Section 6 (Synthesis Over Summary).                                                              | R1 (overall) + AE | Removes R1's strongest evidence for the "list of references" critique and lets the new evaluation section carry into the paper's final argument.                                   | open `conclusions_audit.md`                                                                |
| 3   | **Section 4.4 REINFORCE + Section 4.2 large-action-space depth pass.** For Section 4.4: rewrite the policy-gradient list into a short paragraph per method family (REINFORCE → PPO/TRPO → actor-critic), each with one ad-policy deployment anchor. For Section 4.2: add a paragraph on action-space reduction techniques used in industrial ad systems (action embedding, candidate generation, top-K constrained search).                                | R1 Soundness      | Closes R1 Major 1 (depth) and R1 Soundness Poor. Together with moves 1 and 2, this is what would move R1 toward Accept.                                                          | open `action_space_audit.md` + extend `policy_learning_citation_audit.md` with prose audit |


After this 3-move sequence, the paper's predicted reviewer state would shift to: **AE: Accept with Minor Revision; R1: Major Revision (likely Accept after one more pass); R2: Minor Revision or Accept.**

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

