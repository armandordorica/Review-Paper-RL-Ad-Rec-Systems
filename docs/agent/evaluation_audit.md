# Evaluation Section: Revision And Reviewer-Risk Audit

Scope: planned new top-level section in `paper.tex`, to be inserted after `\subsection{Balancing Exploration and Exploitation in Policy Learning}` and before `\section{Conclusions}`. This audit defines the objective, placement, scope boundaries, section outline, and paper-by-paper evaluation inventory for the future evaluation section.

Latest refresh: May 25, 2026 (early afternoon). Created after the Section 4 MDP-formulation opener and Table 1 notation guide landed, then recalibrated against the current `paper.tex` metric tables. A compact first draft of the new evaluation section has now been inserted into `paper.tex` before Conclusions, using three subsections and one evidence table. The section opener was then grounded in verified prior-survey coverage: Afsar et al.\ categorize RL recommender evaluation environments as offline, simulation, and online; Lin et al.\ summarize evaluation strategies, datasets, and ranking metrics; Deffayet et al.\ critique next-item prediction as an offline protocol for RL recommenders. The manuscript section now follows the same survey convention with ad-policy-specific subsections on trade-off metrics and guardrails, pre-deployment evidence, and online industrial evidence. The metrics subsection now explicitly distinguishes primary metrics, secondary/diagnostic metrics, guardrails, short-term proxies, and long-term holdout outcomes. The evaluation table was redesigned from a system-by-system comparison into a mechanism-oriented table with evaluation setting, mechanism, goal, metrics used, and representative systems. This remains a draft until reported metrics are verified source-by-source.

Latest citation audit: May 25, 2026 (mid-afternoon). Audited current `paper.tex` lines 1068-1114 after the evidence table was relabeled and metric cells were revised. Overall citation coverage is strong enough for a draft, but several claims need tightening before final submission: SlateQ should not be described as a simulator platform, online rollout details should not be carried by broad platform papers without more precise phrasing, and table rows should distinguish direct ad-policy systems from general recommender/RL workflow anchors.

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

The reviewer complaint must be calibrated against `original_submission_paper.pdf`, not treated as a literal description of the current draft. The current `paper.tex` is not empty on evaluation: Section 4.1 now includes Tables~\ref{tab:proxy-metrics-revenue}, \ref{tab:proxy-metrics-engagement}, and \ref{tab:proxy-metrics-fatigue}, which inventory revenue, engagement, and ad-fatigue metrics that candidate policies should improve or guard. It also includes Table~\ref{tab:utility-comparison}, a short "Reported results" paragraph, and Section 4.4's discussion of offline versus online policy learning, counterfactual estimation, staged rollout, and actor-critic evaluation.

The remaining gap is therefore narrower and more precise than "metrics are absent." The current manuscript has a metric inventory, but it does not yet synthesize those metrics into an evaluation framework. The new section should explain how the existing policy-improvement targets are used in practice: which metrics become primary objectives, which become guardrails, how offline replay or counterfactual estimators estimate them, when simulators are useful, and why A/B tests or long-term holdouts remain necessary.

Recommended placement: insert a new top-level section after Section 4 and before Conclusions. Section 4 explains how the MDP components are designed; the new section explains how candidate policies and formulations are validated. Placing it before Conclusions lets the conclusion synthesize methods and evidence rather than ending after a methods-only section.

Estimated reviewer-aligned score if this section is absent: **5.5 / 10** for evaluation coverage. The current metric tables and reward-validation prose mean the paper is no longer at the original-submission baseline, but the reviewer-facing "systematic review of how evaluation is done" remains incomplete. Estimated score after E1-E6 land: **8.5 / 10**, assuming the section connects the existing metric tables to evaluation modalities, includes one comparative evaluation-evidence table, and avoids unverified numerical claims.

## Section Objective

The section should answer one governing question:

> How do industrial and academic systems evaluate whether an RL-based ad policy improves the joint trade-off among monetization, engagement, and long-term user value?

The section should make three conclusions explicit:

1. **No single evaluation modality is sufficient.** Offline replay and counterfactual estimators screen candidate policies cheaply, simulators test sequential behavior under controlled assumptions, and online A/B tests remain the strongest causal evidence for production impact.
2. **Metrics must match the policy objective.** CTR, CVR, RPM, ad load, dwell time, short-view rate, return rate, and retention proxies measure different parts of the monetization-engagement trade-off. A gain in one metric is not evidence of overall policy improvement unless guardrail metrics and time horizons are specified.
3. **Reported results across papers are not directly comparable without context.** Systems differ in platforms, action spaces, logging policies, rollout constraints, horizon length, and guardrail definitions. The evaluation section should compare evidence type and trade-offs, not rank papers as if they used a shared benchmark.

## Recommended Placement And Shape

### Recommended LaTeX placement

Insert after the current exploration/exploitation subsection and before Conclusions:

```latex
\section{Evaluating Joint Ad and Organic Ranking Policies}
\label{sec:evaluation}
```

This should become the new Section 5, pushing Conclusions to Section 6.

### Recommended compact manuscript structure

The seven concerns in this audit are a coverage checklist, **not** seven manuscript subsections. To avoid bloating the paper, the actual section should be capped at roughly **1.5-2 pages** and should use the existing Section 4.1 metric tables instead of recreating them.

1. `\subsection{Evaluation Metrics: Trade-offs and Guardrails}`
   - Goal: connect the existing metric tables to evaluation without duplicating them.
   - Include: revenue, engagement, and ad-fatigue proxies from Tables~\ref{tab:proxy-metrics-revenue}, \ref{tab:proxy-metrics-engagement}, and \ref{tab:proxy-metrics-fatigue}; primary metric versus secondary diagnostic versus guardrail use; short-term proxy metrics versus long-term holdout outcomes; horizon mismatch between immediate revenue metrics and delayed retention/fatigue metrics.
   - Also include, in 2-3 sentences, why evaluation is hard in joint ad and organic ranking: logging-policy bias, policy-induced feedback loops, delayed outcomes, multi-objective trade-offs, user-risk during exploration, and support mismatch.

2. `\subsection{Pre-Deployment Evidence: Offline Replay and Simulation}`
   - Goal: satisfy the offline-replay, IPS, doubly robust, and RecSim reviewer asks in one compact subsection.
   - Include: behavior/logging policy, target policy, support/overlap, IPS, doubly robust estimation, model-based value estimates, why estimates fail for actions rarely selected by the logging policy, and RecSim as a simulator for sequential recommender dynamics.
   - Main citations: `swaminathan2015counterfactual`, `dudik2011doubly`, `levine2020offline`, `chen2022off`, `gauci2018horizon`, `sagtani2024ad`, `ie2019recsim`, `ie2019slateq`.
   - Note: RecoGym is optional. Include it only if a bibliography entry is added and its relevance is verified.

3. `\subsection{Online Evidence Across Industrial Systems}`
   - Goal: cover A/B tests, staged rollout, long-term holdouts, and reported evidence in one place.
   - Include: A/B tests, traffic ramps, feature gates, guardrail metrics, long-term holdouts, online contextual-bandit updates, and one compact comparative table.
   - Main citations: `barajas2022online`, `zhao2021dear`, `zhao2020jointly`, `yan2020ads`, `zhang2018whole`, `gauci2018horizon`, `chen2022off`, `Mehrotra2020`, `hohnhold2015focusing`.
   - The table should carry most of the reviewer-facing "reported evidence" burden. Use exact reported numbers only after verifying them in the cited source; otherwise state evidence type qualitatively.

### Coverage checklist, not manuscript headings

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
| `wang2022surrogate`, `mcdonald2023spotify`, `yi2023progressive` | Long-term proxy and surrogate-metric evaluation | Return rate, delayed retention, progressive horizon, long-term proxies | Useful for long-term metric subsection and guardrail design. | Use as recommender-system support; pair with ad-specific reward/evaluation papers. |
| `Theocharous-2015`, `zhao2018deep`, `wu2018budget` | Value-based RL / advertising RL evaluation | Lifetime value, bidding, budget-constrained display advertising | Useful as older ad/RL evaluation anchors for value-based formulations. | Verify exact metrics before quoting. |

