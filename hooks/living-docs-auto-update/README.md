# living-docs-auto-update

A Claude Code `SessionEnd` hook that keeps **three living documents** fresh in every project you work on: `WORKSTATE.md`, `ARCHITECTURE.md`, and `CHANGELOG.md`. Runs once per session end, uses Haiku (cheap), and silently no-ops for sessions that don't touch tracked projects.

## Why

"Living documents" only live if something keeps them alive. Manual updates rot. This hook closes the drift gap automatically so a new session starting "let's work on X" can resume with full context instead of asking "what do you mean?"

## What it maintains

Per project (identified by having a `WORKSTATE.md` at its root under `~/Agents/Workspaces/` or `~/dev/`):

| Doc | When updated | What gets updated |
|---|---|---|
| `WORKSTATE.md` | Any non-trivial session | Bumps "Last updated"; adds one dated "Recently shipped" line; adjusts Now/Next/Blocked only if genuinely changed |
| `CHANGELOG.md` | Session that **shipped** something (user-visible change, new playbook, pushed commit) | Prepends a new `## YYYY-MM-DD — <title>` entry with 2–6 line summary |
| `ARCHITECTURE.md` | Session with **structural** change (new folder, reorg, new workstream, new subsystem) | Amends the folder-tree diagram + relevant tables in-place; never rewrites from scratch |

Classification is done by the hook agent reading git log + file system state. Conservative: prefers under-logging to noise.

## Install

### Option 1 — merge into your user-level settings (jq)

```bash
jq -s '.[0] * .[1]' ~/.claude/settings.json hook.json > /tmp/merged.json \
  && mv /tmp/merged.json ~/.claude/settings.json
```

### Option 2 — copy-paste

Open `~/.claude/settings.json` and merge the contents of `hook.json` into the top-level object. If `hooks.SessionEnd` already exists, append the inner hook object to its array.

### Verify

Next session you end cleanly (`/exit`, `Ctrl+D`, or `Ctrl+C` twice), Claude Code will show "Updating living docs…" briefly before exit. Check any touched project's docs for updates.

## Adopting on a new project

Drop these three files at the project root:

```
<project>/
├── WORKSTATE.md      # required — session-by-session state
├── ARCHITECTURE.md   # optional — updated only on structural changes
└── CHANGELOG.md      # optional — updated only when shipping
```

Minimum WORKSTATE:

```markdown
# Workstate

**Last updated:** YYYY-MM-DD

## Now
- (active work)

## Next
- (queued)

## Blocked
_(none)_

## Recently shipped
- YYYY-MM-DD — (seed entry)
```

ARCHITECTURE and CHANGELOG: any structure the hook can amend in-place. It preserves existing voice and conventions.

Tip: the `init-vault` skill in based-stack scaffolds all three (plus an Obsidian-vault layout) in one shot.

## Scope

- Runs on: **every** `SessionEnd` event (one Haiku inference per session end, typically < $0.01).
- Writes to: only `WORKSTATE.md`, `ARCHITECTURE.md`, `CHANGELOG.md` at project roots.
- Roots: `~/Agents/Workspaces/` (Obsidian vaults) and `~/dev/` (code repos). Edit the prompt to expand.

## Classification (how the hook decides what to update)

- **Structural change** → touch ARCHITECTURE: new top-level folder, removed/renamed category, new workstream under `projects/`, code-side new subsystem under `src/`.
- **Shipped change** → touch CHANGELOG: user-visible feature/fix, new doc that isn't a placeholder, pushed commit, new playbook.
- **Trivial** → no update: typos, whitespace, WIP, read-only sessions.
- **Anything non-trivial** → WORKSTATE gets "Recently shipped" + "Last updated" bumped (safe default).

## Tweaking

Edit the `prompt` field inline in `~/.claude/settings.json`. Common tweaks:

- **Expand scope** — add root paths to step 1's `find` command (e.g., `~/Documents/`, `~/work/`).
- **Swap model** — change `model` to a different ID for different speed/quality tradeoffs.
- **Loosen conservativeness** — remove the "trivial" skip rules to log more aggressively.

## Disable

Remove or comment out `hooks.SessionEnd` in `~/.claude/settings.json`. Hook stops firing immediately.

## Gotchas

- **Ctrl+C kills Claude Code immediately — the hook does NOT complete in time.** Tested empirically 2026-04-18. The `timeout` field in the hook config doesn't mean the process blocks until the hook finishes; it just bounds how long the hook *can* run if the process stays alive. Ctrl+C exits the CLI before the `agent` hook's inference + file edits complete. Use the [`update-workstate` slash command](../../commands/update-workstate/) for reliable updates.
- **`/exit` and `Ctrl+D` may work better** (untested) — worth keeping the hook installed as a best-effort bonus for those paths.
- **Hard-kills definitely don't fire hooks** — terminal window close, `kill -9`, crashes.
- **Hook runs with tool access** (it's an `agent`-type hook, can read and edit files). Scope rule in the prompt keeps it tight.
- **Multi-project sessions** — hook handles all projects touched, one classification per project.

## Source

Part of [based-stack](https://github.com/sachio222/based-stack). Pairs naturally with:
- `init-vault` skill — scaffolds a new vault with WORKSTATE + ARCHITECTURE + CHANGELOG pre-wired.
- `strategy-sprint` + `landing-page-refresh` playbooks — business-side workflows whose outputs feed into these living docs.
