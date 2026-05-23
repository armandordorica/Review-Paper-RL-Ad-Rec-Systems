# Section 3 History: Revision And Reviewer-Risk Audit

Scope: `paper.tex`, `\section{A Brief History of Advertising and Recommendation Systems: From Rule-Based to Deep Learning-Based Joint Optimization}` (currently lines 176-293).

Latest refresh: May 23, 2026, first comprehensive audit in response to whether the history section is necessary, what should stay, what should go, and what is missing.

## Reviewer context used

- Associate Editor: strengthen the focus on ad-related aspects and joint ad plus organic recommendation; remove repetitive or not clearly relevant material; add critical comparison and practical evaluation discussion; use bold sparingly.
- Reviewer 1: overemphasis on generic pedagogical material; evolution from RNNs to Transformers feels out of place unless tied tightly to RL for ad policy optimization; Section 3.2 MAB clinical-trials lead-in may confuse readers; need deeper comparisons, trade-offs, assumptions, deployment implications, and real-world outcomes.
- Reviewer 2: the progress of ad policies in recommenders over time is part of the perceived contribution, but emphasis on ad policies remains insufficient; tables and figures must be correctly labelled, readable, and positioned near first reference.
- `revision_rules.md`: remove material without clear "so what"; lead the reader at every stage; do not use literature review space for textbook-style method exposition; audit citation alignment.

## Current Overall Assessment

Section 3 is necessary, but it is currently too broad and too long for the role it should play. The paper needs a short historical bridge because the target contribution is not only "RL for recommender systems" but "why ad policy moved from static allocation and myopic prediction toward sequential, monetization-aware control." Without that bridge, Section 4's RL formulation would feel unmotivated.

The section should therefore stay, but it should be refocused from a general history of advertising, deep learning, attention, and bandits into a practitioner-facing transition: (1) static ads and pricing objectives, (2) supervised prediction and representation learning, (3) adaptive experimentation and bandits, (4) why these remain myopic for ad load, ad fatigue, retention, and joint ad-organic ranking, and (5) why full RL becomes a natural next framing.

Estimated reviewer-aligned score: **6.5 / 10**. The table framework is promising and the section already defines important terms such as ad fatigue, ad load, top slot, minimum gap, displacement cost, logging policy, and rewards. However, the prose still contains generic deep-learning exposition, weak citation anchors, speculative claims about attention heads, an overlong offline-replay paragraph, and an underdeveloped joint ad plus organic recommendation thread.

## Is The Section Necessary?

Yes, but only in a trimmed and more argumentative form.

Keep the section because it does three useful jobs:

- It explains why static ad selection and pointwise prediction are insufficient for monetization-aware feeds.
- It introduces the progression from pricing objectives to representation learning to sequential policy optimization.
- It gives practitioners a vocabulary for seeing RL as one possible response to ad fatigue, ad load, delayed value, exploration, and counterfactual evaluation.

Do not keep it as a broad tutorial history. A reviewer who already complained about generic background will read unrelated material on AlexNet, general Transformer mechanics, clinical trials, and attention-head pruning as more evidence that the paper is drifting away from ad-policy optimization.

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

## What Should Stay

- <span style="background:#fd7e14;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P2</span> <span style="background:#6c757d;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">TODO</span> **H3.** Keep the LinkedIn ad-load example (`yan2020ads`) because it is concrete, industrial, and directly tied to ad placement, top slot, minimum gap, and saturation.
- <span style="background:#fd7e14;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P2</span> <span style="background:#6c757d;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">TODO</span> **H4.** Keep the progression from CPM/CPC/CPA to utility functions, but compress the historical corporate details and use the discussion to motivate why utility functions encode explicit trade-offs among revenue, engagement, fatigue, and conversions.
- <span style="background:#fd7e14;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P2</span> <span style="background:#6c757d;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">TODO</span> **H5.** Keep bandits and contextual bandits, but frame them as short-horizon adaptive policy tools for choosing ad configurations or treatment arms, not as a broad clinical-trials history.
- <span style="background:#fd7e14;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P2</span> <span style="background:#6c757d;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">TODO</span> **H6.** Keep offline replay / counterfactual evaluation, but move most details later if Section 4 or an evaluation section will cover off-policy learning. In Section 3, it should only explain why large policy-search spaces are screened offline before online A/B testing.

## What Should Go Or Be Compressed

