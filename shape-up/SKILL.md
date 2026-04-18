---
name: shape-up
description: 'Plan, scope, and ship software projects using Shape Up cycles. Use when the user mentions "shaping work", "6-week cycles", "appetite", "betting table", "hill charts", "scopes", or "circuit breaker". Covers pre-cycle design, cycle execution, and scope management. For rapid 5-day prototyping, see design-sprint. For validated learning experiments, see lean-startup.'
license: MIT
metadata:
  author: avery
  source: "Shape Up: Stop Running in Circles and Ship Work that Matters by Ryan Singer (Basecamp)"
---

# Shape Up

A product development methodology that replaces sprints and backlogs with fixed-time cycles, shaped work, and betting on what to build next. Teams ship meaningful features in 6-week cycles without the chaos of endless planning.

## Core Principle

**Projects fail from poor shaping, not poor execution.** Giving teams raw ideas or over-specified requirements causes either wandering without direction or building the wrong thing with precision.

**The foundation:** Shape Up separates the work of deciding what to build (shaping) from the work of building it (execution). Shaped work arrives at the cycle start as a pitch with a fixed appetite, a clear solution direction, and explicit boundaries -- so teams can make autonomous decisions without constant interruption.

## Scoring

**Goal: 10/10.** When reviewing product plans, sprints, or project scopes, rate them 0-10 based on Shape Up principles. A 10/10 means work is properly shaped before the cycle, teams have full ownership, scope is variable while time is fixed, and progress is visible on hill charts. Lower scores indicate raw ideas handed to teams, unbounded scope, or micromanagement of tasks.

## Shape Up Framework Overview

| Section | Focus | Key Output |
|---------|-------|------------|
| **Shaping** | Design work at the right abstraction level | Pitch (5 ingredients) |
| **Betting** | Decide what to build this cycle | Cycle commitments |
| **Building** | Execute with full team ownership | Shipped work |
| **Hill Charts** | Track and communicate progress | Motion vs. stasis signals |
| **Circuit Breaker** | Manage failed cycles honestly | Cancel or rescope decisions |

---

### 1. Shaping

**Core concept:** Before any work enters a cycle, it must be shaped -- designed at the right level of abstraction so it is rough enough to allow creative latitude but solved enough to avoid rabbit holes.

**Why it works:** Raw ideas handed to teams create chaos. Over-specified requirements remove the autonomy that enables good execution. Shaped work lands in the narrow band where teams have clear direction but real ownership.

**Key insights:**
- **Appetite is not an estimate** -- appetite is the maximum time you are willing to spend, set before design, not after
- **Breadboarding sketches interfaces** as words and connections, not boxes, to explore interactions without committing to layout
- **Fat marker sketches** are deliberately coarse -- one thick stroke per element prevents over-specification
- **Rabbit holes are identified proactively** -- if a solution requires solving an open technical question, the shaper resolves it or the pitch flags it explicitly
- **No-gos are as important as the solution** -- explicitly bounding what is out of scope prevents scope creep during execution
- **The pitch is the deliverable** -- five ingredients: problem, appetite, solution, rabbit holes, no-gos

**Product applications:**

| Context | Application | Example |
|---------|-------------|---------|
| New feature request arrives | Translate from raw idea to shaped pitch before betting table | "Users want notifications" becomes a specific notification pitch with appetite and solution sketch |
| Technical spike needed | Resolve the open question during shaping, not during cycle | Database migration uncertainty resolved before pitching the feature |
| Two competing solution approaches | Pick one in shaping; don't hand the decision to the team | Shaper chooses inline editing over modal -- team executes |
| Very large project | Shape as multiple pitches, each with its own appetite | "Invoicing" splits into creation, payment, history as separate bets |
| Vague deadline pressure | Set appetite as a constraint to force scope decisions | "This gets 2 weeks of one programmer" forces ruthless scoping |
| Request with unclear need | Return to conversations with customers before shaping | Interview 3 customers before pitching a solution |

**Copy patterns:**
- "What's the appetite on this before we figure out what to build?"
- "Let's breadboard the key interactions before we commit to any layout."
- "This pitch needs a no-gos section -- what are we explicitly not doing?"
- "That's a rabbit hole -- the shaper needs to resolve it before this goes to the betting table."

