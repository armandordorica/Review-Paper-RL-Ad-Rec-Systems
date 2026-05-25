# Conclusions: Revision And Reviewer-Risk Audit

Scope: `paper.tex`, `\section{Conclusions}` (currently lines 1118-1126).

Latest refresh: May 25, 2026. Rewrote the conclusion around the paper's RL-component taxonomy, joint ad/organic optimization constraints, desired design properties across reward/state/action/policy/exploration, and staged evaluation workflow. The conclusion now states the survey's synthesized contribution instead of ending with a generic RL summary.

## Reviewer Context Used

Anchored to direct quotes from `docs/agent/reviewers.txt`, which responds to `original_submission_paper.pdf`. Three-state calibration: the conclusion was present in the original submission, and Reviewer 1's overall critique directly targets the paper's lack of synthesis and added value. The current conclusion is therefore **present in submission and reviewer-relevant**, not merely an internal-style cleanup item.

- **Associate Editor:** `"a critical discussion and comparison of approaches seems missing"` -> C1, C2, C4.
- **Associate Editor:** `"Questions of evaluating the described methods are missing as well."` -> C3.
- **Associate Editor:** `"the organization and presentation of the work should be improved and focused"` -> C1, C5.
- **Reviewer 1 Overall:** `"much of the content diverges into pedagogical material or surface-level summaries, at the expense of detailed, critical analysis"` -> C1, C2.
- **Reviewer 1 Conclusion:** `"it reads more as a list of loosely connected references than as a cohesive, critical review"` -> C1, C2, C4.
- **Reviewer 1 Major Comment 1:** `"A more detailed comparison of methods, highlighting their trade-offs, assumptions, and real-world performance, would substantially enhance the utility of the survey."` -> C2, C3.
- **Reviewer 1 Major Comment 3:** `"Quantitative results from existing studies could also be summarized to help readers understand real-world performance and trade-offs."` -> C3.
- **Reviewer 1 Suggestions:** `"Provide a clearer framework for comparing approaches--e.g., by organizing around challenges like exploration, long-term optimization, evaluation, or system constraints."` -> C1, C2, C4.
- **Reviewer 2:** `"Emphasis on Ad-policies is insufficient, since this is the main focus of the paper."` -> C1, C2, C5.
- **`revision_rules.md`:** Section 5 "Make the so what explicit", Section 6 "Separate prior work from your own contribution", Section 8 literature-review discipline, Section 17.2 metric and trade-off discussion.

## Current Overall Assessment

The conclusion now directly answers the reviewers' added-value concern. It presents the paper's organization around reward design, action spaces, state representations, policy learning, exploration, and evaluation as an authorial taxonomy, and it uses that taxonomy to synthesize why RL for ad-supported recommendation is difficult in practice. It also identifies reward design, logged-data support, exploration discipline, and staged evaluation as the main constraints that determine whether RL is credible for joint ad and organic ranking.

Remaining risks are now narrower. The conclusion is citation-light, which is acceptable because it synthesizes claims supported earlier in the manuscript, but final review should confirm that each synthesized property is already developed in Sections 4 and 5. The future-work sentence is now grounded in review-derived gaps rather than generic directions.

Estimated reviewer-aligned score: **8.0 / 10**. The section is now much more responsive to the AE and Reviewer 1 concerns about critical synthesis, comparison, and evaluation. The main remaining risk is source-alignment verification rather than structure.

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

### Reviewer-Flagged Synthesis And Added Value

- <span style="background:#fd7e14;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P2</span> <span style="background:#6c757d;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">TODO</span> **C5.** Make the ad-policy focus explicit in every paragraph. Avoid broad wording such as "large-scale recommender systems" unless the sentence also names ad insertion, ad load, monetization, organic engagement, advertiser value, or user fatigue.

### Accuracy, Tone, And Citation Hygiene

- <span style="background:#6c757d;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P3</span> <span style="background:#6c757d;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">TODO</span> **C8.** Keep the conclusion citation-light unless a new empirical claim is introduced. The conclusion should mainly synthesize prior sections. If it introduces a new claim about field trends, industry adoption, or performance, either cite it or remove it.

## Citation Adequacy Scores

| Citation | Current Use In Conclusions | Adequacy | Assessment |
|---|---|---:|---|
| None | The conclusion currently contains no citations. | n/a | This is acceptable if the conclusion only synthesizes claims already supported earlier. It becomes risky if broad new field-wide or future-work claims remain uncited. |

## Resolved Revision Items

- <span style="background:#7c1d1d;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P0</span> <span style="background:#198754;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">DONE</span> **C1.** Rewrote the conclusion as synthesis rather than summary. The opening paragraph now states that the paper contributes an RL-component taxonomy for ad-supported recommendation and frames the review around joint ad and organic ranking under production constraints.

- <span style="background:#dc3545;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P1</span> <span style="background:#198754;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">DONE</span> **C2.** Carried forward the Section 4 framework by naming reward design, action spaces, state representations, policy learning, exploration, and evaluation, then synthesizing their shared expressiveness-versus-learnability trade-off.

- <span style="background:#dc3545;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P1</span> <span style="background:#198754;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">DONE</span> **C3.** Integrated the evaluation section by describing a staged workflow of offline estimation, simulation, controlled online experiments, and long-term monitoring.

- <span style="background:#dc3545;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P1</span> <span style="background:#198754;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">DONE</span> **C4.** Replaced generic future work with concrete gaps grounded in the review: counterfactual evaluation, interpretable state/action abstractions, long-term reward proxies, and reproducible industrial benchmarks.

- <span style="background:#fd7e14;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P2</span> <span style="background:#198754;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">DONE</span> **C6.** Removed the unsupported trend claim that RL has "gained popularity" and grounded the conclusion in what the review shows.

- <span style="background:#fd7e14;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P2</span> <span style="background:#198754;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">DONE</span> **C7.** Removed the undeveloped "decentralized approaches" future-work claim.

- <span style="background:#fd7e14;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P2</span> <span style="background:#198754;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">DONE</span> **C9.** The current conclusion at least names several real constraints, including state/action spaces, proxy metrics, computational demands, contextual bandits, and offline replay. These can be reused in a stronger rewrite.

## Out Of Scope For This File

- Section 5 evaluation details: handled in `evaluation_audit.md`.
- Section 4 method-specific repairs: handled in the relevant Section 4 audits.
- Abstract and introduction framing: handled in `abstract_revision_todo.md` and `introduction_audit.md`.
- Acknowledgments: no audit needed unless style requirements change.

## Working Rules

- Rewrite the conclusion only after deciding which Section 4 and Section 5 claims are stable enough to synthesize.
- Do not add new research directions that are not grounded in the manuscript.
- Use the conclusion to answer "what did this review teach a practitioner that a method list would not?"
- Keep the conclusion concise, but it should be more than a generic closing paragraph. Target three compact paragraphs: synthesis, evaluation/deployment implications, and concrete open gaps.