- <span style="background:#7c1d1d;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P0</span> <span style="background:#6c757d;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">TODO</span> **H7.** Remove or radically compress the generic AlexNet / neural-network breakthrough material. It does not support the ad-policy argument unless rewritten around industrial ad/recsys models such as CTR prediction, two-tower retrieval, wide-and-deep ranking, or DLRM-style representation learning.
- <span style="background:#7c1d1d;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P0</span> <span style="background:#6c757d;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">TODO</span> **H8.** Remove the clinical-trials lead-in for MABs or reduce it to a half sentence. Reviewer 2 specifically flagged this as confusing, and it distracts from the recommender/ad-policy use case.
- <span style="background:#dc3545;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P1</span> <span style="background:#6c757d;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">TODO</span> **H9.** Cut the speculative attention-head examples. Claims such as one head prioritizing CTR and another mitigating ad fatigue are plausible as intuition, but the current citations do not directly establish this mechanism in ad-policy systems.
- <span style="background:#dc3545;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P1</span> <span style="background:#6c757d;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">TODO</span> **H10.** Compress the paragraph on selecting and weighting attention heads. Michel and Voita support general head-pruning analysis, not ad-policy head selection, and the passage looks like a generic Transformer tutorial.
- <span style="background:#dc3545;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P1</span> <span style="background:#6c757d;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">TODO</span> **H11.** Move or shorten the offline-replay paragraph. It tries to explain A/B/n experiments, logged interactions, rewards, importance sampling, and policy learning in one paragraph, creating a mini-methods tutorial inside the history section.
- <span style="background:#fd7e14;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P2</span> <span style="background:#6c757d;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">TODO</span> **H12.** Remove weak historical trivia unless it directly supports the optimization transition. Yahoo/Overture acquisition details, Wikipedia-sourced CPM, and broad history-of-tracked-user material are lower value than ad-ranking and auction/relevance sources.
- <span style="background:#fd7e14;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P2</span> <span style="background:#6c757d;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">TODO</span> **H13.** Remove source comments from the section before final submission (`%% Goal`, `%% missing`, `%%tie this up`) because they are useful drafting notes but create source hygiene risk.

## What Is Missing

- <span style="background:#7c1d1d;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P0</span> <span style="background:#6c757d;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">TODO</span> **H14.** Add a clear through-line for joint ad plus organic ranking. The current section mostly discusses ad selection and ad configurations. It should explicitly explain when the problem changes from selecting ads independently to jointly ranking ads with organic content in a shared feed.
- <span style="background:#dc3545;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P1</span> <span style="background:#6c757d;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">TODO</span> **H15.** Add ad-marketplace constraints that make history relevant: advertiser value, user value, platform revenue, budget pacing, reserve prices, auction/relevance scoring, and ad-load constraints. These are the mechanisms that distinguish ad policy from generic recommendation.
- <span style="background:#dc3545;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P1</span> <span style="background:#6c757d;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">TODO</span> **H16.** Add a concise explanation of why pointwise supervised prediction is not enough for ad policy: it optimizes immediate response under the logging policy, but it does not optimize policy-induced trajectories, delayed retention, or future inventory/user-state effects.
- <span style="background:#dc3545;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P1</span> <span style="background:#6c757d;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">TODO</span> **H17.** Add evaluation framing earlier and more cleanly: A/B testing validates live effects; offline replay/counterfactual estimators screen candidate policies; neither replaces the other. This should be a short workflow bridge, not a long technical detour.
- <span style="background:#fd7e14;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P2</span> <span style="background:#6c757d;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">TODO</span> **H18.** Add missing practical trade-offs to the table or surrounding prose: interpretability versus performance, scalability versus action granularity, short-term revenue versus long-term engagement, exploration risk versus learning speed, and offline-estimator bias/variance versus online test cost.
- <span style="background:#fd7e14;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P2</span> <span style="background:#6c757d;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">TODO</span> **H19.** Add one or two stronger industrial anchors for the transition from supervised ranking to RL or off-policy learning in ads/recsys. Current closing examples are useful, but the section should tie them to specific historical limitations rather than listing them at the end.

## Recommended Restructure

Recommended shape after revision:

1. **Opening bridge paragraph.** Why a history section exists: ad policy evolved because the objective shifted from serving ads to optimizing a joint, repeated-interaction marketplace.
2. **Static allocation and pricing objectives.** CPM/CPC/CPA and rule-based placement, with only enough history to motivate objective misalignment.
3. **Supervised prediction and representation learning.** CTR/CVR/ranking models, embeddings, and two-tower systems as scalable pointwise prediction, followed by their myopia.
4. **Adaptive experimentation and bandits.** A/B testing, MABs, contextual bandits, and offline replay as tools for screening and adapting policies under uncertainty.
5. **Why full RL enters.** Long-horizon ad fatigue, retention, ad load, policy-induced distribution shift, and joint ad-organic ranking require stateful policy optimization.