**Ethical boundary:** Shaping must represent honest design work, not post-hoc justification for a predetermined outcome. Pitches that pretend to be open while hiding a decision already made undermine team trust and produce poor work.

See: [references/shaping.md](references/shaping.md)

---

### 2. Betting

**Core concept:** The betting table is a small, senior group that meets once per cool-down to decide what the next cycle will contain. There is no backlog. Only recent pitches compete. The word "bet" implies real commitment with real consequences.

**Why it works:** Backlogs create the illusion of progress and obligation. Old ideas accumulate, reviews become chores, and the backlog becomes a source of guilt rather than value. By eliminating the backlog, the betting table forces honest prioritization: if something is truly important, it will resurface. If it disappears, it was not that important.

**Key insights:**
- **No backlog means no debt** -- ideas not bet on simply expire; anyone can bring them back next cool-down with a fresh pitch
- **Small group keeps it fast** -- typically CEO/product owner, CTO, and senior product person; 1-2 hours maximum
- **Decision criteria filter bets** -- does the problem matter, is the appetite right, is the solution attractive, is this the right time, are the right people available
- **A bet is a commitment** -- the team gets uninterrupted time; management does not pull people mid-cycle
- **Two tracks can run in parallel** -- while one team builds, shapers continue shaping the next cycle's pitches
- **Cool-down is not slack** -- it is when shaping happens, bugs get fixed, and the betting table meets

**Product applications:**

| Context | Application | Example |
|---------|-------------|---------|
| Too many good pitches | Bet only what fits the cycle; let the rest expire | 5 pitches, 2 slots: bet the 2 most time-critical |
| Old idea resurfaces | Require a fresh pitch, not a backlog item | "That invoicing idea from 3 months ago" needs re-pitching with current context |
| Stakeholder pushes for feature | Route to shaping first, then betting table | "Sounds interesting -- write a pitch and we'll consider it next cycle" |
| Bug backlog growing | Dedicate one team to bugs during cool-down; schedule annual bug smash | Track recurring categories, not individual tickets |
| Mid-cycle interruption attempt | Enforce the bet commitment | "We're committed to this cycle -- bring it to the next betting table" |
| Team capacity mismatch | Match team size to appetite at betting time | Big bet gets 2 programmers + designer; small gets 1 programmer |

**Copy patterns:**
- "Is there a pitch for that? If not, we can't bet on it."
- "That idea didn't get bet this cycle -- it's not in the backlog, just not the highest priority right now."
- "The betting table is in cool-down. Bring a pitch and we'll consider it."
- "We committed to this. We're not pulling the team mid-cycle."

**Ethical boundary:** The no-backlog principle must be implemented honestly. Maintaining a "shadow backlog" as a list of guilt or obligation defeats the purpose and re-creates all the problems Shape Up solves.

See: [references/betting-and-cycles.md](references/betting-and-cycles.md)

---

### 3. Building

**Core concept:** Teams of one designer and one to two programmers receive the shaped work and own the project end-to-end. They do not receive a task list -- they discover and map their own tasks as scopes that represent integrated, shippable slices of the work.

**Why it works:** Task lists create a false sense of progress and hide risk. A hundred tasks "done" means nothing if the hard integration work was never started. Scopes force teams to think in terms of working software, not activity.

**Key insights:**
- **Responsibility is handed over, not tracked** -- the team decides how to implement within the shaped boundaries; management does not assign tasks
- **Get one piece done in week 1** -- finish something real and shippable early to establish momentum and surface integration risk
- **Imagined tasks (planned upfront) always outnumber discovered tasks (found during build)** -- expect scope to evolve
- **Scopes are integrated slices, not layers** -- "Notify on reply" is a scope; "back-end work" is not
- **Layer cakes hide risk** -- building all back-end then all front-end means integration surprises at the end
- **Chowder is real** -- a small list of loose tasks that don't belong to any scope is normal and healthy

**Product applications:**

