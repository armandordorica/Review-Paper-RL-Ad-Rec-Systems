# Paper Collection Methodology: Revision And Reviewer-Risk Audit

Scope: `paper.tex`, `\section{Paper Collection Methodology}` (currently lines 119-174). Covers four prose paragraphs (lines 122, 124, 126-127, 129) and the FrozenLake vs Ad Recommendations comparison table (lines 131-174).

Latest refresh: May 17, 2026, first comprehensive audit. Builds on the deferred-decision note from the introduction audit (R7) that the FrozenLake table and references in this section need their own coordinated cleanup.

## Reviewer context used

- Associate Editor: stronger focus on ad-related aspects; clearer problem definitions; avoid repetitive material; the work has tutorial value and should highlight its industry-practitioner orientation; "please do not use references in the abstract, and please use bold-face text sparingly."
- Reviewer 1 (the most relevant single source for this section):
  - Acknowledged this section as a strength: *"The method used to identify relevant citations appears thoughtful"* and *"the selection criteria for the 153 papers they cite are good."*
  - Explicitly flagged the FrozenLake example as not contributing meaningfully (*"the Frozen Lake example does not meaningfully contribute to understanding the core problems faced in real-world ad and recommendation systems"*), and recommended *"focused, domain-relevant illustrations (e.g., simplified bandit-based ad selection examples)"* instead.
  - Explicitly flagged terminology used before definition (*"'displacement cost' appears early but is only briefly defined much later in the appendix"*).
  - Flagged the broader pattern of pedagogical overemphasis at the expense of focused, ad-specific content.
- Reviewer 2 (also a strong endorsement of this section):
  - *"The authors have clearly outlined their paper collection method. They also included related work from the industry and real-life applications, which is highly relevant, and provides a timely overview of existing methods."*
  - Asked for more citations from RL-based recommender / ad-serving literature where possible.
  - Noted that the writing and overall structure of the paper need to be improved generally.
- `revision_rules.md` directly relevant to this section:
  - §1: do not identify the sponsor company by name; defensibility; no extreme words.
  - §3: each chapter, except the first, should begin with a short introductory paragraph and end with a summary section.
  - §7.1: no redundancy, no orphans, claim-citation alignment.
  - §13: include an overall process-flow diagram if useful.
  - §17.1: reproducibility checklist (publicly available data artifacts, configuration details).
  - §17.2: methodology checklist (research question, data collection process, exclusion criteria).

## Current Overall Assessment

The methodology section is one of the **reviewer-praised** parts of the paper. Both reviewers explicitly commended either the method or the selection criteria, so the broad structure is sound. The section already:

- enumerates four distinct collection channels (foundational textbooks, curated industry list, targeted keyword searches, Google Scholar review-paper search, citation-network crawling),
- reports the final corpus size (153 papers),
- names three explicit ranking criteria (influence, industry relevance, recency),
- includes a cross-domain mapping table that grounds the MDP abstraction in concrete ad-policy terms.

The main remaining risks are:

- **Citation-claim alignment**: `russell2016artificial` is cited at line 122 as foundational for *"Contextual Bandits, Off-Policy Learning, and Offline Replay"*. Russell & Norvig is broad enough to mention MDPs in passing, but it is not a defensible foundation for off-policy learning or offline replay — those are domain-specific topics better anchored to `Sutton1998` or specialized references.
- **Missing reproducibility hygiene**: no date range for the collection window, no exclusion criteria, no description of how duplicates or near-duplicates were handled. `revision_rules.md` §17.1 explicitly calls for this kind of reporting.
- **Missing section-level scaffolding**: no opening sentence describing what the section covers, no closing summary. `revision_rules.md` §3 requires both.
- **Residual "displacement cost" mentions elsewhere in the paper** may still appear without a definition. The methodology table now defines the term inline (M3 partially resolved), but a sweep of other body mentions is still needed.
- **Goal row in the comparison table** still uses *"without compromising user experience"* — the same absolute construction softened in the introduction (intro audit I4). Worth a follow-up consistency edit.
- **Redundancy with the introduction**: the closing sentences of paragraph 4 (line 129) restate the paper's overall structure, which is already covered by the structure paragraph at line 117.

