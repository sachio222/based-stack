# agents/ — agent lineages + the rotation process

Per-role agent lineage records for {{PROJECT}}, per [[DECISIONS]] §2 (anti-photocopy) + §3 (outcome-shaped handoffs). Ported from the porto team. Manual process, driven by the `/handoff` skill.

## The team

| Role | Owns | Does NOT |
|---|---|---|
| **CoS** (`cos/`) | Coordination, ratifying the build loop, vault hygiene, **committing the vault** | Write product code |
| **PM** (`pm/`) | The backlog — scoping, tiering, prioritization; decisions baked onto tickets | Write code; run the loop |
| **Engineering** (`engineering/`) | The build loop — picks tickets, writes code in `{{CODE_REPO}}`, owns the merge gate | Re-scope tickets unilaterally |
| **Product** (`product/`) | Strategy — monetization, pricing, positioning, feature vision, the wedge | File tickets (hands strategy to PM); write code |

Jake is founder; he decides. The relay is deliberately thin: **"go loop ×N"** (Engineer) · **"ratify"** (CoS) · **"check inbox"** (PM).

## Lineages

| Role | Generations | Current |
|---|---|---|
| `cos/` | 00-genesis (founded the team OS, {{DATE}}) | **CoS-Genesis active** |
| `pm/` | (booting) | **PM-Genesis** — boot block at `pm/00-genesis/boot-block.md` |
| `engineering/` | (booting) | **Engineer-Genesis** — boot block at `engineering/00-genesis/boot-block.md` |
| `product/` | (ready) | **Product-Genesis** — boot block at `product/00-genesis/boot-block.md` |

Layout per generation: `agents/<role>/<NN-name>/` with `README.md` (lineage entry) + `handoff.md` (the §3 handoff, written at rotation) + `boot-block.md` (the one-paste unit that boots the next generation).

## The rotation process (repeatable — follow exactly)

> **Executable version: the `/handoff` skill** drives this whole process — the §4 verification, the outcome-shaped handoff, the lineage record, and the one-unit successor boot block with handshake + rules. Invoke it rather than hand-rolling; this doc is the rationale + reference.

**Trigger:** context nearing limits, a natural chunk boundary, or a role change. Prefer rotating at a chunk boundary over mid-ticket.

1. **Write the handoff** → `agents/<role>/<NN-name>/handoff.md` (§3 outcome-shaped). Author preference: (a) the retiring agent writes it as its last act; (b) if already retired, the CoS distills it from the agent's reports (acceptable under §2 — reports are primary relay artifacts). Every section passes *necessary AND sufficient*. **§4 re-validation (mandatory):** before any claim enters the handoff, check it against the [[LESSONS]] settled-facts registry — SETTLED claims carry their evidence; everything else is verified fresh or labeled `ASSUMPTION:`. A stale risk handed down becomes an instruction to stall.
2. **Create the generation README** — lineage entry: generation number, role, period, predecessor/successor, transcript pointer.
3. **Cross-pull LESSONS** — the handoff's mistakes / known-NOT-to-do / known-unknowns pull the role-relevant subset from [[LESSONS]] by reference, not duplication.
4. **Assemble the successor boot block** — ONE self-contained paste unit (amendments relayed separately get dropped — the "Relay-gap" lesson). Use the `/handoff` skill's `boot-block-template.md`. It MUST carry two behavioral rules: **(a) peek-before-ask** (check predecessor artifacts before asking the human); **(b) a declined question is not a yes** (a declined/skipped decision stays blocked).
5. **Successor verification handshake — BLOCKING.** The boot block instructs the successor to open its first report with **3 bullets**: (a) where we are, (b) what it's about to do, (c) one thing the handoff says NOT to redo. **The CoS checks those bullets against the handoff BEFORE ratifying or relaying any work — if absent or prose-shaped, the only reply is "handshake first."**
6. **Single-writer rule:** at most ONE active session holds write authority over a given repo (the vault, or the code repo) at a time. Rotation isn't complete until the predecessor's session is CLOSED — an open predecessor is a live writer. Destructive git ops (force-push, history rewrite, shared-branch rebase) additionally require the repo idle (no `index.lock`, clean tree) and the human's confirmation the predecessor is closed.
7. **Update lineage records** — this README's table, WORKSTATE (rotation noted in the live head), and the predecessor's README gets its successor field filled.

## How to introduce a NEW role (reusable pattern)

A new role's founding brief (`00-genesis/boot-block.md`) carries, in order: **1.** Identity (who, generation, founding the role) · **2.** What {{PROJECT}} is (30-second orientation + team roster + where they slot) · **3.** Role + boundaries (what they own and explicitly do NOT) · **4.** Boot sequence (primary artifacts to read) · **5.** Standing rules (peek-before-ask, declined-is-not-yes, identity guardrail, §2/§3/§4, justify-scope) · **6.** Comms + where work lives (the human's "brief" preference, the lane to PM/CoS/Jake, the lineage folder) · **7.** Skills · **8.** Retirement (`/handoff` at context limit) · **9.** Verification handshake (the blocking 3 bullets) · **10.** First assignment (one concrete starting task).