| Context | Application | Example |
|---------|-------------|---------|
| Team asks "what should we work on first?" | Direct them to get one piece done end-to-end | Build the simplest notification type fully before touching the others |
| Progress report requested mid-cycle | Ask about scopes, not tasks | "How many scopes are fully done vs. still in progress?" |
| Team organized by specialty | Restructure around integrated scopes | Front-end and back-end programmers work the same scope together |
| Unexpected complexity discovered | Scope hammer: cut or simplify, time is fixed | "We found 3x more edge cases -- which ones are must-haves?" |
| New task discovered mid-build | Add to appropriate scope or chowder | "Auth edge case" goes to chowder if small, or opens a new scope if significant |
| QA concerns about quality | Assign QA role to the team, not a separate gatekeeper | Designer acts as QA on interactions; programmer tests own code |

**Copy patterns:**
- "What's the one thing you can get fully done this week?"
- "Show me the scopes. Which are fully done, which are in progress, which haven't been started?"
- "Don't build layers -- build slices. Something end-to-end."
- "That's a discovered task. Add it to the scope and keep going."

**Ethical boundary:** Hand-over responsibility means teams must be genuinely trusted to make implementation decisions. Frequent check-ins, task assignment, or second-guessing implementation choices re-creates the micromanagement the methodology explicitly rejects.

See: [references/building.md](references/building.md)

---

### 4. Hill Charts and Progress

**Core concept:** Work is like a hill: the uphill phase involves figuring out the approach (unknowns, design decisions, uncertainty), while the downhill phase involves executing a known plan (confidence, momentum, finishing). Each scope gets a dot that moves from left to right as work progresses.

**Why it works:** Traditional task completion percentages hide the most important information -- whether the team knows what they are doing. A scope that is "40% complete" with all tasks known (downhill) is far less risky than a scope that is "40% complete" with key decisions unmade (uphill). Hill charts make this distinction visible.

**Key insights:**
- **Motion is not progress** -- a dot that moves back is a signal to investigate, not punish; it means the team discovered something they did not know
- **Stasis is the real warning sign** -- a dot that has not moved in several days indicates a stuck scope
- **Three thresholds matter** -- starting a scope, cresting the hill (approach figured out), and completing (done and shippable)
- **Scope names tell the story** -- "Notifications" is too vague; "Notify on reply" and "Unread count badge" are specific enough to track meaningfully
- **Scope health signs** -- a scope that keeps growing is a scope in trouble; consider splitting or cutting
- **Scope refactoring resolves stasis** -- sometimes a stuck scope needs to be split, renamed, or have work moved to chowder

**Product applications:**

| Context | Application | Example |
|---------|-------------|---------|
| Status update requested by stakeholder | Share hill chart snapshot instead of narrative | Screenshot shows 3 scopes downhill, 2 uphill, 1 not started |
| Team reports "almost done" for two weeks | Check if dot has actually moved | "The scope has been in the same uphill position -- what's blocking the approach?" |
| Scope has been uphill for too long | Investigate the unknown -- is it a rabbit hole? | "What decision needs to be made to get this downhill?" |
| Mid-cycle check-in | Review hill chart, not task list | "Three scopes are done, two are cresting -- are we on track?" |
| Scope growing with new tasks | Evaluate scope health | "This scope keeps getting new tasks. Is it a real scope or are we expanding?" |
| End of cycle approaching | Identify what is still uphill | Any uphill scope this late is high risk -- consider cutting |

**Copy patterns:**
- "Where's that scope on the hill right now -- uphill or downhill?"
- "The dot moved back -- that's useful information. What did you discover?"
- "That scope has been in the same spot for four days. What's blocking the approach decision?"
- "Everything uphill with two weeks left is a risk. What can we cut to scope hammer this?"

**Ethical boundary:** Hill charts must reflect honest assessment. A scope moved to downhill to reduce management anxiety, when unknowns remain, defeats the tool's purpose and introduces hidden risk into the cycle.

See: [references/hill-charts-and-scope.md](references/hill-charts-and-scope.md)

---

### 5. The Circuit Breaker and Scope Hammering

**Core concept:** Projects that do not ship at the end of a cycle are cancelled by default, not extended. Scope hammering is the practice of distinguishing must-haves from nice-to-haves to cut scope when time runs short. The circuit breaker prevents bad bets from consuming runway indefinitely.