Estimated reviewer-aligned score: **8.5 / 10**, up from 7.75 / 10 after M2 (FrozenLake content) was resolved by dropping the FrozenLake column from the comparison table and rewriting the line 129 prose to remove the toy-example framing. M3 (displacement-cost term) is partially resolved by the inline gloss in the restructured table now appearing in the main body. The remaining gap is held by smaller phrasing and reproducibility hygiene items, plus the `russell2016artificial` citation-claim alignment fix.

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

### Reviewer-flagged content (partially resolved)

- <span style="background:#7c1d1d;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P0</span> <span style="background:#ffc107;color:black;padding:2px 8px;border-radius:4px;font-weight:bold">PENDING REVIEW</span> **M3 (partially resolved).** *"Displacement Cost Threshold"* still appears at the equivalent line inside the restructured table, but the inline gloss in the table now sits in the main body (no longer only deferred to the appendix), and the term is preceded by a definition (*"A measure of the opportunity cost for showing an ad"*). Reviewer 1's complaint was that *"displacement cost appears early but is only briefly defined much later in the appendix"*; the table now provides the early definition in the main body. Verify whether *"displacement cost"* (lowercase, narrative usage) appears anywhere else in the paper without an inline definition and either define on first use or replace the references. If no other unmoored uses exist, this can be moved to Resolved.

### Citation-claim alignment

- <span style="background:#dc3545;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P1</span> <span style="background:#6c757d;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">TODO</span> **M4.** Audit the *"foundational academic works"* claim at paragraph 1 (line 122). Currently cites `Sutton1998`, `agarwal2016statistical`, and `russell2016artificial` as foundations for *"Markov Decision Processes (MDPs), Contextual Bandits, Off-Policy Learning, and Offline Replay."* Issues:
  - `russell2016artificial` (Russell & Norvig AI textbook) is broad enough to mention MDPs in passing but is not a defensible foundation for *"Contextual Bandits, Off-Policy Learning, and Offline Replay"* — these are specialized topics better anchored to `Sutton1998` or domain-specific references.
  - Consider replacing `russell2016artificial` with a more on-target source for the specialized topics, or narrowing the foundational-topic list it is attached to. `revision_rules.md` §7.1 third bullet (claim-citation alignment) applies.
- <span style="background:#dc3545;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P1</span> <span style="background:#6c757d;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">TODO</span> **M5.** Verify `agarwal2016statistical` placement at line 122. The same citation is also used in the introduction at line 105 for the *"outcomes depend on the policy that generates the subsequent trajectory"* claim. Both uses appear defensible (it is a textbook on statistical methods for recommender systems), but cross-check the textbook framing is the intended use here, and remove if the *"Statistical Methods for Recommender Systems"* italicized title in the prose is meant to do the work without needing a citation.

### Reproducibility and methodology hygiene

- <span style="background:#dc3545;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P1</span> <span style="background:#6c757d;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">TODO</span> **M6.** Add a date / collection window. Currently the methodology gives no time window for the search ("papers were collected" but no start/end dates). `revision_rules.md` §17.1 calls for this kind of configuration detail. A simple sentence such as *"The search was conducted between [dates] and includes papers published through [date]"* would close this gap.
- <span style="background:#dc3545;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P1</span> <span style="background:#6c757d;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">TODO</span> **M7.** Specify exclusion criteria. The section reports ranking criteria (influence, industry relevance, recency) but does not describe how papers were filtered out. A brief sentence on exclusion (e.g., *"Papers were excluded if they did not involve recommendation, advertising, or RL components, or if they lacked methodological detail sufficient to evaluate the approach"*) closes a gap that `revision_rules.md` §17.2 explicitly flags.
### Section-level scaffolding

- <span style="background:#fd7e14;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P2</span> <span style="background:#6c757d;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">TODO</span> **M9.** Add a 1-2 sentence opening paragraph that frames what the section covers and how it is organized. `revision_rules.md` §3 requires this for every chapter / section past the first. Currently the section opens directly with *"To ensure broad coverage..."* with no orientation.
- <span style="background:#fd7e14;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P2</span> <span style="background:#6c757d;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">TODO</span> **M10.** Add a brief closing summary that pulls the section together before the historical-overview section begins. The current section ends with the FrozenLake table caption and segues abruptly into the next section. `revision_rules.md` §3 ("each chapter ... should end with a summary section") and §5 ("make the 'so what' explicit") both apply.
- <span style="background:#fd7e14;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P2</span> <span style="background:#6c757d;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">TODO</span> **M11.** Consider whether a process-flow diagram (search channels → ranking → final 153 papers) would add value. `revision_rules.md` §13 explicitly suggests this for methodology sections. Optional but reviewer-friendly given Reviewer 2's broader structure complaint.

