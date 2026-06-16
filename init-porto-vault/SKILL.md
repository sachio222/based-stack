---
name: init-porto-vault
description: Use when the user wants to stand up a multi-agent team operating system — a CoS/PM/Engineer/Product agent org with a build-loop, generational handoffs, and governance docs — inside a project vault, new or existing. Triggers include "init porto vault", "set up the agent team here", "I want the multi-agent team operating system for this project", "spin up a CoS/PM/engineer/product team", "stand up CoS/PM/engineer/product agents".
---

# init-porto-vault

## Overview

Stands up a **multi-agent team operating system** inside a project's Obsidian vault: a CoS / PM / Engineering / Product agent org that runs a repeatable build-loop, rotates generations through outcome-shaped handoffs, and keeps its state in git-tracked governance docs. It's a project-agnostic pattern — this skill stands it up for **any** project, new or existing.

**Core principle:** the vault becomes both the product-strategy home AND the coordination layer for the team building it. The team operates on thin relays — **"go loop ×N"** (Engineer) · **"ratify"** (CoS) · **"check inbox"** (PM) — and every boundary crossing (handoff, ratification, kickoff) sources from primary artifacts, never a summary of a summary.

**You are standing up the team as its founding CoS** (CoS-Genesis), unless the user says otherwise.

## When to use

- The user wants a project run by a team of agents (CoS/PM/Engineer/Product) instead of ad-hoc sessions.
- They've seen a multi-agent team setup work elsewhere and want the same for their project.
- A vault exists (or will) and they want the loop + handoff + governance scaffolding.

**Not for:** a one-off task; a project that just needs a CLAUDE.md; scaffolding a *plain* vault with no team (use `init-vault` for that).

## Required background

- **`init-vault`** — if the project has NO vault yet, run that FIRST to create the canonical layout, then layer this OS on top.
- **`handoff`** — drives generational rotation (it provides the *successor* boot-block template + the §-rotation mechanics). This skill creates the *founding* (genesis) boot-blocks; `handoff` takes over at the first rotation. Don't duplicate it.

## The procedure

Four phases: **Survey → Resolve forks → Build → Verify.** Don't skip Survey — the whole point is to ground the OS in *this* project, not photocopy a template.

### Phase 0 — Survey (gather; never guess)

Collect these before writing anything. Read the vault, the paired repo, and the tracker — peek primaries.

| What | How | Why it matters |
|---|---|---|
| **Vault exists?** | `ls` the target path | If not → run `init-vault` first, then continue here. |
| **Vault git-tracked?** | `git -C <vault> rev-parse --is-inside-work-tree` | The CoS commits the vault at each ratification (§1). |
| **Paired code repo** | find it; `git remote -v`; `git log --format='%an <%ae>'` | The loop builds here. **Commit identity comes from the repo — VERIFY it, never assume** (see Common Mistakes). **Tiebreaker if `git config` / `git log` authorship / `remote` disagree:** real recent `git log` authorship wins; flag the discrepancy to the human; never silently pick. |
| **Repo gates** | `package.json` scripts / `Makefile` / `pyproject` / CI config | The merge gate runs these (typecheck/lint/test/build). |
| **Issue tracker** | Linear MCP configured? GitHub issues? Just the vault? | The Engineer picks tickets from here; adapt the loop's pick + write-back step. |
| **Product + spine** | vault docs, repo CLAUDE.md, tracker initiatives | Grounds the boot-blocks' "what this is" + the loop's execution focus + the north-star question. |
| **Product invariant** | what's the core quality the product lives or dies on? | Becomes the §6 product gate (e.g. a security-review gate on auth/secret changes; a live-reconciliation gate on financial-calc changes). May be none. |

### Phase 1 — Resolve forks (ask the human)