**Why it works:** Automatic extensions reward poor shaping and create incentives for slow execution. The circuit breaker forces honest evaluation: was the original bet sound? Extensions are only justified when all remaining work is in the downhill (execution) phase -- meaning the approach is fully figured out.

**Key insights:**
- **Extensions require all work to be downhill** -- if any scope is still uphill, the project is not close enough to extend; cancel and reshoot
- **Scope hammering uses ~ notation** -- items marked with ~ are nice-to-haves that will be dropped if time runs short
- **Must-have vs. nice-to-have is a forcing function** -- asking "what happens if we ship without this?" reveals true priorities
- **Cancelled work is not wasted** -- the learning from the cycle informs a better bet next time
- **R&D mode exists for uncertain technical territory** -- expect to explore and spike, not ship; cycles in R&D mode have different success criteria
- **Production mode vs. cleanup mode** -- most cycles are production (new features); cleanup addresses accumulated rough edges before a significant release

**Product applications:**

| Context | Application | Example |
|---------|-------------|---------|
| Cycle end approaching with work remaining | Scope hammer to find cuts | "What can we mark ~ and drop to ship on time?" |
| Team requests extension | Ask: is all remaining work downhill? | "If every scope is downhill and it's just execution time, we can discuss. If anything is still uphill, we need to cancel." |
| Project cancelled at cycle end | Evaluate: reshoot as a new pitch or abandon? | "What did we learn? Can we shape a better pitch for the next cycle?" |
| Feature grows during building | Apply ~ to newly added items | Tag additions as nice-to-have; protect the original appetite |
| New uncertain technology being explored | Frame as R&D cycle, not production | "This is R&D -- success means a working spike and a decision, not a shipped feature" |
| Product releasing after several cycles | Schedule a cleanup cycle | Reserve a cycle before the release to address rough edges and known debt |

**Copy patterns:**
- "This doesn't ship on Friday unless we cut something. What gets a ~?"
- "Are all the remaining scopes downhill? If yes, let's talk extension. If no, we reset."
- "The circuit breaker fired. What did we learn and how do we pitch this better?"
- "Mark that ~ -- it's nice-to-have and we protect the appetite."

**Ethical boundary:** The circuit breaker is not a punishment tool. Cancelled cycles should be treated as learning opportunities, not failures. Teams that fear cancellation will hide progress problems rather than surface them -- the opposite of what Shape Up requires.

See: [references/hill-charts-and-scope.md](references/hill-charts-and-scope.md)

---

## Cool-Down and the 8-Week Rhythm

Cool-down is the 2-week period between cycles. It has no scheduled work. Teams use it to fix bugs, explore ideas, and recover. The betting table meets during cool-down to select the next cycle's bets.

| Activity | Who | When in Cool-Down |
|----------|-----|-------------------|
| Fix small bugs | Any programmer | Any time |
| Write/refine pitches | Shapers, senior product | First week |
| Explore technical spikes | Interested programmers | Any time |
| Betting table meeting | Senior group | End of cool-down |
| Annual bug smash | Whole company | Once per year |

**The 8-week rhythm:** 6-week cycle + 2-week cool-down. Two cycles fit neatly into a quarter. Teams know the pace and can plan around it.

**Bug handling philosophy:** Small bugs go to cool-down. Recurring patterns become pitches for systematic fixes. The annual "bug smash" clears accumulated minor issues once per year. Not everything needs a ticket.

---

## Shape Up vs. Scrum / Agile

Shape Up was designed as a direct alternative to Scrum. Understanding the differences clarifies when and why to apply each.

| Dimension | Shape Up | Scrum / Agile |
|-----------|----------|---------------|
| **Planning unit** | 6-week cycle | 2-week sprint |
| **Backlog** | None -- pitches expire | Required -- maintained continuously |
| **Sprint planning** | Betting table (1-2 hours, once per cool-down) | Sprint planning (4-8 hours every 2 weeks) |
| **Daily standups** | Not prescribed | Required |
| **Velocity tracking** | Not used | Central to planning |
| **Scope** | Variable -- cut to fit time | Fixed -- time extends to fit scope |
| **Task assignment** | Team self-organizes | Scrum master / product owner assigns |
| **Estimation** | Appetite (pre-design) | Story points (post-design) |
| **Progress tracking** | Hill charts by scope | Burn-down charts by task |
| **Interruptions** | Protected -- bets are commitments | Backlog can change anytime |
| **Failed cycle** | Circuit breaker -- cancel | Sprint review -- carry over |

