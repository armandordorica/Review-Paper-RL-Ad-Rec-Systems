# Policy Learning: Citation And Reviewer-Risk Audit

Scope: `paper.tex`, `Policy Learning` subsection, current as of May 10, 2026. The audit emphasizes the `Offline vs Online Policy Learning` and `Value-based vs Policy-based Learning` subsubsections because those are the most citation-dense and most exposed to reviewer concerns about generic RL exposition, shallow synthesis, and citation alignment.

Latest refresh: May 10, 2026, after the citation cleanup in `Value-based vs Policy-based Learning`.

Reviewer context used:

- Reviewers said policy learning was explained at length, but ad-specific aspects were not sufficiently emphasized.
- Reviewers asked for fewer generic pedagogical explanations and more domain-specific illustrations tied to ads and recommendation.
- Reviewers asked for deeper comparison of methods, including trade-offs, assumptions, and real-world performance.
- Reviewers flagged shallow offline-RL and evaluation discussion despite citations to richer offline-RL and recommender-system literature.
- Reviewers flagged citation mismatch risk and unsupported claims about adaptability or production relevance.

## Current Overall Assessment

The subsection is substantially stronger than earlier drafts. It now:

- defines policy, state, and action symmetrically,
- avoids treating ads themselves as the only possible action space,
- softens broad production claims about stochastic policies and offline-first deployment,
- gives a concrete offline/online synthesis table,
- replaces generic value-based algorithm listing with ad-policy examples,
- adds industry-facing support for neural policies and actor-critic systems,
- removes several repeated or weakly placed uses of `Sutton1998`, `williams1992simple`, `schulman2017proximal`, `dulac2019challenges`, `zhao2021dear`, `chen2022off`, and `cai2023two`,
- adds a stronger on-policy / auction-based recommender citation, `xu2023optimizing`.

The main remaining risks are:

- `Sutton1998` still appears several times in the value/policy subsection, but current uses are mostly for definitions, equations, or foundational concepts.
- The value/policy subsection still contains a block of formal RL exposition before the ad-policy synthesis, though the examples and supporting citations are now more domain-specific.
- The final policy-learning comparison table still contains some broad RL citations, but the highest-risk rows now include more ad/recommender-specific anchors.
- Several performance claims cite industry systems but do not report quantitative magnitudes.
- Some claims are directionally right but could still be tightened if exact reported results are available, especially around actor-critic benefits and policy-based suitability.

## Citation Adequacy Scores

Scores use a 1-10 scale:

- 9-10: directly supports the attached claim and is well placed.
- 7-8: mostly appropriate but broad, indirect, or supporting only part of the sentence.
- 5-6: plausible but weakly aligned or too general for the attached claim.
- 1-4: likely mismatched and should be removed or replaced.

