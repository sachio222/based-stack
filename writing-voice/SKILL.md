---
name: writing-voice
description: Write prose in the user's published voice (Jake Krajewski / medium.com/@jakekrajewski) — conversational-technical, second-person, rhetorical-question openers, reassuring-guide tone. Invoke when the user asks for an essay, article, blog post, long-form note, or rewrite in his voice. Do NOT invoke for code, terse chat replies, or bullet-style reference/cheatsheet docs.
---

# Writing Voice — Jake Krajewski

The user publishes on Medium as Jake Krajewski. When writing prose for
him, match this voice by default.

## When to apply

- Essays, articles, blog posts, explainers, long-form notes.
- Rewrites of existing prose into his voice.
- Prose sections of otherwise-technical docs.

## When NOT to apply

- Code (inline or in files).
- Terse chat replies (≤2 sentences).
- Cheatsheets, reference tables, or bullet-list docs where bullets
  are the correct form.
- Install-guide docs (those follow a separate template — see
  the `install_guide_style` memory).

---

## Fingerprint (paste this when briefing another model)

Conversational technical writing with a reassuring-guide tone. Heavy
second-person "you." Short punchy sentences alternating with longer
explanatory ones. Rhetorical questions as openers and pivots. Light
self-aware humor, never snarky. Explains hard things by positioning
the reader as smart-but-stuck, then walking them through it without
condescension. Bridges expert concepts to practical application.

## Defaults

- **Open with a rhetorical question, a setup-and-deflate, or a
  direct scene.** Never "In this article" or "Let's explore."
- **Second-person ("you") is the default POV.** Use "I" sparingly
  and on purpose. Almost never "we."
- **Mix sentence lengths.** Short sentences land judgments and
  pivots. Long sentences carry explanations. Fragments are allowed
  when they land. ("It hasn't.")
- **Em-dashes — with spaces — for inline asides.** Heavy use.
- **Parentheticals for clarification.** (Like this.) Sparingly.
- **Bold the single word worth remembering,** not every other one.
  Italics for beat emphasis ("It *didn't* tell you").
- **Section endings land.** Use a callback, a dry one-liner, or a
  payoff sentence. Never "in conclusion."

## Verbal tics to reach for (sparingly)

"For starters…" · "Here's what to do instead." · "Here's the thing." ·
"Fair warning:" · "Worth knowing." · "You'd think X. You'd be wrong
more often than you'd like." · "Criminally underused." · "Welcome to
[topic]."

One per section, tops. They lose power fast.

## Anti-patterns — do NOT

- "Let's dive into…" / "In this article…" / "In today's post…"
- "We" as the default POV.
- Academic hedging ("it could be argued," "some would say").
- Throat-clearing before the first real sentence of content.
- Emojis in headings or body (unless a specific piece earns it).
- Heavy bolding for its own sake.
- Bullet lists where prose would carry more voice.
- Closing with a disclaimer or summary.

---

## Opening stubs

Four proven scaffolds to paste and riff on:

**The "you just did the obvious thing" open**
> You sit down to [X]. You do [obvious thing]. It comes back. You
> nod, as if [X] has just confirmed something meaningful. It hasn't.

**The quoted rhetorical question**
> "How do I [thing] without [common failure]?" you ask yourself, as
> [common failure] happens again.

**The problem-shared open**
> [Common frustration] is the kind of problem that sounds like it
> shouldn't be a problem. And yet, here we are.

**The setup-and-pivot**
> The instinct is to [default approach]. Don't. [Default approach]
> [fails in specific way]. Here's what to do instead.

---

## Editing checklist (run before finalizing)

- [ ] Opening earns the first ten seconds. No throat-clearing.
- [ ] Second-person as default; first-person used on purpose.
- [ ] No "we." No "let's."
- [ ] Short sentences land the big points.
- [ ] Every bold/italic emphasis has been earned.
- [ ] At least one prose section per header (no bulletpoint-itis).
- [ ] Sections land, don't fizzle.
- [ ] No "in conclusion."
- [ ] One technical term per paragraph gets defined or grounded.
- [ ] The reader is smarter at the end than they were at the start.

---

## Reference samples

Re-read for calibration:

- **PyTorch Layer Dimensions: Get your layers to work every time**
  — Jan 2020, *TDS Archive*. Rhetorical-question open,
  problem-solution, abstraction-to-concrete.
- **A coder's guide to colors — stop using RGB and use this
  instead** — Sep 2020, *UX Collective*. Dash-contrast title,
  reframe, designer-thinking-for-developers.
- **Words We'll Never Speak: AI-Native Concepts That People Can't
  Use (Yet)** — Jul 2025. Speculative-but-grounded, parenthetical
  softener.
- **How to Stream any ChatGPT Generation to Your Client in
  NextJS** — Jun 2023, *Level Up Coding*. Practical-problem,
  acknowledge-limits, show-the-real-way.

---

## Deeper references

- [`references/opening-moves.md`](references/opening-moves.md) —
  expanded opener patterns with examples.
- [`references/formatting.md`](references/formatting.md) — formatting
  habits (dashes, italics, parentheticals, tables vs prose).
- [`references/sample-analysis.md`](references/sample-analysis.md) —
  short excerpts from published work with commentary on moves.

Canonical in-vault reference (richest version):
`~/Agents/Workspaces/Main/Writing/Voice — Jake Krajewski.md`

---

## How to use this skill

1. When the user asks for prose in his voice, open this skill and
   scan the Fingerprint + Defaults + Anti-patterns.
2. If the piece is >500 words, also skim the Opening stubs and pick
   one (or combine two).
3. Draft. Run the Editing checklist before finalizing.
4. For longer or more-involved work, load the reference files in
   `references/` for deeper guidance.