### Redundancy with the introduction

- <span style="background:#fd7e14;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P2</span> <span style="background:#6c757d;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">TODO</span> **M12.** Paragraph 4 (line 129) restates the paper's overall structure (*"To contextualize the selected works, this survey builds from the ground up... a review of how each component is operationalized in industry"*). This duplicates the structure paragraph at line 117 in the introduction. Trim or remove the structural restatement.

### Prose polish

- <span style="background:#fd7e14;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P2</span> <span style="background:#6c757d;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">TODO</span> **M13.** Tighten *"While recent and highly cited work was prioritized, papers introducing novel methodologies were also included regardless of citation count"* (line 129). The two clauses are not cleanly parallel; consider restructuring as a single explanatory sentence or splitting into "criteria + exception".
- <span style="background:#fd7e14;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P2</span> <span style="background:#6c757d;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">TODO</span> **M14.** Fix double-space typo on line 124 *("...LinkedIn),  surfacing additional papers")* — two spaces between *"),"* and *"surfacing"*.
- <span style="background:#6c757d;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P3</span> <span style="background:#6c757d;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">TODO</span> **M15.** Verify `van2024practical` and `bietti2021contextual` placements. Both are cited as examples of papers found via the curated list and citation crawling respectively. Cross-check that the bib entries actually correspond to the work intended and that they are used elsewhere in the paper (otherwise these are decorative single-cite entries).

## Citation Adequacy Scores

Scores use a 1-10 scale:

- 9-10: directly supports the attached claim and is well placed.
- 7-8: mostly appropriate but broad, indirect, or supporting only part of the sentence.
- 5-6: plausible but weakly aligned or too general for the attached claim.
- 1-4: likely mismatched and should be removed or replaced.

| Citation | Uses In Methodology | Where Used | Adequacy | Assessment |
|---|---:|---|---:|---|
| `Sutton1998` | 1 | P1 line 122, foundational RL textbook | 10 | Canonical fit. The standard reference for MDPs, value-based and policy-based RL, off-policy learning. Best-placed of the three foundational citations. |
| `agarwal2016statistical` | 1 | P1 line 122, foundational stats for recsys | 8 | Defensible fit but the *"Statistical Methods for Recommender Systems"* title is doing most of the work in the prose. The citation is appropriate; just verify the framing is the intended one. Already cited in the introduction (line 105) for a more specific claim about policy-dependent outcomes — the two uses are for different facets, so the repetition is defensible. |
| `russell2016artificial` | 1 | P1 line 122, foundational AI/MDP textbook | 5 | Weakly aligned. Russell & Norvig is a broad AI textbook; it covers MDPs but is not a defensible foundation for *"Contextual Bandits, Off-Policy Learning, and Offline Replay."* Either replace with a more on-target source or narrow the foundational-topic list it is attached to. See M4. |
| `zhao2020jointly` | 2 | P2 line 124 (curated list), P3 line 126 (citation crawling source) | 9 | Direct fit for both uses. Both are descriptive citations naming an actual paper that participated in the methodology; this is appropriate self-referential bookkeeping rather than a substantive RL claim. Each use is for a distinct facet (curated-list example vs citation-network seed). |
| `zhao2021dear` | 2 | P2 line 124 (curated list), P3 line 126 (citation crawling source) | 9 | Same as `zhao2020jointly`. Distinct facets, appropriate use. |
| `sagtani2024ad` | 1 | P2 line 124 (curated list) | 9 | Direct fit. Industrial ad-load balancing paper named as a curated-list example. |
| `van2024practical` | 1 | P2 line 124 (curated list) | 8 | Direct fit if the bib entry is the intended *"Practical Bandits"* work. Verify (M15). |
| `levine2020offline` | 1 | P3 line 126 (citation crawling source) | 9 | Direct fit. Foundational offline-RL tutorial; appropriate as a citation-network seed. |
| `yan2020ads` | 1 | P3 line 126 (found via crawling) | 9 | Direct fit. Named as a paper discovered via the citation-network crawl from the seeds. |
| `bietti2021contextual` | 1 | P3 line 126 (found via crawling) | 8 | Direct fit if the bib entry corresponds to *"A Contextual Bandit Bake-off"*. Verify (M15). |

**Citation tally**

