# DECISIONS.md — Locked Decisions ({{PROJECT}})

The citable register of decisions the team treats as settled. Cite them by § number in handoffs, tickets, and proposals. To overturn one, re-litigate explicitly and annotate the entry (strikethrough + date + reason) — never silently.

**Founded {{DATE}} by CoS-Genesis.** §1–§7 are the governance foundation ported from the porto team's operating principles + grounded in {{PROJECT}}'s product. The team adds product/strategy/architecture decisions below as they accrue (§8+).

---

## Governance foundation (§1–§7) — these shape how all work slots in

### §1 — Vault is the persistence backbone
The vault is git-tracked and is the source of truth for coordination state. Write to a vault file before reaching for a heavier store. The vault (`agents/`, WORKSTATE, LESSONS, DECISIONS, reports, plans) outlives any single session.

### §2 — Anti-photocopy
Cross-boundary context always sources from **primary artifacts** (git log, ticket comments, the live code, LESSONS, the handoff's peek pointers) — never a summary of a summary. A successor reads the handoff fully, then peeks primaries on specific questions.

### §3 — Outcome-shaped handoffs
A handoff is **necessary AND sufficient**: every section earns its place; first-session necessities are inlined at one hop; deeper context stays peek-able. Rotation runs through the `/handoff` skill (see `agents/README.md`).

### §4 — Epistemic status (a bare assertion doesn't cross a boundary)
Before any claim enters a handoff/boot-block, check it against the settled-facts registry in [[LESSONS]]. SETTLED claims carry their evidence pointer; everything else is verified fresh or labeled `ASSUMPTION:` inline. **A stale risk handed to a successor becomes an instruction to fear it and stall** — re-validate before writing fears down. A successor obeying the handoff must never be slower than a fresh agent reading the memories.

### §5 — Integration-optionality (degrade, not break)
External integrations — the issue tracker / MCP, GitHub, local services — **degrade, they don't hard-break the loop.** No single-point-of-failure that wedges the team if a tool is down. Build the seam for absence.

### §6 — {{PRODUCT_INVARIANT_TITLE}} ({{PROJECT}}'s core invariant)
*{{Fill with the project's core quality invariant — the one thing the product lives or dies on — and the rule it imposes on engineering. Example (nvmber5): "Trustworthy-with-receipts — never change calculation/statement logic in isolation; validate controls + reconciliation LIVE (running app, real scenario), not just fixtures, because the dual-engine hazard hides render-time drift behind green tests." Example (porto): "security review on auth/secret/path/multi-tenant surfaces before merge." If the project has NO such invariant, change this heading to **§6 — (reserved; no product-specific invariant for this project)** and remove the §6 trust-gate lines in LOOP-PROTOCOL / the boot-blocks. **Do NOT renumber** — §7 and every cross-reference to it must stay stable.}}*

### §7 — One commit per ticket; branch-build; no scope creep
The Engineer builds on a branch, commits by explicit path (one commit per ticket — makes archaeology cheap), and never expands scope mid-ticket: discoveries become **filed follow-up tickets**, not silent additions. Merge happens at the gate, not during the build.

---

## Product / strategy / architecture decisions (§8+)

*(none yet — the team fills this as decisions are locked.)*

---

## Open questions parked for the human (record framing, don't pre-decide — §4)

- **What is {{PROJECT}}'s v1 Definition of Done?** {{NORTH_STAR}}
- {{Other parked questions — product name, vault remote, etc.}}
