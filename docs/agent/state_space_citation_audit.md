# State Space Representation Citation Audit

Scope: `paper.tex`, `State Space Representation`, lines 712-793 as of May 9, 2026.

Reviewer concern addressed: citations should not be repeated unnecessarily, and each citation should directly support the claim it is attached to.

## 1. Reference Adequacy Scores

Scores use a 1-10 scale:

- 9-10: Directly supports the claim and is well placed.
- 7-8: Mostly appropriate, but either broad, indirect, or slightly overburdened.
- 5-6: Plausible but weakly aligned, too general, or supporting only part of the sentence.
- 1-4: Likely mismatched or should be removed/replaced.

| Citation | Where Used | Adequacy | Rationale |
|---|---:|---:|---|
| `Sutton1998` | Formal MDP/state definition | 9 | Strong foundational source for state, action, reward, transition, and discount notation. Adequate when used once for the formal RL setup. |
| `puterman2014markov` | Formal MDP definition; Markovianity definition | 9 | Strong source for Markov decision processes and the Markov property. Good fit for the formal definition. |
| `zhao2021dear` | State-instance components; table; reported results; contextual/request-level features; guidance | 9 | Directly relevant to online advertising impression allocation and request-level features. Strong fit for DEAR-specific claims. |
| `ie2019slateq` | State-instance components; slate-so-far context; table; reported results; guidance | 9 | Directly supports slate-level state representation and user-choice decomposition. Strong fit. |
| `xia2023transact` | State-instance components; long/real-time sequence representation; table; reported results; sequence compression; guidance | 9 | Directly supports real-time session-sequence state representation at Pinterest. Strong fit. |
| `swaminathan2015counterfactual` | Logged-feedback variance/counterfactual estimation; sample efficiency | 8 | Strong source for logged bandit feedback and counterfactual risk. Good fit for variance and logged-feedback claims, but it is not ad-specific. |
| `dulac2021challenges` | Real-world RL partial observability/drift; sample-efficiency challenges | 8 | Good fit for real-world RL challenges. Broad rather than ad-specific, but appropriate for general deployment constraints. |
| `hohnhold2015focusing` | Long-term business/user outcomes; drift over days/weeks | 7 | Relevant to long-term user/business outcomes in production systems, but only indirectly supports the specific state-representation drift claim. |
| `Zhou2018` | DIN as long-history user behavior model; table; reported results; user embeddings; interaction features; guidance | 8 | Strong for user behavior attention in display advertising. Less direct for RL state-space design, but useful as a state-representation building block. |
| `pancha2022pinnerformer` | Long-history user embeddings; table; reported results; guidance | 8 | Strong for long-horizon user embeddings at Pinterest. Not ad-policy-specific, but appropriate for user-state representation. |
| `kang2018sasrec` | Sequence compression via self-attention | 7 | Strong for self-attentive sequential recommendation, but not ad-specific and not an RL system. Adequate as a sequence-modeling reference. |
| `naumov2019deep` | Serving/model-size cost; ad embeddings; offline/online levers | 6 | Relevant to large-scale recommendation model architecture and embedding costs, but only indirectly supports state-space design claims. Use sparingly. |
| `liu2022monolith` | Real-time embeddings, serving system, drift/online component | 7 | Relevant to real-time recommendation infrastructure and online features. Not ad-specific, but supports production serving/state-refresh claims. |
| `gama2014survey` | Distribution shift/concept drift | 8 | Strong general source for concept drift. Not recommender- or ad-specific, but directly supports the drift concept. |
| `zhao2023embedding` | Embedding decomposition and recommender embedding survey | 6 | Useful broad embedding survey, but weak for the specific offline/online decomposition claim unless the text explicitly frames it as general embedding practice. |
| `levine2020offline` | Sample efficiency/offline RL | 8 | Strong for offline RL constraints and extrapolation/sample issues. Broad, but appropriate. |
| `gauci2018horizon` | Engineered low-dimensional features; interpretability; guidance | 7 | Relevant production RL platform source. Good for applied RL workflows and operator-facing considerations, but not always specific to state representation. |
| `glanois2024survey` | Interpretability in RL | 8 | Appropriate general interpretability-in-RL source. It supports the interpretability concept but not specific ad-system practice. |
| `ie2019recsim` | RecSim simulator in reported results | 9 | Direct source for RecSim. Appropriate where simulator-based evaluation is mentioned with SlateQ. |
| `cheng2016wide` | Ad/item embeddings; user-ad interaction/cross features; contextual signals | 7 | Strong for wide-and-deep recommender feature crosses and industrial recommendation modeling, but not ad-policy/RL-specific. |
| `covington2016deep` | Contextual signals and engineered features | 6 | Strong for YouTube recommendation architecture, but only indirectly supports the specific contextual-signal claim in ad + organic policy. |
| `grbovic2018real` | Embedding projection/personalization building blocks | 7 | Relevant to production embeddings for search ranking. Adequate for embedding-combination claims, but not ad-policy-specific. |
| `zhang2018whole` | Final guidance on constrained reward/action formulations | 8 | Directly relevant to whole-page/dynamic ad allocation and monetization trade-offs. Good fit. |
| `yan2020ads` | Final guidance on constrained ad allocation | 9 | Directly relevant to feed ad allocation via constrained optimization. Strong fit. |

