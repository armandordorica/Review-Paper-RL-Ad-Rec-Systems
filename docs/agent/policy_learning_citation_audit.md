# Policy Learning: Citation And Reviewer-Risk Audit

Scope: `paper.tex`, `Policy Learning`, lines 795-854, current as of May 9, 2026.

Reviewer context used:

- Reviewers specifically noted that policy learning was explained at length, but the parts specific to ad-related aspects were not sufficiently emphasized.
- Reviewers asked for fewer generic pedagogical explanations and more domain-specific illustrations tied to ads and recommendations.
- Reviewers asked for deeper comparison of methods, trade-offs, assumptions, and real-world performance.
- Reviewers flagged shallow offline-RL discussion despite citations to richer offline-RL literature.
- Reviewers asked for clearer evaluation discussion, including metrics, simulators, counterfactual estimators, and reported quantitative results.
- Reviewers flagged citation mismatch risk and repeated/loosely attached references.

## Current Overall Assessment

The section is improved relative to the reviewer criticism. It now:

- opens with an explicit scope statement,
- separates definitions from the argument about stochastic ad policies,
- includes an explicit offline-vs-online goal sentence,
- replaces the FrozenLake example with an ad-load example,
- includes industry examples from YouTube, Meta/Horizon, Spotify, TikTok, LinkedIn, Google Ads, and Facebook/Meta,
- discusses actor-critic methods and constrained actor-critic methods for multi-objective settings.

The main remaining risks are:

- repeated foundational citations (`Sutton1998`, `williams1992simple`, `levine2020offline`) in adjacent sentences,
- broad claims about what production ad systems "typically" do,
- some citation clusters where general RL sources are mixed with ad-system claims,
- several strong or informal claims that may invite reviewer pushback,
- a reported-results gap: many industry examples are cited, but the paragraph rarely states what was measured, how it was evaluated, or the magnitude of improvement.

## 1. Citation Adequacy Scores

Scores use a 1-10 scale:

- 9-10: directly supports the attached claim and is well placed.
- 7-8: mostly appropriate but broad, indirect, or supporting only part of the sentence.
- 5-6: plausible but weakly aligned or too general for the attached claim.
- 1-4: likely mismatched and should be removed or replaced.

