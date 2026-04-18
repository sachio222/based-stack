# Building: Executing with Full Team Ownership

When a cycle starts, the shaped work belongs to the team. Not partially -- entirely. The team makes implementation decisions. The team organizes their own tasks. The team decides what to build first. Management's job at cycle start is to hand over the pitch and get out of the way.

This is not negligence. It is the intentional architecture of Shape Up. Teams that own their work make better decisions, communicate problems sooner, and feel the weight of delivery in a way that creates accountability. Teams that receive task lists follow instructions -- which is a different and less effective mode.

## Team Structure

Shape Up prescribes small, integrated teams:

**Standard big batch team:** 1 designer + 1-2 programmers

**Standard small batch team:** 1 programmer (with occasional design help) or 1 programmer + 1 designer

**Why so small:**
- Small teams communicate with almost zero overhead
- Every person can see the full scope of the work
- Accountability is unambiguous -- the whole team owns the whole outcome
- Small teams can make all decisions within the team without escalation

**No separate roles for QA, project management, or technical writing during the cycle.** The designer acts as a quality check on interactions and visual design. The programmer tests their own code. Project communication flows through the hill chart, not status meetings.

## Hand Over Responsibility

Hand-over is not a handoff. A handoff implies the receiver executes what the sender designed. Hand-over means the receiver takes ownership of the outcome, not just the tasks.

**What the team receives:**
- The pitch document (problem, appetite, solution sketch, rabbit holes, no-gos)
- Access to any relevant background (customer support threads, design explorations)
- An understanding of what "done" looks like

**What the team does NOT receive:**
- A task list
- An implementation specification
- A wireframe to build pixel-for-pixel
- Sprint assignments broken down by day

**The principle:** The shaped work defines the destination and rules out certain paths (rabbit holes, no-gos). How the team gets there is their decision.

## The First Week: Get One Piece Done

The most important rule for the first week of a cycle: finish something. Not start everything. Finish one small, complete, end-to-end piece of the project.

**Why this matters:**
- Demonstrates the team can actually build what was shaped
- Surfaces integration complexity early, when there is time to respond
- Creates momentum and confidence
- Reveals unknowns while there are 5 weeks left, not 1

**What counts as "done":** A user can perform a complete action. Not a back-end component in isolation. Not a UI mockup. An actual user-facing behavior that works end-to-end.

**Example:** A notifications feature might have email notifications, in-app notifications, and notification settings. In week 1, the team ships one notification type end-to-end -- the trigger, the back-end logic, the delivery, and the UI -- even if the design is rough and the other types are not started.

**Anti-pattern:** Spending week 1 setting up data models, database schemas, and API contracts without any visible user-facing behavior. This is building layers instead of slices, and it pushes integration risk to the end of the cycle.

## Imagined vs. Discovered Tasks

Every project starts with imagined tasks -- the tasks the team expects to exist before they have started building. As building progresses, imagined tasks are replaced by discovered tasks -- the actual tasks that appear when the team understands the real work.

**Imagined tasks are always wrong.** Not maliciously -- they are the best estimate available before contact with reality. But discovered tasks will differ in number, difficulty, and nature. Expect it.

**The implication:** Do not create a comprehensive task list at cycle start and try to execute it. Create a rough map of expected work, then update it continuously as the real shape of the project emerges.

**What this looks like in practice:**
- Week 1: Team starts with 8 imagined tasks
- After first piece done: 8 tasks revised to 14 -- 3 of the original tasks split, 4 new ones discovered
- Week 3: List has 9 tasks, 5 complete, 4 remaining -- scope has been clarified through building

## Scopes: Integrated Work Slices

Tasks have a layer problem: "back-end work" and "front-end work" are layers, not features. A team that finishes all the back-end has nothing a user can see or test. Progress is invisible until the integration happens at the end -- which is when surprises appear.

Scopes solve this by grouping tasks around integrated user-facing features, not technical layers.

**A scope contains everything needed to ship one user-facing behavior:**
- Database changes
- Server-side logic
- API endpoints
- Front-end components
- Design decisions
- Edge cases and error states

