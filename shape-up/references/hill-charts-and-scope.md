# Hill Charts, Scope Hammering, and the Circuit Breaker

The three tools in this document address the hardest part of software projects: knowing the truth about progress and acting on it honestly.

Hill charts make the truth visible. Scope hammering acts on the truth when time runs short. The circuit breaker enforces the truth when time runs out.

## The Hill Chart

Work resembles a hill. The left half is uphill: uncertain territory where the team figures out the approach, makes key decisions, and navigates unknowns. The right half is downhill: confident execution where the approach is known and the team is completing work they understand how to do.

```
                    * (crest: approach figured out)
                 *     *
              *           *
           *                 *
        *                       *
UPHILL                              DOWNHILL
(figuring out)                    (executing)

|----------|------------|----------|---------|
Start     25%          50%        75%      Done
```

Each scope in the project gets a dot on the hill. The dot moves left-to-right as the scope progresses. Scopes start on the far left (not started) and end on the far right (done).

**The critical distinction:** A dot at the 40% position uphill looks identical in completion percentage to a dot at the 40% position downhill. But they represent entirely different states:
- **40% uphill:** The team is still figuring out how to solve this. Major decisions remain. The path forward is uncertain.
- **40% downhill:** The team knows exactly what to do. They are executing a known plan.

Traditional task completion percentages cannot capture this difference. Hill charts can.

## Three Thresholds

Scope movement is most meaningful at three points:

### Threshold 1: Scope Starts

A scope exists on the chart and the team begins work. The dot appears on the left end. This signals: we know what this scope is and we have started it.

### Threshold 2: Cresting the Hill

The team has figured out the approach. All major unknowns are resolved. Implementation decisions are made. The scope moves to the top of the hill. This signals: the team is confident -- now it is execution.

**Why this threshold matters most:** A scope that has not crested by mid-cycle is a significant risk. Uphill work in the second half of a cycle means the team may discover something that cannot be resolved in the remaining time.

### Threshold 3: Completion

The scope is done. Shippable. The dot reaches the far right. This signals: a user can actually do this thing.

## Reading Hill Chart Motion

### Motion is information

When a dot moves, that is information. When a dot moves backward (from downhill back to uphill), that is especially valuable information. It means the team discovered an unknown they thought was resolved.

**Do not punish backward movement.** A dot that moves back is a sign of honest, accurate reporting. Punishing it teaches teams to leave dots in their old positions -- which is far more dangerous than the backward move itself.

### Stasis is the warning signal

A dot that has not moved in 3-5 days is the real warning sign. Stasis means:
- The team is stuck on a decision they cannot resolve
- The scope has become a rabbit hole
- Something outside the team's control is blocking progress
- The team has moved on to other scopes and forgotten this one

**When you see stasis:** Ask one question: "What's blocking the approach decision?" Not "why are you behind?" but "what specific thing do you not yet know how to solve?"

## Scope Refactoring

When a scope is stuck, the fix is often not "work harder" but "rethink the scope." Scope refactoring means restructuring how the work is divided to resolve the stasis.

**Common scope refactoring moves:**

**Split:** A stuck scope may actually be two scopes entangled together. Separating them clarifies ownership and progress.
- Before: "Notification system" (stuck)
- After: "Email delivery" (downhill) + "In-app notification display" (uphill)

**Cut:** Some part of the stuck scope may be the source of complexity. Cutting it from must-have to nice-to-have (~) allows the rest to move.
- Before: "User-customizable notification preferences" (uphill, stuck)
- After: "Fixed notification defaults" (downhill, shippable) + "Custom preferences" (~, cut this cycle)

**Merge to chowder:** A scope that is genuinely small and not worth tracking separately can be dissolved into chowder and handled as a collection of small tasks.

## Scope Hammering

Scope hammering is the practice of applying force to scope to fit within the remaining time. As the end of a cycle approaches, the team -- with input from the shaper if needed -- evaluates every remaining scope against one question:

**"What happens if we ship without this?"**

If the answer is "users cannot complete the core task" -- it is a must-have. If the answer is "it would be nicer, but users can still accomplish what they need" -- it is a nice-to-have.

### The ~ Notation

Nice-to-haves are marked with a tilde (~) in the scope list. The ~ mark communicates:
- This item is known and considered
- It will be cut if time runs short
- No one needs to ask permission to cut it -- the ~ is the permission

**Example scope list at week 5:**
- [done] Notify on new reply
- [done] Unread count badge
- [downhill] Mark all as read
- [uphill] ~ Customizable notification sounds
- [uphill] ~ Per-thread mute toggle
- [chowder] Update help article

In this example, "Customizable notification sounds" and "Per-thread mute toggle" will be cut if the cycle ends before they are done. "Mark all as read" is a must-have that the team will finish.

