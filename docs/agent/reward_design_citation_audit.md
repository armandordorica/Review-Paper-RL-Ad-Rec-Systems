# Reward Design: Citation And Reviewer-Risk Audit

Scope: `paper.tex`, `Reward Design for Monetization-Aware Recommendation Systems`, lines 334-655, current as of May 9, 2026.

Reviewer context used:

- Reviewers asked for a stronger focus on ad policies and joint ad + organic optimization.
- Reviewers asked for deeper comparison of methods, trade-offs, assumptions, and real-world performance.
- Reviewers specifically flagged limited discussion of joint optimization and reward design for long-term metrics.
- Reviewers asked for clearer evaluation discussion, including metrics, counterfactual estimators, reported results, and practical evaluation workflows.
- Reviewers flagged citation mismatch risk and broad claims attached to insufficiently specific sources.

## Current Overall Assessment

This section is one of the more reviewer-aligned parts of the paper. It has:

- an explicit subsection goal,
- a clear shift from proxy metrics to utility functions,
- tables of revenue, engagement, and fatigue proxies,
- a dedicated discussion of why blending ad and organic signals is structurally hard,
- a comparison table across TikTok, Alibaba, and LinkedIn formulations,
- a critical comparison of blending mechanisms, ad reward, organic reward, limitations, reported results, and practitioner guidance.

The main remaining risks are not that the section is too generic overall. Instead, they are:

- some broad reward-design claims are stated before citations or with only broad support,
- several proxy-table rows lack direct citations,
- the offline-RL paragraph may overstate what the cited offline-RL sources support for reward-formulation search,
- some reported-results claims are qualitative and may need exact reported metrics or careful attribution,
- the table and prose use several low-level headings and formatting choices that may need alignment with the rest of the paper.

## 1. Citation Adequacy Scores

Scores use a 1-10 scale:

- 9-10: directly supports the attached claim and is well placed.
- 7-8: mostly appropriate but broad, indirect, or supporting only part of the sentence.
- 5-6: plausible but weakly aligned or too general for the attached claim.
- 1-4: likely mismatched and should be removed or replaced.

