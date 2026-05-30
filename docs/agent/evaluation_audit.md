# Evaluation Section: Revision And Reviewer-Risk Audit

Scope: `paper.tex`, `\section{Evaluating Joint Ad and Organic Ranking Policies}` (currently lines 1068-1117). The section now sits after `\subsection{Balancing Exploration and Exploitation in Policy Learning}` and before `\section{Conclusions}`. It contains three subsections: evaluation metrics and guardrails, offline replay and simulation, and online industrial evidence, plus Table~\ref{tab:evaluation-evidence}.

Latest refresh: May 25, 2026 (2:00 PM). Refreshed against the current manuscript after the dedicated evaluation section landed. The section is no longer a planned insertion: it now directly addresses the AE and Reviewer 1 evaluation complaint with a compact framework that ties Section 4.1's metric tables to offline replay, IPS, doubly robust estimation, RecSim/SlateQ-style simulation evidence, online A/B testing, staged rollout, long-term holdouts, and a four-row mechanism-oriented evidence table. The remaining audit risk is source verification and precision, not structural absence.

Latest citation audit: May 25, 2026 (2:00 PM). Audited current `paper.tex` lines 1068-1117. The prior simulator wording issues have been corrected: RecSim now carries the simulator-platform claim and SlateQ carries the slate-decomposition / slate-evaluation claim. Online rollout claims have also been softened so `gauci2018horizon` and `chen2022off` support the broader offline-screening to online-validation workflow rather than unverified feature-gate or traffic-ramp details. The section should not be treated as final until the exact reported metrics for the representative systems are checked source-by-source and the paper is compiled to inspect table placement.

## Reviewer Context Used

All reviewer quotes below come from `docs/agent/reviewers.txt`, which responds to `original_submission_paper.pdf`.

- **Associate Editor:** *"Questions of evaluating the described methods are missing as well. From a presentation perspective, the work has a good tutorial value in certain places, but lacks a deeper technical discussion at other places."* → E1, E2, E3, E4.
- **Associate Editor:** *"Given that the focus is on industry, at least some overview of common evaluation aspects, e.g., typical KPIs or outcomes of real-world studies, could be added."* → E2, E5, E6.
- **Reviewer 1 Major Comment 3:** *"The paper raises the importance of evaluation but does not offer a systematic review of how evaluation is done in practice or in the cited work. Topics such as common metrics, simulator-based testing (e.g., RecSim), or the role of counterfactual estimators are either absent or only briefly mentioned. Quantitative results from existing studies could also be summarized to help readers understand real-world performance and trade-offs."* → E1 through E7.
- **Reviewer 1 Experimental Evaluation:** *"There is a complete lack of systematic evaluation and standardized metrics for comparing the different approaches."* → E2, E5.
- **Reviewer 1 Experimental Evaluation:** *"Even if it were difficult to come to common metrics, the highlight quantitative results of various papers could be quoted: this is not done."* → E6.
- **Reviewer 1 Experimental Evaluation:** *"There was no real discussion of how evaluation should be done, and no mention of toolkits and simulators like RecSim."* → E3, E4.
- **Reviewer 1 Theoretical Background and Evaluation:** *"For instance, they discuss offline RL at only a very shallow level, despite citing papers that discuss the important issues at great depth."* → E3.

## Current Overall Assessment

The reviewer complaint must be calibrated against `original_submission_paper.pdf`, not treated as a literal description of the current draft. The original submission did not contain a dedicated evaluation section, so the current Section 5 is new content added in response to the AE and Reviewer 1. That makes the section reviewer-responsive, but every sentence carries full author responsibility under the three-state rule.

The current section substantially changes the reviewer-facing state. It now explains why evaluation for joint ad and organic ranking is a trade-off problem rather than a single-metric leaderboard; classifies metrics into primary, secondary, and guardrail roles; distinguishes short-term proxies from long-horizon outcomes; explains offline replay, IPS, doubly robust estimation, support limitations, RecSim, and SlateQ; and then places A/B tests and long-term holdouts as the high-confidence validation stage. Table~\ref{tab:evaluation-evidence} summarizes the workflow by measurement mode rather than ranking papers against a nonexistent shared benchmark.

Estimated reviewer-aligned score: **8.0 / 10** for evaluation coverage. This is a major improvement over the original-submission baseline and likely moves the AE's evaluation concern from a major blocker to a revision item. The score is held below 8.5 because the evidence table remains mostly qualitative, exact reported magnitudes have not been verified, several entries mix ad-policy systems with broader recommender/RL workflow anchors, and the section has not yet been compiled to verify float placement and cross-references.

## Section Objective

The section answers one governing question:

> How do industrial and academic systems evaluate whether an RL-based ad policy improves the joint trade-off among monetization, engagement, and long-term user value?

The section should continue to make three conclusions explicit:

1. **No single evaluation modality is sufficient.** Offline replay and counterfactual estimators screen candidate policies cheaply, simulators test sequential behavior under controlled assumptions, and online A/B tests remain the strongest causal evidence for production impact.
2. **Metrics must match the policy objective.** CTR, CVR, RPM, ad load, dwell time, short-view rate, return rate, and retention proxies measure different parts of the monetization-engagement trade-off. A gain in one metric is not evidence of overall policy improvement unless guardrail metrics and time horizons are specified.
3. **Reported results across papers are not directly comparable without context.** Systems differ in platforms, action spaces, logging policies, rollout constraints, horizon length, and guardrail definitions. The evaluation section should compare evidence type and trade-offs, not rank papers as if they used a shared benchmark.

## Current Placement And Shape

### Implemented LaTeX placement

The section has been inserted after the exploration/exploitation subsection and before Conclusions:

```latex
\section{Evaluating Joint Ad and Organic Ranking Policies}
\label{sec:evaluation}
```