| Citation | Current Use | Adequacy | Assessment |
|---|---|---:|---|
| `Sutton1998` | RL definitions, offline/online taxonomy, Monte Carlo, value functions, trajectory notation, policy-gradient theorem | 9 for definitions/equations; 6 where repeated | Foundationally correct. Keep for first-use definitions and equations, but avoid stacking it onto industry or ad-policy claims. |
| `russell2016artificial` | Broad value-based vs policy-based taxonomy in earlier draft | 6 | Removed from the current value/policy subsection because `Sutton1998` already supports the taxonomy. |
| `levine2020offline` | Offline learning, logged-data limits, Monte Carlo/offline-RL limitations, table row on offline learning | 8 | Strong for offline RL and logged-data concerns. It is broad, so it is best when paired with `chen2022off`, `gauci2018horizon`, or counterfactual-learning citations. |
| `chen2022off` | YouTube/off-policy actor-critic, logged recommender trajectories, offline evaluation, rollout, neural policies, actor-critic | 9 | One of the strongest industry/recommender RL anchors. Well placed for offline-to-online, actor-critic, and logged-trajectory claims. |
| `gauci2018horizon` | Horizon/Meta workflow, gated rollout, production RL platform, actor-critic/hybrid claims | 8 | Strong applied RL infrastructure source. Good for production rollout and hybrid methods. Avoid using it as sole support for broad ad-serving generalizations. |
| `Mehrotra2020` | Spotify contextual bandit, multi-objective online optimization, offline-then-online rollout | 8 | Strong industry platform example. Best tied to bandit/multi-objective online learning and Spotify, not generic offline RL. |
| `swaminathan2015counterfactual` | Logged bandit feedback, missing counterfactuals, IPS, support-region limits | 9 | Strong fit for logged-feedback and counterfactual-risk claims. Current placement is appropriate. |
| `dudik2011doubly` | Doubly robust estimators and counterfactual policy evaluation | 9 | Strong fit where doubly robust estimators are explicitly named. Current use is appropriate. |
| `zhao2021dear` | Ad-policy actions, ad-impression policy learning, TikTok/DEAR, neural ad-serving policy | 9 | Strong ad-policy anchor. Current use is well aligned, especially for ad-impression and policy-based ad-ranking claims. |
| `ie2019reinforcement` / `ie2019slateq` | Slate formulation, large slate/action-space claims, comparison table limitations | 8 | Good for slate-based recommender RL. Not ad-specific, but appropriate for slate/action-space complexity. |
| `Theocharous-2015` | Personalized ad recommendation and lifetime-value optimization | 9 | Strong fit for value-based ad-policy formulations. Better than generic RL citations for this claim. |
| `zhao2018deep` | Sponsored-search real-time bidding with deep RL | 9 | Strong ad/RL source for value-based or deep RL bidding settings. |
| `wu2018budget` | Budget-constrained display advertising with model-free RL | 9 | Strong display-advertising RL source. Current use is well aligned. |
| `williams1992simple` | Policy-gradient estimator, REINFORCE, stochastic policy parameterization | 9 | Strong foundational policy-gradient support. Current use is more focused than before. |
| `schulman2015trust` | TRPO, policy-gradient stability, high-variance policy updates | 9 | Strong fit for stability and policy-optimization claims. |
| `schulman2017proximal` | PPO and parameterized policy optimization | 9 | Strong fit. Current use is concentrated in the algorithm list rather than repeated across explanatory claims. |
| `mnih2016asynchronous` | Actor-critic and neural RL methods | 8 | Strong deep RL source, especially for actor-critic. It is not ad-specific, so pairing with `chen2022off` is helpful. |
| `lin2023survey` | RL/recommender taxonomy and actor-critic context | 7 | Useful broad recommender RL survey. Should not carry ad-policy-specific claims alone. |
| `dulac2021challenges` | Real-world RL limits, large action spaces, exploration risk, deployment constraints | 8 | Broad but appropriate for practical RL challenges. The subsection now prefers the later journal version and avoids repeated use where a method-specific citation exists. |
| `kaelbling1996reinforcement` | Exploration rules such as epsilon-greedy and classic RL survey support | 7 | Acceptable for general RL exploration, but older and broad. Current use is acceptable but not industry-specific. |
| `cai2023two` | Two-stage constrained actor-critic and multi-objective trade-offs | 9 | Direct support for constrained actor-critic in recommendation. Strong fit. |
| `xu2023optimizing` | On-policy RL in auction-based recommender systems and online/guarded policy updates | 8.5 | Newer and relevant to on-policy learning in auction-based recommender systems. Good addition for online/on-policy policy learning. |
| `mcmahan2013ad` | Supervised ad click prediction at Google scale | 8 | Strong for supervised ad prediction, not for value-based RL. Current separation is appropriate. |
| `zhu2021overview` | Action-space structure, discrete/enumerable action-space claims, final practitioner factors | 7 | Broad but useful for action-space structure. Current placement is acceptable when paired with ad-specific examples. |

## Resolved Citation / Wording Issues

