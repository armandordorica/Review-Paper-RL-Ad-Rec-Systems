# Reward Design: Revision And Reviewer-Risk Audit

Scope: `paper.tex`, `\subsection{Reward Design for Monetization-Aware Recommendation Systems}` (currently lines 284-606).

Latest refresh: May 25, 2026. Rebuilt from a citation-only audit into a section-level reviewer-risk audit with an explicit score, prioritized pending items, citation adequacy scores, and resolved items. The current subsection is one of the manuscript's stronger reviewer-facing sections: it defines the reward-design problem, distinguishes proxy metrics from utility functions, explains why ad and organic signals are hard to blend, compares four industrial utility formulations, and gives practitioner guidance. The main remaining risks are citation alignment, overclaiming around offline RL and "canonical" utility language, proxy-table support, exact reported-results evidence, and table readability.

## Reviewer Context Used

Anchored to direct quotes from `docs/agent/reviewers.txt`, which responds to `original_submission_paper.pdf`. Three-state calibration: the original submission already discussed reward functions and long-term metrics, but the current proxy tables, utility comparison table, and expanded critical comparison contain substantial **new content** added after submission. New content carries full author responsibility and should be source-verified before final submission.

- **Associate Editor:** `"a critical discussion and comparison of approaches seems missing"` -> R2, R5, R8.
- **Associate Editor:** `"Questions of evaluating the described methods are missing as well. Given that the focus is on industry, at least some overview of common evaluation aspects, e.g., typical KPIs or outcomes of real-world studies, could be added."` -> R3, R4, R7.
- **Reviewer 1 Major Comment 1:** `"A more detailed comparison of methods, highlighting their trade-offs, assumptions, and real-world performance, would substantially enhance the utility of the survey."` -> R2, R5, R7.
- **Reviewer 1 Major Comment 7:** `"The challenge of optimizing long-term metrics such as retention is acknowledged, but the discussion remains abstract. More concrete exploration of how surrogate metrics can be identified and used in reward shaping would be helpful."` -> R1, R3, R4.
- **Reviewer 1 Major Comment 3:** `"Quantitative results from existing studies could also be summarized to help readers understand real-world performance and trade-offs."` -> R7.
- **Reviewer 2:** `"Several statements about adaptability of RL and its traits on recommenders and ad-related systems, are not sufficiently backed by literature. Some of the cited work on these claims are on general RL research, not specific to ad-policies/recommenders."` -> R1, R3, R6.
- **`revision_rules.md`:** Section 7.1 citation audit, Section 8 literature-review discipline, Section 15 table handling, Section 17.2 metric and trade-off discussion.

## Current Overall Assessment

The reward-design subsection is reviewer-aligned and materially stronger than a generic RL tutorial. It answers a core ad-policy question: how should a platform turn revenue, engagement, and user-experience harm into an optimization signal? It also gives the reader concrete artifacts, including proxy-metric tables, a representative blended-utility equation, a utility-formulation comparison table, and a critical comparison across DEAR, Zhao et al. 2020, Alibaba, and LinkedIn.

The remaining problems are not structural absence. They are reviewer-risk details: some rows in the proxy tables are insufficiently sourced; the offline-RL paragraph overstates support by implying reward-formulation search rather than policy learning under a specified reward; "canonical utility function" overclaims consensus; the reported-results paragraph needs exact source-level evidence where available; and the large utility table may be visually dense in the PDF. These are fixable without a full rewrite.

Estimated reviewer-aligned score: **8.2 / 10**. The section is strong enough to answer Reviewer 1's reward-design and long-term-metric concern at a high level, but it should not be considered submission-ready until the proxy tables, offline-RL wording, and reported-results claims are source-verified.

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

### Citation Alignment And Overclaim Control

- <span style="background:#dc3545;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P1</span> <span style="background:#6c757d;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">TODO</span> **R1.** Add direct support or an explicit table note for the proxy-metric tables. Current gaps include pCTR, ad impressions, session duration, shares, and some polarity assignments. The tables are useful, but a reviewer can reasonably ask whether every row is reported in cited systems or included as an illustrative operational proxy. Recommended fix: either cite missing rows directly or add a careful note that rows summarize reported metrics and related recommender-evaluation proxies, with uncited entries treated as illustrative.

- <span style="background:#dc3545;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P1</span> <span style="background:#6c757d;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">TODO</span> **R2.** Revise the offline-RL paragraph so it does not imply that offline RL directly searches for improved reward formulations unless a direct source is added. `levine2020offline` supports offline RL from logged data and distribution-shift risk; `chen2022off` supports off-policy learning in recommenders. Neither, as currently used, clearly supports "actively searching for improved reward formulations." Recommended fix: distinguish reward design from policy learning under a specified reward.

- <span style="background:#fd7e14;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P2</span> <span style="background:#6c757d;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">TODO</span> **R3.** Replace "A canonical utility function" with "A representative abstract form" or equivalent. The cited systems support a useful abstraction, not a field-wide canonical standard.

