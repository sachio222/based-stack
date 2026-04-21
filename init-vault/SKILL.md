---
name: init-vault
description: Scaffold a new Obsidian vault with the canonical layout — WORKSTATE, ARCHITECTURE, CHANGELOG, README, CLAUDE.md, per-folder READMEs — so the living-docs auto-update hook can maintain it. Invoke when user says "init a new vault", "create a vault", "scaffold a vault", "new Obsidian vault", or similar.
---

Scaffold a new Obsidian vault at `~/Agents/Workspaces/<parent>/<VaultName>/` with the canonical layout used across based-stack vaults (LanguageAcademy, OrchestratedOncology, PortfolioV2, etc.). The resulting vault is compatible with the `living-docs-auto-update` hook, so WORKSTATE/ARCHITECTURE/CHANGELOG auto-maintain going forward.

## What the user should confirm before you start

Ask (one question at a time, multiple-choice preferred):

1. **Vault name** — short, `CamelCase` if a per-project vault, plain word if topical.
2. **Vault type** — one of:
   - **Per-project** (like LanguageAcademy) — full `projects/{product, marketing, seo, geo, strategy}/`, `notes/`, `reference/`, `Resources/` layout. Best for a single product or business initiative with a sibling code repo.
   - **Knowledge / research** — `notes/`, `reference/{books, frameworks, research}/`, optional `projects/` for investigations. Best for focused research or a subject-matter vault.
   - **Topical personal** (like Main) — user-defined category folders. Best when the vault hosts many unrelated workstreams.
3. **Location** — under `~/Agents/Workspaces/Development/` (per-project default) or `~/Agents/Workspaces/` directly (topical default). Allow override.
4. **Paired code repo?** — if per-project, ask whether there's a sibling at `~/dev/<slug>/`. If yes, note it in the vault's CLAUDE.md + WORKSTATE for cross-referencing.
5. **Git init?** — default yes. Private repo on the user's GitHub under `sachio222` naming pattern `<slug>-vault`. Confirm with user before creating/pushing.

## The canonical layout you create

```
<VaultName>/
├── .obsidian/                        # empty — Obsidian populates on first open
├── README.md                         # orientation for humans/LLMs
├── CLAUDE.md                         # first-read for new Claude sessions
├── ARCHITECTURE.md                   # vault structure + conventions
├── DESIGN.md                         # design system index (omit for topical vaults)
├── CHANGELOG.md                      # dated work log, newest first
├── WORKSTATE.md                      # Now / Next / Blocked / Recently shipped — LIVING DOC
├── <VaultName>.md                    # landing card / seed note
├── skills-index.md                   # which skills apply to which workstream (per-project only)
│
├── notes/                            # fast-moving thinking
│   ├── README.md
│   ├── daily/
│   ├── inbox/
│   ├── ideas/
│   ├── meetings/
│   └── plans/
│
├── projects/                         # per-project only — active workstreams
│   ├── README.md
│   ├── product/README.md
│   ├── marketing/README.md
│   ├── seo/README.md
│   ├── geo/README.md
│   └── strategy/README.md
│
├── reference/                        # slow-moving canonical knowledge
│   ├── README.md
│   ├── books/
│   ├── frameworks/
│   └── research/
│
└── Resources/                        # per-project only — produced assets
    ├── README.md
    ├── Brand/
    └── Marketing/
```

Topical vaults skip `projects/`, `Resources/`, and `DESIGN.md`; they use user-named category folders instead (e.g., `Creative/`, `Development/`, `Gaming/`, `System/`, `Writing/`).

Knowledge vaults skip `projects/` and `Resources/`; keep `reference/` as the hub.

## Canonical file contents

Seed each file with a minimum-viable template. Key requirements:

### WORKSTATE.md (required — the living doc hook targets this)

```markdown
# Workstate

**Last updated:** <today in YYYY-MM-DD>

Single source of truth for what's active on [[<VaultName>]]. **A new session should read this first.**

## Now
- (fill in when a workstream starts)

## Next
- (queued)

## Blocked
_(none)_

## Recently shipped
- <today> — Vault scaffolded via `/init-vault` with canonical layout.

## Open questions
_(none tracked)_

## Parked ideas
_(park ideas here that aren't active but you don't want to forget)_

---

## For a new session starting on <VaultName>

1. You've already read this.
2. (list 2-3 key docs specific to this vault)
3. Living-docs hook maintains Now/Next/Recently-shipped automatically after each session end.
```

### ARCHITECTURE.md

```markdown
# Architecture — <VaultName>

Structure of the [[<VaultName>]] Obsidian vault.

## Layout

\```
<copy of the file tree above, actual to this vault>
\```

## Conventions

- Obsidian `[[wikilink]]` syntax for internal navigation
- Every folder has a `README.md` index
- Dated artifacts: `<Topic> - YYYY-MM-DD.md`
- Versioned drafts: `<Doc> v2.md` (preserve history)
- READMEs list primary notes + point to relevant skills

## Related

- [[README]]
- [[WORKSTATE]]
- [[CLAUDE]]
```

### CHANGELOG.md

