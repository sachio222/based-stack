# Shaping: Designing Work at the Right Abstraction Level

Shaping is the upstream design work that happens before any project enters a cycle. A shaper -- typically a senior product person, designer, or founder -- takes a raw idea and transforms it into a pitch: a document that defines the problem, sets the appetite, proposes a solution at the right level of detail, and explicitly names what is out of scope. Shaped work is rough enough that the team has creative latitude, solved enough that major unknowns are resolved, and bounded enough that the team cannot expand into adjacent territory.

Shaping is not a design phase. It does not produce wireframes, specifications, or task lists. It produces enough direction that a capable team can own the rest.

## Appetite vs. Estimate

The most important distinction in shaping is between appetite and estimate.

**Estimate:** How long will this take? (Derived from scope)

**Appetite:** How much time are we willing to spend? (Constrains scope)

Estimates follow scope: you figure out what you want to build, then calculate how long it will take. Appetites precede design: you decide how much the problem is worth, then design a solution that fits.

| Dimension | Estimate | Appetite |
|-----------|----------|---------|
| When set | After design | Before design |
| What it reflects | Scope complexity | Business value judgment |
| What it does | Predicts duration | Constrains scope |
| Who owns it | Engineers | Shaper / product owner |
| Result when wrong | Overrun | Rescope |

**Standard appetites:**
- **Small batch:** 1-2 weeks, one programmer or one programmer + designer
- **Big batch:** 6 weeks, one designer + 1-2 programmers

**Appetite as forcing function:** Setting a 2-week appetite on a feature that a team would estimate at 6 weeks forces the question: what version of this is worth 2 weeks? Often the answer reveals that only a slice of the original idea carries most of the value.

## Breadboarding

Breadboarding is a shaping technique for exploring interactions without committing to visual layout. The name comes from electronics: a breadboard is a prototype circuit that tests connections without soldering.

**Three elements:**
- **Places:** Screens, pages, or dialogs (e.g., "Invoice detail page")
- **Affordances:** Interactive elements within a place (e.g., "Send reminder button")
- **Connection lines:** Navigation between places (e.g., "→ Confirmation dialog")

**How it works:** Draw places as labels. Under each place, list affordances as words. Connect places with lines showing where affordances lead.

**Why breadboarding over wireframes:**
- Words are faster to create than boxes
- Coarse structure forces focus on flow, not layout
- Visual execution decisions are deferred to the team

**Example -- Invoice reminder flow:**
```
Invoice detail page
  - Send reminder [button]
  - View history [link]
    |
    v
Send reminder dialog
  - To: [email field, pre-filled]
  - Message: [text, default provided]
  - Send / Cancel
    |
    v
Confirmation toast
  - "Reminder sent to [email]"
```

## Fat Marker Sketches

Fat marker sketches are visual shaping tools used when spatial arrangement matters -- when the 2D layout of elements is part of the solution.

**The constraint:** Draw with a thick marker (or a thick brush in a digital tool) so that each element takes up visible space. Thin-line wireframes invite pixel-level decisions. Fat markers force concept-level decisions.

**What fat marker sketches show:**
- Approximate component placement ("nav on left, content on right")
- Relative sizing ("the map takes up most of the screen")
- Key element groupings ("filters sit above the results list")

**What they do not show:**
- Exact spacing, padding, or alignment
- Color, typography, or icon choices
- Precise copy

**When to use breadboarding vs. fat marker sketches:**
- Use breadboarding when the key question is about flow and interaction
- Use fat marker sketches when the key question is about spatial arrangement

## The Pitch: 5 Ingredients

A pitch is the deliverable of shaping. It contains exactly five ingredients:

### 1. Problem

What is going wrong, and for whom? A good problem statement includes:
- The specific situation that triggers the need
- What the user is trying to do
- What is currently failing or missing

**Weak:** "Users want better notifications"
**Strong:** "When a reply comes in on a watched thread, users miss it because the only signal is a browser tab badge. Mobile users who work primarily from their phone never see it."

### 2. Appetite

How much time is this worth? State the appetite explicitly: small batch (1-2 weeks) or big batch (6 weeks). Include team size if it matters ("1 programmer, no designer needed").

### 3. Solution

The shaped solution -- presented as breadboards, fat marker sketches, or a written description at the right abstraction level. Not a specification. Not a task list. A solution direction the team can own and refine.

### 4. Rabbit Holes

Specific known risks, tricky edge cases, or open technical questions that could cause the project to blow up. For each rabbit hole:
- Name the issue explicitly
- State how the shaper resolved it ("We decided to use X approach") OR
- Flag it as an open question the team must resolve in the first week

**Never leave rabbit holes implicit.** Teams discover them anyway -- the difference is whether they discover them with 6 weeks remaining or 1 week remaining.

### 5. No-Gos

An explicit list of what is out of scope. No-gos are not "future ideas" -- they are decisions made during shaping to prevent scope expansion.

**Why no-gos matter:** During building, teams encounter adjacent problems. Without explicit no-gos, a well-intentioned team will solve them. With no-gos, the team has permission to say "not this cycle" without asking for approval.

## Responding to Raw Ideas

Not every idea deserves to be shaped. Most ideas arrive as raw requests that need evaluation before shaping investment.

**The interest filter:** Is this problem real? Is the timing right? Do we have a credible solution path? If the answer to any of these is no, the idea goes to the parking lot -- not the backlog.

**The parking lot vs. the backlog:** The parking lot is an informal list of ideas that might become pitches someday. It carries no obligation. The backlog carries implicit obligation -- items there feel like promises to get to eventually. Shape Up has no backlog; the parking lot is never "groomed."

**Grab-bag avoidance:** A "grab-bag" is a pitch that bundles many small improvements under one title ("Clean up the settings page"). Grab-bags fail because:
- Different tasks have different priority
- Progress is invisible (which task is done?)
- The team cannot get one piece done early

**Fix:** Either shape each improvement as its own pitch (if worth a bet) or let them be handled during cool-down as small bugs.

## Shaping Process: Step by Step

### Phase 1: Narrow the Problem

- Talk to the customer or stakeholder who raised the need
- Identify the specific situation that creates the problem
- Resist the urge to propose solutions yet -- understand the problem first

### Phase 2: Sketch Possible Solutions

- Use breadboarding for flow-heavy problems
- Use fat marker sketches for layout-heavy problems
- Iterate quickly -- this is thinking on paper, not design work

### Phase 3: Identify Rabbit Holes

- Walk through the proposed solution mentally
- Ask: "Where might this go wrong?"
- Resolve each rabbit hole or flag it explicitly in the pitch

### Phase 4: Write the Pitch

- Document all 5 ingredients
- Keep it to a few pages -- a pitch is not a spec
- Share with one or two trusted people for a gut check before the betting table

## Shaping Checklist

- [ ] Problem stated in terms of a specific situation, not a feature request
- [ ] Appetite set before design work began
- [ ] Solution shown as breadboard or fat marker sketch, not wireframe
- [ ] At least one explicit rabbit hole identified and addressed
- [ ] No-gos section present with at least 2-3 items
- [ ] Solution is rough enough to allow creative latitude
- [ ] Solution is solved enough that no open design questions remain
- [ ] Pitch fits on a readable page -- not a specification document
