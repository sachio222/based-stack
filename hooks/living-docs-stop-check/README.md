# living-docs-stop-check (DEPRECATED — too disruptive)

**Status: deprecated.** Stop hooks fire on every assistant turn. Even with the cheap-check-first design in `hook.sh` (git status across scoped roots, early-exit on clean), the per-turn latency was too disruptive in practice (tested 2026-04-18). User rejected.

## Use this instead

→ [`commands/update-workstate/`](../../commands/update-workstate/) — a slash command invoked manually when you want living docs fresh. No per-turn latency.

## Files

- `hook.sh` — shell script with cheap-check + escalation to `claude -p /update-workstate`. Do not install.
- This README — explains what was attempted and why it didn't land.

## Related

- `hooks/living-docs-auto-update/` — the earlier SessionEnd variant (also deprecated).
- `commands/update-workstate/` — the active replacement.