```markdown
# Changelog

Work log for [[<VaultName>]]. Newest first. Not a formal semver changelog — project memory.

---

## <today> — Vault initialized via /init-vault

Canonical layout scaffolded: WORKSTATE, ARCHITECTURE, CHANGELOG, README, CLAUDE.md, per-folder READMEs. Living-docs auto-update hook will maintain this going forward.
```

### CLAUDE.md

```markdown
# CLAUDE.md

This file provides guidance to Claude Code when working in this vault.

## What this is

<One-line description based on vault type + user's answer to purpose.>

## Read first

1. `WORKSTATE.md` — single source of truth for what's active.
2. `README.md` if WORKSTATE references something unfamiliar.
3. <If paired code repo:> `~/dev/<slug>/CLAUDE.md` for code-level orientation.

## Conventions

- Obsidian `[[wikilinks]]` for internal navigation
- Per-folder READMEs as indices
- Living-docs hook (from based-stack) auto-maintains WORKSTATE, ARCHITECTURE, CHANGELOG after each session
- Implementation plans live in `notes/plans/YYYY-MM-DD-<name>.md`

## Relevant skills

(Per-project vaults: generate a starter list from the workstream → skill mapping in skills-index.md)
(Topical / knowledge vaults: skip, or point to skills-index globally)
```

### README.md

```markdown
# <VaultName> — Vault

<One-line description.>

**Read [[WORKSTATE]] first** — it's the single source of truth for what's active, next, and blocked.

## Layout

<Table listing top-level folders with one-line descriptions>

## Top-level notes

- [[<VaultName>]] — seed note
- [[WORKSTATE]] — active state
- [[ARCHITECTURE]] — vault structure
- [[CHANGELOG]] — work log
- (DESIGN if per-project, skills-index if per-project)

## Setup on a new machine

\```bash
git clone git@github.com:sachio222/<slug>-vault.git \
  ~/Agents/Workspaces/<parent>/<VaultName>

# Re-create the Goldilocks plugin symlink (standard on all based-stack vaults)
~/dev/obsidian-plugins/obsidian-goldilocks-essentials/install-in-vault.sh \
  ~/Agents/Workspaces/<parent>/<VaultName>
\```
```

### `<VaultName>.md` (seed note)

```markdown
# <VaultName>

<One-paragraph description.>

## Links

- (project website, repo, etc., if applicable)

## Vault orientation

Start here: **[[WORKSTATE]]** (what's active) and **[[README]]** (layout).

### Top-level
- [[README]]
- [[WORKSTATE]]
- [[ARCHITECTURE]]
- [[CHANGELOG]]

### Workstreams (per-project)
- [[projects/product/README|Product]]
- [[projects/marketing/README|Marketing]]
- [[projects/seo/README|SEO]]
- [[projects/geo/README|GEO]]
- [[projects/strategy/README|Strategy]]

### Supporting
- [[notes/README|notes/]]
- [[reference/README|reference/]]
- [[Resources/README|Resources/]]
```

### Per-folder READMEs

One paragraph explaining purpose + a short list of what belongs there. See any existing based-stack vault (LanguageAcademy, OrchestratedOncology) for reference examples — don't reinvent.

## Steps to execute

1. **Confirm answers** to the 5 questions above.
2. **Pick the right subfolder set** based on vault type (per-project / knowledge / topical).
3. **Create the folder structure** with `mkdir -p`.
4. **Write each file** using the templates above, substituting `<VaultName>`, dates, and user-provided context.
5. **Verify** with `find <VaultPath> -type f | sort` and show the user the tree.
6. **Optionally git init** (if user confirmed):
   ```bash
   cd <VaultPath>
   git init
   # Ask user to confirm remote creation via gh: gh repo create sachio222/<slug>-vault --private --source . --push
   ```
7. **Install the Goldilocks plugin symlink** (standard on every based-stack vault — do this by default, no need to ask):
   ```bash
   if [ -x ~/dev/obsidian-plugins/obsidian-goldilocks-essentials/install-in-vault.sh ]; then
     ~/dev/obsidian-plugins/obsidian-goldilocks-essentials/install-in-vault.sh <VaultPath>
   fi
   ```
   If the install script is missing on this machine, skip silently and mention it in the post-scaffold summary so the user can restore it later. Do not abort the scaffold over a missing plugin.

## After scaffolding

Tell the user:

- Open the vault in Obsidian — community plugins install on first open.
- The `living-docs-auto-update` hook (from based-stack) will maintain WORKSTATE/ARCHITECTURE/CHANGELOG automatically after each Claude Code session that touches this vault. No action needed — verify by ending a session with `Ctrl+C` twice or `/exit`.
- **Fill in Now/Next in WORKSTATE** with the real active work so the next session can resume properly. The hook won't invent context, only maintain it.

## Non-negotiables

- **Never** create the `.obsidian/` folder with content. Leave empty; Obsidian populates on first open.
- **Always** include WORKSTATE.md even for minimal vaults — it's the living-docs hook's anchor.
- **Always** use the `<today>` date for "Last updated" and first CHANGELOG entry.
- **Never** scaffold over an existing vault — check the target path is empty first. If not empty, abort and ask.