**When Shape Up fits better:** Established product teams with senior designers and programmers, where the cost of poor shaping is high and autonomous team ownership is a priority.

**When Scrum fits better:** Teams that need more structure, new teams learning to work together, or organizations where stakeholder visibility into daily work is a hard requirement.

---

## Common Mistakes

| Mistake | Why It Fails | Fix |
|---------|-------------|-----|
| **Handing raw ideas to teams** | Teams wander without direction or build the wrong thing | Shape first: breadboard, fat marker sketch, write the pitch |
| **Maintaining a backlog "just in case"** | Backlog debt re-creates the pressure Shape Up removes | Let unbet ideas expire; require fresh pitches to resurface |
| **Giving teams task lists** | Removes ownership, hides integration risk, creates false progress | Hand over responsibility; let teams discover and map scopes |
| **Extending cycles by default** | Rewards poor shaping; hides real execution problems | Apply circuit breaker: cancel unless all work is downhill |
| **Using hill charts for tasks** | Granularity creates noise, not signal | Track scopes (integrated slices), not individual tasks |
| **Shaping too specifically** | Removes team's ability to find better solutions | Use fat marker sketches; solution should be rough but not vague |
| **Shaping during the cycle** | No focus; team and shaper both context-switch | Shapers work on next cycle during building; tracks are parallel |

---

## Quick Diagnostic

| Question | If No... | Action |
|----------|----------|--------|
| Is there a written pitch with all 5 ingredients? | Team will be working from incomplete information | Write the pitch before betting |
| Does the pitch have an explicit appetite? | Scope will expand to fill unlimited time | Set the appetite -- small batch (1-2 weeks) or big batch (6 weeks) |
| Does the pitch have a no-gos section? | Scope creep will occur during building | Add explicit out-of-scope items to the pitch |
| Are scopes named as integrated slices? | Progress will be invisible until the end | Rename from layers ("back-end") to features ("Notify on reply") |
| Has the betting table met this cool-down? | Teams are building unvetted work | Schedule the betting table before the cycle starts |
| Is any scope still uphill in the last week? | At risk of not shipping | Scope hammer: apply ~ and cut nice-to-haves |

---

## Reference Files

- [shaping.md](references/shaping.md): Appetite vs. estimate, breadboarding, fat marker sketches, pitch format, rabbit holes, grab-bag avoidance
- [betting-and-cycles.md](references/betting-and-cycles.md): Betting table mechanics, decision criteria, no-backlog philosophy, two tracks, cool-down, bug handling
- [building.md](references/building.md): Team structure, hand-over responsibility, scopes, imagined vs. discovered tasks, layer cakes, chowder, QA
- [hill-charts-and-scope.md](references/hill-charts-and-scope.md): Hill chart mechanics, uphill/downhill, three thresholds, scope hammering, circuit breaker, extension criteria

## About the Author

**Ryan Singer** is the Head of Product Strategy at Basecamp (now 37signals) and the creator of the Shape Up methodology. He spent over 15 years shaping and shipping products at Basecamp, working directly with founders Jason Fried and David Heinemeier Hansson. Shape Up emerged from the practices Basecamp developed to eliminate the chaos of sprints and backlogs while shipping meaningful work on a reliable cadence. Singer published Shape Up as a free book at basecamp.com to share the methodology with the broader product community.

## Further Reading

- [*"Shape Up: Stop Running in Circles and Ship Work that Matters"*](https://basecamp.com/shapeup) by Ryan Singer (free at basecamp.com)
- [*"It Doesn't Have to Be Crazy at Work"*](https://www.amazon.com/Doesnt-Have-Crazy-Work/dp/0062874780) by Jason Fried and David Heinemeier Hansson
- [*"Rework"*](https://www.amazon.com/Rework-Jason-Fried/dp/0307463745) by Jason Fried and David Heinemeier Hansson