| Citation | Where Used In Current Policy-Learning Text | Adequacy | Current Assessment |
|---|---|---:|---|
| `zhang2018whole` | Ad-policy levers such as ad load, placement, and price thresholds | 8 | Strong fit for whole-page/dynamic ad allocation and ad-load decisions. Appropriate as an ad-policy action-space anchor. |
| `zhao2021dear` | Ad-serving policy definition; stochastic/exploration mechanisms; policy-based ad ranking; TikTok PPO example | 9 | Directly relevant to online advertising impressions in recommender systems. One of the strongest ad-policy anchors in this subsection. |
| `ie2019reinforcement` | Slate/action formulation in the policy definition | 8 | Relevant to slate-based recommender RL. Less ad-specific than DEAR, but appropriate for slate and ranking policy context. |
| `pancha2022pinnerformer` | User/state representation and differentiable pipeline context | 7 | Strong for industrial user representation, but indirect for policy learning. Best used as representation support rather than as evidence for RL claims. |
| `xia2023transact` | State representation and end-to-end differentiable ranking context | 8 | Good production ranking/representation source. Supports pipeline integration better than it supports policy-learning theory. |
| `Zhou2019` | User behavior/state variables in the policy definition | 6 | Plausible support for behavior-aware recommendation state features, but broad in this subsection. Consider replacing or pairing with a more ad-specific state-representation source if the claim becomes more specific. |
| `Sutton1998` | Foundational policy definitions, offline/online taxonomy, Monte Carlo, value functions, policy gradients, and actor-critic | 9 for definitions; 6 for repeated explanatory uses | Foundationally appropriate, but still appears frequently. Keep for first definitions and equations; remove where adjacent prose is already supported. |
| `levine2020offline` | Offline RL, logged-data limitations, uncertainty, sample efficiency, and policy-gradient shortcomings | 8 | Strong for offline RL and practical limitations. Less direct for production ad systems, so it works best when paired with industry examples. |
| `gauci2018horizon` | Stochastic/exploration mechanisms, offline-to-online workflow, Meta/Horizon rollout, and actor-critic production practice | 8 | Strong applied RL platform source. Good for production workflow and actor-critic claims; weaker as sole support for broad ad-serving generalizations. |
| `russo2018tutorial` | Exploration benefit of stochastic policies | 8 | Strong exploration/exploitation reference. Not ad-specific, but well matched to the general exploration mechanism claim. |
| `zou2019reinforcement` | Long-term recommendation outcomes from exploration | 7 | Relevant to RL for long-term recommender engagement. Indirect for ad-user pairings specifically, but acceptable after the prose was softened. |
| `mazoure2021improving` | Long-term metrics in recommendation systems | 8 | Good support for long-term recommendation objectives. Not ad-specific, but useful for the long-term outcome framing. |
| `dulac2021challenges` | Real-world RL uncertainty, partial information, drift, and deterministic-policy limitations | 8 | Broad but appropriate for real-world RL constraints. Good support for uncertainty and deployment-risk language. |
| `Mehrotra2020` | Practical uncertainty/trade-offs and Spotify offline-to-online contextual-bandit workflow | 8 | Good industry/practical recommender example. Keep tied to Spotify or general recommender experimentation rather than ad-specific claims. |
| `Jannach2023` | General recommender uncertainty and objective trade-offs | 6 | Broad recommender-system support. Acceptable for general trade-off language, but weak for ad-policy-specific production claims. |
| `dimitrakakis2018decision` | Online policy learning through live interaction | 7 | Appropriate for decision-making and online learning concepts. Not ad-specific, but the claim is conceptual. |
| `dulac2019challenges` | Online risk, Monte Carlo limitations, action-space scaling, value-method limits, and policy-method limits | 8 | Strong for real-world RL challenges and algorithmic limitations. Broad but well aligned with the current claims. |
| `swaminathan2015counterfactual` | Logged bandit feedback, importance sampling, and counterfactual evaluation | 9 | Directly supports logged-data and counterfactual-risk claims. Strong fit. |
| `dudik2011doubly` | Doubly robust estimation and counterfactual reasoning | 9 | Direct support for doubly robust evaluation. Strong fit. |
| `chen2022off` | YouTube offline RL, actor-critic, Monte Carlo returns, policy rollout, and end-to-end production policy learning | 9 | Strong industry recommender-system RL source. One of the best supports for offline actor-critic and production policy-learning claims. |
| `russell2016artificial` | Value-based vs policy-based taxonomy | 6 | General AI textbook. Acceptable background, but less necessary when `Sutton1998` and more specific RL sources are already cited. |
| `schulman2017proximal` | Policy optimization and the policy objective/formalism | 9 | Strong source for policy optimization and PPO-style policy learning. Good fit. |
| `mnih2015human` | Deep Q-Networks | 9 | Direct source for DQN. Strong fit for the algorithm list. |
| `mnih2016asynchronous` | Neural policy/function approximation and actor-critic methods | 8 | Strong deep RL source, especially for actor-critic. Less specific to recommendation/ad systems. |
| `williams1992simple` | REINFORCE, policy gradients, and stochastic policy parameterization | 9 for REINFORCE/policy gradient; 6 for repeated stochastic-policy explanations | Strong foundational policy-gradient source. Use sparingly outside REINFORCE and policy-gradient claims. |
| `kaelbling1996reinforcement` | General sufficiency of value/policy approaches and epsilon-greedy workaround | 7 | Classic RL survey. Useful but often redundant with `Sutton1998`; keep only where it adds breadth. |
| `lin2023survey` | Recommender-system RL taxonomy and actor-critic context | 7 | Relevant RL/recsys survey. Helpful for recommendation context, but broad for ad-specific claims. |
| `schulman2015trust` | TRPO, policy-gradient stability, and stochastic policy optimization | 9 | Direct support for TRPO and policy optimization/stability claims. Strong fit. |
| `mcmahan2013ad` | Google Ads supervised ad-click prediction / immediate outcome modeling | 8 | Strong support for large-scale supervised ad click prediction after the value-based RL claim was split out. No longer used to support Q-learning or discrete RL ad-policy optimization. |
| `Theocharous-2015` | Personalized ad recommendation and lifetime-value optimization | 8 | Direct ad/recsys RL source. Stronger fit for value-based ad-policy optimization than `mcmahan2013ad`, though the paper should avoid overgeneralizing it to all platforms. |
| `zhao2018deep` | Sponsored-search real-time bidding with deep RL | 9 | Direct ad/RL source for value-based or deep RL formulations in sponsored-search bidding. Strong support for the revised value-based RL sentence. |
| `wu2018budget` | Budget-constrained bidding via model-free RL in display advertising | 9 | Direct display-advertising RL source. Strong support for the revised value-based/ad-bidding sentence. |
| `ie2019slateq` | Slate-level recommendation and action-space complexity | 8 | Good fit for slate-level recommendation and action decomposition. Less ad-specific, but appropriate for complex slate/action claims. |
| `cai2023two` | Two-stage constrained actor-critic and multi-objective optimization | 9 | Direct support for constrained actor-critic and multi-objective balancing. Strong fit. |
| `zhu2021overview` | Final paradigm-selection factors and action-space considerations | 6 | Broad overview. Acceptable for high-level practitioner guidance, but weak for ad-policy-specific recommendations. |