## Proposed Evaluation Table For `paper.tex`

Recommended table title:

```latex
\caption{Evaluation settings, mechanisms, metrics, and representative systems for joint ad and organic ranking policies.}
```

Recommended columns:

| Column | Purpose |
|---|---|
| Evaluation setting | Offline, simulation, online, or online long-horizon setting. |
| Mechanism | Offline replay, off-policy evaluation, simulator, A/B test, staged rollout, or holdout. |
| Goal | Why the mechanism is used in the deployment workflow. |
| Metrics used | Primary, secondary, guardrail, or long-term metrics. |
| Representative systems | Cited systems or methodological papers using the mechanism. |

The table should include no more than 8-10 rows in the manuscript. Put method papers (`swaminathan2015counterfactual`, `dudik2011doubly`, `ie2019recsim`) in prose unless they function as evaluation artifacts rather than deployed systems.

## Pending Revision Items

### Structural and reviewer-risk items

- <span style="background:#7c1d1d;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P0</span> <span style="background:#fd7e14;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">PARTIAL (May 25 draft)</span> **E1.** Add the new top-level evaluation section before Conclusions. Draft inserted in `paper.tex` as `\section{Evaluating Joint Ad and Organic Ranking Policies}`. Still needs source verification and compilation.
- <span style="background:#7c1d1d;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P0</span> <span style="background:#fd7e14;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">PARTIAL (May 25 draft)</span> **E2.** Reuse the existing Section 4.1 metric tables as the metric taxonomy for evaluation. Draft cross-references Tables~\ref{tab:proxy-metrics-revenue}, \ref{tab:proxy-metrics-engagement}, and \ref{tab:proxy-metrics-fatigue}; verify after compile that references render correctly and table placement remains acceptable.
- <span style="background:#7c1d1d;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P0</span> <span style="background:#fd7e14;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">PARTIAL (May 25 draft)</span> **E3.** Explain offline replay, IPS, and doubly robust estimation as evaluation tools with assumptions and failure modes inside the compact "Pre-Deployment Evidence: Offline Replay and Simulation" subsection. Draft includes logging-policy mismatch, IPS, DR, support limits, and offline screening role.
- <span style="background:#dc3545;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P1</span> <span style="background:#fd7e14;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">PARTIAL (May 25 draft)</span> **E4.** Add simulator-based evaluation coverage, including RecSim, inside the same offline/simulation subsection. Draft includes RecSim and SlateQ; RecoGym intentionally omitted because it is not currently in the bibliography.
- <span style="background:#dc3545;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P1</span> <span style="background:#fd7e14;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">PARTIAL (May 25 draft)</span> **E5.** Add online evaluation and rollout discussion inside "Online Evidence Across Industrial Systems": A/B testing, staged rollouts, feature gates, guardrail monitoring, and long-term holdouts. Draft covers all five at a high level.
- <span style="background:#dc3545;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P1</span> <span style="background:#fd7e14;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">PARTIAL (May 25 draft)</span> **E6.** Add one compact comparative evaluation-evidence table across representative cited systems. Draft table has six rows. Exact numbers and evidence wording must be verified source-by-source before finalizing.
- <span style="background:#fd7e14;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P2</span> <span style="background:#fd7e14;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">PARTIAL (May 25 draft)</span> **E7.** Add a 1-paragraph practitioner workflow, preferably as the closing paragraph of the online-validation subsection rather than a separate subsection. Draft closing paragraph added after Table~\ref{tab:evaluation-evidence}.

### Citation and verification items

