#!/bin/bash
# living-docs-stop-check: Stop hook with cheap gate before expensive update.
#
# Design: fires on every Stop event but does ~50-200ms of shell work first.
# Escalates to the full living-docs update only when scoped projects have
# uncommitted changes. Zero latency on trivial turns.
#
# Scope: ~/Agents/Workspaces/ (vaults) and ~/dev/ (code repos).
# Escalation: runs `claude -p "/update-workstate"` inline (blocks until done).

set -u

ROOTS=(
  "$HOME/Agents/Workspaces"
  "$HOME/dev"
)

# --- Phase 1: cheap gate ---

DIRTY=0

# Pass A: any tracked repo under scope with uncommitted changes?
for root in "${ROOTS[@]}"; do
  [ -d "$root" ] || continue
  while IFS= read -r gitdir; do
    repo=$(dirname "$gitdir")
    # Skip deep/nested .git directories that aren't primary repos
    case "$repo" in
      */node_modules/*) continue ;;
      */.claude/plugins/cache/*) continue ;;
    esac
    if [ -n "$(git -C "$repo" status --porcelain 2>/dev/null | head -c 1)" ]; then
      DIRTY=1
      break 2
    fi
  done < <(find "$root" -maxdepth 5 -type d -name '.git' 2>/dev/null)
done

# Pass B: if no dirty git, check for recent non-git file changes under scope
if [ "$DIRTY" = "0" ]; then
  if find "${ROOTS[@]}" -type f -newermt '10 minutes ago' \
       -not -path '*/.git/*' \
       -not -path '*/node_modules/*' \
       -not -path '*/.obsidian/workspace*' \
       -not -path '*/.claude/plugins/*' \
       2>/dev/null | head -c 1 | grep -q .; then
    DIRTY=1
  fi
fi

# --- Phase 2: gate decision ---

if [ "$DIRTY" = "0" ]; then
  # Silent no-op. No blocking, no output.
  exit 0
fi

# --- Phase 3: escalate to full update ---

# Scoped changes detected. Run the /update-workstate slash command via a
# headless Claude Code invocation. Blocks until done (usually 10-30s).
#
# The parent CC session may already be running another `claude` process;
# headless mode with --print should be safe (no shared state with the
# parent REPL).
if command -v claude >/dev/null 2>&1; then
  # Output is captured to a log for debugging but not shown inline.
  log="${HOME}/.claude/debug/living-docs-stop-check.log"
  mkdir -p "$(dirname "$log")"
  {
    echo "--- $(date -Iseconds) ---"
    claude -p "/update-workstate" 2>&1
  } >> "$log"
fi

exit 0