| Citation | Where Used In Current Reward-Design Text | Adequacy | Current Assessment |
|---|---|---:|---|
| `mcdonald2023spotify` | Delayed long-term outcomes; high-intent actions; long-horizon engagement; long-term holdouts/proxies | 8 | Strong practical industry source for optimizing long-term engagement without waiting for delayed outcomes. Not ad-specific, so best paired with ad-specific reward sources. |
| `zhang2018whole` | Multi-objective reward specification; CTR/revenue/Click Yield; Alibaba constrained whole-page optimization; utility comparison table; reported results | 9 | Directly relevant to whole-page ad allocation and joint ad + organic objectives. One of the strongest reward-design anchors. |
| `yan2020ads` | Multi-objective ad allocation; CTR/pCTR/revenue; bid/pCTR ad utility; LinkedIn constrained optimization; shadow bid; reported results | 9 | Direct fit for feed ad allocation and constrained optimization. Strong support for monetization-aware ad policy. |
| `sagtani2024ad` | Multi-objective ad-load balancing; canonical utility form; ad-load reward context | 9 | Direct ad-load/off-policy learning source. Strong fit for reward design and joint marketplace trade-offs. |
| `wang2022surrogate` | Surrogate metrics for long-term user experience; high-quality consumption; diversity; repeated consumption; time to revisit | 8 | Strong for surrogate long-term engagement metrics in recommendation. Not ad-specific, but well aligned with long-term proxy discussion. |
| `mazoure2021improving` | Risk that short-term proxies can misrepresent long-term objectives | 8 | Good support for long-term metric optimization in recommender systems. Broad rather than ad-specific. |
| `43887` | Clicks/short-term signals and long-term business/user outcomes | 7 | Relevant long-term experimentation source, but appears to duplicate `hohnhold2015focusing`. Prefer one consistent key. |
| `hohnhold2015focusing` | Long-term outcomes, holdouts, calibration difficulty, validation limits, long-term fatigue | 8 | Strong practical long-term evaluation source. Current use is appropriate, but duplicate bibliography keys should be cleaned up. |
| `silberstein2020ad` | Ad close/mitigation and degraded ad experience | 7 | Relevant to ad-quality/user-experience harm, but less direct for the broader claim that high CTR does not imply high ad quality. |
| `xu2023optimizing` | Long-term value, 30-day sessions, auction-based recommender optimization | 8 | Strong for long-term auction/recommender objectives. Good support for longer-horizon engagement metrics. |
| `sagtani2023quantifying` | Ad fatigue dimensions and click entropy | 9 | Direct source for user fatigue/ad-load signals. Strong fit for the fatigue proxy table. |
| `pan2023learning` | Short-view, early-skip, non-completion as implicit negative feedback | 8 | Strong for implicit negative feedback in industrial short-video recommendation. Not ad-specific, but good support for negative engagement proxies. |
| `zhao2018recommendations` | Skip / not-click rate and negative feedback | 7 | Relevant to negative feedback via DRL recommendations. Less ad-specific and may not directly support every example in the table. |
| `wu2017returning` | User return rate / long-term engagement | 8 | Good support for return-based engagement. General recommender source, not ad-specific. |
| `wu2018beyond` | Relative watch time / engagement in online video | 7 | Relevant to watch-time engagement metrics. Not ad-specific and not necessarily reward-design-specific. |
| `yi2014beyond` | Dwell time as engagement/personalization signal | 8 | Direct support for dwell time beyond clicks. General personalization source. |
| `carrion2021blending` | Context-sensitive valuation / virtual bids for blending ads and organic content | 9 | Directly relevant to blending advertising with organic content. Strong fit for unit-conversion and virtual-bid discussion. |
| `zhao2021dear` | TikTok/DEAR reward formulation; binary ad/user-experience reward; reported results | 9 | Direct ad-policy/RL source. Strong support for DEAR formulation and production ad impression setting. |
| `zhao2020jointly` | Jointly learning to recommend and advertise; separate reward functions; live validation of weights; table/results | 9 | Direct support for joint ad + recommendation reward design. Strong fit. |
| `gauci2018horizon` | A/B validation, reward search cost, exhaustive experimentation cost | 6 | Horizon is useful for production RL workflow, but current attachment to reward-weight A/B experimentation costs is somewhat broad. Pair with experimentation/evaluation sources if keeping these claims. |
| `swaminathan2015counterfactual` | Offline replay, logged bandit feedback, counterfactual estimation | 9 | Direct support for counterfactual evaluation from logged feedback. Strong fit. |
| `dudik2011doubly` | Counterfactual estimation and doubly robust evaluation | 9 | Direct support for counterfactual/off-policy evaluation. Strong fit. |
| `levine2020offline` | Offline RL, logged data as surrogate, out-of-distribution risk | 8 for offline RL limits; 5 for reward-formulation search | Strong general offline-RL source, but weaker for the specific claim that offline RL actively searches over reward formulations. |
| `chen2022off` | Offline RL staying close to behavior policy; production recommender off-policy learning | 8 | Strong for off-policy actor-critic in recommendation. Less direct for reward-design search specifically. |
| `mcmahan2013ad` | pCTR modeling/cold-start ad-click prediction challenges | 8 | Strong source for large-scale ad click prediction and sparse ad modeling. Appropriate for pCTR modeling challenges. |

## 2. Missing Or Under-Specified Support

### 2.1 Opening reward properties are mostly uncited

Current claim:

```tex
In principle, an effective reward signal ... should satisfy at least three properties.
```

Risk:

The properties are plausible and useful, but they read like a normative taxonomy. If they are the paper's analytical lens, say so. If they are from the literature, cite reward-design or real-world RL sources. Reviewers asked for claims to be substantiated and for definitions to be clear.

Recommended next edit:

```tex
As an analytical lens for the systems reviewed here, we evaluate reward signals along three dimensions...
```

Priority: medium.

### 2.2 Partial observability claim lacks a direct citation

Current claim:

```tex
reward design is constrained by partial observability...
```

Risk:

The claim is technically sound, but no citation appears until later in the sentence for sparse/delayed outcomes and multi-objective specification. A reviewer may see this as another broad RL assertion.

Recommended next edit:

Add a real-world RL or recommender citation to the partial-observability clause, or tie it explicitly to observable proxy metrics in the reviewed ad/recsys systems.

Priority: medium.

### 2.3 Several proxy-table rows lack direct support

Examples:

- pCTR has no citation in the revenue proxy table.
- Ad impressions has no citation.
- Session Duration and Shares have no citation.
- Some polarity assignments are asserted without a direct source.

Risk:

The table is useful, but reviewers specifically flagged citation alignment and evaluation metrics. A table of metrics should make clear which entries are directly reported in cited systems and which are synthesized/common-practice examples.

Recommended next edit:

Add a footnote or table note:

```tex
Rows summarize metrics reported in the cited systems and related recommender-evaluation work; uncited examples are included as common operational proxies and should be interpreted as illustrative.
```

Or add direct citations row by row.

Priority: high.

### 2.4 Offline RL as reward-formulation search may be under-supported

Current claim:

