# Betting and Cycles: Committing to What Gets Built

The betting table is where work enters cycles. A small group of senior people meets once per cool-down -- typically for one to two hours -- to decide what the team will build next. The language is intentional: bets, not assignments. A bet implies a choice made under uncertainty, with real commitment behind it, and a defined ceiling on the downside.

The betting table's most important power is not what it approves. It is what it does not carry forward.

## How the Betting Table Works

**Who attends:** CEO or product owner, CTO, and one or two senior product or design people. Small enough for fast decisions. Senior enough for real authority.

**When it meets:** During cool-down, after teams have had time to explore pitches. Usually the last 2-3 days of the 2-week cool-down period.

**What it reviews:** Only recent pitches. There is no backlog to scroll through. Ideas that were not shaped into a pitch this cycle are simply not in scope for consideration.

**Duration:** 1-2 hours. If decisions are taking longer, the pitches are not well-shaped enough.

**Output:** A clear list of bets for the next cycle, with team assignments and explicit start dates.

## Decision Criteria

Every bet at the betting table passes through five filters:

### 1. Does the problem matter?

Is this a real problem that real customers have? Is there evidence? Have we heard this from multiple sources or just one loud stakeholder? A problem that only one person has raised is a weak bet.

### 2. Is the appetite right?

Does the value of solving this problem justify the time proposed? A 6-week big batch should solve a meaningful problem. A 2-week small batch should not address something trivial. If the pitch asks for 6 weeks but the problem is minor, the appetite is wrong.

### 3. Is the solution attractive?

Does the proposed solution actually solve the problem well? Does it feel clean or hacky? Will it create future problems? The betting table does not redesign the solution -- that would mean the shaping was not done. But it can reject a pitch if the solution direction seems wrong.

### 4. Is this the right time?

Does this problem need to be solved now? Are there dependencies on infrastructure, other features, or external events? Is the team that would own it available? Timing matters as much as merit.

### 5. Are the right people available?

The bet must match the team. If the shaped work requires deep back-end expertise and the available programmer is primarily front-end, that is a misfit. Match the work to the people, or the people to the work.

## No Backlog

The most structurally radical aspect of Shape Up is the complete absence of a backlog.

**What this means in practice:**
- There is no list of "approved but not yet started" items
- Ideas that do not get bet this cycle simply expire
- Anyone can bring an idea back next cool-down as a fresh pitch
- Nothing accumulates obligation or implied priority by virtue of being written down

**Why this works:** A backlog is a list of things you implicitly promised to do eventually. That promise creates pressure. The pressure forces work onto the schedule that no longer matters or was never high priority. The no-backlog principle forces an honest question every cycle: is this important enough to be one of our top priorities right now?

**Common objection:** "But we'll forget good ideas." Ideas that are truly valuable tend to resurface. If an idea disappears and no one brings it back, it probably was not as important as it seemed when written down. Important ideas have advocates who remember them.

**Managing the transition:** Teams coming from Scrum or Jira often maintain a "maybe someday" informal list outside the betting system. This is acceptable as a personal reference, but it must never become a formal backlog with review obligations attached.

## Two Tracks Running in Parallel

Shape Up separates shaping from building into two distinct tracks that run simultaneously:

| Track | Who | Activity |
|-------|-----|----------|
| **Building track** | Cycle teams | Executing the current cycle's bets |
| **Shaping track** | Senior shapers | Preparing pitches for the next cycle |

While a team is 4 weeks into a 6-week cycle executing a bet, the shapers are already working on what comes next. This means the betting table always has fresh, considered pitches to evaluate -- not raw ideas scrambled together at the last minute.

**Why parallel tracks matter:** When shaping happens during cool-down alongside building, quality suffers. Shapers are rushed. Teams are distracted. The betting table makes poor decisions because pitches are underbaked. Parallel tracks give shaping the time and attention it requires.

## The 8-Week Rhythm in Detail

```
Weeks 1-6:   CYCLE (teams build; shapers shape next cycle)
Weeks 7-8:   COOL-DOWN (no scheduled work; betting table meets)
Weeks 9-14:  NEXT CYCLE
Weeks 15-16: COOL-DOWN
...
```

**Two cycles per quarter:** Most organizations run 2 big batches or a mix of big and small batches per quarter. This creates a predictable cadence that management, stakeholders, and teams can plan around.

**Cool-down is not vacation:** It is unstructured time for valuable, non-cyclical work. Teams use it for:
- Fixing small bugs they noticed during the cycle
- Technical exploration they were curious about
- Writing pitches for problems they want to solve
- Recovering from an intense cycle

**Nothing ships during cool-down:** Cool-down is not a sprint. Teams work on whatever interests them without commitment to any deliverable.

## Bug Handling Policy

Shape Up has a specific philosophy about bugs that differs from typical development practices.

**Small bugs during cycle:** Fix them opportunistically if they are minor and quick. Do not create tickets. Do not interrupt the cycle plan.

**Significant bugs during cycle:** If a bug requires more than a day to fix, it becomes a competing priority. The betting table decides whether to address it mid-cycle (unusual) or in cool-down (typical).

**Cool-down bug window:** Teams can address accumulated small bugs freely during cool-down without needing to create formal pitches.

**Recurring bug patterns:** If the same category of bugs keeps appearing, that pattern becomes a pitch at the next betting table. "Our CSV import keeps breaking" is a problem worth shaping a solution for -- not just patching repeatedly.

**Annual bug smash:** Once per year, the entire company dedicates a week to fixing every small bug and rough edge on the list. This prevents small issues from accumulating indefinitely while also keeping them out of the main cycle rhythm.

## What "Commitment" Means

When the betting table places a bet, the commitment runs in both directions:

**The team commits to:** Owning the work. Making autonomous decisions within the shaped boundaries. Shipping something meaningful by the end of the cycle.

**Management commits to:** Not interrupting the team with new priorities. Not pulling team members onto other projects mid-cycle. Trusting the team's judgment about implementation.

This mutual commitment is what makes 6-week cycles different from 6-week sprints. In a sprint, stakeholders can add work at any time, teams can be reassigned, and the sprint goal is aspirational. In a Shape Up cycle, the bet is a protected commitment on both sides.

## Betting Table Checklist

Before the betting table meets:

- [ ] All pitches are fully written with 5 ingredients
- [ ] Each pitch has an explicit appetite (small or big batch)
- [ ] Team availability is known for the upcoming cycle
- [ ] No pitches are being shared for the first time at the table -- pre-read them
- [ ] The previous cycle's output has been reviewed (what shipped, what did not)

During the betting table:

- [ ] Evaluate each pitch against all 5 decision criteria
- [ ] Assign specific people to each bet at the time of betting
- [ ] Record the outcome of each pitch (bet, deferred, rejected)
- [ ] Set cycle start date and first-day check-in expectations

After the betting table:

- [ ] Communicate bets to teams immediately
- [ ] Share pitch documents with teams before cycle start
- [ ] Confirm no mid-cycle commitments exist that would interrupt teams