It is now Section 5, and Conclusions have shifted to Section 6.

### Current compact manuscript structure

The section follows the intended compact three-subsection structure and uses the existing Section 4.1 metric tables instead of recreating the metric inventory.

1. `\subsection{Evaluation Metrics: Trade-offs and Guardrails}`
   - Current status: implemented at lines 1073-1078.
   - Residual risk: the subsection clearly defines metric roles, but exact table references and float placement still need compile verification.

2. `\subsection{Pre-Deployment Evidence: Offline Replay and Simulation}`
   - Current status: implemented at lines 1080-1085.
   - Residual risk: the subsection is appropriately compact; avoid expanding it into estimator derivations.

3. `\subsection{Online Evidence Across Industrial Systems}`
   - Current status: implemented at lines 1087-1117 with Table~\ref{tab:evaluation-evidence}.
   - Residual risk: the online subsection uses qualitative evidence. Exact reported magnitudes should be added only after checking the cited sources.

### Coverage checklist

The compact 3-subsection structure must still cover these seven reviewer obligations:

1. Why evaluation is hard in joint ad and organic ranking.
2. How the existing policy-improvement metrics become evaluation objectives, guardrails, or diagnostics.
3. Offline replay, IPS, and doubly robust estimation.
4. Simulator-based testing, especially RecSim.
5. Online A/B testing and controlled rollout.
6. Reported evidence across cited systems.
7. A practical offline-screening to online-validation workflow.

## In Scope

- Evaluation modalities used by or needed for the cited systems: offline replay, IPS, doubly robust estimation, simulators, A/B testing, staged rollouts, contextual-bandit online updates, long-term holdouts.
- Explicit reuse of the existing metric tables in Section 4.1: revenue proxies, engagement proxies, and ad-fatigue proxies. The new section should explain how these metrics function as objectives or guardrails in evaluation, not recreate the same inventory.
- Metrics used in monetization-aware ad-policy evaluation: CTR, pCTR, CVR, RPM, revenue, ad load, Click Yield, dwell time, session length, short-view rate, return rate, retention, ad fatigue, user-experience guardrails.
- A comparative table across cited systems and methodological papers.
- Limitations of each evaluation modality: logging-policy support, simulator misspecification, short A/B-test horizons, delayed outcomes, metric gaming, and inability to compare systems with different objectives.
- Explicit distinction between offline evaluation, online evaluation, and simulator-based evaluation.

## Out Of Scope

- A full tutorial or derivation of IPS, doubly robust estimators, or regret bounds. Define only what is needed for the survey's argument.
- New experiments, new datasets, or claims that the paper empirically evaluates the cited systems.
- Generic recommender metrics unless they are tied to ad-policy objectives or guardrails.
- A comprehensive survey of every recommender-system simulator. Mention RecSim because Reviewer 1 explicitly named it; mention RecoGym only if a citation is added and the relevance is verified.
- A leaderboard ranking of papers. The systems are not directly comparable because platforms, objectives, action spaces, and rollout constraints differ.

## What The Referenced Papers Are Doing In Terms Of Evaluation

This table is an audit inventory, not final manuscript prose. Each "reported evidence" item should be verified against the original paper before exact numerical claims are added to `paper.tex`.

