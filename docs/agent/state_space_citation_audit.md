# State Space Representation: Remaining Citation And Reviewer-Risk Audit

Scope: `paper.tex`, `State Space Representation`, lines 712-793, current as of May 9, 2026.

Reviewer context used:

- Reviewers asked for a stronger focus on ad policies and joint ad + organic optimization.
- Reviewers flagged generic recommender/RL material that is not sufficiently tied to ad policy optimization.
- Reviewers asked for deeper comparison, trade-offs, assumptions, and real-world performance.
- Reviewers asked for clearer evaluation discussion, including common metrics, simulators, counterfactual estimators, and reproducibility limits.
- Reviewers flagged citation mismatch risk and repeated/loosely attached references.

## Current Overall Assessment

The section is substantially stronger than before. It now has:

- a clear section goal,
- an explicit statement that the five properties are an analytical lens rather than a consensus taxonomy,
- a comparison table across representative systems,
- a reported-results paragraph,
- practitioner guidance,
- fewer broad or weak citation attachments than before.

The remaining risks are less about obviously incorrect citations and more about how an editor might judge the depth and specificity of the synthesis. The main remaining issue is that parts of the section still read like a general state-representation discussion with ad examples, rather than a fully ad-policy-specific comparison of how state design affects joint revenue and organic-engagement outcomes.

## 1. Citation Adequacy Scores

Scores use a 1-10 scale:

- 9-10: directly supports the attached claim and is well placed.
- 7-8: mostly appropriate but broad, indirect, or supporting only part of the sentence.
- 5-6: plausible but weakly aligned or too general for the attached claim.
- 1-4: likely mismatched and should be removed or replaced.

| Citation | Where Used | Adequacy | Current Assessment |
|---|---:|---:|---|
| `Sutton1998` | Formal MDP/state definition | 9 | Strong foundational source. Current use is not repetitive. |
| `puterman2014markov` | Formal MDP definition; Markovianity definition | 9 | Strong source for MDPs and the Markov property. |
| `zhao2021dear` | State components; DEAR table column; reported results; contextual signals; sample efficiency; guidance | 9 | Directly ad-policy relevant. Strong fit. |
| `ie2019slateq` | Slate-so-far state; table; reported results; guidance | 9 | Directly supports slate state and user-choice decomposition. Strong fit. |
| `xia2023transact` | Real-time sequence representation; table; reported results; sequence compression; offline/online representation pattern; guidance | 9 | Strong fit for real-time state representations and production serving constraints. |
| `zhang2024scaling` | Online user representations for ads personalization; stability; representation decomposition; guidance | 9 | Strong ad-personalization fit and a good replacement for the earlier broad `zhao2023embedding` citation. |
| `liu2022monolith` | Real-time recommendation infrastructure; stability; representation decomposition | 8 | Strong production-system source for freshness and serving-time representation, but not ad-specific. |
| `swaminathan2015counterfactual` | Logged-feedback variance; counterfactual value estimation; sample efficiency | 8 | Good support for logged-feedback/counterfactual claims, but not ad-specific. |
| `levine2020offline` | Offline RL and sample-efficiency constraints | 8 | Strong for offline RL limitations. Broad but appropriate. |
| `dulac2021challenges` | Real-world RL partial observability, drift, and sample-efficiency constraints | 8 | Broad but appropriate for real-world RL constraints. |
| `gama2014survey` | Distribution shift/concept drift | 8 | Strong concept-drift source, not ad-specific. Fine when paired with production/recsys examples. |
| `hohnhold2015focusing` | Long-term outcomes and production drift context | 7 | Relevant to long-term user/business outcomes. Less direct for state-representation drift specifically. |
| `Zhou2018` | DIN, user behavior attention, display advertising, reported results | 8 | Strong for display-ad CTR state features. Less direct for RL state-space design but useful as a representation building block. |
| `pancha2022pinnerformer` | Long-history user embeddings; table; reported results; guidance | 8 | Strong for user-state representation, but not ad-policy-specific. |
| `kang2018sasrec` | Sequence compression via self-attention | 7 | Good for sequence compression, but not ad-specific and not RL. |
| `naumov2019deep` | Model size / serving cost in expressiveness trade-off | 7 | Acceptable for recommender architecture and embedding-system cost. No longer used for ad-feature claims. |
| `gauci2018horizon` | Interpretability and operator-facing production RL concerns | 8 | Good fit for production RL workflow and operator-facing levers. No longer used for engineered state-feature examples. |
| `glanois2024survey` | Interpretable RL | 8 | Good conceptual support for interpretability, but not ad-system-specific. |
| `ie2019recsim` | RecSim in SlateQ reported results | 9 | Direct support. |
| `mcmahan2013ad` | Ad features and sparse ad-click prediction context | 9 | Strong fit for sparse ad/user/context feature claims. |
| `cheng2016wide` | Ad features; feature crosses; user-ad interaction features | 7 | Useful industrial feature-modeling source. Not ad-policy/RL-specific. |
| `covington2016deep` | Engineered contextual features in the levers list; embedding combination sentence | 6 | Broad recommender-system source. It is no longer used for the main contextual-signals sentence, but remaining uses are still general rather than ad-policy-specific. |
| `grbovic2018real` | Embedding projection / production personalization building blocks | 7 | Good production-embedding source, not ad-policy-specific. |
| `zhang2018whole` | Final guidance on constrained reward/action formulations | 8 | Strong ad-allocation and whole-page optimization fit. |
| `yan2020ads` | Final guidance on constrained ad allocation | 9 | Strong fit for feed ad allocation and constrained optimization. |