- <span style="background:#dc3545;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P1</span> <span style="background:#6c757d;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">TODO</span> **E8.** Verify exact reported metrics and magnitudes for `zhao2021dear`, `zhao2020jointly`, `zhang2018whole`, `yan2020ads`, `chen2022off`, `gauci2018horizon`, `sagtani2024ad`, `xu2023optimizing`, and `cai2023two`.
- <span style="background:#fd7e14;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P2</span> <span style="background:#6c757d;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">TODO</span> **E9.** Decide whether to add RecoGym. It is not currently in `bibliography.bib`, so it should not be named in `paper.tex` unless a source is added and checked.
- <span style="background:#fd7e14;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P2</span> <span style="background:#6c757d;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">TODO</span> **E10.** Keep estimator citations parsimonious. Use `swaminathan2015counterfactual` for logged counterfactual risk, `dudik2011doubly` for doubly robust estimation, and `levine2020offline` for offline RL limitations. Do not attach all three to every sentence.
- <span style="background:#dc3545;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P1</span> <span style="background:#198754;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">DONE (May 25)</span> **E11.** Rephrased the simulator sentence and table row so `ie2019recsim` carries the simulator-platform claim and `ie2019slateq` carries the slate-decomposition / slate-evaluation claim. The table now says RecSim provides configurable user-response simulation and SlateQ provides a tractable slate-evaluation model.
- <span style="background:#dc3545;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P1</span> <span style="background:#198754;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">DONE (May 25)</span> **E12.** Tightened the online-evidence paragraph by removing unverified feature-gate and traffic-ramp wording. `gauci2018horizon` and `chen2022off` now support the broader offline-screening to online-validation workflow rather than specific rollout mechanisms.
- <span style="background:#fd7e14;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P2</span> <span style="background:#198754;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">DONE (May 25)</span> **E13.** Relabeled the table column from "Representative systems" to "Representative systems and sources" and adjusted the caption to acknowledge that some entries are methodological sources rather than deployed ad systems.
- <span style="background:#fd7e14;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P2</span> <span style="background:#198754;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">DONE (May 25)</span> **E14.** Clarified that the primary / secondary / guardrail taxonomy is the authors' synthesis by adding "We organize these metrics into three roles" before the metric definitions.

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
| `ie2019slateq` | Slate recommendation decomposition and simulation/evaluation row. | 7 | Relevant to slate-based RL evaluation, but current wording should not imply SlateQ is itself a simulator platform. |
| `dulac2021challenges` | Simulator representativeness and need for online validation. | 8 | Good broad real-world RL limitations source; not ad-specific. |
| `barajas2022online` | Online advertising incrementality testing and practical online-evaluation framing. | 8 | Relevant ad-experiment source. Does not by itself support every listed metric in the sentence. |
| `gauci2018horizon` | Industrial RL workflow, offline evaluation, staged rollout / guardrail examples. | 6 | Useful broad platform source, but broad for ad-policy-specific rollout claims. Verify source text or soften wording. |
| `sagtani2024ad` | Ad-load balancing via off-policy learning; offline row; ad-load / guardrail examples. | 9 | Direct ad-policy and off-policy-learning source. Strong fit. |

## Recommended Order Of Execution

1. Draft the compact section opener and `Evaluation Metrics: Trade-offs and Guardrails`, reusing Tables 3-5 rather than repeating their contents.
2. Draft `Pre-Deployment Evidence: Offline Replay and Simulation`, merging offline replay, IPS, doubly robust estimation, RecSim, and optional RecoGym.
3. Verify reported metrics for the representative systems that will appear in the table.
4. Draft `Online Evidence Across Industrial Systems`, including the compact evidence table and a short closing practitioner workflow.
5. Trim for page budget: target 1.5-2 pages, avoid estimator derivations, and move any long method explanation back to Section 4 or cut it.
6. Update `paper_audit_master.md` and `history_audit.md` H23 after the section lands.

## Out Of Scope For This File

- Rewriting Section 4.4 policy-learning prose, except to avoid duplicating content in the future evaluation section.
- Designing new experiments.
- Full proofs or derivations of IPS, doubly robust estimation, or regret.
- Bibliography deduplication outside the evaluation sources.

## Working Rules

- Treat exact quantitative results as unverified until checked in the cited paper.
- Do not claim a paper used online A/B testing unless the source explicitly says so.
- Do not compare systems as if they share a benchmark.
- Every metric claim must state the evaluation modality: offline, simulator, online A/B, rollout, or long-term holdout.
- Keep the section practitioner-facing and ad-policy-specific.