### Scope Hammering Questions

When approaching scope hammer decisions:
1. "What does the user absolutely need to complete the task?"
2. "What would be nice but does not block core usage?"
3. "What did we add during building that was not in the original pitch?" (These are candidates for ~)
4. "What is the minimum shippable version of this scope?"

### Before/After Comparison for Scope Hammering

| Before Hammering | After Hammering |
|-----------------|----------------|
| Full notification preferences (8 settings) | Three fixed options: all on, essentials only, all off |
| Custom sort order for notification list | Default chronological order (custom sort is ~) |
| Badge count by category | Single total badge count (category breakdown is ~) |
| Notification digest email (weekly/daily/instant) | Instant only (digest options are ~) |

## The Circuit Breaker

If a project does not ship by the end of the cycle, it is cancelled by default. There is no automatic extension.

**What this means:**
- The team stops working on the project
- The code does not ship
- The shaper and betting table evaluate what happened
- A new pitch may be written for the next cycle -- or the idea may be abandoned

**Why this rule exists:**
- It eliminates the incentive to hide progress problems
- It forces honest shaping -- if a project is consistently hard to scope, the shaping was wrong
- It creates urgency without micromanagement -- the team knows Friday is real
- It prevents a bad bet from consuming multiple cycles of runway

### Extension Criteria

Extensions are not categorically forbidden, but they require a specific condition: **all remaining work must be downhill.**

If every scope is downhill -- meaning the team is executing a known plan and there are no remaining unknowns -- then an extension of a few days can be justified. The only thing needed is time, not discovery.

If any scope is still uphill -- meaning there are unresolved decisions or unknowns -- then the team does not actually know how long the remaining work will take. An extension has an undefined endpoint. Cancel.

| Scenario | Decision |
|----------|----------|
| 2 scopes remain, both clearly downhill, 2 days needed | Extension justified |
| 1 scope remains, still uphill, approach unclear | Cancel |
| 3 scopes done, 2 scopes (~) cut, project complete | Ship as-is |
| Project 60% done, major feature still uphill | Cancel |
| All done except one bug discovered in QA | Fix the bug, ship |

### After a Cancellation

Cancellation is information, not failure. Ask:
1. Was the problem real? (If yes, reshoot as a new pitch)
2. Was the appetite right? (If the work is genuinely 12 weeks, a 6-week bet was wrong)
3. Was the solution too complex? (Shape a simpler solution)
4. Were there unresolved rabbit holes? (Address them in the new pitch)
5. Was the team the right fit? (Different team composition might work)

A well-reasoned pitch after a cancellation often produces better outcomes than the original would have -- because the team now has real information about the problem.

## Cycle Modes

Not every cycle is a production cycle. Shape Up acknowledges three distinct modes:

### Production Mode (standard)

The team builds and ships new user-facing features. This is the default cycle mode. Scopes are user-facing behaviors. Success = shipped work in production.

### R&D Mode

The team explores uncertain technical territory without a commitment to ship. Used when a new technology, architecture, or product direction has too much uncertainty to shape properly.

**R&D success criteria:** A decision and a spike -- enough to know whether to proceed and what the path would look like. Not a shipped feature.

**R&D pitches are different:** The pitch describes the uncertainty to explore, not the feature to build. The output is knowledge, not software.

### Cleanup Mode

A cycle dedicated to addressing accumulated rough edges, small inconsistencies, and technical debt before a significant release. No new features. The team works from a list of known issues and polishes them.

**When to use cleanup:** Before a major marketing push, a significant version release, or when the rough edges have accumulated enough to affect customer experience.

## Hill Chart Ceremony

**Weekly:** Update hill chart dots. Teams do this themselves -- not for management, but for their own awareness. Reviewing the hill chart weekly forces the team to be honest with themselves about what is uphill vs. downhill.

**At mid-cycle check-in:** Share the hill chart with the betting table or product owner. The conversation should focus on: are there any scopes still uphill that concern us?

**Two weeks before cycle end:** Any scope still uphill is a risk. The team must decide: is it feasible to get this downhill in time, or should it be cut now?

**Final week:** All remaining scopes should be downhill. If not, scope hammer immediately.

## Hill Chart Checklist

- [ ] Every scope is represented by a dot
- [ ] Scope names are specific behaviors, not layers or vague categories
- [ ] Dots are updated at least weekly
- [ ] Backward dot movements are investigated, not punished
- [ ] Stasis (dot unmoved for 3+ days) triggers a conversation
- [ ] Mid-cycle: identify any scope still uphill as a risk
- [ ] Week 5: any scope still uphill gets scope hammered or cut
- [ ] Extension only granted when all remaining work is demonstrably downhill