## 2. Remaining Citation Issues

### 2.1 `covington2016deep` remains broad in the levers section

Current location:

```tex
\item \textbf{Engineered contextual features.} Anchor $s$ with low-dimensional human-readable signals (location, device, ad-load history, onboarding interests) to support interpretability and address the cold-start regime when long histories are unavailable \cite{covington2016deep}.
```

Risk:

`covington2016deep` supports contextual and engineered features in a large-scale recommender system, but it does not specifically support ad-load history or ad-policy interpretability. An editor concerned about ad-policy focus may still flag this as too general.

Recommended next edit:

Replace or pair `covington2016deep` with an ad-policy citation. A safer version would be:

```tex
\item \textbf{Engineered contextual features.} Anchor $s$ with low-dimensional human-readable signals (location, device, ad-load history, onboarding interests) to support interpretability and address the cold-start regime when long histories are unavailable \cite{zhao2021dear}.
```

If the onboarding/location/device examples are meant as general recommender examples, keep `covington2016deep` but add `zhao2021dear`:

```tex
\cite{covington2016deep, zhao2021dear}
```

Preferred action: use `zhao2021dear` only if the goal is stricter reviewer-proof ad-policy focus.

### 2.2 `hohnhold2015focusing` is indirect for state drift

Current location:

```tex
The state representation should remain informative as the logging policy, ad inventory, and user behavior change between training cycles \cite{gama2014survey, hohnhold2015focusing}.
```

Risk:

`hohnhold2015focusing` is strong for long-term production outcomes, but weaker for state-representation drift itself. `gama2014survey` already covers drift conceptually.

Recommended next edit:

Either remove `hohnhold2015focusing` here or keep it only if the sentence is reframed around long-term production outcomes. A stricter citation version:

```tex
The state representation should remain informative as the logging policy, ad inventory, and user behavior change between training cycles \cite{gama2014survey, dulac2021challenges}.
```

Preferred action: replace `hohnhold2015focusing` with `dulac2021challenges` in this sentence, and reserve `hohnhold2015focusing` for long-term outcome/evaluation discussion.

### 2.3 `glanois2024survey` is general for operational review

Current location:

```tex
State components with human-readable meaning let operators trace policy behavior to upstream signals, support pre-launch review, and isolate regressions when A/B lifts move \cite{gauci2018horizon, glanois2024survey}.
```

Risk:

`glanois2024survey` supports interpretable RL broadly, but not necessarily operator review in ad systems. The pairing with `gauci2018horizon` makes it acceptable.

Recommended next edit:

No urgent change required. If tightening further:

```tex
... when A/B lifts move \cite{gauci2018horizon}.
```

Preferred action: keep for now unless citation density becomes a problem, because it supports the conceptual interpretability claim.

## 3. Missing Or Under-Specified Support

### 3.1 Resolved: reproducibility-audit claim should identify its basis

Current location:

```tex
none of the papers share random seeds, hyperparameter search spaces, or full reproducibility artifacts
```

Risk:

This is exactly the kind of evaluation/reproducibility point reviewers asked for, but it is also an author audit claim. An editor may ask how the authors know this.

Current resolution:

Make the basis explicit:

```tex
In our review of these papers, none shared random seeds, hyperparameter search spaces, or full reproducibility artifacts, which limits cross-system comparison to the qualitative axes in Table~\ref{tab:state-space-comparison}.
```

Status: resolved in the current `paper.tex`. This small edit directly responds to reviewer concerns about evaluation and reproducibility.

### 3.2 Table claims are not explicitly tied to citations row by row

Current table columns cite each system in the header, but individual row entries are uncited.

Risk:

This is acceptable for a compact synthesis table, but a reviewer could still ask whether each cell is directly supported. The caption says the table compares published systems, but the body does not explain whether the rows are author-coded from the cited papers.

Recommended next edit:

Add one sentence before the table:

```tex
The entries in the table are author-coded from the cited system descriptions and reported evaluations, rather than copied verbatim from the original papers.
```

Priority: medium. This helps distinguish prior work from the authors' synthesis, which reviewers asked for.

### 3.3 Latent-intent sentence is okay without citation, but could be clearer

Current location:

```tex
Because only a subset of the latent user intent and platform dynamics is observable through these signals, constructing $s$ is itself a design problem.
```

Assessment:

No citation is required if treated as a local inference from the preceding feature list.

Optional clarity edit:

```tex
Because these signals observe user intent and platform dynamics only indirectly, constructing $s$ is itself a design problem rather than a mechanical feature-collection step.
```

Priority: low.