- Unique citations in the methodology: 10.
- Total citation tokens: 12.
- Re-cited within the methodology: `zhao2020jointly`, `zhao2021dear` (2 each — used as both curated-list examples and citation-network seeds, defensible distinct facets).
- All citations in this section are descriptive (naming papers that participated in the methodology) rather than substantive (claiming external knowledge), so the §7.1 alignment risk is lower than in the introduction.

## Resolved Revision Items

- <span style="background:#7c1d1d;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P0</span> <span style="background:#198754;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">DONE</span> **M1.** Anonymized the curated-list source in paragraph 2 (line 124). Replaced *"a curated list of 10-15 papers referenced within Pinterest's Ad Policy team was also compiled"* with *"14 papers from an industry curated reading list were also compiled"*. Resolution chosen over a transparency-with-disclosure path because the byline already lists University of Toronto as both authors' affiliation; adding employment disclosure would have *created* a Pinterest connection that does not otherwise exist in the paper, contrary to the author's intent to publish as an independent academic. The keyword-search company list at line 124 retains *"Pinterest"* alongside the other six platforms — now neutral methodology reporting rather than a sponsor disclosure. The `revision_rules.md` §1 sponsor-anonymity rule is satisfied by removal of the only sponsor-implying mention, without requiring §1 itself to be reframed.
- <span style="background:#dc3545;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P1</span> <span style="background:#198754;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">DONE</span> **M8.** Replaced the vague *"10-15 papers"* with the exact count *"14 papers"* in the same edit that resolved M1. The curated-list count is now reproducible at the level of cardinality, even though the individual papers on the list beyond the four named examples are not explicitly enumerated (the four examples plus the criteria stated elsewhere are sufficient).
- <span style="background:#7c1d1d;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">P0</span> <span style="background:#198754;color:white;padding:2px 8px;border-radius:4px;font-weight:bold">DONE</span> **M2.** Removed the FrozenLake content per Reviewer 1's explicit feedback that *"the Frozen Lake example does not meaningfully contribute to understanding the core problems faced in real-world ad and recommendation systems."* Two coordinated edits: (1) prose at line 129 rewritten to drop the *"toy example such as the Frozen Lake"* framing and the *"comparison between the toy example and real-world implementation parallels"* table reference, replacing them with a direct framing of the survey as a per-component review of how MDP components are operationalized in industrial recommender systems; (2) comparison table restructured from three columns (MDP Component / FrozenLake Example / Ad Recommendations) to two columns (MDP Component / Ad Recommendations), with column widths adjusted (was `p{2.5cm}|p{3cm}|p{8cm}`, now `p{2.5cm}|p{11cm}`, same total width) and the caption updated from *"Comparison of Frozen Lake Example and Large-Scale Recommendation Systems..."* to *"Mapping of MDP Components to Large-Scale Recommendation Systems for Ad Policy Optimization."* Every Ad Recommendations cell is preserved verbatim, so no ad-policy content was lost.

## Out of scope for this file

- The FrozenLake content elsewhere in the paper (lines beyond the methodology) is addressed by intro audit R7 (the preview sentence is already removed) and any future per-section audits.
- The "comparison table later in the paper" mentioned in earlier conversations (the policy-learning comparison table at lines 791-892 or thereabouts) is out of scope for this audit; it lives in the policy-learning subsection.
- Citation audits for body sections live in `reward_design_citation_audit.md`, `state_space_citation_audit.md`, and `policy_learning_citation_audit.md`.
- Abstract revisions live in `abstract_revision_todo.md`. Introduction revisions live in `introduction_audit.md`. Document-wide revision conventions live in `revision_rules.md`.

## Working rules

- Apply changes one at a time, with explicit approval per item, consistent with the repo workflow.
- Preserve `paper.tex` paragraph style. Do not reflow existing paragraphs in the source unless the change explicitly says so.
- When proposing replacement text in chat, wrap suggestions in fenced `latex` blocks with short physical line widths, per `format-suggested-sentences.mdc`.
- When updating an item's status, swap the colored status badge in place (TODO -> IN PROGRESS -> PENDING REVIEW -> DONE).
- When an item is resolved, move it from Pending to Resolved with a one-line summary of how it was resolved.
- Apply the §7.1 citation audit checks (no redundancy, no orphans, claim-citation alignment) to every change.
- M2 (FrozenLake content) is the largest pending change in scope: it includes both prose and a 40-line table. Discuss the high-level decision (drop / replace / restructure) before applying.