## 2. Missing Citations

The following claims are currently uncited or under-cited and should either receive support or be reframed as the authors' synthesis.

1. **Taxonomy construction in the opening paragraph.**  
   Claim: the five properties are synthesized from recurring design considerations across published systems.  
   Recommendation: This can remain uncited if presented as the authors' synthesis, but it may be stronger to cite the representative systems once at the end of the sentence: `\cite{zhao2021dear, ie2019slateq, pancha2022pinnerformer, xia2023transact}`.

2. **"Only a subset of latent user intent and platform dynamics is observable."**  
   This is plausible and important, but currently has no direct citation.  
   Recommendation: cite a real-world RL/offline-RL challenge source such as `dulac2021challenges` or `levine2020offline`, or rephrase as interpretive framing.

3. **"Markovianity matters because value estimators, off-policy methods, and policy-gradient updates ... assume the next reward depends only on `(s,a)`."**  
   This is a technical RL claim and should be supported.  
   Recommendation: attach `\cite{Sutton1998, puterman2014markov}` or `\cite{Sutton1998}` to this sentence, but avoid repeating both if the prior sentence already contains `puterman2014markov`.

4. **"The practical question is therefore how Markovian the state must be..."**  
   This is a synthesis claim. It does not require a citation if framed as the paper's analytical takeaway. If it is meant as an established evaluation practice, it needs support.

5. **"The offline component absorbs short-horizon noise..."**  
   This is plausible but broad.  
   Recommendation: cite a system with explicit long-term/offline plus real-time components, preferably `xia2023transact` or `liu2022monolith`; otherwise soften to "is intended to absorb."

6. **"Representations that lean entirely on dense online features..." and "representations that lean entirely on offline features..."**  
   These are trade-off claims without direct citation.  
   Recommendation: either cite real-time recommendation infrastructure and drift sources (`liu2022monolith`, `gama2014survey`) or frame as analytical synthesis: "In this taxonomy, representations that..."

7. **"Ad embeddings ... let the policy generalize across the long tail..."**  
   The citations support embeddings and recommender models, but the long-tail ad-specific generalization claim could use a more directly ad/recsys source if available.

8. **"None of the papers share random seeds, hyperparameter search spaces, or full reproducibility artifacts."**  
   This is an audit claim made by the authors. It is acceptable without citation, but only if the authors have actually checked the cited papers. Consider wording as "In our review of these papers..." to make the basis explicit.

## 3. Overclaiming

1. **Opening paragraph: "industrial and academic systems implicitly or explicitly appeal to..."**  
   Risk: This can sound broader than the evidence if only four systems are later compared.  
   Suggested revision: "The subsection uses five structural properties to compare representative systems: ..."

2. **Markovianity paragraph: "exact Markovianity is unattainable."**  
   Risk: Strong universal claim. It is directionally true for large-scale ad systems, but "unattainable" may be too absolute.  
   Suggested revision: "exact Markovianity is generally unrealistic in production ad policies..."

