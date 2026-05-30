# Policy Learning: Revision And Reviewer-Risk Audit

Scope: `paper.tex`, `\subsection{Policy Learning}` (currently lines 745-846).

Latest refresh: May 30, 2026. P1 (Reviewer 1's named REINFORCE depth gap) is addressed in the YouTube industrial example rather than a standalone textbook paragraph: REINFORCE is defined in one clause when YouTube's migration to actor-critic is discussed (full-trajectory returns, high variance on logged data). The May 30 standalone policy-gradient paragraph was removed as redundant with lines 818--819 and the YouTube/TikTok examples. Remaining reviewer-significant risks: reported-results evidence (P6), actor-critic / Horizon framing (P7), and source-support on the offline/online table (P4/P5).

Prior refresh: May 25, 2026. Rebuilt from a citation-focused audit into a scored section-level reviewer-risk audit. The subsection defines an ad-serving policy, connects actions and states back to Sections~\ref{action_space_representation} and~\ref{state_space_representation}, compares offline, online, and hybrid rollout patterns, and replaces some generic algorithm listing with ad-policy examples.

## Reviewer Context Used

Anchored to direct quotes from `docs/agent/reviewers.txt`, which responds to `original_submission_paper.pdf`. Three-state calibration: the original submission already contained policy-learning exposition and reviewers directly criticized that area. The current offline/online table, strengthened value/policy examples, and actor-critic synthesis contain substantial **new content** added after submission. New content carries full author responsibility and should be source-verified before final submission.

- **Associate Editor:** `"policy learning is explained in some length, but the parts that are specific for ad-related aspects are not sufficiently emphasized."` -> P1, P2, P5, P8.
- **Associate Editor:** `"a critical discussion and comparison of approaches seems missing"` -> P3, P4, P7, P9.
- **Reviewer 1 Major Comment 1:** `"A more detailed comparison of methods, highlighting their trade-offs, assumptions, and real-world performance, would substantially enhance the utility of the survey."` -> P3, P4, P6, P7.
- **Reviewer 1 Soundness:** `"many important methods are barely described, if at all (e.g. policy gradient methods such as REINFORCE, or methods to deal with extremely large action spaces). In many cases, approaches are listed with explanation or any comparisons being drawn."` -> P1, P2, P3, P7.
- **Reviewer 1 Theoretical Background:** `"they discuss offline RL at only a very shallow level, despite citing papers that discuss the important issues at great depth."` -> P4, P5.
- **Reviewer 1 Major Comment 3:** `"Quantitative results from existing studies could also be summarized to help readers understand real-world performance and trade-offs."` -> P6.
- **Reviewer 2:** `"The majority of the paper looks like a general study on Reinforcement Learning and Recommender systems. Emphasis on Ad-policies is insufficient, since this is the main focus of the paper."` -> P1, P2, P5, P8.
- **Reviewer 2:** `"Several statements about adaptability of RL and its traits on recommenders and ad-related systems, are not sufficiently backed by literature. Some of the cited work on these claims are on general RL research, not specific to ad-policies/recommenders."` -> P5, P6, P7.
- **Reviewer 2:** `"Position tables in the texts where they are mentioned or referred to will make it easier for the readers."` -> P10.
- **`revision_rules.md`:** Section 7.1 citation audit, Section 8 literature-review discipline, Section 15 table handling, Section 17.2 metric and trade-off discussion.

## Current Overall Assessment

The policy-learning subsection is no longer a purely generic RL tutorial. It introduces policy learning through ad-serving decisions, distinguishes offline from online learning in terms of logged impressions, counterfactual evaluation, staged rollout, and exploration risk, and compares value-based, policy-based, and actor-critic approaches with ad-policy anchors. The two comparison tables are useful because they summarize practical choices that practitioners actually face.

The remaining risks are still more serious than in the reward, action, and state-space subsections. Reviewer 1 explicitly named policy-gradient methods such as REINFORCE as underdeveloped, and the current text still compresses REINFORCE, PPO, TRPO, and actor-critic into a short algorithm list before moving to actor-critic examples. Several paragraphs still teach the policy-gradient objective and action-value notation before giving the ad-policy interpretation. That material is correct, but it may reinforce the reviewer concern that policy learning is explained at length while the ad-specific implications arrive late. The section also needs stronger reported-results evidence from DEAR, YouTube, Horizon, and constrained actor-critic sources where exact magnitudes are public.

Estimated reviewer-aligned score: **8.0 / 10** (up from 7.4 after the policy-gradient depth pass landed). The section now answers Reviewer 1's named "REINFORCE barely described" critique with a per-family explanation grounded in ad-policy update mechanics. The remaining cap is the reported-results evidence (P6) and the deployment-claim framing checks (P5/P7), which are verification rather than structural gaps.

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

### Reviewer-Flagged Depth And Ad-Policy Focus

- <span style="background:#dc3545;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P1</span> <span style="background:#198754;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">DONE</span> **P1.** Addressed May 30, 2026. Reviewer 1's complaint applied to `original_submission_paper.pdf`, where REINFORCE appeared only in a name list and as a parenthetical in the YouTube sentence. The current draft defines REINFORCE in one clause inside the YouTube example (full-trajectory returns, high-variance on logged data) and keeps the actor-critic contrast in the following sentence. A standalone textbook paragraph added earlier the same day was removed as redundant.

- <span style="background:#dc3545;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P1</span> <span style="background:#6c757d;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">TODO</span> **P2.** Compress or relocate generic formal exposition before the ad-policy synthesis. The policy-gradient objective and action-value definition are accurate, but the section spends many lines on equations and method definitions before the practical ad-policy interpretation. Recommended fix: keep the equations only if the adjacent prose immediately explains what the terms mean for ad-policy actions, logged trajectories, and downstream monetization/engagement returns.

- <span style="background:#fd7e14;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P2</span> <span style="background:#6c757d;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">TODO</span> **P3.** Recheck the "policy-based methods can handle large or complex sets of ads more flexibly" sentence. The idea is plausible, but `ie2019slateq` is not policy-gradient-specific and `dulac2021challenges` is broad. If retained, make the claim narrower: policy-based methods can directly parameterize stochastic decisions over candidate ad-policy controls, but they do not remove the need to restrict or factor large action spaces.

### Offline, Online, And Deployment Claims

- <span style="background:#fd7e14;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P2</span> <span style="background:#6c757d;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">TODO</span> **P4.** Re-audit the offline/online policy-learning table for exact source support. The table is useful and generally well grounded, but each row blends multiple sources across RL, counterfactual learning, and production systems. Confirm that the cited sources directly support the role, mechanism, and trade-off columns, or add a table note that the rows are authorial synthesis from the cited systems.

- <span style="background:#fd7e14;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P2</span> <span style="background:#6c757d;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">TODO</span> **P5.** Soften broad stochastic-policy production claims if they cannot be source-verified. Current language says many large-scale recommendation and ad-serving systems use stochastic policies or stochastic exploration mechanisms, while simpler or older systems may use deterministic rules. This is directionally plausible, but broad. Recommended fix: tie the claim to specific systems or narrow it to "systems that learn online or use bandit/RL exploration often include stochastic exploration mechanisms."

### Evidence, Results, And Citation Fit

- <span style="background:#dc3545;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P1</span> <span style="background:#6c757d;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">TODO</span> **P6.** Add concrete reported-results evidence where available. Reviewer 1 asked for quantitative results. Check `zhao2021dear`, `chen2022off`, `gauci2018horizon`, `cai2023two`, and `Theocharous-2015` for exact metrics or improvement magnitudes. If exact values are not public, say that rather than using broad improvement language.

- <span style="background:#fd7e14;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P2</span> <span style="background:#6c757d;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">TODO</span> **P7.** Verify the actor-critic claims. The YouTube `chen2022off` discussion is strong and specific. The Horizon/Facebook paragraph mentions notifications and video ranking rather than ad recommendations, so it should not be used as direct evidence for ad recommendation unless the sentence is framed as production RL infrastructure rather than ad-specific deployment. The `cai2023two` paragraph should be checked for exact objective names, constraints, and reported trade-off results.

- <span style="background:#fd7e14;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P2</span> <span style="background:#6c757d;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">TODO</span> **P8.** Replace table phrase "limited support" with plain language. Recommended wording: "unreliable for actions rarely selected by the previous policy." This matches the earlier prose and avoids jargon that a junior practitioner may not understand.

### Tables, Placement, And Style

- <span style="background:#fd7e14;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P2</span> <span style="background:#6c757d;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">TODO</span> **P9.** Check whether Table~\ref{tab:policy-learning-comparison} adds enough beyond Table~\ref{tab:offline-online-policy-learning}. Both are useful, but together they may feel table-heavy. Keep both only if the first table explains rollout modality and the second explains algorithm family.

- <span style="background:#fd7e14;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P2</span> <span style="background:#6c757d;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">TODO</span> **P10.** Compile and inspect placement of both policy-learning tables. They are `table*` floats, so source placement may not match rendered placement.

- <span style="background:#6c757d;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P3</span> <span style="background:#6c757d;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">TODO</span> **P11.** Reduce repeated `Sutton1998` visibility only where it does not harm clarity. The current uses are mostly defensible for definitions and equations; the risk is reviewer perception that the section is textbook-like.

## Citation Adequacy Scores

| Citation | Current Use In Policy-Learning Subsection | Adequacy | Assessment |
|---|---|---:|---|
| `Sutton1998` | RL definitions, offline/online taxonomy, Monte Carlo, value functions, trajectory notation, policy-gradient theorem. | 9 for definitions/equations; 6 where repeated | Foundationally correct. Keep for first-use definitions and equations, but avoid stacking it onto industry or ad-policy claims. |
| `levine2020offline` | Offline learning, logged-data limits, Monte Carlo/offline-RL limitations, table row on offline learning. | 8 | Strong for offline RL and logged-data concerns. Broad, so best paired with recommender or counterfactual-learning sources. |
| `chen2022off` | YouTube off-policy actor-critic, logged recommender trajectories, offline evaluation, rollout, neural policies, actor-critic. | 9 | One of the strongest industry/recommender RL anchors. Well placed for offline-to-online, actor-critic, and logged-trajectory claims. |
| `gauci2018horizon` | Horizon/Meta workflow, gated rollout, production RL platform, actor-critic/hybrid claims. | 8 | Strong applied RL infrastructure source. Good for production rollout and hybrid methods. Avoid using as sole support for ad-serving generalizations. |
| `Mehrotra2020` | Spotify contextual bandit, multi-objective online optimization, offline-then-online rollout. | 8 | Strong industry platform example. Best tied to bandit/multi-objective online learning, not generic offline RL. |
| `swaminathan2015counterfactual` | Logged bandit feedback, missing counterfactuals, IPS, support-region limits. | 9 | Strong fit for logged-feedback and counterfactual-risk claims. |
| `dudik2011doubly` | Doubly robust estimators and counterfactual policy evaluation. | 9 | Strong fit where doubly robust estimators are explicitly named. |
| `zhao2021dear` | Ad-policy actions, ad-impression policy learning, TikTok/DEAR, neural ad-serving policy. | 9 | Strong ad-policy anchor. Current use is well aligned. |
| `ie2019reinforcement` / `ie2019slateq` | Slate formulation, large slate/action-space claims, comparison table limitations. | 8 | Good for slate-based recommender RL. Not ad-specific, but relevant to slate/action-space complexity. |
| `Theocharous-2015` | Personalized ad recommendation and lifetime-value optimization. | 9 | Strong fit for value-based ad-policy formulations. |
| `zhao2018deep` | Sponsored-search real-time bidding with deep RL. | 9 | Strong ad/RL source for value-based or deep RL bidding settings. |
| `wu2018budget` | Budget-constrained display advertising with model-free RL. | 9 | Strong display-advertising RL source. |
| `williams1992simple` | Policy-gradient estimator, REINFORCE, stochastic policy parameterization. | 9 | Strong foundational policy-gradient support. Needs more explanatory use, not just citation in a list. |
| `schulman2015trust` | TRPO, policy-gradient stability, high-variance policy updates. | 9 | Strong fit for stability and policy-optimization claims. |
| `schulman2017proximal` | PPO and parameterized policy optimization. | 9 | Strong fit. Current use is concentrated in the algorithm list; may need a sentence explaining why PPO matters for ad-policy updates. |
| `mnih2016asynchronous` | Actor-critic and neural RL methods. | 8 | Strong deep RL source, especially for actor-critic. Not ad-specific, so pair with `chen2022off` or `cai2023two`. |
| `lin2023survey` | RL/recommender taxonomy and actor-critic context. | 7 | Useful broad recommender RL survey. Should not carry ad-policy-specific claims alone. |
| `dulac2021challenges` | Real-world RL limits, large action spaces, exploration risk, deployment constraints. | 8 | Broad but appropriate for practical RL challenges. |
| `kaelbling1996reinforcement` | Exploration rules such as epsilon-greedy and classic RL survey support. | 7 | Acceptable for general RL exploration, but older and broad. |
| `cai2023two` | Two-stage constrained actor-critic and multi-objective trade-offs. | 9 | Direct support for constrained actor-critic in recommendation. Strong fit, but exact results should be source-checked. |
| `xu2023optimizing` | On-policy RL in auction-based recommender systems and online/guarded policy updates. | 8 | Relevant to on-policy learning in auction-based recommender systems. |
| `mcmahan2013ad` | Supervised ad click prediction at Google scale. | 8 | Strong for supervised ad prediction, not value-based RL. Current separation is appropriate. |
| `zhu2021overview` | Action-space structure, discrete/enumerable action-space claims, final practitioner factors. | 7 | Broad but useful for action-space structure. Current placement is acceptable when paired with ad-specific examples. |

## Resolved Revision Items

- <span style="background:#dc3545;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P1</span> <span style="background:#198754;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">DONE</span> **P12.** Generic value-based algorithm listing was replaced with ad-policy settings: personalized ad recommendation, sponsored-search real-time bidding, and budget-constrained display advertising.
- <span style="background:#dc3545;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P1</span> <span style="background:#198754;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">DONE</span> **P13.** Policy-based learning wording was made more formal and less conversational.
- <span style="background:#fd7e14;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P2</span> <span style="background:#198754;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">DONE</span> **P14.** The policy-gradient theorem now has direct foundational support through `Sutton1998` and `williams1992simple`.
- <span style="background:#fd7e14;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P2</span> <span style="background:#198754;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">DONE</span> **P15.** Epsilon-greedy and stochasticity claims were softened so value-based methods are no longer described as incapable of stochastic exploration.
- <span style="background:#fd7e14;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P2</span> <span style="background:#198754;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">DONE</span> **P16.** Architecture-specific pipeline claims were generalized to avoid implying a universal transformer-to-attention ad-ranking architecture.
- <span style="background:#dc3545;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P1</span> <span style="background:#198754;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">DONE</span> **P17.** The offline/online synthesis table now distinguishes offline learning, online learning, and offline-then-online rollout.
- <span style="background:#fd7e14;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P2</span> <span style="background:#198754;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">DONE</span> **P18.** Softmax/action-logit wording was removed and replaced with practitioner-facing examples of ad-load levels, insertion positions, bids, and slate choices.
- <span style="background:#fd7e14;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P2</span> <span style="background:#198754;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">DONE</span> **P19.** Dense repeated citations were reduced in the value/policy subsection.
- <span style="background:#fd7e14;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P2</span> <span style="background:#198754;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">DONE</span> **P20.** Actor-critic overclaiming was softened from controlling the bias-variance trade-off to managing it.

## Out Of Scope For This File

- Section 4.1 reward design: handled in `reward_design_citation_audit.md`.
- Section 4.2 action-space design: handled in `action_space_audit.md`.
- Section 4.3 state-space design: handled in `state_space_citation_audit.md`.
- Section 4.5 exploration/exploitation: audit file still missing.
- Section 5 evaluation framework: handled in `evaluation_audit.md`.
- Paper-wide float placement and table/figure numbering: belongs in a future `tables_figures_audit.md`.

## Working Rules

- Treat P1 and P2 as the highest-leverage Section 4.4 fixes because they directly answer Reviewer 1's named policy-gradient critique.
- Preserve only as much formal RL exposition as needed to support the ad-policy argument.
- Tie every method family to a concrete ad-policy decision: ad load, insertion position, bid, slate choice, guardrail constraint, or rollout policy.
- Do not claim an industry example is ad-specific if the cited system is a broader recommender or production RL platform.
- Apply citation checks to every metric, performance claim, method-family comparison, and deployment claim.
