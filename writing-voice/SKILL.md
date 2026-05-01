---
name: writing-voice
description: Write prose in the user's published voice (Jake Krajewski / medium.com/@jakekrajewski) — warm-tutor register, peer-not-authority, goofy-specific asides, personifies tools, acknowledges reader frustration directly. Invoke when the user asks for an essay, article, blog post, long-form note, or rewrite in his voice. Do NOT invoke for code, terse chat replies, or bullet-style reference/cheatsheet docs.
---

# Writing Voice — Jake Krajewski

The user publishes on Medium as Jake Krajewski. When writing prose for
him, match this voice by default.

## How to invoke this skill

**Step 1. Read [`references/voice-samples.md`](references/voice-samples.md) FIRST.** That file contains two complete published Medium articles verbatim. The samples are the source of truth. The fingerprint below describes the voice in self-aware terms — it is a recipe, not the meal. Calibrate against the prose, not the description.

**Step 2.** Then skim the Fingerprint, Defaults, and Anti-patterns sections of this file. They're useful checklists, but where they conflict with the samples, *the samples win*. Past failures of this skill came from following the fingerprint mechanically without reading samples — produces voice-cosplay, not voice.

**Step 3.** Draft. Then run the Editing checklist.

> **Calibration warning.** Both samples in `voice-samples.md` are tutorial/explainer genre (Dec 2019 / Jan 2020). When writing in a different genre — opinion, LinkedIn post, cover letter, essay — preserve the *attitude* (warm, peer-not-authority, goofy-specific asides, reassuring) but adapt structure to the genre. Do not force tutorial structure onto opinion writing.

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

Warm-tutor register with reassuring-guide tone. Peer-not-authority — Jake writes as someone who recently figured this out himself and remembers being stuck. Goofy-specific asides ("the intermittent frequency of cricket — Acheta domesticus — chirps at moonrise"), absurd-but-precise. Personifies tools and frameworks ("PyTorch on the other hand, thinks you want…", "make up and be friends again"). Directly acknowledges reader frustration ("if it throws up at you and you're yelling at your computer right now, breathe. It's OK."). First-person and second-person both used freely and often. Rhetorical questions throughout — as opens, as section pivots, as transitions. Sentences are mostly medium-length and conversational; short fragments are rare, not dominant. Endings *settle* warmly ("That's it!", "I hope this tutorial helped"), they don't *land* dramatically.

## Defaults

- **Open with a rhetorical question, a setup-and-deflate, a direct scene, or a "Preface" / casual stage-set ("I'll be walking through…").** Never "In this article" or "Let's explore."
- **Both first-person AND second-person are default POVs.** "I'll address what an autoencoder is" + "You might be asking" both appear naturally. Use "we" for the inclusive walk-through ("we'll grab MNIST", "we'll put together a basic network") — this is one of the few writers where "we" is correct.
- **Sentence rhythm is conversational-medium, not punchy.** Most sentences run 15-30 words with embedded clauses. Reserve short fragments ("Done.", "That's it.", "Just kidding.") for genuine punctuation moments — typically 1-2 per section, not every paragraph.
- **Parentheticals are the dominant inline-aside form** (like this). Em-dashes — with spaces — are used too, but less than the fingerprint of a more "essayistic" writer would suggest. When in doubt, prefer the parenthetical.
- **Trailing ellipses for tonal softening.** "No, really…" "OK… I guess." "Please…" Signals a held-breath, a soft retreat from a strong claim, or a conversational sigh. Sparingly but distinctively.
- **Bold for headers, labels, and step markers** ("**Step 1.**", "**Note:**", "**Example 2:**"). Almost never bold a single word inline. Italics for emphasis on a single word ("see things *her* way") is fine but rare.
- **Goofy-specific asides earn their keep.** When introducing a hard concept, look for the absurd-but-precise comparison — moon phases, cricket Latin names, "throw up at you", "head-scratching errors". One per section, often two.
- **Personify the tool.** PyTorch has moods. Linux's kernel has opinions. The interpreter shouts at you. This dramatizes the user's confusion without blaming them.
- **Acknowledge reader frustration explicitly.** "If you're yelling at your computer right now, breathe." This is the single most distinctive emotional move in the voice.
- **Section endings settle warmly.** "That's it!" "Now we're talking!" "I hope this helped." "Make up and be friends again." Closings are encouraging, not punchy.

## Verbal tics actually attested in the samples

"For starters…" · "Just kidding, it's not that simple." · "OK… I guess." · "No, really…" · "So basically…" · "Probably going to use X because it's generic and simple." · "Suffice it to say…" · "What about X you say?" · "Now we're talking!" · "Done." · "That's it!" · "Why tho?" · "I hope this tutorial helped."

One or two per section. They lose power fast — but the warm-tutor voice depends on a few of them appearing naturally throughout.

## Anti-patterns — do NOT

- "Let's dive into…" / "In this article…" / "In today's post…"
- Academic hedging ("it could be argued," "some would say").
- Throat-clearing before the first real sentence of content.
- Emojis in headings or body (unless a specific piece earns it).
- Heavy bolding for its own sake (especially inline single-word bolding).
- Bullet lists where prose would carry more voice.
- Closing with a disclaimer or summary ("In conclusion…").
- **Stacking dry one-liner mic-drops at section endings.** This is the failure mode of mechanically applying an "essayist" voice template to Jake's actual warm-tutor voice. Endings should settle, not land.
- **Forcing punchy short sentences as the dominant rhythm.** Short fragments are accents, not the beat.
- Confident-pronouncement tone. Jake writes as the friend who figured it out one step ahead of you, not as the authority telling you how it is.

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
- [ ] First- and second-person both present and natural; "we" used for inclusive walk-through where it fits.
- [ ] At least one goofy-specific aside per section (cricket Latin name energy, not just "haha").
- [ ] At least one moment of personifying the tool / acknowledging reader frustration somewhere in the piece.
- [ ] Sentence rhythm is conversational-medium dominant; short fragments used as accents only.
- [ ] Parentheticals deployed (often). Em-dashes used (less often).
- [ ] Bold reserved for headers, labels, step markers — almost no inline single-word bolding.
- [ ] At least one rhetorical question other than the opener (section pivot).
- [ ] Closing settles warmly. Not a mic-drop one-liner.
- [ ] Read it aloud. Does it sound like a friend who just figured this out, or like an essayist performing?

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

- [`references/voice-samples.md`](references/voice-samples.md) — **read this first.** Two complete published Medium articles, verbatim. The source of truth for this voice.
- [`references/opening-moves.md`](references/opening-moves.md) — expanded opener patterns with examples.
- [`references/formatting.md`](references/formatting.md) — formatting habits (dashes, italics, parentheticals, tables vs prose).
- [`references/sample-analysis.md`](references/sample-analysis.md) — short excerpt fragments with commentary on moves. (Older, fragmentary — `voice-samples.md` is now the primary reference.)

---

## How to use this skill

1. When the user asks for prose in his voice, open this skill and
   scan the Fingerprint + Defaults + Anti-patterns.
2. If the piece is >500 words, also skim the Opening stubs and pick
   one (or combine two).
3. Draft. Run the Editing checklist before finalizing.
4. For longer or more-involved work, load the reference files in
   `references/` for deeper guidance.
