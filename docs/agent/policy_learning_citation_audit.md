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

| Citation | Where Used | Adequacy | Current Assessment |
|---|---:|---:|---|
| `zhang2018whole` | Policy/action levers such as ad load, placement, and thresholds | 8 | Strong fit for whole-page/dynamic ad allocation and ad-load decisions. Good support for ad-policy levers. |
| `zhao2021dear` | Policy definition; deterministic/stochastic production ad policies; end-to-end ad ranking; TikTok PPO example | 9 | Directly relevant to online advertising impressions in recommender systems. Strong ad-policy anchor. |
| `ie2019reinforcement` | Policy/action formulation and slate recommender context | 8 | Relevant to slate-based recommender RL. Less ad-specific but appropriate for slate/ranking context. |
| `pancha2022pinnerformer` | State features in policy context; pipeline representation example | 7 | Strong user-representation source, but not policy-learning-specific and not ad-policy-specific. Use cautiously. |
| `xia2023transact` | State features and differentiable ranking pipeline context | 8 | Strong production representation/ranking source. Relevant to end-to-end pipeline discussion, less directly to policy learning. |
| `Zhou2019` | State features in policy context | 6 | Likely supports user behavior modeling or recommender representation, but the current attachment to state variables in the policy definition is broad. Check exact bib entry before relying on it. |
| `Sutton1998` | Deterministic/stochastic policy definition; offline/online taxonomy; Monte Carlo; value/policy-based taxonomy; policy gradients; value functions; actor-critic | 9 for foundational definitions; 6 when repeated in adjacent explanatory sentences | Foundational source is appropriate, but repeated use is dense. Some instances can be consolidated to reduce textbook feel. |
| `levine2020offline` | Stochastic policy definition; uncertainty/partial information; offline policy learning; MC limitations; sample efficiency; policy-based shortcomings | 8 | Strong for offline RL and practical limitations. Less direct for stochastic policies in production ad systems. Use strongest in offline-learning paragraphs. |
| `gauci2018horizon` | Deterministic vs stochastic ad policies; offline-first practice; Horizon/Meta rollout; actor-critic production systems | 8 | Strong production RL platform source. Good for offline-to-online deployment and applied RL workflow; weaker for "ad policies are typically stochastic" unless Horizon examples specifically support it. |
| `russo2018tutorial` | Exploration benefit of stochastic policies | 8 | Strong exploration/exploitation reference. Not ad-specific, but appropriate for exploration claim. |
| `zou2019reinforcement` | Long-term ad-user pairing / recommendation outcomes | 7 | Relevant to RL in recommendation, but verify it directly supports the specific "uncover ad-user pairings" phrasing. |
| `mazoure2021improving` | Long-term outcomes / improving long-term metrics | 8 | Good support for long-term recommendation objectives. Not necessarily ad-specific. |
| `dulac2021challenges` | Real-world RL uncertainty, drift, value-method scalability, policy-method limitations | 8 | Broad but appropriate for real-world RL constraints. |
| `Mehrotra2020` | Uncertainty/trade-offs, Spotify contextual bandits/offline-to-online practice | 8 | Good industry/practical recommender example. Check whether exact Spotify offline/online phrasing is fully supported. |
| `Jannach2023` | Uncertainty/trade-offs in recommender systems | 6 | Broad recommender-system source. Acceptable only for general recommender uncertainty/trade-off claims, not ad-policy-specific claims. |
| `dimitrakakis2018decision` | Online policy learning through interaction | 7 | Appropriate for decision-making/online learning concepts. Not ad-specific. |
| `dulac2019challenges` | Online risk, MC limitations, value/policy limitations, action-space complexity | 8 | Strong for real-world RL challenges. Broad but well matched. |
| `swaminathan2015counterfactual` | Logged-data support, importance sampling, counterfactual evaluation | 9 | Strong source for logged bandit feedback and counterfactual risk. Good fit. |
| `dudik2011doubly` | Doubly robust estimation and counterfactual reasoning | 9 | Directly supports doubly robust evaluation claims. Good fit. |
| `chen2022off` | YouTube offline RL, actor-critic, end-to-end production policy learning | 9 | Strong industry ad/recsys-adjacent production RL source. Good fit for offline actor-critic and policy-learning examples. |
| `russell2016artificial` | Value vs policy taxonomy; informal policy-based explanation | 6 | General AI textbook. Fine for background, but less necessary when `Sutton1998` and specific RL sources are already cited. |
| `schulman2017proximal` | Policy optimization/PPO; policy gradient formalism | 9 | Strong source for PPO and policy optimization. Good fit. |
| `mnih2015human` | DQN | 9 | Direct source for DQN. Good fit. |
| `mnih2016asynchronous` | Neural network policy/function approximation; actor-critic | 8 | Strong RL source, especially for deep actor-critic. |
| `williams1992simple` | REINFORCE/policy gradient; policy distribution; ad-load example | 9 for REINFORCE/policy-gradient claims; 6 for the ad-load example | Strong foundational policy-gradient source. Less necessary for the illustrative ad-load example if `Sutton1998` already supports the concept. |
| `kaelbling1996reinforcement` | General RL sufficiency; epsilon-greedy workaround | 7 | Classic RL survey. Useful but often redundant with `Sutton1998`. |
| `lin2023survey` | Neural policies in recommender systems; value-vs-policy taxonomy; actor-critic | 7 | Relevant RL/recsys survey. Broad but helpful for recommendation context. |
| `schulman2015trust` | TRPO; policy-based stochastic policies | 9 | Direct support for TRPO and policy optimization. |
| `mcmahan2013ad` | Google/LinkedIn value-based approaches; small discrete ad policies | 5 | Strong ad-click prediction paper, but likely weak support for "Q-learning to optimize discrete ad policies." Verify exact claim. |
| `Theocharous-2015` | Personalized ad recommendation / lifetime value optimization | 8 | Directly ad/recsys RL-ish source. Better fit than `mcmahan2013ad` for value-based ad policy optimization. |
| `zhao2024survey` | Ad/content retrieval survey; industry examples | 6 | Broad survey source. Useful for context, but weak for precise claims about TikTok/Google/LinkedIn methods unless it explicitly reports them. |
| `ie2019slateq` | Slate/action complexity and stochastic policy flexibility | 8 | Good fit for slate-level recommendation and action-space complexity. |
| `cai2023two` | Two-stage constrained actor-critic / multi-objective setting | 9 | Direct source for constrained actor-critic and multi-objective balancing. Strong fit. |
| `zhu2021overview` | Final paradigm-selection factors | 6 | Broad overview. Acceptable for general RL considerations, but weak for ad-policy-specific practitioner guidance. |

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