| Citation / system | Evaluation modality | Metrics or outcomes to extract | What it contributes to the evaluation section | Verification status |
|---|---|---|---|---|
| `zhao2021dear` (DEAR / TikTok) | Online A/B tests plus production deployment claims; likely offline training/evaluation for policy development | Ad revenue, user-experience or organic-engagement guardrails, browsing continuation, ad impression outcomes | Concrete industrial RL ad-policy example with joint monetization and engagement claims. Use as one of the main "real-world outcome" rows. | Current paper says revenue improves without statistically significant organic-engagement degradation, but exact magnitudes are not in the manuscript. Verify before quoting. |
| `zhao2020jointly` (Jointly Learning to Recommend and Advertise) | Live experiments and baseline comparison against bandit-style approaches | Revenue and engagement metrics; reward weights $\alpha,\beta$ | Direct joint ad-plus-organic learning example. Useful for showing how reward weights are validated through experiments. | Current paper says it outperforms baseline bandit approaches in revenue and engagement. Verify exact metrics and baselines. |
| `zhang2018whole` (Alibaba whole-page optimization) | Production or industrial evaluation of constrained whole-page ad allocation | Revenue, Click Yield, threshold satisfaction | Shows constrained evaluation: revenue is optimized subject to an engagement or click-yield guardrail. Useful contrast to weighted-sum objectives. | Current paper states revenue improves while Click Yield stays above threshold $T$. Verify reported magnitudes and whether evaluation was online or offline. |
| `yan2020ads` (LinkedIn feed ads) | Industrial evaluation of feed ad allocation / constrained optimization | Revenue, engagement utility, pCTR, shadow-bid behavior | Strong example of a learned exchange rate between revenue and engagement. Useful for explaining guardrail-based evaluation and objective calibration. | Current paper states revenue and engagement improve. Verify exact experiment design and metrics. |
| `sagtani2024ad` (ad-load balancing via off-policy learning) | Off-policy learning/evaluation in a content marketplace | Ad load, marketplace utility, engagement/revenue trade-off, policy value under logged data | Directly relevant to offline evaluation and logging-policy correction for ad load. Use in the offline-evaluation subsection and metrics table. | Verify estimator type, reported metrics, and whether results are offline-only or include online validation. |
| `chen2022off` (YouTube off-policy actor-critic) | Offline actor-critic training/evaluation on logged recommender data; production-oriented validation | Long-horizon value, Monte Carlo returns, critic estimates, policy improvement against previous agent | Strong anchor for offline RL depth. Use to explain why actor-critic plus importance correction can improve over full-trajectory IS or REINFORCE-style estimates. | Current paper cites YouTube training actor-critic offline and deploying after evaluation. Verify exact reported metrics and deployment evidence. |
| `gauci2018horizon` (Meta Horizon) | Platform-level offline evaluation, counterfactual policy evaluation, gated rollout, A/B validation | Task-specific rewards, policy value, rollout safety, guardrail monitoring | Strong anchor for an industrial evaluation workflow: offline evaluation, doubly robust estimators, then controlled rollout. | Verify which tasks are ads versus notifications/video ranking. Use carefully if not ad-specific. |
| `ie2019slateq` (SlateQ) | Slate-based RL evaluation, likely simulator or logged recommender experiments | Slate reward, choice-model assumptions, long-term value | Useful for simulator/sequential evaluation and action-space complexity, especially when slates cannot be exhaustively evaluated online. | Verify exact evaluation setup before summarizing results. |
| `ie2019recsim` (RecSim) | Simulator/toolkit paper | Simulated user response, long-term recommender dynamics | Directly satisfies Reviewer 1's RecSim request. Use to explain simulator-based testing, not as evidence that a specific ad policy improved in production. | Bibliography has RecSim. Need inspect source before adding detailed claims. |
| RecoGym | Simulator/toolkit | Synthetic ad/recommendation interactions | Reviewer-facing optional mention because `/write-rl-paper` names RecoGym, but it is not currently in the bibliography. | Not currently cited. Add only if a bib entry is added and relevance to ad-policy evaluation is verified. |
| `swaminathan2015counterfactual` | Counterfactual policy learning from logged bandit feedback | IPS, counterfactual risk, support assumptions | Foundational estimator anchor. Use for method explanation and limitations, not as an industrial ad-system result. | Already cited. Good for offline-evaluation subsection. |
| `dudik2011doubly` | Doubly robust estimation | Bias-variance trade-off, model plus propensity correction | Foundational doubly robust anchor. Use to explain why DR can reduce variance relative to pure IPS when the reward model is useful. | Already cited. Keep technical detail brief. |
| `levine2020offline` | Offline RL survey/tutorial | Distribution shift, out-of-support actions, offline policy improvement risk | Use for limitations and failure modes of offline evaluation. | Already cited. Broad source, pair with recommender/ad-system papers. |
| `bietti2021contextual`, `li2010contextual`, `van2024practical` | Contextual-bandit evaluation and online learning | Regret, reward estimates, exploration cost, production bandit considerations | Useful for online exploration and bandit evaluation, especially in the practical workflow subsection. | Verify whether any ad-specific metrics are available before placing in the outcome table. |
| `Mehrotra2020` (Spotify bandits) | Online/bandit evaluation workflow | Multi-objective recommendation metrics, online learning, exploration controls | Useful example of cautious offline-to-online bandit deployment, but not ad-specific. | Use as supporting recommender-system evidence, not as primary ad-policy evidence. |
| `xu2023optimizing` | On-policy RL in auction-based recommender systems | Long-term value, auction/recommendation outcomes, online policy learning | Relevant to online RL in auction-based recommendation, close to ad-policy evaluation. | Verify exact metrics and whether reported outcomes are online or offline. |
| `cai2023two` | Offline experiments for constrained actor-critic | Watch time, interactions, main objective vs auxiliary constraints | Useful for multi-objective constrained evaluation and trade-off tables. | Current paper says offline experiments showed a better balance. Verify exact metrics. |
| `hohnhold2015focusing` | Long-term holdout/evaluation framing | Long-term user value, holdouts, metric calibration | Important for explaining why short A/B windows miss delayed engagement and fatigue. | Good as conceptual evaluation anchor; not necessarily ad-specific. |
| `wang2022surrogate`, `mcdonald2023spotify`, `yi2023progressive` | Long-term proxy and surrogate-metric evaluation | Return rate, delayed retention, progressive horizon, long-term proxies | Useful for long-term metric subsection and guardrail design. | Use as recommender-system support; pair with ad-policy reward/evaluation papers. |
| `Theocharous-2015`, `zhao2018deep`, `wu2018budget` | Value-based RL / advertising RL evaluation | Lifetime value, bidding, budget-constrained display advertising | Useful as older ad/RL evaluation anchors for value-based formulations. | Verify exact metrics before quoting. |

## Implemented Evaluation Table In `paper.tex`

Current table caption:

```latex
\caption{Evaluation settings, mechanisms, metrics, and representative systems or methodological sources for joint ad and organic ranking policies.}
```

Current columns:

| Column | Purpose |
|---|---|
| Measurement mode | Offline, simulation, online, or online long-horizon setting. |
| Evaluation method | Offline replay / off-policy evaluation, user-response simulator or slate model, A/B test or staged rollout, or holdout / delayed-outcome measurement. |
| Purpose | Why the mechanism is used in the deployment workflow. |
| Metrics used | Primary, secondary, guardrail, or long-term metrics. |
| Representative systems and sources | Cited systems or methodological papers using the mechanism. |

The table currently has four rows, which is appropriate for the page budget. Method papers (`swaminathan2015counterfactual`, `dudik2011doubly`, `ie2019recsim`) are mostly handled in prose, except RecSim and SlateQ appear in the simulation row because they function as evaluation artifacts.

## Pending Revision Items

### Structural and reviewer-risk items

