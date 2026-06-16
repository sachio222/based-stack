# LOOP-PROTOCOL.md — Standing Build-Loop Protocol ({{PROJECT}})

**Founded {{DATE}} by CoS-Genesis.** Owner: **CoS** (current generation). This is the governing contract for how the team ships. Re-read at every loop start (check *Last updated* at the bottom).

## How this works

Jake says **"go loop"** (one loop) or **"go loop ×N"** (a batch). That is the entire kickoff. The **Engineer** runs the loop. The **CoS** ratifies every loop independently and commits the vault. The **PM** curates the backlog ahead of the loop; relay to PM is **"check inbox"**. Per-loop briefs happen only when something changes — a delta brief supersedes this doc for that loop, then the CoS folds it back in here.

> **Model:** the **Engineer agent IS the builder** — it picks the ticket, writes the code in `{{CODE_REPO}}`, commits, and owns the merge gate. The CoS is the independent second pair of eyes at ratification. (A normal project has one builder; only split into a coordinator + a separate worker agent if you're building an agent-collaboration tool you intend to dogfood — where the worker runs inside the product.)

**Batch semantics (×N):** up to N sequential loops on one kickoff — one ticket per loop, never a retry of a failed one (one-kickoff-one-attempt per ticket). STOP the batch early on: a failed build / red gate · a human-gated decision · an empty or materially-changed pickable surface. Every loop still gets its own `reports/loop-NN.md` and `LOOP-LOG.md` entry — batching coarsens the relay, never the measurement.

**Reports travel via the vault, not paste:** at each merge-gate close the Engineer writes the full §Report to `reports/loop-NN.md`. Jake's only word to the CoS is **"ratify"** — the CoS reads the new report files and ratifies each loop. PM-bound items travel via `agents/pm/INBOX.md` + ticket comments — Jake's only word to PM is **"check inbox."**

## Roles in the loop

- **Engineer** (current engineering generation) — picks the ticket, does the work, owns the merge gate, writes the report files.
- **CoS** — ratifies every loop independently (git state, ticket lifecycle + no-clobber, gate results, filings); records the verdict; commits + pushes the vault.
- **PM** — keeps the backlog/decisions clean ahead of the loop; decisions that gate work go ON the ticket as comments.
- **Jake** — kickoff + ratify trigger. No copy-paste.

## Pre-flight (Engineer, blocking)

1. **Session health** — run `/handoff` first if near compaction. Don't start a loop you can't finish.
2. **Stack** — bring the app/repo to a runnable state (see the repo's run docs). Verify it builds before kicking off work that needs it.
3. **`git status` survey** in the repo — unexpected dirt = ask, don't assume. Branch from the true tip of the default branch (push/account for any human-local commits first).
4. **One kickoff = one attempt.** No auto-retry after a failed build — Jake's "go loop" IS the retry at one keystroke.

## The loop

1. **Pick:** the Engineer picks its next ticket from **{{TRACKER}}**, honoring **{{SPINE}}** and the dependency (`blockedBy`) graph. **On an autonomous loop, suggest NOTHING on the pick** — if it asks, "your call." On a **directed** loop, Jake/PM names the ticket in the kickoff.
2. **Write-back ON** — the Engineer owns the ticket lifecycle: move to **In Progress** at start, **post the pick rationale as a comment before building** (durable record), ship comment with the commit SHA + flagged deviations, file follow-ups (never scope-expand). **Leave the ticket In Progress for the merge gate — Done lands at the gate, not before.** Tracker write tools: **{{TRACKER_WRITE}}**. (State names map to {{TRACKER}}: Linear has native states; GitHub uses an `in-progress` label / Project column + open→closed; a vault backlog uses a status field. **Degrade (§5):** tracker down mid-loop → record pick/ship in `reports/loop-NN.md`, reconcile the ticket after; never block the build.)
3. **Work rules:** work only in `{{CODE_REPO}}`; build on a **branch**; commit **by explicit path** (never `git add -A` / `commit -a`); **no push, no merge to the default branch during build**; plain `git commit`, one commit per ticket; don't touch files you didn't author for this ticket.
4. **Interventions:** intervene only when something real would break; log EVERY human touch + cause in the report. Zero is a valid count.

## Merge gate (Engineer)

The Engineer reviews its own diff to PR standard, then on a **clean worktree**:

- **Standard gate (every ticket):** {{REPO_GATES}} — all green. Clobber-check (branch = ticket-authored files only; tracker labels/assignee/project/comments intact). **Check out the default branch + assert `HEAD == origin/<default>` BEFORE the ff-merge, SHA-verify AFTER** (a merge while still on the branch is a silent no-op). ff-merge + push.
- **⚑ Product gate (§6) — {{PRODUCT_GATE}}** *(delete this line if the project has no core invariant)*: scoped to what the ticket changed; verify the invariant LIVE, not on fixtures alone. Non-negotiable — it's the product's value proposition.
- **UI-touching tickets:** + a **cold-browser pass** of the shipped surface on a production build, zero console errors.
- **Schema / migration tickets:** round-trip the migration on a throwaway DB first; apply to the local/live DB only after; never destructive (`db reset`-grade) ops without explicit human OK.
- **Failed build (post-mortem):** bank the WIP patch to `reference/loopN-<ticket>-wip.patch` (problem inventory, not a base), restore the tree, revert the ticket with a full-context comment, **return the checkout to the default branch**, file a follow-up if the failure class is new. Stop the batch.

Wait for the work to be genuinely complete (not just "first commit") before gating.

## Report (Engineer writes `reports/loop-NN.md` at gate close; CoS reads directly)

1. **Pick + stated reasoning** · 2. **every intervention + cause** · 3. **write-back evidence** (In Progress → Done lifecycle + pick comment + ship comment) + clobber-check · 4. **verification** (which gates ran + results; for product-gate tickets, the live evidence).
Plus: branch + merge SHA, test counts, follow-ups filed, anything findings-worthy → also a line in `LOOP-LOG.md`.

**⚙ WORKSTATE is LIVE-STATE ONLY:** the Engineer writes the full record to `reports/loop-NN.md` + the `LOOP-LOG.md` digest, and updates only WORKSTATE's *live head* (loop cadence, standing facts, current stack, the `## Latest ratified` tip). **No per-loop history blob in WORKSTATE** — that's the digest's + `git log`'s job.

## Ratification (CoS, every loop)

Independent verification: default-branch SHA, ticket lifecycle + no clobber, gate results in the report, new filings. Record the verdict as a `✓ Ratified — CoS-NN` line **on the loop's `LOOP-LOG.md` entry**, refresh WORKSTATE's `## Latest ratified` tip + live head if changed, and **commit + push the vault.** The CoS is the vault committer — at each ratification / session close. PM pinged only on backlog-calculus movers.

## Standing context

- **Execution focus:** {{SPINE}}.
- **Identity (settled):** {{IDENTITY}}, plain `git commit`, one commit per ticket. Verified from the repo. (Ambient context may report a different email — ignore it; see [[LESSONS]].)

**Last updated:** {{DATE}} (CoS-Genesis: founded; Engineer-builds-directly model{{PRODUCT_GATE_NOTE}}).