```tex
Offline RL extends this further by not only evaluating fixed configurations but actively searching for improved reward formulations within the space of possible configurations...
```

Risk:

`levine2020offline` supports offline RL from logged data and distribution-shift risks. `chen2022off` supports off-policy actor-critic in recommenders. Neither necessarily supports "searching for improved reward formulations" as opposed to learning a policy under a specified reward. This is the biggest citation-fit risk in the section.

Recommended next edit:

Soften and distinguish reward search from policy optimization:

```tex
Offline RL can support this process once a candidate reward formulation has been specified: logged data can be used to learn or evaluate policies under that reward before live deployment...
```

Priority: high.

### 2.5 Reported-results paragraph needs more exact evidence

Current location:

```tex
\textbf{Reported results.}
```

Risk:

The paragraph says systems report improvements, but often not exact magnitudes. Reviewer 1 explicitly asked for quantitative results from existing studies where possible.

Recommended next edit:

For each cited system, verify whether exact online/offline numbers are available. If exact values are not public, state that explicitly and avoid implying comparable quantitative evidence across systems.

Priority: high.

## 3. Overclaiming / Wording Risks

### 3.1 "Relatively simple reward functions may be sufficient"

Current claim:

```tex
Relatively simple reward functions may be sufficient in controlled settings...
```

Risk:

This is plausible but not cited and may sound like a universal principle. The section can avoid the broad premise and instead contrast controlled RL examples with monetization-aware recommendation systems.

Recommended next edit:

```tex
In controlled examples, the reward is often directly specified and immediately observable. In monetization-aware recommendation systems, reward design is harder because...
```

Priority: low to medium.

### 3.2 "Canonical utility function" may overstate consensus

Current claim:

```tex
A canonical utility function at the policy layer to blend ads and organic content can be represented as follows...
```

Risk:

"Canonical" implies an established standard. The cited systems support a representative abstracted form, but not necessarily a field-wide canonical formulation.

Recommended next edit:

```tex
A representative abstract form of a policy-layer utility that blends ads and organic content is:
```

Priority: high.

### 3.3 "Reward design is substantially harder" needs framing

Current claim:

```tex
The second problem, reward design, is substantially harder...
```

Risk:

The contrast is intuitively right, but "substantially harder" is evaluative. It is supported by the combinatorial argument that follows, but the sentence would be stronger if framed as "typically harder to operationalize at scale" or "harder in this setting."

Recommended next edit:

```tex
The second problem, reward design, is harder to operationalize at scale...
```

Priority: medium.

### 3.4 "This makes offline RL a natural fit"

Current claim:

```tex
This makes offline RL a natural fit for reward design in large-scale systems...
```

Risk:

"Natural fit" is broad and promotional. It also inherits the citation-fit issue from the previous offline-RL sentence.

Recommended next edit:

```tex
This makes offline methods useful for narrowing candidate policies before live experimentation...
```

Priority: high.

### 3.5 "Sidesteps the unit-conversion problem"

Current claim:

```tex
This sidesteps the unit-conversion problem by treating engagement as a hard constraint...
```

Risk:

This is a reasonable interpretation of the constrained formulation, but "sidesteps" may imply the problem disappears. In practice, the Click Yield threshold still requires calibration.

Recommended next edit:

```tex
This avoids choosing a direct additive exchange rate between revenue and engagement, but moves the calibration burden to the threshold \(T\).
```

Priority: medium.

## 4. Incorrect Or Weak Citation Matches

### 4.1 `43887` and `hohnhold2015focusing` appear to duplicate the same paper

Risk:

Both bibliography keys appear to refer to Hohnhold, O'Brien, and Tang's long-term optimization paper. Using both keys can create unnecessary duplicate references and citation inconsistency.

Recommended next edit:

Standardize on one key, likely `hohnhold2015focusing`, and replace `43887` where it appears.

Priority: medium.

### 4.2 `gauci2018horizon` for A/B reward-weight validation is broad

Risk:

Horizon supports production RL infrastructure and off-policy evaluation, but the current paragraph uses it to support practical A/B validation of utility weights and the cost of many treatment arms. This may be too indirect.

Recommended next edit:

Pair with experimentation sources such as `hohnhold2015focusing` or rephrase so `gauci2018horizon` supports offline RL workflow rather than A/B testing practice.

Priority: medium.

### 4.3 `silberstein2020ad` does not fully support "high CTR does not imply high ad quality"

Risk:

The paper is relevant to ad-close mitigation and user experience in native ads, but it may not directly establish the general high-CTR/low-quality claim.

Recommended next edit:

Either cite a more direct ad-quality or clickbait/short-term metric source, or soften the sentence:

```tex
clicks may still fail to capture downstream user satisfaction...
```

Priority: medium.

## 5. Evaluation And Reported-Results Gaps

### 5.1 The section discusses metrics, but not enough evaluation protocol

Risk:

The reviewer request was not only "list metrics"; it was also "how evaluation is done in practice." This section has A/B testing, long-term holdouts, counterfactual estimation, and reported results, but it could more explicitly synthesize the evaluation workflow.

Recommended next edit:

Add a short synthesis sentence after the validation paragraph:

```tex
Taken together, the reviewed systems suggest a staged evaluation workflow: offline counterfactual screening of candidate reward or policy configurations, short-horizon online experiments for immediate engagement and revenue, and longer holdouts for retention or fatigue effects.
```

Priority: high.

### 5.2 Table rows mix metrics, utility components, and optimization objectives

Risk:

The proxy tables list metrics, while Table `utility-comparison` lists reward components and objectives. The distinction is present in the prose, but readers may still conflate proxy metrics with utility functions.

Recommended next edit:

Add a one-sentence bridge before Table `utility-comparison` explaining that the table compares utility formulations, not raw proxy metrics.

Priority: medium.

## 6. Structural / Presentation Risks

### 6.1 Bold run-in headings inside critical comparison

Current examples:

```tex
\textbf{Blending mechanism.}
\textbf{Representation of ad reward.}
```

Risk:

The associate editor asked to use bold sparingly. These headings are useful, but if the section is long, `\paragraph{...}` or a compact list structure may be more consistent.

Recommended next edit:

Either keep them if the style is now used consistently across the paper, or convert to formal paragraph headings without bold-in-text styling.

Priority: low to medium.

### 6.2 Table formatting may be difficult to read

Risk:

Reviewer 2 flagged unreadable tables/figures and table placement. Table `utility-comparison` has dense minipages, equations, and narrow columns.

Recommended next edit:

If time permits, simplify the table into shorter cells and move detailed equations into prose or footnotes. Ensure the table appears near its first reference.

Priority: medium.

### 6.3 Need a clearer closing transition

Risk:

The section ends with practitioner guidance, which is useful, but it may need a clearer transition into the next MDP component/state-space discussion.

Recommended next edit:

Add a short closing sentence linking reward design to state/action representation:

```tex
These reward choices also constrain the state and action representations discussed next, because the system must observe enough context to estimate the selected proxies and expose enough control levers to optimize them.
```

Priority: medium.

## 7. Reviewer-Weighted Recommended Next Edits

The ranking below prioritizes the issues most directly tied to the reviewer comments: reward-design depth, long-term metrics, evaluation workflow, joint ad + organic optimization, and citation alignment.

### Highest Priority

1. Revise the offline-RL paragraph so it does not imply that offline RL directly searches over reward formulations unless a direct source is added.
   - Reviewer basis: citation alignment and substantiated claims.
   - Concrete edit: distinguish offline policy evaluation/optimization under a specified reward from the separate design problem of choosing the reward.

2. Add a staged evaluation-workflow synthesis.
   - Reviewer basis: reviewers explicitly asked for practical evaluation strategies, metrics, counterfactual estimators, and real-world studies.
   - Concrete edit: connect offline counterfactual screening, short-horizon A/B tests, and long-term holdouts in one concise paragraph or sentence.

3. Verify and sharpen the reported-results paragraph.
   - Reviewer basis: Reviewer 1 asked for quantitative results where available.
   - Concrete edit: add magnitudes where papers report them; otherwise attribute qualitatively and state when exact magnitudes are not public.

4. Add direct support or a table note for uncited proxy metrics and polarity assignments.
   - Reviewer basis: reviewers flagged evaluation metrics and citation alignment.
   - Concrete edit: cite missing rows or label them as illustrative/common operational proxies.

### High Priority

5. Replace "canonical utility function" with "representative abstract form."
   - Reviewer basis: avoid overclaiming and unsupported field-wide language.

6. Soften "natural fit" and other promotional offline-RL phrasing.
   - Reviewer basis: avoid overclaiming, especially for production relevance.

7. Standardize duplicate Hohnhold citations.
   - Reviewer basis: citation hygiene and reference accuracy.

### Medium Priority

8. Clarify the distinction between proxy metrics and utility formulations before Table `utility-comparison`.
   - Reviewer basis: definitions and organization.

9. Improve table readability if the PDF shows dense or small text.
   - Reviewer basis: Reviewer 2 specifically flagged table/figure readability and placement.

10. Add a closing transition from reward design to state/action representation.
    - Reviewer basis: organization and guided structure.