Use `AskUserQuestion`. Three genuine forks (everything else has a sensible default — state it, don't ask):

1. **Version-control the vault?** — *git init locally now (CoS commits at ratification; remote is the user's to create later)* vs *leave untracked*. Default: git init locally.
2. **Which role boot-blocks now?** — *PM + Engineer + Product (full team; Product sits ready)* vs *just what they're spinning up*. The CoS is always you (genesis). Default: all three.
3. **The product gate (§6)** — propose the project's core invariant as a verification gate (from Survey) and confirm, or confirm there's none. Don't invent one that doesn't fit.

Other defaults you just apply (mention them): Engineer **builds directly** (no separate worker-agent split — see Adaptation); WORKSTATE is **live-state-only**; the relay vocab is **go loop / ratify / check inbox**.

### Phase 2 — Build

1. **Snapshot first (reversibility).** If git-initting: write `.gitignore`, `git init`, set the vault's `user.name`/`user.email` to the **verified** identity, commit the current state as `Initial vault snapshot (pre team-OS scaffold)` — the reversal point for every edit that follows. **If the vault is already tracked:** note the current HEAD as the reversal point, AND confirm the vault's own `git config user.email` matches the verified identity (an existing vault may be committing as a *different* identity — reconcile or flag; same trap as Common Mistakes).
2. **Create dirs:** `mkdir -p agents/{cos,pm,engineering,product}/00-genesis reports`.
3. **Write governance docs** from `templates/` with substitutions (see Placeholders): `LOOP-PROTOCOL.md`, `DECISIONS.md`, `LESSONS.md`, `LOOP-LOG.md`.
4. **Write the org:** `agents/README.md` (from template), `agents/pm/INBOX.md` (from template), the three genesis boot-blocks (from `templates/genesis-boot-block.md`, one per role using the Role-fills table below), the small lineage READMEs + `reports/README.md` (generate from the specs below — they're trivial).
5. **Wire existing docs** — for each, **edit if present, create from the canonical pattern if missing** (an existing vault may lack some). The **seed note** = the vault's landing/orientation note, usually `<VaultName>.md`. `WORKSTATE.md` → live-state-only + a `## Team` head; `CLAUDE.md` → read-first order (WORKSTATE→LESSONS→DECISIONS→LOOP-PROTOCOL→repo CLAUDE.md), the team model, the governance-commitments list, verified identity, and **delete any aspirational "living-docs auto-hook" line** (the CoS commits the vault — there is no hook); `README.md` + `ARCHITECTURE.md` + seed note → add the team + the new top-level docs + `agents/`/`reports/`.
6. **Memory:** write one project memory (the team OS is stood up — roles, relay, key adaptation, the product gate) + a one-line `MEMORY.md` pointer, in `{{MEMORY_DIR}}`.
7. **Commit** the scaffold (`Stand up the multi-agent team OS (CoS-Genesis)`). The author is the verified `{{IDENTITY}}` (the human — never list them as a co-author). Append whatever co-author trailer *your environment* mandates (e.g. the Claude Code `Co-Authored-By` line from your global config), if any — don't invent one.

### Phase 3 — Verify + hand back

- `git ls-files | sort` (or `find`) → show the tree; confirm `git status` clean.
- Tell the human **how to spin up each role**: open a fresh session in the vault, paste `agents/<role>/00-genesis/boot-block.md`, expect the **3-bullet handshake**, reply "handshake first" if it's missing. Then the relay is just go-loop / ratify / check-inbox. Flag the **single-writer** rule (one session writes a given repo at a time).
- Surface only the parked open questions that actually apply from Survey (v1 Definition of Done; product name *if* it's a working name; vault remote *only if* not yet created).

## Placeholders (fill every one from Survey)

`{{PROJECT}}` vault/project name · `{{DATE}}` founding date · `{{PRODUCT_ONE_LINER}}` what it is, one line · `{{CODE_REPO}}` paired repo path (or "none yet — loop targets the repo once it exists") · `{{REPO_GATES}}` the actual commands (e.g. `npm run type-check · npm run lint · npm run test · npm run build`) · `{{IDENTITY}}` verified `Name <email>` + host + remote protocol · `{{TRACKER}}` e.g. `Linear team KEY` / `GitHub issues` / `vault backlog` · `{{TRACKER_WRITE}}` how the Engineer writes back (Linear `save_issue`/`save_comment`; `gh issue edit`; etc.) · `{{SPINE}}` the execution focus (initiative/epic/phase ladder) · `{{PRODUCT_GATE}}` the §6 invariant + how to verify it live (or omit if none) · `{{NORTH_STAR}}` v1 Definition of Done (or "open question — record framing, don't lock") · `{{MEMORY_DIR}}` the vault's project-memory dir = `~/.claude/projects/<vault absolute path with every `/` replaced by `-`>/memory/` (peek its `MEMORY.md` — it holds the project memories the roles inherit).

Lines in templates that cite a doc/path that doesn't exist for this project: **delete them** (§4 — never cite an unverified path).

## Role-fills (for the genesis boot-blocks)

Each boot-block is the generic 10-part founding brief (`templates/genesis-boot-block.md`) filled with:

| Role | Owns | Does NOT | First assignment | Skills |
|---|---|---|---|---|
| **CoS** (you — genesis) | coordination, ratifying the loop, vault hygiene, **committing the vault** | write product code | *(none — you're already active; you just stood up the OS)* | — |
| **PM** | the backlog: scoping, tiering, prioritization; decisions baked onto tickets | write code; run the loop; pre-decide parked Qs | make the backlog loop-ready (confirm tracker items exist, sized, ordered by dependency + spine phase; flag product-gate-critical tickets) | `shape-up`, `jobs-to-be-done`, `continuous-discovery`, `writing-plans` |
| **Engineering** | the build-loop: pick → build in the repo → merge gate → report | re-scope tickets; decide strategy | prove the loop end-to-end on ONE ticket (pre-flight gates green → pick → branch-build → merge gate → report → ratify) | `systematic-debugging`, `test-driven-development`, `verification-before-completion`, `using-git-worktrees` |
| **Product** | strategy: monetization, pricing, positioning, the wedge, feature vision | file tickets (hands strategy to PM); write code | the positioning + monetization foundation (prepare, don't pressure) + help frame the v1 DoD | `pricing-strategy`, `obviously-awesome`, `jobs-to-be-done`, `testing-business-ideas`, `lean-startup` |

The small READMEs are one paragraph each — generate them:
- `agents/cos/00-genesis/README.md` — role + **the founding act** (what you stood up, the snapshot SHA), where the role is documented, retirement via `/handoff`, `Successor: none yet`.
- `agents/{pm,engineering}/00-genesis/README.md` + `agents/product/README.md` — role one-liner, pointer to `boot-block.md`, the tracker/contract, "rotate via `/handoff`", `Successor: none yet`. (Product's notes "ready, not yet booted" if not activated.)
- `reports/README.md` — "one `loop-NN.md` per loop, written by the Engineer at gate close; the CoS reads it to ratify; digest line goes to `LOOP-LOG`."

## Adaptation guidance (the judgment calls — don't photocopy)

- **New vs existing project.** No vault → `init-vault` first. Existing vault with content → layer onto it; don't clobber real notes; snapshot before editing.
- **No code repo yet.** The loop still works — point `{{CODE_REPO}}` at the future repo and note "repo TBD"; the Engineer's first assignment becomes scaffolding it.
- **Tracker varies.** Linear MCP present → use it (`save_issue`/`save_comment`). Else GitHub issues (`gh issue edit`/`comment`/`create`), or a vault-based `notes/backlog.md`. Adapt the loop's pick + write-back lines; the loop shape is identical. **Map the state vocabulary too** — "In Progress / Done at the gate" is Linear-native; GitHub has no native In-Progress, so use an `in-progress` label or a Project column + open→closed; a vault backlog uses a status field. Fix the mapping at founding. **Degrade (§5):** if the tracker/MCP is unreachable mid-loop, the Engineer still records pick rationale + ship SHA in `reports/loop-NN.md` and reconciles the ticket when it's back — never block the build on the tracker.
- **The §6 product gate is the highest-value adaptation.** Identify the one thing the product lives or dies on and make a merge-gate check for it: e.g. a security-sensitive app → a `/security-review` pass on auth/secret/path tickets; a financial-modeling app → **live reconciliation** on calc/statement-engine tickets (fixtures can hide render-time drift). If the project has no such invariant, **mark §6 reserved (do NOT renumber — §7 cross-refs must stay stable)** and drop the trust-gate lines — don't manufacture one.
- **The Engineer builds directly (default).** For a normal app there's one builder: the Engineer session writes the code. Only split it into a coordinator + a separate worker agent if you're building an agent-collaboration tool you intend to dogfood (where the worker runs inside the product) — otherwise don't.
- **Don't copy a source project's specifics:** its north-star, internal vocabulary, frozen IDs, or dogfood-evidence framing. Keep only the *governance* (anti-photocopy, outcome-handoffs, epistemic-status, integration-optionality, vault-backbone) — those are universal; re-derive everything product-specific from *this* project.

## Common mistakes

| Mistake | Fix |
|---|---|
| **Guessing commit identity** | Read it from the repo's `git config` + `git log` + `remote`. An ambient email baked into convention once → 30 misattributed commits + a history rewrite. Identity is verify-from-source, not assume. |
| Photocopying a source project's north-star / dogfood bits | Those don't transfer. Port governance, re-derive the product spine from *this* project. |
| Giving a genesis a `handoff.md` | Genesis has no predecessor → no `handoff.md` yet. It writes one when IT retires (via `/handoff`). Founding briefs are `boot-block.md` only. |
| Putting per-loop history in WORKSTATE | WORKSTATE = live-state only. History → `LOOP-LOG` + `reports/` + `git log`. |
| Editing existing vault docs without a snapshot | Commit the pre-state first; it's the reversal point. |
| Inventing a §6 gate that doesn't fit | If there's no core invariant, mark §6 reserved (don't renumber — §7 cross-refs depend on it). A forced gate becomes loop friction. |
| Asking forks you can answer | Survey first. Only ask the 3 genuine forks; default and state the rest. |

## Verify the skill works (before relying on it)

This is a technique skill — test by **application**: dispatch a subagent with a described project (e.g. "a Rust CLI, existing vault, GitHub issues, no Linear") and the path to this SKILL.md, and ask it to produce the scaffolding *plan* + the filled identity/tracker/gate values. Check it (a) surveys before asking, (b) verifies identity from the repo, (c) adapts the tracker + product gate correctly, (d) doesn't photocopy a source project's specifics. Plug any gap, re-test.
