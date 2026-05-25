# Conclusions: Revision And Reviewer-Risk Audit

Scope: `paper.tex`, `\section{Conclusions}` (currently lines 1118-1123).

Latest refresh: May 25, 2026. Opened as the missing Section 6 audit and aligned with the scored reviewer-risk format used for the other section audits. The current conclusion is concise, but it is not yet doing the work a revised survey conclusion needs to do. It summarizes RL's promise, mentions state/action spaces and proxy metrics, and gives broad future directions. It does not synthesize the paper's revised contribution, does not carry forward the new evaluation section, does not name concrete gaps from the review, and does not leave reviewers with a clear "what has been learned" answer.

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

The current conclusion is too generic for the revised manuscript. It could fit many RL-for-recommender surveys because it says RL balances short- and long-term objectives, faces large state/action spaces and proxy-metric challenges, and may improve interpretability and reward functions. Those statements are not wrong, but they do not reflect the paper's current stronger material: reward-design proxies and utility formulations, action-space levers, state-space trade-offs, policy-learning deployment patterns, exploration risks, and the new evaluation framework.

The conclusion is also where the paper should answer the reviewers' core concern about added value. The revised paper is no longer only a list of methods; it now contains several authorial syntheses. The conclusion should name those syntheses and state the paper's practical takeaway: RL is useful for monetization-aware ranking when it is constrained by measurable reward proxies, tractable action/state abstractions, conservative exploration, and staged evaluation. It should also identify the unresolved gaps that follow from the review, not generic future work.

Estimated reviewer-aligned score: **4.8 / 10**. The section is short and fixable, but in its current form it is the weakest major section because it fails to consolidate the revisions that now exist elsewhere in the manuscript. A rewrite is likely necessary rather than a local sentence polish.

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

- <span style="background:#7c1d1d;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P0</span> <span style="background:#6c757d;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">TODO</span> **C1.** Rewrite the conclusion as synthesis rather than summary. The current first paragraph says the paper provides an overview of scalable techniques, but it does not state the paper's synthesized takeaway. Recommended structure: one opening paragraph that states what the review shows about RL for monetization-aware ranking, centered on joint ad + organic optimization and production constraints.

- <span style="background:#dc3545;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P1</span> <span style="background:#6c757d;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">TODO</span> **C2.** Carry forward the Section 4 framework. The conclusion should briefly name the main design axes the paper developed: reward design, action-space design, state representation, policy learning, and exploration/exploitation. It should explain how these axes jointly determine whether RL is practical for ad-supported recommender systems.

- <span style="background:#dc3545;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P1</span> <span style="background:#6c757d;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">TODO</span> **C3.** Integrate the new evaluation section. The current conclusion does not mention the staged evaluation workflow, reported-evidence limitations, counterfactual estimators, simulators, A/B tests, or long-term holdouts. Since evaluation was a major reviewer complaint, the conclusion should state that deployment-ready RL for ads depends on offline screening, controlled online validation, and long-horizon monitoring.

- <span style="background:#dc3545;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P1</span> <span style="background:#6c757d;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">TODO</span> **C4.** Replace generic future work with concrete gaps from the review. Current future directions ("enhancing interpretability, refining reward functions, and exploring decentralized approaches") are vague and not clearly derived from the manuscript. Better gaps: long-term ad-fatigue measurement, source-verified counterfactual evaluation under sparse logged actions, interpretable state/action abstractions, safe exploration under ad-load constraints, and reproducible industrial benchmarks.

- <span style="background:#fd7e14;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P2</span> <span style="background:#6c757d;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">TODO</span> **C5.** Make the ad-policy focus explicit in every paragraph. Avoid broad wording such as "large-scale recommender systems" unless the sentence also names ad insertion, ad load, monetization, organic engagement, advertiser value, or user fatigue.

### Accuracy, Tone, And Citation Hygiene

- <span style="background:#fd7e14;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P2</span> <span style="background:#6c757d;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">TODO</span> **C6.** Soften or remove overbroad claims. "The integration of RL ... has gained popularity" and "promising approach" are broad and not cited. A conclusion can summarize without citations, but unsupported field-wide trend claims are unnecessary. Prefer "The reviewed systems show..." or "This survey shows..." because those claims are grounded in the paper's own review.

- <span style="background:#fd7e14;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P2</span> <span style="background:#6c757d;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">TODO</span> **C7.** Avoid introducing claims not developed in the paper. "Decentralized approaches" appears in the current future-work sentence but is not a major through-line in the manuscript. Remove unless the paper actually develops this topic elsewhere.

- <span style="background:#6c757d;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P3</span> <span style="background:#6c757d;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">TODO</span> **C8.** Keep the conclusion citation-light unless a new empirical claim is introduced. The conclusion should mainly synthesize prior sections. If it introduces a new claim about field trends, industry adoption, or performance, either cite it or remove it.

## Citation Adequacy Scores

| Citation | Current Use In Conclusions | Adequacy | Assessment |
|---|---|---:|---|
| None | The conclusion currently contains no citations. | n/a | This is acceptable if the conclusion only synthesizes claims already supported earlier. It becomes risky if broad new field-wide or future-work claims remain uncited. |

## Resolved Revision Items

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