- <span style="background:#7c1d1d;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P0</span> <span style="background:#198754;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">DONE (May 25 draft)</span> **E1.** Add the new top-level evaluation section before Conclusions. Implemented in `paper.tex` as `\section{Evaluating Joint Ad and Organic Ranking Policies}` at lines 1068-1117.
- <span style="background:#7c1d1d;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P0</span> <span style="background:#198754;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">DONE (May 25 draft)</span> **E2.** Reuse the existing Section 4.1 metric tables as the metric taxonomy for evaluation. The section cross-references Tables~\ref{tab:proxy-metrics-revenue}, \ref{tab:proxy-metrics-engagement}, and \ref{tab:proxy-metrics-fatigue}; compile verification remains a separate production check.
- <span style="background:#7c1d1d;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P0</span> <span style="background:#198754;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">DONE (May 25 draft)</span> **E3.** Explain offline replay, IPS, and doubly robust estimation as evaluation tools with assumptions and failure modes. Implemented in the "Pre-Deployment Evidence: Offline Replay and Simulation" subsection.
- <span style="background:#dc3545;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P1</span> <span style="background:#198754;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">DONE (May 25 draft)</span> **E4.** Add simulator-based evaluation coverage, including RecSim. Implemented with RecSim and SlateQ; RecoGym remains intentionally omitted because it is not in the bibliography.
- <span style="background:#dc3545;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P1</span> <span style="background:#198754;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">DONE (May 25 draft)</span> **E5.** Add online evaluation and rollout discussion. Implemented in "Online Evidence Across Industrial Systems" with A/B tests, staged rollout, guardrails, and long-term holdouts.
- <span style="background:#dc3545;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P1</span> <span style="background:#fd7e14;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">PARTIAL (source verification)</span> **E6.** Add one compact comparative evaluation-evidence table across representative cited systems. Implemented as a four-row mechanism table, but exact numbers and evidence wording must be verified source-by-source before finalizing.
- <span style="background:#fd7e14;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P2</span> <span style="background:#198754;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">DONE (May 25 draft)</span> **E7.** Add a practitioner workflow as the closing paragraph. Implemented after Table~\ref{tab:evaluation-evidence}.

### Citation and verification items

- <span style="background:#dc3545;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P1</span> <span style="background:#6c757d;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">TODO</span> **E8.** Verify exact reported metrics and magnitudes for `zhao2021dear`, `zhao2020jointly`, `zhang2018whole`, `yan2020ads`, `chen2022off`, `gauci2018horizon`, `sagtani2024ad`, `xu2023optimizing`, and `cai2023two`.
- <span style="background:#fd7e14;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P2</span> <span style="background:#6c757d;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">TODO</span> **E9.** Decide whether to add RecoGym. It is not currently in `bibliography.bib`, so it should not be named in `paper.tex` unless a source is added and checked.
- <span style="background:#fd7e14;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P2</span> <span style="background:#6c757d;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">TODO</span> **E10.** Keep estimator citations parsimonious. Use `swaminathan2015counterfactual` for logged counterfactual risk, `dudik2011doubly` for doubly robust estimation, and `levine2020offline` for offline RL limitations. Do not attach all three to every sentence.
- <span style="background:#dc3545;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P1</span> <span style="background:#198754;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">DONE (May 25)</span> **E11.** Rephrased the simulator sentence and table row so `ie2019recsim` carries the simulator-platform claim and `ie2019slateq` carries the slate-decomposition / slate-evaluation claim. The table now says RecSim provides configurable user-response simulation and SlateQ provides a tractable slate-evaluation model.
- <span style="background:#dc3545;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P1</span> <span style="background:#198754;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">DONE (May 25)</span> **E12.** Tightened the online-evidence paragraph by removing unverified feature-gate and traffic-ramp wording. `gauci2018horizon` and `chen2022off` now support the broader offline-screening to online-validation workflow rather than specific rollout mechanisms.
- <span style="background:#fd7e14;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P2</span> <span style="background:#198754;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">DONE (May 25)</span> **E13.** Relabeled the table column from "Representative systems" to "Representative systems and sources" and adjusted the caption to acknowledge that some entries are methodological sources rather than deployed ad systems.
- <span style="background:#fd7e14;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P2</span> <span style="background:#198754;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">DONE (May 25)</span> **E14.** Clarified that the primary / secondary / guardrail taxonomy is the authors' synthesis by adding "We organize these metrics into three roles" before the metric definitions.
- <span style="background:#dc3545;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P1</span> <span style="background:#6c757d;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">TODO</span> **E15.** Compile the paper and inspect whether Table~\ref{tab:evaluation-evidence} appears near first reference, whether references to Tables~\ref{tab:proxy-metrics-revenue}, \ref{tab:proxy-metrics-engagement}, and \ref{tab:proxy-metrics-fatigue} resolve cleanly, and whether the added section creates page-budget or float-placement pressure.

## Citation Adequacy Scores