## 4. Remaining Overclaiming / Wording Risks

### 4.1 Resolved: stability paragraph used strong mechanism language

Previous language:

```tex
The slower-changing component absorbs short-horizon noise and remains stable across retraining cycles...
```

Risk:

"Absorbs" sounds mechanistic and universal. The cited systems support the design pattern, but not necessarily this exact mechanism in all cases.

Current resolution:

```tex
The slower-changing component is intended to smooth short-horizon noise and remain stable across retraining cycles...
```

Status: resolved in the current `paper.tex`.

### 4.2 Stability paragraph describes extreme representations

Current language:

```tex
Representations that lean entirely on dense online features...
representations that lean entirely on offline features...
```

Risk:

The extremes are useful for explanation, but they may not correspond to real systems. Reviewers objected to general claims not sufficiently grounded in practice.

Recommended next edit:

```tex
In this taxonomy, representations that lean heavily on dense online features...
representations that lean heavily on offline features...
```

Priority: medium.

### 4.3 Reported results use "meaningful" without metric values

Current language:

```tex
meaningful offline retrieval-quality gains and online engagement lift
```

Risk:

Reviewers specifically asked for quantitative results where available. "Meaningful" is interpretive and may invite criticism if exact magnitudes are not reported in the paragraph.

Recommended next edit:

Either quote the reported magnitudes if available from `pancha2022pinnerformer`, or soften:

```tex
reported offline retrieval-quality gains and online engagement lift
```

Priority: high if exact numbers are not being added.

### 4.4 Guidance paragraph uses prescriptive "are appropriate"

Current pattern:

```tex
Engineered low-dimensional states ... are appropriate...
Slate-so-far representations ... are appropriate...
Long-horizon user embeddings ... are appropriate...
Hybrid offline / online representations ... are appropriate...
```

Risk:

The guidance is useful for practitioners, but repeated "are appropriate" can sound stronger than the evidence supports. Reviewers asked for critical comparison, but not unsupported prescriptions.

Recommended next edit:

Use "are most defensible when" or "are better suited when" to make the guidance conditional:

```tex
Engineered low-dimensional states ... are most defensible for early-stage systems...
```

Priority: medium.

## 5. Reviewer-Specific Risks Beyond Citation Fit

### 5.1 Ad-policy specificity is improved but still uneven

The section now discusses ad + organic ranking in the opening and guidance paragraphs, and includes DEAR, SlateQ, TransAct, and ad-feature examples. However, several core paragraphs still discuss state representation in general RL/recommender terms.

Likely editor concern:

"The section is more focused than before, but some discussion of embeddings and state representations still reads like general recommender-system content rather than ad-policy-specific RL analysis."

Recommended next edit:

In each property paragraph, ensure at least one sentence explicitly states why the property matters for balancing monetization and organic engagement. Markovianity and guidance already do this best; expressiveness, stability, and sample efficiency could be made more ad-specific.

### 5.2 Evaluation discussion is present but compact

The reported-results paragraph is a major improvement, but it is dense and mostly qualitative. Reviewer 1 explicitly asked for quantitative results, common metrics, simulators, and counterfactual estimators.

Likely editor concern:

"Reported results are mentioned, but the section still does not systematically compare metrics or evaluation setups."

Recommended next edit:

Consider splitting the reported-results paragraph into two parts:

1. reported outcomes by system,
2. evaluation limitations and reproducibility.

This would make the response to the evaluation critique more visible.

### 5.3 The table may need clearer placement/explanation

Reviewer 2 complained elsewhere that tables were not positioned clearly. This table is placed in the section, which helps, but the surrounding text could more explicitly walk the reader through the takeaway.

Likely editor concern:

"The table is useful, but the takeaway could be more explicit."

Recommended next edit:

After the table or immediately before it, add a short sentence stating the main takeaway:

```tex
The table shows that higher expressiveness generally comes at the cost of serving complexity, lower interpretability, or greater evaluation burden.
```

Priority: medium.

## 6. Recommended Next Edits

High priority:

1. Remove or soften "meaningful" in the PinnerFormer reported-results sentence unless exact magnitudes are added.
2. Replace `hohnhold2015focusing` with `dulac2021challenges` in the state-drift sentence, or reframe the sentence to make `hohnhold2015focusing` clearly about long-term outcome stability.

Medium priority:

1. Replace `covington2016deep` with `zhao2021dear` in the engineered contextual-features lever, or pair them if both general and ad-specific support are desired.
2. Rephrase "lean entirely" to "lean heavily" and explicitly frame the sentence as taxonomy-based synthesis.
3. Add a sentence clarifying that table entries are author-coded from the cited papers.
4. Make one or two property paragraphs more explicitly about the ad + organic trade-off, not just recommender state representation.

Low priority:

1. Consider reducing inline parenthetical citation density for `PinnerFormer`, `DIN`, `SlateQ`, and `DEAR` if readability becomes an issue.
2. Consider rewording the latent-intent sentence for clarity rather than adding a citation.
3. Consider changing repeated "are appropriate" in guidance to "are most defensible" or "are better suited."

