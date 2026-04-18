# update-workstate

A Claude Code **slash command** that keeps living documents (`WORKSTATE.md`, `CHANGELOG.md`, `ARCHITECTURE.md`) fresh in projects you work on. Synchronous counterpart to the `living-docs-auto-update` hook.

## Why this exists

The `SessionEnd` hook in this repo works on paper but fails in practice because **Ctrl+C kills Claude Code immediately** — the hook's agent doesn't get time to complete inference + file edits before the process dies. Verified empirically on 2026-04-18 (see `feedback_sessionend_hooks.md` memory).

This slash command sidesteps that. It runs in the parent session (no async handoff), so it completes reliably before any exit path.

## What it does

Two phases:

1. **Detect-first / early-exit.** Cheap check: did this session actually touch files under `~/Agents/Workspaces/` or `~/dev/` in a non-trivial way? Skip WebSearch, reads, `git status`, typo fixes, out-of-scope edits. If nothing qualifies → one-line no-op.

2. **Classify and update.** For each qualifying project, decide trivial / shipped / structural, then update only the docs that apply:
   - `WORKSTATE.md` for any non-trivial change
   - `CHANGELOG.md` for shipped changes
   - `ARCHITECTURE.md` for structural changes

Conservative by design. Output is one line per project touched, or a clear no-op reason.

## Install

Claude Code reads user-level slash commands from `~/.claude/commands/`. Copy the command file there:

```bash
mkdir -p ~/.claude/commands
cp command.md ~/.claude/commands/update-workstate.md
```

Then `/update-workstate` is invokable from any session.

## Usage

Type `/update-workstate` at any point:

- After a milestone (shipped a feature, wrote a doc, pushed a commit)
- Before a risky exit (terminal about to close, laptop battery dying)
- As a sanity check after a long session

Example outputs:

```
LanguageAcademy: WORKSTATE + CHANGELOG updated
Main: WORKSTATE only
no-op (read-only session)
no-op (only edits under ~/.claude/, which is out of scope)
no-op (nothing qualifies)
```

## Scope

- Reads / edits only: `WORKSTATE.md`, `CHANGELOG.md`, `ARCHITECTURE.md` at project roots.
- Project root = any directory with a `WORKSTATE.md` under `~/Agents/Workspaces/` or `~/dev/`.
- Does not commit, push, or invoke other skills.

## Tweaking

The command's logic lives in `command.md` (Markdown with YAML frontmatter). To adjust scope, edit the root-paths list. To change the trivial threshold, edit the "Explicitly NOT worth documenting" section.

## Pairs with

- [`hooks/living-docs-auto-update/`](../../hooks/living-docs-auto-update/) — the `SessionEnd` hook version. Aspirational; relies on `SessionEnd` firing cleanly (which it doesn't on Ctrl+C). Keep both installed: the hook *might* fire on `/exit`, and if it does it's a bonus; the slash command is the reliable primary mechanism.
- `init-vault` skill — scaffolds a new vault with all three living docs pre-wired so this command has targets on day one.

## Source

Part of [based-stack](https://github.com/sachio222/based-stack).