| Citation | Current use in `paper.tex` evaluation section | Adequacy | Assessment |
|---|---|---:|---|
| `afsar2022reinforcement` | Prior survey distinguishes offline, simulation, and online evaluation environments. | 9 | Strong fit for the evaluation-modality framing. |
| `lin2023survey` | Prior survey reports common recommendation metrics including Recall, Hit Ratio, and NDCG. | 8 | Good survey anchor for standard RL-recommender metrics; keep the ad-policy limitation in the surrounding prose. |
| `deffayet2022offline` | Offline next-item / one-step protocols do not measure long-term consequences of learned RL policies. | 9 | Strong fit and important for reviewer-facing evaluation rigor. |
| `zhang2018whole` | Click Yield / constrained revenue evaluation; metric taxonomy examples; online-system row. | 9 | Direct ad-policy source. Strong anchor for constrained monetization-engagement trade-offs. |
| `yan2020ads` | LinkedIn feed ads; pCTR, revenue, engagement utility, and protected engagement objective. | 9 | Direct ad-policy source. Strong anchor for constrained feed-ad evaluation. |
| `sagtani2023quantifying` | User fatigue and guardrail / ad-fatigue examples. | 7 | Relevant to fatigue and interventions in recommenders, but not as direct as an ad-specific fatigue source. Pair with ad-load sources when possible. |
| `hohnhold2015focusing` | Short vs long-term metrics, long-term holdouts, online experiment framing. | 9 | Strong long-term evaluation source. Watch duplicate bibliography key `43887` elsewhere. |
| `wang2022surrogate` | Long-term surrogate outcomes in recommenders. | 8 | Good support for delayed-outcome proxy framing; not ad-specific, so pair with ad-policy papers for monetization claims. |
| `mcdonald2023spotify` | Long-term optimization / delayed-outcome measurement. | 7 | Useful industry/recommender anchor, but it is a blog source and should not carry formal holdout-method claims alone. |
| `zhao2020jointly` | Joint ad + recommendation reward and online-system row. | 9 | Direct fit for joint recommendation and advertising. |
| `zhao2021dear` | DEAR/TikTok reward and online-system row. | 9 | Direct fit for RL-based online advertising impression in recommender systems. |
| `swaminathan2015counterfactual` | IPS / logged counterfactual policy evaluation. | 9 | Strong foundational anchor. |
| `dudik2011doubly` | Doubly robust estimator explanation. | 9 | Strong foundational anchor. |
| `levine2020offline` | Offline RL support / out-of-distribution action limitations. | 8 | Strong general offline-RL anchor; pair with recommender/off-policy sources for domain fit. |
| `chen2022off` | YouTube off-policy actor-critic; offline recommender policy learning; rollout/workflow examples. | 8 | Strong recommender off-policy source, but not ad-specific. Avoid making it carry ad-policy deployment claims alone. |
| `ie2019recsim` | Configurable recommender simulator and simulation evidence row. | 9 | Strong simulator-platform anchor. |
| `ie2019slateq` | Slate recommendation decomposition and simulation/evaluation row. | 7 | Relevant to slate-based RL evaluation. Current wording avoids implying that SlateQ is itself a simulator platform. |
| `dulac2021challenges` | Simulator representativeness and need for online validation. | 8 | Good broad real-world RL limitations source; not ad-specific. |
| `barajas2022online` | Online advertising incrementality testing and practical online-evaluation framing. | 8 | Relevant ad-experiment source. Does not by itself support every listed metric in the sentence. |
| `gauci2018horizon` | Industrial RL workflow and offline-screening to online-validation pattern. | 7 | Useful broad platform source. Current wording is safer than earlier rollout-specific phrasing, but it remains broad for ad-policy-specific claims. |
| `sagtani2024ad` | Ad-load balancing via off-policy learning; offline row; ad-load / guardrail examples. | 9 | Direct ad-policy and off-policy-learning source. Strong fit. |

## Recommended Order Of Execution

1. Verify reported metrics and evidence wording for the representative systems in E8, starting with the direct ad-policy systems (`zhao2021dear`, `zhao2020jointly`, `zhang2018whole`, `yan2020ads`, `sagtani2024ad`).
2. Compile the manuscript and inspect Table~\ref{tab:evaluation-evidence}, cross-references, and page budget (E15).
3. Decide whether any exact quantitative results are safe to add. If not, keep the table qualitative and explicitly frame it as evidence-type comparison rather than performance ranking.
4. Update `history_audit.md` H23 to mark the dedicated evaluation section as structurally landed, with source verification remaining in this audit.
5. Revisit the conclusion so it synthesizes the new evaluation section rather than ending with generic future-work language.

## Out Of Scope For This File

- Rewriting Section 4.4 policy-learning prose, except to avoid duplicating content in the current evaluation section.
- Designing new experiments.
- Full proofs or derivations of IPS, doubly robust estimation, or regret.
- Bibliography deduplication outside the evaluation sources.

## Working Rules

- Treat exact quantitative results as unverified until checked in the cited paper.
- Do not claim a paper used online A/B testing unless the source explicitly says so.
- Do not compare systems as if they share a benchmark.
- Every metric claim must state the evaluation modality: offline, simulator, online A/B, rollout, or long-term holdout.
- Keep the section practitioner-facing and ad-policy-specific.

## Quantitative Results from Cited Papers

To address the reviewers' request for quantitative results and specific metrics used in practice, we have aggregated the reported outcomes from key cited papers. This provides a quantitative lens for the evaluation section, detailing *what* metrics are reported and *how* they are used across different stages of deployment (offline vs. online). 

### 1. Online Evidence Across Industrial Systems

**DEAR (Deep Reinforcement Learning for Online Advertising Impression) [`zhao2021dear`]**
*   **Context:** Jointly determines whether to interpolate an ad, which ad to select, and where to place it in a recommendation list.
*   **Metrics Used:** Accumulated rewards in a session ($R = \sum r_t$), where the reward balances advertising revenue against the negative influence of ads on user experience.
*   **Reported Results:** In offline experiments on a real-world short video site, DEAR achieved an accumulated reward of 10.96, outperforming baselines like HDQN (10.27), GRU (9.87), DeepFM (9.23), and Wide & Deep (9.12). All improvements showed high statistical significance (p-value < 0.01).

**Jointly Learning to Recommend and Advertise [`zhao2020jointly`]**
*   **Context:** A two-level RL framework that generates a recommendation list (level 1) and then inserts ads into it (level 2) to balance immediate ad revenue and long-term user experience.
*   **Metrics Used:** Session Dwell Time ($R^{rs}$), Session Length ($R^{as}$), and Session Ad Revenue ($R^{rev}$).
*   **Reported Results:** Offline experiments demonstrated significant improvements over the best baseline (RAM-l): Session Dwell Time improved by 0.61%, Session Length improved by 0.83%, and Session Ad Revenue improved by 4.70% (all p-values < 0.01).

