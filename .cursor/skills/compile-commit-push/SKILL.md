---
name: compile-commit-push
description: Saves current project edits, recompiles the LaTeX paper using README-documented instructions, commits the intended source and generated PDF artifacts, and pushes to GitHub. Use when the user asks to save, recompile, commit, push, publish, sync to GitHub, or run the paper's edit-to-push workflow.
---

# Compile, Commit, And Push

## Source Of Truth

Before running any build, commit, or push command, read `README.md` and follow its current "Daily workflow: edit -> compile -> push" instructions. If this skill conflicts with `README.md`, the README wins.

At the time this skill was created, the README-documented timestamped PDF workflow was:

1. Run `./build_timestamped_pdf.sh`.
2. Commit `paper.tex` and the generated `paper_YYYY-MM-DD_HHMM.pdf`.
3. Push with `git push`.

## Workflow

1. Confirm the user explicitly asked to commit and push. Do not commit or push on an ambiguous request.
2. Read `README.md` and identify the current compile/commit/push instructions.
3. Inspect the working tree with:
   - `git status --short`
   - `git diff`
   - `git log --oneline -5`
4. Save-state note: Cursor/tool edits are already written to disk. If there are editor-only unsaved buffers outside tool edits, ask the user to save them before compiling.
5. If the commit includes revisions to `paper.tex`, identify the corresponding `docs/agent/*_audit.md` file for the edited section and update it before compiling:
   - move completed items from pending to resolved,
   - add new unresolved risks discovered during the edit,
   - preserve the audit file's existing status/priority style,
   - if no audit file exists for the edited section, decide whether the change is small enough to proceed without one and mention that decision in the final report.
6. Compile using the README-documented command. Prefer the timestamped PDF workflow when the user asks to push a PDF artifact.
7. After compiling, inspect `git status --short` again and identify the newly generated timestamped PDF.
8. Stage only relevant files:
   - intended source files changed for this task,
   - the generated timestamped PDF requested by the README workflow,
   - corresponding audit files updated for the edited paper sections,
   - skill files only if they are part of the user's requested changes.
9. Do not stage secrets, unrelated user edits, LaTeX intermediate files, or broad build artifacts unless the README explicitly requires them.
10. Draft a concise commit message that describes the reviewer-facing or paper-facing purpose of the change.
11. Commit using a heredoc message.
12. Run `git status` after committing to verify the branch state.
13. Push only after a successful commit and only because the user explicitly asked for push.
14. Report the commit hash, pushed branch, generated PDF filename, corresponding audit updates, and any files intentionally left unstaged.

## Safety Rules

- Never run destructive git commands such as `git reset --hard` or `git checkout --` unless the user explicitly requests and approves them.
- Never use `--no-verify`, force push, amend, or rebase unless the user explicitly requests it and the normal git safety checks permit it.
- If compile fails, stop before committing and report the failure.
- If a `paper.tex` revision has a corresponding audit file and the audit has not been updated, stop before committing and update the audit first.
- If unrelated changes are present, leave them unstaged and mention them.
- If README instructions fail, report the failure before using any fallback.

## Example Invocation

User:

```text
/compile-commit-push compile, commit, and push this revision
```