If space is tight, collapse subsections into one section with two shorter subsections: "From Static Ads to Pointwise Prediction" and "From Adaptive Experiments to Sequential Policy Optimization."

## Citation Adequacy Scores

| Citation | Uses | Where Used | Adequacy | Assessment |
|---|---:|---|---:|---|
| `kant2021history` | 1 | Early online ads / data-tracked users | 6 | Broad history source, not ad-policy or recommender-specific. Acceptable only for a compressed historical opener. |
| `fain2006sponsored` | 2 | Sponsored search history and search relevance | 8 | Good fit for sponsored-search history. Less directly tied to modern feed ad policies. |
| `abrams2007personalized` | 1 | Ad fatigue and rule-based limitations | 8 | Relevant ad-fatigue source. The "rule-based systems" part may need a more direct anchor. |
| `yan2020ads` | 2 | Top slot, minimum gap, ad load | 10 | Direct industrial ad-allocation fit. One of the strongest citations in this section. |
| `hu2004performance` | 1 | Performance-based pricing | 8 | Good fit for pricing-model history. |
| `wikipedia-cpm` | 1 | CPM definition | 3 | Weak source for an academic manuscript. Replace with a textbook, industry, or advertising-economics source, or define CPM without citation if treated as common terminology. |
| `wsj2003yahoooverture` | 1 | Yahoo/Overture acquisition | 5 | Factually relevant but likely unnecessary. Corporate transaction detail has low value for the paper's argument. |
| `ellam2003overture` | 1 | CPC / Overture | 7 | Reasonable historical source, but the text should avoid over-investing in corporate chronology. |
| `zhang2018whole` | 1 | Move toward dynamic data-driven allocation | 8 | Good ad-allocation fit. Could be used more directly for whole-page ad allocation rather than broad "industry compelled to innovate" prose. |
| `barajas2022online` | 2 | ML and A/B testing / incrementality | 7 | Useful for A/B testing in ads, weaker for ML adoption chronology. |
| `cui2015global` | 2 | ML models in sponsored search | 8 | Good fit for ad-selection optimization, but the model list may overgeneralize from one sponsored-search setting. |
| `krizhevsky2012imagenet` | 1 | Deep-learning breakthrough | 4 | Too generic for this survey. Cut or replace with an industrial recommender/ad ranking source. |
| `covington2016deep` | 1 | Deep recommendations / embeddings | 8 | Strong industrial recommender source, though not ads-specific. |
| `vorotilov2023scaling` | 1 | Two-tower ads/recsys scaling | 8 | Likely useful if the claim is about scalable retrieval/representation; verify source alignment before keeping. |
| `schwartz2017customer` | 3 | MABs in marketing and rewards | 7 | Relevant to customer/marketing bandits, but broad for large-scale ad platforms. |
| `burtini2015improving` | 1 | Explore-exploit tradeoff | 7 | General recommender bandit source. Acceptable for definition, not enough for ad-policy claims. |
| `robbins1952sequential` | 1 | MAB origins | 9 | Canonical historical fit, but this origin detail should be very short. |
| `villar2015multi`, `thompson1933likelihood` | 1 each | Clinical-trials history | 5 | Accurate but strategically distracting given reviewer feedback. Remove or compress. |
| `li2010contextual`, `chapelle2011empirical` | 1-2 | Web/advertising bandits | 9 | Strong sources for contextual bandits and Thompson sampling in web/news/ad-like settings. |
| `kuleshov2014algorithms` | 1 | MAB reward/uncertainty estimation | 8 | Good tutorial source; use sparingly. |
| `wen2019learning` | 1 | Reward-function challenge | 7 | Plausible, but the sentence needs a more explicit ad/recsys link or a narrower claim. |
| `engel2008incorporating` | 2 | Utility functions in online advertising | 8 | Good fit for utility-based ad allocation. |
| `vaswani2017attention` | 3 | Transformers and multi-head attention | 6 | Canonical for Transformers, but too generic for repeated ad-policy claims. |
| `ma2018modeling` | 2 | Multi-task learning / multi-objective intuition | 7 | Strong for multi-task learning, weaker for the specific attention-head ad-policy story. |
| `zhao2019recommending` | 1 | Longer-term / multitask recommendation | 8 | Good industrial recommendation source, but not an ad-policy source. |
| `an2024tmh`, `lyu2023entire` | 1 each | Attention / CTR and aggregated representation | 6 | Potentially relevant but not strong enough for broad claims about multi-objective ad-policy optimization. |
| `Kang2018`, `kang2018sasrec` | 1-2 | Sequential recommendation and experiments | 7 | Strong sequential recommendation source, not ads-specific. Avoid duplicating both keys if they are the same work. |
| `Michel2019`, `Voita2019` | 2 each | Attention-head selection/pruning | 6 | Good general NLP/attention analysis, weak for ad-policy weighting claims. |
| `Zhou2018`, `Zhou2019` | 1 each | User interest evolution / shifting weights | 8 | Good industrial CTR/recsys sources if used for evolving user interests, not for attention-head policy control. |
| `Mehrotra2018`, `Mehrotra2020`, `Jannach2023` | 1 each | Multi-objective trade-offs | 8 | Good fit for multi-objective recommendation. Strengthen by explicitly tying to ad marketplace trade-offs. |
| `Schein2002`, `Bobadilla2013` | 1 each | Cold start | 7 | Appropriate for cold-start definition, but the passage may be expendable if attention-head tuning is cut. |
| `agarwal2016statistical` | 2 | Offline replay / policy evaluation | 9 | Strong recommender-statistics source. |
| `levine2020offline`, `agarwal2020optimistic` | 1 each | Offline RL / search spaces | 8 | Strong offline-RL sources, but broad relative to ad-policy history. |
| `agarwal2019online`, `chen2009large` | 1 each | Online parameter selection / A/B data collection | 8 | Useful industrial-ad/recsys evaluation anchors. |
| `wu2017returning` | 2 | Long-term user value / reward examples | 8 | Good recommender long-term engagement source. |
| `Sutton1998`, `bubeck2012regret` | 2 each | RL and bandit definitions | 9 | Canonical definitional sources. Avoid using them to support ad-specific claims. |
| `dudik2011doubly`, `swaminathan2015counterfactual` | 1 each | Importance sampling / counterfactual learning | 9 | Strong off-policy/counterfactual sources. |
| `agarwal2014taming`, `bietti2021contextual`, `dimitrakakis2018decision` | 1 each | Contextual bandit limitations | 8 | Good bandit sources, mostly generic. Pair with ad/recsys sources where possible. |
| `afsar2022reinforcement`, `zhou2016latent` | 1 each | Recommender-system bandits | 7 | Useful, but the "ranking decisions independent" claim should be hedged because many recommender settings are not independent. |
| `mcdonald2023impatient`, `yi2023progressive` | 1 each | Long-term objectives via proxies | 7 | Potentially useful; verify exact alignment, especially for ad-policy-specific reward proxy claims. |
| `gauci2018horizon` | 2 | Full RL versus bandit horizon, Meta deployment | 9 | Strong industrial long-horizon RL anchor. |
| `ccelik2023ad` | 1 | Ad fatigue | 8 | Good direct ad-fatigue anchor. |
| `zhao2020jointly`, `zhao2021dear` | 1 each | Industrial/ad RL examples | 10 | Directly central to the paper. Should be foregrounded earlier, not only in the closing paragraph. |
| `zhao2024survey` | 1 | Google / RL-driven ad scheduling | 5 | Too broad for the specific claim about Google experimenting with RL-driven ad scheduling unless the cited survey directly documents that claim. Verify or replace. |