**Alibaba Whole-Page Optimization [`zhang2018whole`]**
*   **Context:** Dynamic ad allocation on Taobao that shifts from slot-based serving to whole-page modeling.
*   **Metrics Used:** Revenue and Click Yield (a proxy for user engagement).
*   **Reported Results:** Through online A/B testing, the proposed dynamic ad allocation strategy significantly increased platform revenue while ensuring that Click Yield remained above a predefined satisfaction threshold, demonstrating successful constrained optimization in production.

**LinkedIn Ads Allocation in Feed [`yan2020ads`]**
*   **Context:** Ads allocation in a newsfeed to achieve an optimal balance of revenue and engagement via constrained optimization.
*   **Metrics Used:** Revenue (REV/RPM) and User Engagement (CTR, total clicks).
*   **Reported Results:** The paper reports that the best-performing algorithm successfully balanced revenue and engagement and was fully deployed on the LinkedIn newsfeed, serving all live traffic. (Note: Exact percentage lifts from the online A/B test are abstracted for confidentiality, but the production deployment is explicitly claimed).

### 2. Pre-Deployment Evidence: Offline Replay and Simulation

**Ad-load Balancing via Off-policy Learning [`sagtani2024ad`]**
*   **Context:** Off-policy learning framework using Doubly Robust (DR) estimators to determine optimal ad-load for feed fetches.
*   **Metrics Used:** User Satisfaction (D1 Retention, Time spent, Views, Engagements, Video plays) and Ads Metrics (Impressions, Clicks, Revenue).
*   **Reported Results:** Online A/B experiments deployed across over 80 million users (200 million sessions) showed statistically significant improvements. For instance, a variant with a trade-off parameter $\beta=0.9$ achieved a 0.52% increase in Ad Clicks and a 0.2% increase in Revenue, alongside positive lifts in Time Spent (0.22%) and Views (0.15%).

**YouTube Off-policy Actor-Critic [`chen2022off`]**
*   **Context:** Offline actor-critic training on logged recommender data to improve long-term user engagement.
*   **Metrics Used:** Long-horizon value, Monte Carlo returns, and critic estimates.
*   **Reported Results:** The paper demonstrates that the off-policy actor-critic approach yields improved offline policy evaluation and was successfully deployed on YouTube, showing improvements in long-term user engagement over traditional REINFORCE-based methods.

### 4. Evaluation Metrics, Guardrails, and Long-Term Proxies

**Surrogate for Long-Term User Experience [`wang2022surrogate`]**
*   **Context:** Uses immediate-term user behavior signals as surrogates for long-term outcomes (user revisiting the platform) in a reinforcement learning recommender.
*   **Metrics Used:** Sequential behavior patterns, repeat visit frequency, and engagement depth metrics.
*   **Reported Results:** Validated surrogates by proving they are statistically predictive of users' increased visiting to the platform over a 5-month horizon. Live experiments on an industrial platform serving billions of users demonstrated the surrogates effectively improved long-term user experience.

**Optimizing for Long-Term Value in Spotify [`mcdonald2023spotify`]**
*   **Context:** Models long-term user engagement outcomes as a time-to-event problem using survival models.
*   **Metrics Used:** Time-to-inactivity (a churn metric), retention, and survival estimates.
*   **Reported Results:** Demonstrated that the churn-based time-to-inactivity metric provided improved sensitivity over baseline retention metrics in Spotify A/B tests while preserving directional accuracy, allowing faster validation of long-term effects.

**Quantifying and Leveraging User Fatigue [`sagtani2023quantifying`]**
*   **Context:** Models multi-granularity user fatigue (global session fatigue and coarse-grained taxonomy fatigue) to prevent engagement drops from repetitive recommendations.
*   **Metrics Used:** Click-through rate (CTR), average click numbers per user (ACN), dwell time (DT), and average refresh number (ARN).
*   **Reported Results:** Online A/B tests showed that fatigue-enhanced models achieved consistent CTR and dwell time improvements (2%–6% relative improvements) across different numbers of refreshes.

**Ad Close Mitigation for Improved User Experience [`silberstein2020ad`]**
*   **Context:** Penalizes ads with a high predicted likelihood of being closed by the user within Yahoo Gemini's generalized second price (GSP) auction to improve user experience.
*   **Metrics Used:** Ad close rate (ACR), click-through rate (CTR), and total revenue.
*   **Reported Results:** Large-scale online experiments on Gemini native traffic showed the system reduced the number of ad close events by more than 20%, while limiting the associated revenue decrease to less than 0.4%.

**Online Advertising Incrementality Testing [`barajas2022online`]**
*   **Context:** Evaluates the true causal effect of advertising by isolating conversions that would not have occurred without a specific campaign.
*   **Metrics Used:** Absolute lift, percentage lift, incremental ROAS, and cost per incremental conversion (CPIC).
*   **Reported Results:** Details the practical deployment of geo-testing and synthetic control methods in a major DSP/ad network, emphasizing that standard attribution often overstates performance compared to true incremental lift.

**Reinforcement Learning to Optimize Long-term User Engagement [`zou2019reinforcement`]**
*   **Context:** Introduces FeedRec, an RL framework with a hierarchical LSTM Q-Network and an S-Network environment simulator to optimize long-term user engagement.
*   **Metrics Used:** Average clicks per session, average browsing depth, and average return time.
*   **Reported Results:** In real-world dataset evaluations, FeedRec outperformed DDPG and other baselines with strong statistical significance (p-value < 0.01) across all three long-term engagement metrics.

### 5. Foundational Estimators and Contextual Bandits

**A Contextual Bandit Bake-off [`bietti2021contextual`]**
*   **Context:** A large-scale empirical evaluation of contextual bandit algorithms across hundreds of datasets.
*   **Metrics Used:** Progressive validation (PV) loss, and a statistically significant win-loss difference metric (calculated via an approximate Z-test).
*   **Reported Results:** Found that optimism under uncertainty (e.g., RegCB) worked best overall, with a simple greedy baseline performing as a surprisingly close second.