## 2. Missing Or Under-Specified Support

### 2.1 Resolved: "Ad policies are typically stochastic" needed tighter support

Previous claim:

```tex
In large-scale recommendation systems, ad policies are typically stochastic...
```

Risk:

This is a broad production claim. The cited sources (`gauci2018horizon`, `zhao2021dear`) are relevant, but the word "typically" implies a field-wide pattern. Reviewers already objected to under-supported broad claims about adaptability and production relevance.

Resolution:

The claim has been softened from a field-wide statement to a system-specific observation:

```tex
In many large-scale recommendation and ad-serving systems, learned policies are stochastic or include stochastic exploration mechanisms...
```

Status: resolved in the current `paper.tex`.

### 2.2 Resolved: offline-first deployment claim was too absolute

Previous claim:

```tex
To mitigate risks and costs of online exploration, offline is almost always used first \cite{levine2020offline}.
```

Risk:

"Almost always" is too broad and may not be supported by `levine2020offline` alone. It also reads as a universal production practice.

Resolution:

```tex
To mitigate risks and costs of online exploration, large-scale systems commonly begin with offline training or offline evaluation before controlled online rollout \cite{levine2020offline, chen2022off, gauci2018horizon}.
```

Status: resolved in the current `paper.tex`.

### 2.3 Resolved: ad-load example percentages were illustrative but uncited

Previous example:

```tex
low ad load, such as ads occupying 10\% of the feed slots, and a high ad load, such as ads occupying 50\% of the feed slots
```

Risk:

The numbers are clearly illustrative, but a reviewer might interpret them as actual industry thresholds.

Resolution:

The percentages have been explicitly framed as a simplified hypothetical setting:

```tex
for example, in a simplified hypothetical setting, ads occupying 10\% versus 50\% of the feed slots
```

Status: resolved in the current `paper.tex`.

### 2.4 Resolved: "Policy-based methods have become the norm" was under-supported

Previous claim:

```tex
Neural network-based policies have become the norm in large-scale recommendation systems...
```

Risk:

This is broad and likely overstates the evidence. Large-scale recommender systems use many supervised, bandit, ranking, and RL components; "the norm" for policies specifically may be hard to defend.

Resolution:

```tex
Neural network-based policies are common in modern industrial RL and recommendation settings...
```

Status: resolved in the current `paper.tex`.

### 2.5 "Policy-based methods tend to be more suitable for ad policy optimization" may overstate

Current claim:

```tex
However, policy-based methods tend to be more suitable for ad policy optimization for a number of reasons...
```

Risk:

This is a strong comparative claim. The later discussion itself says value-based approaches are appropriate for small discrete action spaces and actor-critic hybrids are common. Reviewers asked for critical comparison, so the section should avoid sounding like policy-based methods dominate categorically.

Recommended next edit:

```tex
However, policy-based methods become attractive in ad policy optimization when the target policy must remain stochastic, operate over large or structured action spaces, or be trained as part of a differentiable ranking pipeline...
```

Priority: high.

## 3. Remaining Citation Issues

### 3.1 Resolved: repeated `Sutton1998` and `williams1992simple`

Previous risk:

The section still cites foundational RL sources very frequently, especially in the value/policy-based subsection. This contributes to the reviewer complaint that the paper reads pedagogically rather than analytically.

Resolution:

The value/policy-based subsection has been trimmed so `Sutton1998` remains mainly on first definitions, core value-learning concepts, and algorithm lists. Repeated adjacent uses of `Sutton1998` were removed from explanatory follow-up sentences. `williams1992simple` is now concentrated around policy-gradient and REINFORCE-related claims rather than general stochastic-policy explanations.

Status: resolved in the current `paper.tex`, though further citation reduction may still be possible during broader prose cleanup.

### 3.2 Resolved: `mcmahan2013ad` did not support the value-based RL ad-policy claim

Previous claim:

```tex
Platforms like LinkedIn and Google Ads have applied value-based approaches like Q-learning to optimize between discrete ad policies...
```

Citation cluster:

```tex
\cite{mcmahan2013ad, Theocharous-2015, zhao2024survey}
```

Previous risk:

`mcmahan2013ad` is about ad click prediction and large-scale supervised ad models, not necessarily Q-learning or value-based RL policy optimization. This may be a citation mismatch.

Resolution:

The claim has been split so `mcmahan2013ad` supports supervised ad click prediction, while value-based RL/ad-bidding claims are supported by more direct ad/RL sources:

```tex
Large-scale ad systems such as Google Ads have long relied on supervised prediction models for immediate outcomes such as click prediction \cite{mcmahan2013ad}. Value-based RL formulations, by contrast, have been explored for personalized ad recommendation, sponsored-search real-time bidding, and budget-constrained display advertising, where the learner estimates the long-term value of candidate ad actions before deriving a policy \cite{Theocharous-2015, zhao2018deep, wu2018budget}.
```

Status: resolved in the current `paper.tex`.

### 3.3 Resolved: `zhao2024survey` was too broad for the TikTok/PPO claim

Current claim:

```tex
TikTok used Proximal Policy Optimization (PPO) to learn a stochastic ranking policy...
```

Current citation:

```tex
\cite{zhao2021dear}
```

Previous risk:

If `zhao2021dear` directly reports PPO in DEAR, `zhao2024survey` may be unnecessary. If not, the claim needs a more direct citation.

Resolution:

The broader survey citation was removed from the TikTok/PPO sentence. The current text relies on the primary DEAR paper:

```tex
\cite{zhao2021dear}
```

Status: resolved in the current `paper.tex`.

### 3.4 General recommender sources are mixed with ad-policy claims

Examples:

- `pancha2022pinnerformer` and `xia2023transact` are used in a sentence about an ad-ranking pipeline with transformer encoder and multi-head attention blending.
- `lin2023survey` and `zhu2021overview` support broad RL/recsys claims.

Risk:

These sources are relevant to representation and recommendation, but not always to policy learning for ads. Reviewers explicitly warned that too much of the paper reads like general recommender systems.