- <span style="background:#fd7e14;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P2</span> <span style="background:#6c757d;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">TODO</span> **R4.** Standardize the duplicate long-term experimentation citation keys `43887` and `hohnhold2015focusing`. They appear to refer to the same Hohnhold/O'Brien/Tang long-term optimization paper. Use one key consistently, likely `hohnhold2015focusing`.

- <span style="background:#fd7e14;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P2</span> <span style="background:#6c757d;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">TODO</span> **R5.** Soften "sidesteps the unit-conversion problem" in the Alibaba constrained-optimization comparison. The constrained formulation avoids choosing a direct additive exchange rate between revenue and engagement, but it moves the calibration burden to the Click Yield threshold \(T\).

### Evidence And Evaluation

- <span style="background:#dc3545;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P1</span> <span style="background:#6c757d;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">TODO</span> **R6.** Verify the reported-results paragraph source by source. Reviewer 1 explicitly asked for quantitative results where available. For each system, record whether exact online/offline magnitudes are public; if not, state that exact magnitudes are not disclosed rather than implying comparable quantitative evidence.

- <span style="background:#fd7e14;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P2</span> <span style="background:#6c757d;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">TODO</span> **R7.** Add a staged evaluation-workflow synthesis if it does not duplicate Section 5. The reward section already discusses A/B tests, long-term holdouts, and counterfactual estimation; one concise sentence could clarify the workflow: offline counterfactual screening, short-horizon A/B testing, and long-term holdouts for retention or fatigue.

### Structure, Table Readability, And Transitions

- <span style="background:#fd7e14;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P2</span> <span style="background:#6c757d;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">TODO</span> **R8.** Improve readability of Table~\ref{tab:utility-comparison} if the PDF shows dense or cramped cells. The current table uses minipages, equations, and narrow columns. If it renders poorly, shorten cells and move explanatory details into prose.

- <span style="background:#fd7e14;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P2</span> <span style="background:#6c757d;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">TODO</span> **R9.** Clarify the distinction between proxy metrics and utility formulations before Table~\ref{tab:utility-comparison}. The prose already implies the distinction, but readers may still conflate metrics with objective functions. Add one sentence only if it materially improves comprehension.

- <span style="background:#6c757d;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P3</span> <span style="background:#6c757d;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">TODO</span> **R10.** Consider adding a closing transition from reward design to action/state representation. The current subsection ends with practitioner guidance; a short bridge could explain that reward choices determine what the state must observe and what the action space must control.

## Citation Adequacy Scores

