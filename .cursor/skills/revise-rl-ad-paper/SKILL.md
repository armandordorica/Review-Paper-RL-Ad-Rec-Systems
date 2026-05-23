---
name: revise-rl-ad-paper
description: Revises and audits the RL ad-policy review paper using ACM TORS reviewer feedback, project revision rules, citation-audit standards, and section audit-file conventions. Use when editing paper.tex, creating or updating docs/agent/*_audit.md files, assessing reviewer risk, checking citation alignment, or deciding whether prose, tables, figures, or evaluation discussion should stay in the manuscript.
---

# Revise RL Ad-Policy Review Paper

## Purpose

Use this skill for the review paper in this repository:

`paper.tex`

The paper targets ACM Transactions on Recommender Systems and surveys reinforcement learning for monetization-aware ranking, especially joint optimization of ads and organic content in large-scale recommender systems.

## Source Documents

Before doing substantive revision or audit work, read the relevant project guidance:

- `SKILL.md` for repository-wide writing, LaTeX, and domain conventions.
- `docs/agent/reviewers.txt` for the Associate Editor and reviewer feedback.
- `docs/agent/revision_rules.md` for document-wide revision priorities.
- `docs/agent/Guidelines for Algorithm Papers.txt` for ACM TORS methodology and evaluation expectations.
- Existing section audits in `docs/agent/*_audit.md` when working on a section with an audit file or creating a new one.

## Reviewer Priorities

Optimize for these reviewer-facing outcomes:

- Strengthen the ad-policy and joint ad plus organic recommendation focus in every section.
- Replace generic RL or recommender pedagogy with domain-specific analysis.
- Add critical comparison of methods: trade-offs, assumptions, constraints, practical deployment implications, and reported performance where available.
- Improve evaluation coverage: online A/B testing, offline replay, counterfactual estimators, simulator-based testing such as RecSim, KPIs, long-term metrics, and real-world reported outcomes.
- Define technical terms at first use, especially ad-policy terms such as displacement cost, ad load, logging policy, support, proxy metrics, and utility function.
- Audit citations for claim alignment, not just topical similarity.
- Fix presentation issues: table and figure labels, float placement, readable figures, sparse boldface, no references in the abstract.

Preserve the paper's strengths:

- The topic is timely and industry-relevant.
- The paper collection methodology and 153-paper corpus are reviewer-praised.
- The tutorial value is useful, but only when it directly supports the ad-policy argument.

## Revision Principles

Apply these rules during every edit:

- Every paragraph must answer: how does this help explain RL for monetization-aware ranking or joint optimization of ads and organic content?
- If a sentence could appear unchanged in a generic RL tutorial, cut it, compress it, or rewrite it with an ad/recommender example.
- Use standard methods and equations only as much as needed for the survey's argument. Cite textbook sources rather than teaching the method at length.
- Separate authorial synthesis from prior work. Use language such as "we introduce", "we synthesize", or "this taxonomy compares" for project-created frameworks.
- Support every nontrivial claim with a citation.
- Keep one well-placed citation per claim unless multiple sources support genuinely distinct facets.
- Do not introduce causal links unless the source or surrounding argument directly supports causality. When the evidence only supports sequence, association, or co-evolution, use non-causal phrasing such as "coincided with", "accompanied", "was followed by", or "created a setting in which".
- Avoid overclaiming. Prefer "suggests", "indicates", "can", "may", or "is associated with" when evidence is limited.
- Use bold sparingly and only for structural labels, not emphasis in running prose.
- Avoid em dashes. Use commas, colons, semicolons, parentheses, or sentence splits.
- Do not add tables or figures unless they provide synthesis that prose cannot provide more clearly.

## Evaluation Framing

When discussing evaluation, use this workflow:

- The candidate design space is large: policies, state definitions, action discretizations, reward functions, constraints, and rollout strategies can combine into an intractable search space.
- Offline replay and related counterfactual methods are used to narrow the candidate set with logged data before deployment.
- A/B testing remains the gold standard for causal online validation of promising candidates.
- Present offline replay and A/B testing as complementary tools: offline methods provide broad screening coverage, while A/B tests provide high-confidence online validation.
- Do not imply that offline replay replaces A/B testing, or that A/B testing can feasibly test every candidate design.

## Tables And Figures

Before keeping or adding a table, ask:

- Does the table synthesize multiple papers, systems, or trade-offs that would be hard to scan in prose?
- Does the text walk the reader through the table's takeaway before or immediately after the table?
- Is the table positioned near first reference?
- Are labels and captions correct and automatically referenced?
- Is the table more than a two-row restatement of nearby prose?

If the table only contrasts one or two simple ideas, fold it into prose. For example, A/B testing versus offline replay is better stated as a workflow unless expanded into a fuller evaluation framework.

## Citation Audit Checks

For each citation in a revised passage:

- No orphaned claims: every external claim has a source.
- No redundant citations: avoid repeating the same citation for the same claim across adjacent sentences.
- Claim-citation alignment: the cited paper must support the exact claim attached to it.
- Domain fit: ad-policy or recommender-specific claims should not rely only on generic RL sources unless the sentence is purely definitional.
- Adequacy score: use 9-10 for direct support, 7-8 for mostly aligned support, 5-6 for weak or broad support, and 1-4 for likely mismatch.

## Section Audit Workflow

Create or update section audits in `docs/agent/` when a section has meaningful reviewer risk, many citations, or unresolved structure issues.

Use filenames like:

- `introduction_audit.md`
- `methodology_audit.md`
- `reward_design_citation_audit.md`
- `state_space_citation_audit.md`
- `policy_learning_citation_audit.md`

Use this structure:

```markdown
# [Section Name]: Revision And Reviewer-Risk Audit

Scope: `paper.tex`, [section/subsection and current line range].

Latest refresh: [date and short context].

## Reviewer context used

- Associate Editor: [section-relevant points].
- Reviewer 1: [section-relevant points].
- Reviewer 2: [section-relevant points].
- `revision_rules.md`: [specific sections used].

## Current Overall Assessment

[Concise assessment of what is working, what remains risky, and an estimated reviewer-aligned score if useful.]

## Legend

[Use the existing priority/status badge legend from nearby audit files.]

## Pending Revision Items

### [Category]

- [priority badge] [status badge] **ID.** Concrete issue, why it matters, and recommended resolution.

## Citation Adequacy Scores

| Citation | Uses | Where Used | Adequacy | Assessment |
|---|---:|---|---:|---|

## Resolved Revision Items

- [priority badge] [DONE badge] **ID.** What changed and why it resolved the issue.

## Out of scope for this file

- [Boundaries so future agents do not mix unrelated work.]

## Working rules

- Apply changes one at a time when the user wants approval-gated revision.
- Preserve `paper.tex` paragraph style unless reflow is explicitly requested.
- Move resolved items from Pending to Resolved with a one-line explanation.
- Apply the citation audit checks to every proposed change.
```

## Editing Workflow

When asked to revise `paper.tex`:

1. Read the relevant section and any matching audit file.
2. Identify whether the requested edit affects reviewer risks, citations, floats, or section structure.
3. Propose the smallest reviewer-aligned change when the user is asking for judgment or approval.
4. Edit only the intended passage.
5. Check for broken references or labels when removing tables, figures, equations, or citations.
6. Run lints after substantive edits.
7. If asked to compile, follow `README.md`: use `./build_timestamped_pdf.sh` for timestamped PDFs.

When asked to create or refresh an audit:

1. Read the section in `paper.tex`.
2. Read the reviewer feedback and revision rules.
3. Inspect citations in the section and score adequacy.
4. Record pending items with concrete, actionable fixes.
5. Record resolved items separately so the audit remains useful as a work queue.