Recommended next edit:

Where the claim is ad-policy-specific, anchor it in ad-policy papers (`zhao2021dear`, `chen2022off`, `gauci2018horizon`, `Theocharous-2015`, `cai2023two`) and move generic recommender sources to background sentences.

Priority: medium.

## 4. Overclaiming / Wording Risks

### 4.1 "Stochastic policies ... spread risk"

Current claim:

```tex
randomizing over plausible actions allows the system to spread risk and continue learning
```

Risk:

"Spread risk" is intuitive but underspecified. It could be read as financial or deployment risk rather than uncertainty management.

Recommended next edit:

```tex
randomizing over plausible actions allows the system to avoid committing prematurely to a single uncertain action while continuing to collect learning signal
```

Priority: medium.

### 4.2 "Value-based methods cannot learn when and how to be random"

Current claim:

```tex
policy-based methods ... can learn when and how to be random, whereas value-based methods cannot
```

Risk:

Too absolute. Value-based methods can be paired with learned uncertainty estimates, Boltzmann policies, entropy regularization, or exploration strategies. The cleaner point is that policy-based methods directly parameterize stochasticity.

Recommended next edit:

```tex
policy-based methods directly parameterize stochastic action probabilities, whereas value-based methods usually require an additional exploration rule to convert value estimates into stochastic behavior
```

Priority: high.

### 4.3 "Epsilon-greedy approaches ... are ad hoc and not a learned methodology"

Risk:

"Ad hoc" is dismissive and may be viewed as informal or overstated. Epsilon-greedy is a standard exploration method, even if simple and externally specified.

Recommended next edit:

```tex
value-based methods often use externally specified exploration rules such as \(\epsilon\)-greedy rather than learning the action distribution directly
```

Priority: high.

### 4.4 End-to-end differentiability claim may be too architecture-specific

Current claim:

```tex
It is common for ad-ranking systems to start with a transformer-based encoder for ad retrieval and to conclude with a multi-head attention blending layer...
```

Risk:

This sounds very specific and may not be true "commonly" across ad-ranking systems. It also blends representation-learning architecture with policy-learning method.

Recommended next edit:

```tex
In neural ranking pipelines, policy-based methods can be easier to integrate when earlier representation layers and the final action-selection layer are trained jointly...
```

Priority: high.

### 4.5 "Actor-critic RL brings the bias-variance trade-off under control"

Risk:

Too strong. Actor-critic methods manage or trade off bias and variance; they do not fully bring it under control.

Recommended next edit:

```tex
Actor-critic RL provides one way to manage the bias-variance trade-off...
```

Priority: high.

### 4.6 "Superior balance" in the Cai et al. paragraph

Current claim:

```tex
This two-tier actor-critic approach achieved a superior balance...
```

Risk:

"Superior" is evaluative. If it is the authors' reported result, attribute it explicitly and specify compared to what.

Recommended next edit:

```tex
Cai et al. report that this two-tier actor-critic approach improved the trade-off...
```

Priority: medium.

## 5. Evaluation And Reported-Results Gaps

### 5.1 Offline-vs-online examples could better state evaluation modes

The YouTube, Meta/Horizon, and Spotify examples are useful, but the paragraph would better respond to reviewer concerns if it clearly stated what was evaluated offline, what was rolled out online, and what metrics were used.

Recommended next edit:

For each industry example, add or preserve one concrete evaluation detail if available:

- YouTube: offline actor-critic / Monte Carlo returns / long-term user engagement objective.
- Horizon/Meta: counterfactual estimators and gated rollout.
- Spotify: contextual bandit offline optimization and incremental online updates.

Priority: medium.

### 5.2 Value-vs-policy examples need cleaner evidence separation

The paragraph at line 846 currently combines Google/LinkedIn, TikTok, Q-learning, PPO, value-based methods, policy-based methods, and broad action-space claims in one dense paragraph.

