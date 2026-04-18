# living-docs-auto-update (DEPRECATED — hook-based approach doesn't work)

**Status: deprecated.** Claude Code's `SessionEnd` agent hook does not fire reliably — tested empirically 2026-04-18. Ctrl+C exits the CLI before the hook can complete, and `/exit` / `Ctrl+D` paths produced no observable hook execution either. Keeping the files here for reference only.

## Use this instead

→ [`commands/update-workstate/`](../../commands/update-workstate/) — a slash command (`/update-workstate`) that runs in the parent session and completes reliably. Manual invocation, but 100% reliable.

## Why hooks failed for this use case

- **`SessionEnd` agent hook**: wired up and installed correctly, but target files never got modified after Ctrl+C×2 or `/exit`. Likely: the CLI terminates before the hook's agent completes its LLM inference + file edits. The `timeout` field in the hook schema does not block process exit as I initially assumed.
- **`Stop` hook (command type)**: fires on every assistant turn. Even with a cheap-check-first design, the blocking before each user prompt is too disruptive — 10+ seconds per trivial turn. User rejected.
- **`PostToolUse` / `FileChanged`**: fire even more frequently; same disruption problem.

## Files

- `hook.json` — the original agent-hook config. Do not install.
- This README — explains what was attempted and why it didn't work.

## When this might work in the future

If Claude Code's hook runtime gains a guarantee that `SessionEnd` blocks process exit until hooks complete (with a configurable max), the agent-type hook here could work. Until then, don't rely on it.

## Related

- `feedback_sessionend_hooks.md` in user memory documents the empirical test.
- `commands/update-workstate/` is the active replacement.