**Scope naming:**
- **Too vague:** "Notifications work"
- **Layered (wrong):** "Back-end for notifications"
- **Correct:** "Notify on new reply" / "Unread count badge" / "Notification preferences"

**Scopes are discovered, not invented.** The team does not define all scopes on day 1. Scopes emerge as the team understands the real work. Early in the cycle, a project might have 2-3 rough scopes. By week 3, it might have 5-7 well-defined scopes.

## Scope Health Signs

| Sign | What It Means | Response |
|------|---------------|----------|
| Scope has been in progress for 2+ weeks | Scope is too big | Split into smaller scopes |
| Scope keeps gaining new tasks | Scope is absorbing adjacent work | Cut new tasks that are nice-to-have; add to ~ list |
| Scope has not been started by week 3 | Might be deprioritized or hidden risk | Evaluate: is it required? Can it be cut? |
| Team struggles to name the scope | Scope is not cohesive | Split or reorganize around a cleaner user-facing concept |
| Two scopes depend on each other deeply | Merge them | One scope, one track, one owner |

## Layer Cakes vs. Icebergs

**Layer cake (bad):** Back-end fully built, then front-end fully built, then integration. Risk concentrates at the end.

**Iceberg (hidden bad):** A small-seeming UI feature has enormous back-end complexity hidden beneath it. The team discovers this after spending weeks on the visible tip.

**Slice approach (correct):** Build end-to-end slices. Each slice touches all layers but for one specific user-facing behavior.

**Detecting icebergs during shaping:** The shaper should ask -- "What's under the water here?" For any part of the solution that seems small, probe the technical complexity. If there is significant hidden work, it needs to be in the pitch as a rabbit hole.

## Chowder

Chowder is a real scope in Shape Up -- a miscellaneous bucket for tasks that are real and necessary but do not belong to any named scope.

**What goes in chowder:**
- One-off setup tasks (configure this service, set this env variable)
- Cross-cutting concerns that touch multiple scopes
- Small fixes discovered during building that are not worth their own scope

**Chowder is healthy in small quantities:** If chowder grows beyond 5-8 items, it probably contains real scopes that have not been named. Examine it for patterns and split off new scopes.

## QA and Quality

There is no separate QA role in a Shape Up cycle. Quality is the team's responsibility.

**Designer as QA:** The designer reviews interactions for correctness, consistency, and usability. They catch regressions in visual behavior and interaction design.

**Programmer as QA:** The programmer tests their own code. They write tests where appropriate and manually verify behaviors in staging before the cycle ends.

**Baseline comparison:** Before shipping, compare the changed behavior against the baseline -- how things worked before. If the change introduces regressions in adjacent behavior, those must be fixed before shipping.

**"Good enough for now":** Not every edge case needs a perfect solution. Shape Up explicitly accepts that shipped work will have rough edges, especially in early versions. The question is not "is it perfect?" but "is it better than before, and does it work well enough for the customers who need it?"

## Building Checklist by Week

### Week 1
- [ ] Team has read and discussed the pitch
- [ ] Team has identified the first scope to get fully done
- [ ] At least one end-to-end piece is complete and working
- [ ] Initial scope map is drafted (rough, expected to change)

### Weeks 2-3
- [ ] Scopes are named as integrated slices, not layers
- [ ] At least 30-40% of scopes are fully done
- [ ] Chowder is reviewed -- anything that belongs in a named scope?
- [ ] Any discovered rabbit holes have been surfaced to the shaper

### Weeks 4-5
- [ ] Most scopes are done or clearly downhill
- [ ] Nice-to-haves have been identified and marked ~
- [ ] Any scope still uphill is flagged as a risk
- [ ] No new scope is being added unless it is critical

### Week 6 (Final)
- [ ] All must-have scopes are done
- [ ] Nice-to-haves (~) are explicitly cut or confirmed included
- [ ] Baseline comparison done -- no regressions in adjacent behavior
- [ ] Work is deployed and verified in production (or staging for staged rollout)
- [ ] Any follow-on work is captured as future pitch ideas, not this cycle's problem