| Citation | Current Use In Reward-Design Subsection | Adequacy | Assessment |
|---|---|---:|---|
| `mcdonald2023spotify` | Delayed long-term outcomes; high-intent actions; long-horizon engagement; long-term holdouts/proxies. | 8 | Strong practical industry source for optimizing long-term engagement without waiting for delayed outcomes. Not ad-specific, so best paired with ad-policy sources. |
| `zhang2018whole` | Multi-objective reward specification; CTR/revenue/Click Yield; Alibaba constrained whole-page optimization; utility comparison table; reported results. | 9 | Directly relevant to whole-page ad allocation and joint ad + organic objectives. Strong reward-design anchor. |
| `yan2020ads` | Multi-objective feed-ad allocation; CTR/pCTR/revenue; bid/pCTR ad utility; LinkedIn constrained optimization; shadow bid; reported results. | 9 | Direct fit for feed ad allocation and constrained optimization. Strong support for monetization-aware ad policy. |
| `sagtani2024ad` | Multi-objective ad-load balancing; representative utility form; ad-load reward context. | 9 | Direct ad-load/off-policy learning source. Strong fit for reward design and marketplace trade-offs. |
| `wang2022surrogate` | Surrogate metrics for long-term user experience; high-quality consumption; diversity; repeated consumption; time to revisit. | 8 | Strong for surrogate long-term engagement metrics in recommendation. Not ad-specific, but useful for long-term proxy discussion. |
| `mazoure2021improving` | Risk that short-term proxies can misrepresent long-term objectives. | 8 | Good support for long-term metric optimization in recommender systems. Broad rather than ad-specific. |
| `43887` | Clicks/short-term signals and long-term business/user outcomes. | 6 | Likely duplicate of `hohnhold2015focusing`. Standardize the key before final submission. |
| `hohnhold2015focusing` | Long-term outcomes, holdouts, calibration difficulty, validation limits, long-term fatigue. | 8 | Strong practical long-term evaluation source. Current uses are generally appropriate. |
| `silberstein2020ad` | Ad close/mitigation and degraded ad experience. | 7 | Relevant to ad-quality/user-experience harm, but less direct for the general claim that high CTR does not imply high ad quality. |
| `xu2023optimizing` | Long-term value, 30-day sessions, auction-based recommender optimization. | 8 | Strong for long-term auction/recommender objectives. Good support for longer-horizon engagement metrics. |
| `sagtani2023quantifying` | Ad fatigue dimensions and click entropy. | 9 | Direct source for user fatigue/ad-load signals. Strong fit for the fatigue proxy table. |
| `pan2023learning` | Short-view, early-skip, non-completion as implicit negative feedback. | 8 | Strong for implicit negative feedback in industrial short-video recommendation. Not ad-specific, but aligned with negative engagement proxies. |
| `zhao2018recommendations` | Skip / not-click rate and negative feedback. | 7 | Relevant to negative feedback via DRL recommendations. Less ad-specific and may not directly support every table example. |
| `wu2017returning` | User return rate / long-term engagement. | 8 | Good support for return-based engagement. General recommender source, not ad-specific. |
| `wu2018beyond` | Relative watch time / engagement in online video. | 7 | Relevant to watch-time engagement metrics. Not ad-specific and not reward-design-specific. |
| `yi2014beyond` | Dwell time as engagement/personalization signal. | 8 | Direct support for dwell time beyond clicks. General personalization source. |
| `carrion2021blending` | Context-sensitive valuation / virtual bids for blending ads and organic content. | 9 | Directly relevant to blending advertising with organic content. Strong fit for unit-conversion and virtual-bid discussion. |
| `zhao2021dear` | DEAR reward formulation; binary ad/user-experience reward; reported results. | 9 | Direct ad-policy/RL source. Strong support for DEAR formulation and production ad impression setting. |
| `zhao2020jointly` | Jointly learning to recommend and advertise; separate reward functions; live validation of weights; table/results. | 9 | Direct support for joint ad + recommendation reward design. Strong fit. |
| `gauci2018horizon` | A/B validation, reward search cost, exhaustive experimentation cost. | 6 | Useful for production RL workflow, but current attachment to reward-weight A/B experimentation costs is broad. Pair with experimentation sources or reframe. |
| `swaminathan2015counterfactual` | Offline replay, logged bandit feedback, counterfactual estimation. | 9 | Direct support for counterfactual evaluation from logged feedback. Strong fit. |
| `dudik2011doubly` | Counterfactual estimation and doubly robust evaluation. | 9 | Direct support for counterfactual/off-policy evaluation. Strong fit. |
| `levine2020offline` | Offline RL, logged data as surrogate, out-of-distribution risk. | 8 for offline RL limits; 5 for reward-formulation search | Strong general offline-RL source, but weak for the current reward-formulation-search claim. |
| `chen2022off` | Offline RL staying close to behavior policy; production recommender off-policy learning. | 8 | Strong for off-policy actor-critic in recommendation. Less direct for reward-design search specifically. |
| `mcmahan2013ad` | pCTR modeling/cold-start ad-click prediction challenges. | 8 | Strong source for large-scale ad click prediction and sparse ad modeling. Appropriate for pCTR modeling challenges. |

## Resolved Revision Items

- <span style="background:#dc3545;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P1</span> <span style="background:#198754;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">DONE</span> **R11.** The section now provides a structured synthesis rather than a generic reward-function tutorial. It frames reward design around partial observability, delayed outcomes, and multi-objective monetization/engagement/fatigue trade-offs.
- <span style="background:#dc3545;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P1</span> <span style="background:#198754;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">DONE</span> **R12.** The section now includes concrete proxy tables for revenue, engagement, and ad fatigue, directly addressing Reviewer 1's request for more concrete long-term surrogate metrics.
- <span style="background:#dc3545;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P1</span> <span style="background:#198754;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">DONE</span> **R13.** The section now compares utility formulations across DEAR, Zhao et al. 2020, Alibaba, and LinkedIn rather than merely listing reward ideas.
- <span style="background:#fd7e14;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P2</span> <span style="background:#198754;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">DONE</span> **R14.** The section now includes practitioner guidance that compares binary rewards, monetary utilities, constrained formulations, and shadow-bid approaches.

## Out Of Scope For This File

- Section 5 evaluation framework: handled in `evaluation_audit.md`.
- Section 4.2 action-space design: handled in `action_space_audit.md`.
- Section 4.3 state representation: handled in `state_space_citation_audit.md`.
- Section 4.4 policy learning: handled in `policy_learning_citation_audit.md`.
- Paper-wide figure/table numbering: belongs in a future `tables_figures_audit.md`.

## Working Rules

- Preserve the section's current structure unless a source check shows a claim is unsupported.
- Apply `/write-rl-paper` conservative replacement rule: suggest replacements only when materially better than the current text.
- Treat the proxy tables as high-value but source-sensitive. Do not add proxy rows without direct support or an explicit illustrative-table note.
- Distinguish reward design from evaluation. Reward design chooses the optimization signal; Section 5 explains how candidate policies and metrics are evaluated.
- Apply citation checks to every nontrivial metric, result, and deployment claim.
