---
description: Detect meaningful changes in this session and update WORKSTATE/CHANGELOG/ARCHITECTURE living docs — early-exit if nothing qualifies
---

Update living documents (`WORKSTATE.md`, `CHANGELOG.md`, `ARCHITECTURE.md`) for every project touched this session. Two phases: **detect first**, then update only if warranted.

## Phase 1 — Relevance check (early-exit-friendly)

Before doing any expensive analysis, answer: **did this session actually change anything worth documenting?**

A change is worth documenting if it meets BOTH criteria:

1. **In scope** — modified a file under `~/Agents/Workspaces/` (Obsidian vaults) or `~/dev/` (code repos).
2. **Non-trivial** — meaningful edit or file creation that a future session would want context on.

**Explicitly NOT worth documenting** (skip these — do not even scan further):

- WebSearch or WebFetch calls that didn't result in any file write
- Read-only operations: `Read`, `Grep`, `Glob`, `ls`, `cat`, `head`, `tail`
- Bash queries that didn't mutate files: `git status`, `git log`, `pnpm --version`, `which X`, `file X`
- Pure chat responses with no tool use
- Edits to files under `.git/`, `node_modules/`, `.obsidian/workspace*`, `/tmp/`
- Typo / whitespace fixes alone
- Creating throwaway files you then deleted in the same session

**Detection steps (run cheap commands in this order):**

1. Check session context for any `Write`, `Edit`, `NotebookEdit` tool calls, or `Bash` calls that clearly mutated files (redirects, `mkdir`, `mv`, `rm`, `cp`, `git commit`, `git push`). If zero such calls → print `no-op (read-only session)` and STOP.

2. For any `Write`/`Edit` target paths that aren't under `~/Agents/Workspaces/` or `~/dev/` → ignore them. If all writes were out-of-scope → print `no-op (no scoped writes)` and STOP.

3. Quick `git -C <repo> status --porcelain` on any repos that look like they have changes, to spot-check that the writes actually produced diffs. If a repo shows clean → no doc update needed there.

4. If after filtering, you're left with **zero qualifying changes across all projects** → print `no-op (nothing qualifies)` and STOP.

Only proceed to Phase 2 if at least one project has qualifying changes.

## Phase 2 — Classify and update

For each project with qualifying changes:

Classify the session's work for that project:

- **Structural** (touches ARCHITECTURE): new top-level folder, removed/renamed folder, new major workstream under `projects/`, new subsystem under `src/`, vault layout reorg.
- **Shipped** (touches CHANGELOG + WORKSTATE Recently-shipped): user-visible change landed — new feature, new non-placeholder doc, pushed commit on release branch, new playbook, activated integration.
- **Non-trivial but not shipped** (WORKSTATE only): WIP that advanced meaningfully, new subfolder, updated major doc. Logs to WORKSTATE but not CHANGELOG.

Then update only the docs that apply:

### `WORKSTATE.md` (always, for any qualifying change)
- Bump `**Last updated:**` to today's date.
- Add ONE dated entry under `## Recently shipped` (1–3 lines). Match the file's existing voice.
- Update `## Now` / `## Next` / `## Blocked` only if the active initiative genuinely shifted.

### `CHANGELOG.md` (only for shipped changes)
- Prepend a new `## YYYY-MM-DD — <short title>` section under the intro.
- 2–6 lines summarizing what shipped. Reference commit SHAs if available.
- Honor "Newest first" convention if the file declares it.

### `ARCHITECTURE.md` (only for structural changes)
- Amend the folder-tree diagram and relevant tables in-place.
- Add rows for new categories/workstreams.
- Never rewrite from scratch — preserve voice and structure.

## Constraints

- Touch only `WORKSTATE.md`, `ARCHITECTURE.md`, `CHANGELOG.md` at project roots under scoped paths.
- Preserve `[[wikilinks]]`, headers, section order.
- Don't commit, don't push, don't invoke other skills.
- Conservative: under-log rather than pollute.

## Output

One line per project touched, or `no-op` with reason. Examples:

- `LanguageAcademy: WORKSTATE + CHANGELOG updated`
- `Main: WORKSTATE only`
- `no-op (read-only session)`
- `no-op (only edits under ~/.claude/, which is out of scope)`
- `no-op (nothing qualifies)`

This is the synchronous counterpart to the `SessionEnd` `living-docs-auto-update` hook. Unlike the hook (which dies on Ctrl+C), this runs in the parent agent and completes reliably. Invoke after milestones, before risky exits, or anytime you want living docs current.