### 1. Generic value-based algorithm list was replaced

Previous issue:

```tex
Common algorithms used in value-based learning include Q-learning, SARSA,
and Deep Q-Networks (DQN) \cite{Sutton1998, mnih2015human}.
```

Risk:

This read as generic RL pedagogy and did not answer the reviewer request for ad-policy relevance. `mnih2015human` only directly supported DQN, not the whole list.

Current resolution:

```tex
In ad-policy settings, value-based formulations appear in personalized ad
recommendation, sponsored-search real-time bidding, and budget-constrained
display advertising...
\cite{Theocharous-2015, zhao2018deep, wu2018budget}.
```

Status: resolved.

### 2. Policy-based learning wording was made more formal

Previous issue:

```tex
the agent tries out different strategies and tweaks their behavior
directly based on what works well overall
```

Risk:

Informal and underspecified.

Current resolution:

```tex
In policy-based learning, the agent directly adjusts the decision rule
used at each decision point to maximize expected cumulative reward,
rather than first estimating the value of every candidate action at that
decision point and then choosing the action with the highest estimated
value.
```

Status: resolved.

### 3. Policy-gradient theorem now has a direct citation

Previous issue:

The sentence introducing the policy-gradient theorem did not cite the theorem directly.

Current resolution:

```tex
... the policy gradient theorem provides a way to compute the gradient
... \cite{Sutton1998, williams1992simple}
```

Status: resolved.

### 4. Epsilon-greedy and stochasticity claims were softened

Previous issue:

The text said value-based methods could not learn stochasticity and described epsilon-greedy as ad hoc.

Risk:

Too absolute. Value-based methods can be paired with exploration rules or uncertainty estimates.

Current resolution:

The text now says value-based systems can explore through mechanisms such as epsilon-greedy, but the exploration rule is usually specified separately from the learned value estimates.

Status: resolved.

### 5. Architecture-specific pipeline claim was generalized

Previous issue:

The subsection implied that ad-ranking systems commonly follow a specific transformer-to-multi-head-attention pipeline.

Risk:

Too architecture-specific and not clearly supported across ad systems.

Current resolution:

The text now refers more generally to ad-ranking systems that combine representation learning, retrieval, and downstream ranking layers.

Status: resolved.

### 6. Offline/online synthesis was added

Previous issue:

The offline-vs-online discussion had useful explanation but lacked synthesis of when each approach is preferred.

Current resolution:

Table `tab:offline-online-policy-learning` now compares offline learning, online learning, and offline-then-online rollout by role, mechanism, and main trade-off.

Status: resolved.

### 7. Duplicate `xu2023optimizing` bibliography entry was removed

Previous issue:

`bibliography.bib` briefly contained duplicate `xu2023optimizing` entries.

Current resolution:

The duplicate was removed and the DOI-bearing entry was retained.

Status: resolved.

### 8. Softmax/action-logit wording was removed

Previous issue:

```tex
a parameterized policy can output an action distribution directly,
for example through a softmax over action logits
```

Risk:

This was technically correct but too didactic and not intuitive for the practitioner audience emphasized by the reviewers.

Current resolution:

```tex
a parameterized ad policy can assign probabilities directly to
candidate actions such as ad-load levels, insertion positions, bids,
or slate choices in the current user and auction context
\cite{zhao2021dear, xu2023optimizing}.
```

Status: resolved.

### 9. Dense repeated citations in the value/policy subsection were reduced

Previous issue:

The subsection used `Sutton1998`, `williams1992simple`, `schulman2017proximal`, `dulac2019challenges`, `zhao2021dear`, `chen2022off`, and `cai2023two` repeatedly, sometimes several times within a single paragraph.

Risk:

Even when technically accurate, citation density made the subsection read as generic RL exposition and could reinforce the reviewer concern that the paper overemphasizes pedagogy rather than ad-policy synthesis.

Current resolution:

