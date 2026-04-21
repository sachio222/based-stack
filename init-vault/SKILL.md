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
   - **Second brain / PKM** — PARA (`00 Inbox/`, `01 Projects/`, `02 Areas/`, `03 Resources/`, `04 Archive/`) + `Daily/` + `MOCs/`. The popular BASB + LYT hybrid seen in "my Obsidian setup" threads on X. Best for personal knowledge management, journaling, and capture-heavy workflows. Ships more starter content than the other variants so a fresh clone is usable on day one.
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

Topical vaults skip `projects/`, `Resources/`, and `DESIGN.md`; they use user-named category folders instead (e.g., `Creative/`, `Development/`, `Gaming/`, `Hardware/`, `System/`, `Writing/`).

Knowledge vaults skip `projects/` and `Resources/`; keep `reference/` as the hub.

Second-brain / PKM vaults replace the `projects/ notes/ reference/` trio with a PARA-based layout — see the dedicated section below.

### Second-brain / PKM layout

The layout below is the PARA + Daily Notes + MOCs hybrid popular in Obsidian X/Twitter threads. Actionability decreases left-to-right across the PARA folders: Projects (active with a deadline) → Areas (ongoing responsibility) → Resources (topic reference) → Archive (inactive). Daily Notes handle capture, MOCs handle navigation, `00 Inbox/` holds fleeting captures until the weekly review.

```
<VaultName>/
├── .obsidian/                        # empty — Obsidian populates on first open
├── README.md
├── CLAUDE.md
├── ARCHITECTURE.md
├── CHANGELOG.md
├── WORKSTATE.md
├── <VaultName>.md                    # home dashboard MOC
│
├── 00 Inbox/                         # fleeting captures — process weekly
│   └── README.md
├── 01 Projects/                      # PARA P — active, with a deadline
│   └── README.md
├── 02 Areas/                         # PARA A — ongoing responsibility
│   └── README.md
├── 03 Resources/                     # PARA R — topic-based reference
│   └── README.md
├── 04 Archive/                       # PARA A — completed / inactive
│   └── README.md
│
├── Daily/                            # YYYY-MM-DD daily notes
│   └── README.md
├── MOCs/                             # Maps of Content — curated entry points
│   ├── README.md
│   └── Home.md
└── Attachments/
    └── README.md
```

**Conceptual sources (all mainstream in Obsidian PKM circles on X):**

- **PARA** — Tiago Forte's *Building A Second Brain*. File by actionability, not topic.
- **Daily Notes** — universal capture layer; one dated note per day.
- **MOCs** — Nick Milo's *Linking Your Thinking*. Notes-of-links as curated entry points, used when a subject accumulates 5+ notes.
- **Inbox** — Getting-Things-Done legacy; weekly review routes captures into the right PARA folder or trash.

**Numbering.** The `00 / 01 / 02 / 03 / 04` prefixes are an Obsidian-on-X convention that keeps PARA folders top-of-tree in stable sort order. Non-PARA utility folders (`Daily/`, `MOCs/`, `Attachments/`) sit below without prefixes so they read as distinct from the PARA system.

**Shareability goal.** This variant ships more starter content than the others — a pre-populated home MOC, PARA-folder READMEs with filing rules, a `Home.md` MOC, and a `CLAUDE.md` that describes the capture → file → archive workflow. A fresh clone is usable on day one without the new owner having to design anything.

### Topical-vault software/tools documentation pattern

Topical vaults commonly accumulate software-install / tools docs (media players, photo viewers, DAWs, editors, backups, etc.). Two conventions that travel together.

**1. Consume vs. produce split.** When a topical vault hosts software docs, split them along a clear axis:

- **Consume / system** (suggested folder: `System/`) — apps for *using* or administering: media players, photo/image viewers, file managers, backups, remote access, security tools, specs. Example docs: `Media-Players.md`, `Photo-Viewers.md`, `File-Managers.md`, `Video-Libraries.md`.
- **Produce / create** (suggested folder: `Creative/`) — apps for *making*: photo editors, audio/DAW tools, video editors, drawing/graphics, animation, product design, writing. Example docs: `Photo-Tools.md`, `Music-Audio-Tools.md`, `Video-Tools.md`, `Drawing-Graphics-Tools.md`, `Animation-Tools.md`, `Writing-Tools.md`.