3. **Expressiveness paragraph: "The state must encode..."**  
   Risk: Strong normative wording.  
   Suggested revision: "A useful state representation should encode..."

4. **Stability paragraph: "A common decomposition splits..."**  
   Risk: The decomposition is common in recommender infrastructure, but may not be established as a standard state-space decomposition for ad RL.  
   Suggested revision: "One recurring pattern in large-scale recommender systems splits..."

5. **Sample efficiency paragraph: "Engineered low-dimensional features ... can converge faster..."**  
   This is now appropriately softened with "can." Keep as is.

6. **Interpretability paragraph: "Embedding-only states ... expose no low-dimensional summary an operator can read."**  
   Risk: Some systems may expose auxiliary diagnostics even if the primary state is embedding-heavy.  
   Suggested revision: "Embedding-dominated states ... often expose no directly human-readable low-dimensional summary..."

7. **Guidance paragraph: "none of the published systems directly addresses..."**  
   Risk: Strong negative claim across all cited systems. It may be defensible, but it should be framed as scope-limited.  
   Suggested revision: "Among the systems compared here, none directly addresses..."

## 4. Incorrect or Weak Citation Matches

1. **`zhao2023embedding` for offline/online decomposition.**  
   This is a broad embedding survey, not necessarily a direct source for the specific stable/offline versus non-stationary/online state decomposition.  
   Recommendation: keep only if the sentence is about general recommender embedding practice, or replace/lean more heavily on `xia2023transact` and `liu2022monolith`.

2. **`naumov2019deep` for ad embeddings.**  
   DLRM is relevant to embedding-heavy recommendation models but does not directly support all ad-specific attributes such as bid context or landing-page quality.  
   Status: The current revision narrowed the claim to "ad identity and related categorical attributes," which is safer. Keep with caution.

3. **`covington2016deep` for contextual signals in ad + organic systems.**  
   YouTube DNN supports context/user/item features in recommendation, but it is not ad-policy-specific.  
   Recommendation: acceptable as background, but pair with an ad-policy system such as `zhao2021dear` when making ad-specific claims, as the current text does.

4. **`gauci2018horizon` for engineered low-dimensional state features.**  
   Horizon is an applied RL platform and may support production RL workflows, but not necessarily the exact examples "commercial-intent scores, ad-load history, dwell quantiles."  
   Recommendation: keep only if those feature types are described in the Horizon examples; otherwise use `zhao2021dear` for request-level engineered features and leave `gauci2018horizon` for platform/workflow claims.

5. **`hohnhold2015focusing` for state drift.**  
   Strong for long-term user/business effects, but weaker for inventory/user-behavior distribution shift in the state representation itself.  
   Recommendation: pair with `gama2014survey` or `dulac2021challenges`, or restrict the claim to long-term metric drift.

6. **`glanois2024survey` for operational pre-launch review.**  
   Strong for interpretable RL generally, but not necessarily for operator review in ad systems.  
   Recommendation: keep as general support and use `gauci2018horizon` for applied RL operations.

## 5. Recommended Edits

High-priority edits:

1. Soften "exact Markovianity is unattainable" to "generally unrealistic in production ad policies."
2. Change "The state must encode..." to "A useful state representation should encode..."
3. Change "A common decomposition" to "One recurring pattern in large-scale recommender systems..."
4. Change "Embedding-only states..." to "Embedding-dominated states often..."
5. Change "none of the published systems" to "among the systems compared here, none..."

Medium-priority citation edits:

1. Add a citation to the partial-observability/latent-intent sentence in the formal definition, likely `dulac2021challenges`.
2. Add `Sutton1998` to the Markovianity-assumption sentence if the technical assumption feels unsupported after removing it from the first sentence.
3. Reconsider `zhao2023embedding` unless the surrounding text explicitly says "general recommender embedding practice."
4. Reconsider `gauci2018horizon` for the engineered-feature sentence unless it directly supports those feature examples.

Low-priority edits:

1. Reduce repeated mentions of `PinnerFormer`, `DIN`, `SlateQ`, and `DEAR` if the prose feels citation-dense, but do not remove them from system-specific claims.
2. Consider moving some citations from inline parentheticals into surrounding prose for readability.