**Practical Contextual Bandits with Regression Oracles [`foster2018contextual`]**
*   **Context:** Introduces RegCB, which uses a regression oracle to generalize UCB and LinUCB to more expressive model classes.
*   **Metrics Used:** Cumulative regret, normalized relative loss, and confidence width decay.
*   **Reported Results:** In extensive empirical evaluations, RegCB consistently outperformed or matched $\epsilon$-greedy and other baselines, typically remaining within 20% of the best possible oracle performance across diverse datasets.

**Doubly Robust Policy Evaluation and Learning [`dudik2011doubly`]**
*   **Context:** Evaluates the Doubly Robust (DR) estimator, which combines propensity scoring with a reward model to evaluate policies from logged data.
*   **Metrics Used:** Root mean squared error (RMSE), bias, and standard deviation.
*   **Reported Results:** Demonstrated that the DR estimator consistently reduced RMSE by 10% to 20% (average 13.6%) compared to standard Inverse Propensity Scoring (IPS), achieving lower variance while remaining unbiased.

**Counterfactual Risk Minimization [`swaminathan2015counterfactual`]**
*   **Context:** Introduces the POEM algorithm for batch learning from logged bandit feedback, using variance regularization.
*   **Metrics Used:** Hamming loss and computational efficiency (CPU seconds).
*   **Reported Results:** POEM significantly outperformed standard IPS on multi-label classification tasks (p-value < 0.05 across 10 runs), proving that variance regularization improves generalization in off-policy learning.

**Constrained Actor-Critic for Short Video Recommendation [`cai2023two`]**
*   **Context:** Two-stage constrained actor-critic (TSCAC) optimizing watch time while satisfying interaction constraints (likes, shares, comments).
*   **Metrics Used:** WatchTime (main), Click, Like, Comment, Share, Download.
*   **Reported Results:** Offline evaluations showed a 2.23% improvement in WatchTime over behavior cloning. Live A/B experiments demonstrated a 0.379% improvement in WatchTime, +3.376% in Shares, and +1.733% in Downloads.

**Optimizing Long-term Value for Auction-Based Recommender Systems [`xu2023optimizing`]**
*   **Context:** On-policy RL (temporal difference learning) to optimize long-term return metrics in an auction-based recommender system (Meta).
*   **Metrics Used:** Conversion count, conversion rate, total impressions.
*   **Reported Results:** Online A/B testing on a system handling billions of daily impressions achieved a 4-10% lift in both conversion count and conversion rate compared to the base policy, while maintaining neutral impression changes.

**Bandit based Optimization of Multiple Objectives [`Mehrotra2020`]**
*   **Context:** Contextual bandits optimizing multiple competing objectives (user satisfaction vs. supplier exposure) on Spotify.
*   **Metrics Used:** Clicks, streams, and Generalized Gini Index (GGI) for multi-objective scalarization.
*   **Reported Results:** The multi-objective approach (MO-LinCB) outperformed single-objective algorithms with over 6.9%, 11.0%, and 10.0% gains across three different interaction metrics.

**Deep Reinforcement Learning for Page-wise Recommendations [`zhao2018deep`]**
*   **Context:** Jointly generates a set of items and their 2D display strategy using a Deep Q-network (DeepPage).
*   **Metrics Used:** Precision@20, Recall@20, F1-score@20, NDCG@20, MAP (offline).
*   **Reported Results:** In offline e-commerce dataset evaluations, DeepPage achieved Precision@20 of 0.0491, Recall@20 of 0.3576, and NDCG@20 of 0.1872, outperforming baseline display strategies.

**SlateQ: Tractable Decomposition for RL with Recommendation Sets [`ie2019slateq`]**
*   **Context:** Decomposes the long-term value (LTV) of a slate into item-wise LTVs to handle combinatorial action spaces in YouTube recommendations.
*   **Metrics Used:** User engagement, LTV, click-through rates.
*   **Reported Results:** Simulations showed higher CTR and average reward per episode compared to myopic baselines. The paper also reports successful validation of scalability and effectiveness in live production experiments on YouTube.

**Budget Constrained Bidding by Model-free RL [`wu2018budget`]**
*   **Context:** Deep Reinforcement Learning to Bid (DRLB) framework for real-time bidding (RTB) under budget constraints.
*   **Metrics Used:** Ratio of winning impression value to optimal ($R/R^*$), acquired real clicks.
*   **Reported Results:** Outperformed baseline bidding strategies (FLB, RLB) across various budget settings, achieving up to 100.92% improvement over FLB and a 4.3% overall improvement in acquired real clicks in offline dataset evaluations.

### 3. Online, Long Horizon (Holdout or Delayed-Outcome Measurement)

**Focusing on the Long-term: It's Good for Users and Business [`hohnhold2015focusing`]**
*   **Context:** Google search ads study on how short-term revenue-focused decisions cause ad blindness and reduce long-term user satisfaction.
*   **Metrics Used:** Long-Term Revenue Per Mille (LTRPM), user click propensity.
*   **Reported Results:** Used long-term holdout experiments to justify a 50% reduction in mobile ad load at Google, proving that reducing ad load was revenue-neutral or positive in the long term while significantly improving user experience.

**Personalized Ad Recommendation Systems for LTV Optimization [`Theocharous-2015`]**
*   **Context:** Uses RL with high-confidence off-policy evaluation (HCOPE) to optimize personalized ad recommendations for long-term user value.
*   **Metrics Used:** Life-Time Value (LTV) vs. Click-Through Rate (CTR).
*   **Reported Results:** Demonstrated that RL algorithms optimizing for LTV outperform myopic CTR-based approaches, using off-policy evaluation techniques to provide statistical guarantees on performance before deployment.