Each doc cross-links its counterpart (e.g., a "Media Players" doc points to "Music-Audio Tools" for DAWs; a "Photo Viewers" doc points to "Photo Tools" for RAW editors). When the user asks for a "[domain] tools" doc, first pick the axis — is this for consuming or producing? — and place it in the matching folder.

Do not pre-create `System/` or `Creative/` during init; let the user name their own top-level folders. Apply the axis only when populating docs.

**2. Six-part install-guide template.** Every software/tools doc inside a topical vault follows this layout:

1. **System-context header** — one-line machine/OS summary + any specs-driven caveats ("Cycles CPU only", "iGPU bottleneck", "Wayland only", etc.).
2. **"Install most at once" bulk-install block** — grouped install lines: official repos first (`pacman`/`apt`/`brew`), then AUR/community (`yay`/`paru`), then Flatpak / upstream binary last. Lets the user paste and install the whole category at once.
3. **Claude integrations summary table** — placed near the top, before per-tool sections. Columns: **Tool · Integration type · Link**. Mark widely-used integrations with ★ and flag **official-from-vendor MCPs** separately from community ones. Explicitly note which tools have no integration ("Nothing reputable found for X, Y, Z").
4. **Per-tool sections** — each tool gets `### Name`, a short description (what it's best for, who it's aimed at), bulleted links (Site, Docs, GitHub, **Claude integration:** if any), then the install snippet.
5. **Verify-installs block** at the end:
   ```bash
   for p in pkg1 pkg2 pkg3; do pacman -Q "$p" 2>/dev/null || echo "$p: not installed"; done
   ```
6. **Cross-references use Obsidian wiki-links** — `[[Note#Heading]]` for section targets, `[[Note#Heading|display]]` inline. Mark cross-domain references with ↪ when a tool's "home" section lives in another doc.

**3. Consumer-doc variant (consume-side docs).** When a doc is about *consuming* (players, viewers, library managers), prepend two sections before the bulk-install block:

- **"The problem this doc fixes"** — one or two paragraphs on what's confusing about the defaults (e.g., "macOS has Photos.app doing two jobs; Linux splits it across viewer + library manager"). Orients the reader before the install list.
- **"Pick a vibe"** — a short table that helps the user choose by mood / use-case rather than feature matrix. Columns: **Vibe · Pick · Notes**. Bold the headline recommendation per row.

Example vibe-table shape:

```markdown
| Vibe                           | Pick           | Notes                                  |
|--------------------------------|----------------|----------------------------------------|
| **Apple Photos / Lightroom**   | digiKam        | Heavy, Qt/KDE, faces/geotags/tags/RAW  |
| Simpler library manager        | Shotwell       | GNOME, events-by-date, clean and fast  |
| **Minimal Preview.app feel**   | qView          | Qt, opens instantly, keyboard-driven   |
```

**4. Starter skeleton.** If the user asks for a new software doc during (or after) vault init, scaffold it with this skeleton — fill in content, don't leave placeholders in the final doc:

```markdown
# <Category> <Players|Viewers|Tools|Editors>

System: <OS/distro> · <DE/compositor>
<One-sentence scope. For <opposite axis>, see [[../<OtherFolder>/<OtherDoc>]].>

## The problem this doc fixes      <!-- consume-side only -->

<Why the defaults are confusing and what this doc solves.>

## Pick a vibe (the short version) <!-- consume-side only -->

| Vibe | Pick | Notes |
|------|------|-------|
| …    | …    | …     |

## Recommended install (cover all bases)

\```bash
sudo pacman -S <pkg1> <pkg2>
\```

\```bash
paru -S <aur-pkg>
flatpak install -y flathub <flathub-id>
\```

## Claude integrations

| Tool | Integration | Link |
|------|-------------|------|
| …    | …           | …    |

## <Tool A>

<Short description — best for, aimed at whom.>
- Site: <url>
- Docs: <url>
- GitHub: <url>
- **Claude integration:** <if any>

\```bash
sudo pacman -S <pkg>
\```

## Verify installs

\```bash
for p in <pkg1> <pkg2>; do pacman -Q "$p" 2>/dev/null || echo "$p: not installed"; done
\```
```

