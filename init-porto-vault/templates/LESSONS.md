# LESSONS.md — Standing Retrospective ({{PROJECT}})

The team's standing memory of what we've learned the hard way. **Peek before acting on anything non-trivial.** Update on session close (same hygiene pass as WORKSTATE). Each entry is one line + a pointer to where the detail lives — don't duplicate content; cross-link. Stale entries get a ~~strikethrough~~ + date + reason, never silent deletion.

**Founded {{DATE}} by CoS-Genesis.** Seeded with hard-won cross-project lessons (paid for once already — don't pay again) + {{PROJECT}}'s known hazards. The team grows the project-specific sections as it ships.

## Discipline (how to keep this file honest)
- One line per lesson + a pointer (memory, ticket, git SHA, file). The detail lives there.
- Categories: **Settled operational facts** (with evidence) · **Mistakes + lessons** · **Things known NOT to do** · **Known unknowns**.
- A known-unknown is an instruction to a successor — re-validate it before it crosses a handoff boundary ([[DECISIONS]] §4). Kill dead ones with a strikethrough.

---

## Settled operational facts (carry an evidence pointer — §4)
- **Commit identity:** {{IDENTITY}}. — *Evidence: repo `git config` + `git log` + `remote` (verified {{DATE}}).*
- **Paired code repo:** `{{CODE_REPO}}`. {{Run/setup pointer.}}
- **Repo gates:** {{REPO_GATES}}. — *Evidence: package/build config (verified {{DATE}}).*
- **Tracker:** {{TRACKER}}; write tools {{TRACKER_WRITE}}. — *Evidence: verified {{DATE}}.*
- {{Project-specific settled facts — known hazards, frozen ids, the product invariant's mechanism, etc.}}

## Mistakes + lessons (paid for once already; don't re-pay)
- **Don't bake an ambient-context email into a convention.** An ambient email baked into convention once → 30 misattributed commits + a history rewrite. Identity is verify-with-source class.
- **One paste unit, always.** A brief relayed separately from its handoff silently dropped. Amendments go IN the boot block, not as a follow-up message ("Relay-gap").
- **A code-reading hypothesis is not a fact.** Relaying unverified code-reading as fact burns trust. Frame findings as hypotheses; re-grep live code before fixing a reported bug (it sometimes lives in dead/archived code).
- **Re-validate inherited known-unknowns before writing them into a handoff.** A stale "risk" made a successor stall on a non-issue. Verify or label `ASSUMPTION:`.
- **Defer-and-flag beats while-I'm-in-here.** File follow-up tickets instead of expanding scope mid-implementation.

## Things known NOT to do
- {{If §6 exists: "Don't validate a <invariant> change on fixtures alone — verify it LIVE ([[DECISIONS]] §6)."}}
- **Don't merge during the build.** Engineer builds on a branch; merge happens at the gate; Done flips at the gate, not before ([[LOOP-PROTOCOL]]).
- **Don't `git add -A` / `commit -a`** — commit by explicit path (one commit per ticket).
- **Don't expand ticket scope mid-implementation** — file follow-ups.
- **Don't trust WORKSTATE prose ordering for execution** — the tracker dependency graph + the spine's phase order rule.
- **Don't engage a successor's work before the verification handshake** (the 3 bullets) checks out — "handshake first" is the only reply to a successor without them.

## Known unknowns (re-validate before relying on)
- **{{PROJECT}}'s v1 Definition of Done** is not yet locked ([[DECISIONS]] open questions).
- {{Project-specific open unknowns.}}
- **Does the repo's pre-commit hook (if any) interfere with the branch-build/explicit-path commit flow?** Watch on loop #1.