Risk:

This is exactly the reviewer complaint: ideas are listed without enough comparison or evidence separation.

Recommended next edit:

Split into two paragraphs:

1. value-based methods for small discrete ad-policy/action spaces,
2. policy-based methods for stochastic ranking policies or large/slate action spaces.

Priority: high.

### 5.3 Quantitative results are mostly absent

The section mentions outperformance and improvements but rarely reports magnitudes or metric names.

Recommended next edit:

If the cited papers provide numbers, add a compact "reported results" sentence or table for:

- DEAR / TikTok,
- YouTube off-policy actor-critic,
- Horizon/Meta,
- constrained actor-critic / Cai et al.,
- Theocharous ad recommendation if relevant.

Priority: medium to high, depending on available numbers.

## 6. Structural / Presentation Risks

### 6.1 Value-based vs Policy-based section lacks an explicit goal sentence

The Offline vs Online subsubsection now has a goal sentence. The Value-based vs Policy-based subsubsection begins immediately with a taxonomy definition.

Risk:

The user has been enforcing "explicit goal first" consistently across sections. This subsubsection may now look inconsistent.

Recommended next edit:

Add a concise goal sentence after the heading:

```tex
This subsubsection compares value-based and policy-based learning as two ways to derive ad-serving policies, emphasizing when each is better suited to discrete ad-treatment choices, stochastic ranking policies, and end-to-end neural pipelines.
```

Priority: high.

### 6.2 The value/policy-based subsection is citation-dense and long

Risk:

Reviewers said policy learning is explained at length but ad-specific parts are insufficiently emphasized. This subsection still contains a long general RL explanation and equations before the domain-specific comparison.

Recommended next edit:

Reduce repeated textbook explanation where possible and bring the ad-load example closer to the taxonomy definition, before the longer policy-gradient equations.

Priority: medium.

### 6.3 Formatting issue: `\textbf{In Policy-based learning}`

Current text:

```tex
\textbf{In Policy-based learning}, ...
```

Risk:

This is stylistically awkward and inconsistent with academic prose. It also uses bold inside running text, which reviewers flagged more generally.

Recommended next edit:

```tex
In policy-based learning, ...
```

Priority: high.

### 6.4 Minor prose/spacing issues

Examples:

- `What policy-based methods learn are the stochastic policy   $\pi_\theta...` has grammar and extra spacing issues.
- `accommodate for stochasticity` should be `accommodate stochasticity`.
- `Finally, Policy-based methods` should lowercase `policy-based`.
- `pipeline\cite{...}` needs a space before the citation.
- Line 814 begins with a leading space before "In ad policy optimization..."
- "Actor-Critic" capitalization varies.
- Bias-variance dash should be consistent with the rest of the document.

Priority: high for easy cleanup because these are visible presentation issues.

## 7. Recommended Next Edits

High priority:

1. Add an explicit goal sentence to `Value-based vs Policy-based Learning`.
2. Fix the awkward bolded phrase `\textbf{In Policy-based learning}` and nearby grammar/spacing issues.
3. Soften "policy-based methods tend to be more suitable for ad policy optimization" to a conditional claim.
4. Replace absolute claims that value-based methods "cannot" learn stochasticity and that epsilon-greedy is "ad hoc."
5. Split the dense value-based vs policy-based industry-example paragraph into clearer value-based and policy-based comparison paragraphs.

Medium priority:

1. Replace the architecture-specific transformer/multi-head attention pipeline claim with a more general neural ranking-pipeline claim.
2. Soften "actor-critic RL brings the bias-variance trade-off under control."
3. Attribute "superior balance" to Cai et al. and specify the comparison if available.
4. Add concrete reported metrics or magnitudes where the cited papers provide them.

Low priority:

1. Consider moving some foundational equations to a shorter explanation if the section still feels overly pedagogical.
2. Consider a compact reported-results table if multiple quantitative results are available.