### 3.2 `mcmahan2013ad` may not support value-based RL ad-policy claim

Current claim:

```tex
Platforms like LinkedIn and Google Ads have applied value-based approaches like Q-learning to optimize between discrete ad policies...
```

Citation cluster:

```tex
\cite{mcmahan2013ad, Theocharous-2015, zhao2024survey}
```

Risk:

`mcmahan2013ad` is about ad click prediction and large-scale supervised ad models, not necessarily Q-learning or value-based RL policy optimization. This may be a citation mismatch.

Recommended next edit:

Verify whether `Theocharous-2015` or another source directly supports value-based ad-policy optimization. If not, split the claim:

```tex
Large-scale ad systems such as Google Ads have long used supervised models for ad click prediction \cite{mcmahan2013ad}, while value-based RL formulations have been explored for personalized ad recommendation and lifetime-value optimization \cite{Theocharous-2015}.
```

Priority: high.

### 3.3 `zhao2024survey` may be too broad for TikTok/PPO claim

Current claim:

```tex
TikTok used Proximal Policy Optimization (PPO) to learn a stochastic ranking policy...
```

Citation cluster:

```tex
\cite{zhao2021dear, zhao2024survey}
```

Risk:

If `zhao2021dear` directly reports PPO in DEAR, `zhao2024survey` may be unnecessary. If not, the claim needs a more direct citation.

Recommended next edit:

Use only the primary system paper if it supports the claim:

```tex
\cite{zhao2021dear}
```

Priority: medium.

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
5. Verify and likely revise the `mcmahan2013ad` / Q-learning / Google Ads claim.
6. Split the dense value-based vs policy-based industry-example paragraph into clearer value-based and policy-based comparison paragraphs.

Medium priority:

1. Replace the architecture-specific transformer/multi-head attention pipeline claim with a more general neural ranking-pipeline claim.
2. Soften "actor-critic RL brings the bias-variance trade-off under control."
3. Attribute "superior balance" to Cai et al. and specify the comparison if available.
4. Add concrete reported metrics or magnitudes where the cited papers provide them.

Low priority:

1. Consider moving some foundational equations to a shorter explanation if the section still feels overly pedagogical.
2. Consider a compact reported-results table if multiple quantitative results are available.