**Non-negotiables for software/tools docs:**

- Verify package names against `pacman -Si` / `yay -Si` (or the platform equivalent) before writing. Never invent package names.
- Curl-check any GitHub URLs for community MCPs before citing them.
- Prefer official repos → AUR → Flatpak → upstream binary, in that order.
- When an AUR build is known to fail, flag it and give a working alternative (e.g., Flatpak).
- Never omit the verify-installs loop — it's how the user confirms the paste actually landed.

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

### Second-brain starter files

For PKM vaults, ship real starter content so a clone is immediately useful.

**`<VaultName>.md` (home dashboard)**

```markdown
# <VaultName>

<One-line description: who this vault is for / what it's for.>

> **How this is organized:** PARA (Projects / Areas / Resources / Archive) for filing + Daily Notes for capture + MOCs for navigation. Read [[CLAUDE]] for the workflow.

## Today

- [ ] Open [[Daily/<today>|today's daily note]]
- [ ] Process [[00 Inbox/README|inbox]] (aim: weekly)

## Active

- [[01 Projects/README|Projects]] — deadline-driven work
- [[02 Areas/README|Areas]] — ongoing responsibilities

## Reference

- [[03 Resources/README|Resources]] — topic-based notes
- [[MOCs/Home|Home MOC]] — curated entry points

## Cold storage

- [[04 Archive/README|Archive]] — done, dropped, or dormant
```

**`MOCs/Home.md` (top-level Map of Content)**

```markdown
# Home MOC

Top-level Map of Content. An MOC is a curated note-of-links — use it as a front door into a subject once that subject has 5+ notes.

## How to use

Link back to this MOC from any note that fits a subject below. When a section grows past ~10 entries, promote it into its own MOC (e.g., `MOCs/Writing.md`, `MOCs/Reading.md`).

## Subjects

- _(empty — populate as the vault grows)_
```

**PARA + utility folder READMEs — one-paragraph filing rules**

- `00 Inbox/README.md` — Fleeting captures and unsorted notes. Everything lands here first. **Process weekly:** route each note to `01 Projects/`, `02 Areas/`, `03 Resources/`, or delete. Empty inbox = reviewed brain.
- `01 Projects/README.md` — **Active work with a deadline.** A project has a defined end state. When done, move the folder to `04 Archive/`. One folder per project; name as `YYYY-MM — <Project>` for chronological sort.
- `02 Areas/README.md` — **Ongoing responsibilities with no end date.** Health, finances, home, a specific role. Areas are maintained, not completed. If an area spawns a deadline-driven effort, that effort becomes a Project.
- `03 Resources/README.md` — **Topic-based reference** you pull from. Books, research, recipes, how-to. Not tied to a specific Project or Area.
- `04 Archive/README.md` — **Inactive items** from the other three folders. Searchable history; only delete when certain you won't want it back.
- `Daily/README.md` — One dated note per day, `YYYY-MM-DD.md`. Use Obsidian's Daily Notes core plugin or Templater for a template.
- `MOCs/README.md` — Maps of Content. Create one when a subject accumulates 5+ notes and you want a curated front door. Link from `[[Home]]` downward.
- `Attachments/README.md` — Shared images and binaries embedded across the vault.

**CLAUDE.md additions (second-brain workflow)**

Include this section under `## Conventions` in the generated CLAUDE.md:

> **Capture → File → Archive workflow.** Write fleeting thoughts into `00 Inbox/` or a `Daily/YYYY-MM-DD.md` note. During weekly review, move notes out of Inbox into `01 Projects/` (deadline-driven), `02 Areas/` (ongoing), or `03 Resources/` (topic reference) — or delete them. When a project or area goes inactive, move the whole folder to `04 Archive/`. Build an MOC (`MOCs/<Subject>.md`) when a subject accumulates 5+ notes and you want a curated front door.

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