## Resolved Revision Items

- <span style="background:#dc3545;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P1</span> <span style="background:#198754;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">DONE</span> **H1.** Replaced the opener with a purpose-first bridge paragraph that explains why the section exists, preserves the "static allocation and pointwise prediction" through-line, avoids unsupported causal claims about performance-based pricing, and points readers to Figure `fig:ad_timeline` and Table `tab:evolution-tracks`.
- <span style="background:#dc3545;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P1</span> <span style="background:#198754;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">DONE</span> **H2.** Redesigned Table `tab:evolution-tracks` after user review. The final direction restores the more scannable three-track, stage-based format while adding explicit RL mapping in each track heading: pricing/objectives to reward design, representation to state and action spaces, and decision horizon to policy learning and evaluation. Representative sources are listed once per track rather than in every cell.

## Out of scope for this file

- Detailed rewrites of Section 4's reward, state, action, and policy-learning subsections.
- Full bibliography cleanup outside citations used in Section 3.
- Figure redesign work for `history_timeline_figure.png`, except where it affects whether Section 3 should keep a timeline figure.

## Working rules

- Apply changes one at a time when the user wants approval-gated revision.
- Preserve `paper.tex` paragraph style unless reflow is explicitly requested.
- Treat Section 3 as a bridge into Section 4, not as a standalone tutorial.
- Apply the citation audit checks to every proposed change.