- `russell2016artificial` was removed from the value/policy taxonomy sentence.
- `dulac2019challenges` was replaced with `dulac2021challenges` where a real-world RL limitations source was still needed.
- Repeated `zhao2021dear`, `chen2022off`, and `cai2023two` citations were trimmed within paragraphs after the first relevant attribution.
- Ad-policy claims now lean more on `zhao2021dear`, `xu2023optimizing`, `Theocharous-2015`, `zhao2018deep`, `wu2018budget`, and `ie2019slateq`.

Status: resolved.

### 10. Actor-critic overclaiming was softened

Previous issue:

```tex
Actor-critic RL brings the bias-variance trade-off under control...
```

Risk:

This overclaimed the method's effect. Actor-critic methods can manage the trade-off but do not eliminate it.

Current resolution:

```tex
Actor-critic RL manages the bias--variance trade-off by using the
critic to provide lower-variance value estimates while the actor
directly optimizes the policy objective
\cite{mnih2016asynchronous, chen2022off}.
```

Status: resolved.

## Remaining Reviewer-Risk Items

### 1. "Better suited" for hybrid methods may still overstate

Current text:

```tex
This combination improves learning stability and makes hybrid methods
better suited for complex recommendation and ad-serving systems than
either pure value-based or pure policy-gradient methods alone...
```

Risk:

This is plausible and now less over-cited, but comparative superiority can still be read as stronger than the evidence. It would be safer to frame it as "often attractive" or "commonly used" rather than categorically better.

Recommended edit:

```tex
This combination can improve learning stability, which makes hybrid
methods attractive for complex recommendation and ad-serving systems...
```

Priority: medium.

### 2. Quantitative evidence remains thin

Current issue:

The subsection now has better citations and synthesis, but still rarely reports concrete metric names or improvement magnitudes from cited industry systems.

Risk:

Reviewer 1 explicitly asked for practical evaluation discussion and quantitative results where available.

Recommended next step:

Add a compact reported-evidence sentence or table for:

- `zhao2021dear` / DEAR,
- `chen2022off` / YouTube,
- `gauci2018horizon` / Horizon,
- `cai2023two` / constrained actor-critic,
- `Theocharous-2015` if lifetime-value results are reported clearly.

Priority: high.

### 3. Final comparison table still uses broad "limited support" phrasing

Current table row:

```tex
Sensitive to logging-policy bias and limited support
```

Risk:

The phrase "limited support" was confusing in prose and may also be confusing in the table.

Recommended edit:

```tex
Sensitive to logging-policy bias and unreliable for actions rarely
selected by the previous policy
```

Priority: medium.

### 4. `Sutton1998` remains visible in adjacent foundational sentences

Current issue:

`Sutton1998` still appears in the value/policy subsection for taxonomy, greedy action selection, the policy-gradient theorem, and the action-value definition.

Assessment:

Most current uses are defensible. The remaining issue is less citation mismatch and more reviewer perception: too many textbook references in a section that reviewers already saw as overly didactic.

Recommended next step:

Do not remove all `Sutton1998`; instead, reduce repeated adjacent uses if the sentence can be supported by the immediately preceding equation or by a more specific method source.

Priority: low to medium.

### 5. Minor prose cleanup remains

Examples:

- Bias-variance dash style should be consistent with the rest of the document.
- Actor-critic capitalization should be consistent.
- Some table wording still says "safer policy screening" or "lower deployment risk"; these are acceptable but could be softened if reviewer-safety is prioritized.

Priority: low.

## Reviewer-Weighted Next Edits

1. Add concrete reported-results evidence where available.
2. Replace "limited support" in the final policy-learning comparison table.
3. Consider softening the remaining "better suited" hybrid-method sentence if exact comparative evidence is not available.
4. Continue reducing dense textbook exposition only where it does not harm clarity.
5. Keep domain-specific citations close to ad-policy claims and reserve foundational RL citations for definitions and equations.