**Blending Advertising with Organic Content in E-Commerce [`carrion2021blending`]**
*   **Context:** A system deployed on JD.COM that uses virtual bids to optimize the blend of personalized sponsored content with non-sponsored content.
*   **Metrics Used:** Virtual bids (platform valuation of clicks), ad revenue, and long-term user engagement.
*   **Reported Results:** The paper reports successful full deployment, serving all traffic through JD.COM's mobile application and processing tens of millions of auctions daily, demonstrating the scalability of the virtual bids approach.

### 4. Evaluation Metrics, Guardrails, and Long-Term Proxies

**Surrogate for Long-Term User Experience [`wang2022surrogate`]**
*   **Context:** Uses immediate-term user behavior signals as surrogates for long-term outcomes (user revisiting the platform) in a reinforcement learning recommender.
*   **Metrics Used:** Sequential behavior patterns, repeat visit frequency, and engagement depth metrics.
*   **Reported Results:** Validated surrogates by proving they are statistically predictive of users' increased visiting to the platform over a 5-month horizon. Live experiments on an industrial platform serving billions of users demonstrated the surrogates effectively improved long-term user experience.

**Optimizing for Long-Term Value in Spotify [`mcdonald2023spotify`]**
*   **Context:** Models long-term user engagement outcomes as a time-to-event problem using survival models.
*   **Metrics Used:** Time-to-inactivity (a churn metric), retention, and survival estimates.
*   **Reported Results:** Demonstrated that the churn-based time-to-inactivity metric provided improved sensitivity over baseline retention metrics in Spotify A/B tests while preserving directional accuracy, allowing faster validation of long-term effects.

**Quantifying and Leveraging User Fatigue [`sagtani2023quantifying`]**
*   **Context:** Models multi-granularity user fatigue (global session fatigue and coarse-grained taxonomy fatigue) to prevent engagement drops from repetitive recommendations.
*   **Metrics Used:** Click-through rate (CTR), average click numbers per user (ACN), dwell time (DT), and average refresh number (ARN).
*   **Reported Results:** Online A/B tests showed that fatigue-enhanced models achieved consistent CTR and dwell time improvements (2%–6% relative improvements) across different numbers of refreshes.

**Ad Close Mitigation for Improved User Experience [`silberstein2020ad`]**
*   **Context:** Penalizes ads with a high predicted likelihood of being closed by the user within Yahoo Gemini's generalized second price (GSP) auction to improve user experience.
*   **Metrics Used:** Ad close rate (ACR), click-through rate (CTR), and total revenue.
*   **Reported Results:** Large-scale online experiments on Gemini native traffic showed the system reduced the number of ad close events by more than 20%, while limiting the associated revenue decrease to less than 0.4%.

**Online Advertising Incrementality Testing [`barajas2022online`]**
*   **Context:** Evaluates the true causal effect of advertising by isolating conversions that would not have occurred without a specific campaign.
*   **Metrics Used:** Absolute lift, percentage lift, incremental ROAS, and cost per incremental conversion (CPIC).
*   **Reported Results:** Details the practical deployment of geo-testing and synthetic control methods in a major DSP/ad network, emphasizing that standard attribution often overstates performance compared to true incremental lift.

**Reinforcement Learning to Optimize Long-term User Engagement [`zou2019reinforcement`]**
*   **Context:** Introduces FeedRec, an RL framework with a hierarchical LSTM Q-Network and an S-Network environment simulator to optimize long-term user engagement.
*   **Metrics Used:** Average clicks per session, average browsing depth, and average return time.
*   **Reported Results:** In real-world dataset evaluations, FeedRec outperformed DDPG and other baselines with strong statistical significance (p-value < 0.01) across all three long-term engagement metrics.

### 5. Foundational Estimators and Contextual Bandits

**A Contextual Bandit Bake-off [`bietti2021contextual`]**
*   **Context:** A large-scale empirical evaluation of contextual bandit algorithms across hundreds of datasets.
*   **Metrics Used:** Progressive validation (PV) loss, and a statistically significant win-loss difference metric (calculated via an approximate Z-test).
*   **Reported Results:** Found that optimism under uncertainty (e.g., RegCB) worked best overall, with a simple greedy baseline performing as a surprisingly close second.

**Practical Contextual Bandits with Regression Oracles [`foster2018contextual`]**
*   **Context:** Introduces RegCB, which uses a regression oracle to generalize UCB and LinUCB to more expressive model classes.
*   **Metrics Used:** Cumulative regret, normalized relative loss, and confidence width decay.
*   **Reported Results:** In extensive empirical evaluations, RegCB consistently outperformed or matched $\epsilon$-greedy and other baselines, typically remaining within 20% of the best possible oracle performance across diverse datasets.

**Doubly Robust Policy Evaluation and Learning [`dudik2011doubly`]**
*   **Context:** Evaluates the Doubly Robust (DR) estimator, which combines propensity scoring with a reward model to evaluate policies from logged data.
*   **Metrics Used:** Root mean squared error (RMSE), bias, and standard deviation.
*   **Reported Results:** Demonstrated that the DR estimator consistently reduced RMSE by 10% to 20% (average 13.6%) compared to standard Inverse Propensity Scoring (IPS), achieving lower variance while remaining unbiased.

**Counterfactual Risk Minimization [`swaminathan2015counterfactual`]**
*   **Context:** Introduces the POEM algorithm for batch learning from logged bandit feedback, using variance regularization.
*   **Metrics Used:** Hamming loss and computational efficiency (CPU seconds).
*   **Reported Results:** POEM significantly outperformed standard IPS on multi-label classification tasks (p-value < 0.05 across 10 runs), proving that variance regularization improves generalization in off-policy learning.
