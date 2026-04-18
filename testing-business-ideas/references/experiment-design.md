# Experiment Design: Hypotheses, Test Cards, and Assumption Maps

Good experiments do not happen by accident. They require a disciplined process for forming hypotheses, selecting the right test, defining what evidence would count as success or failure, and capturing what was learned. This reference covers the tools that make experimentation rigorous rather than impressionistic.

## The Well-Formed Hypothesis

A hypothesis is a testable prediction. Not every belief is a hypothesis. A hypothesis must be:

**Testable:** There must exist a possible result that would deny it. If every outcome can be interpreted as confirming the hypothesis, it is not testable -- it is an unfalsifiable belief.

**Precise:** The prediction must be specific enough that two independent observers reviewing the results would agree on whether it was confirmed or denied.

**Discrete:** The hypothesis tests one thing. Testing multiple things in one experiment produces ambiguous results -- you cannot determine which variable drove the outcome.

### Hypothesis Format

The standard format from the Strategyzer testing framework:

**"We believe [customer segment] will [action] because [reason]."**

| Component | What It Specifies | Example |
|-----------|------------------|---------|
| Customer segment | Who is being tested | "Adults aged 25-45 in Golden, CO" |
| Action | What they will do (behavioral) | "will click the 'Reserve My Spot' button" |
| Reason | The underlying assumption | "because they want structured adult fitness with a community feel" |

**Full example:** "We believe adults aged 25-45 in this market will click the 'Reserve My Spot' button on a landing page describing adult fitness classes because they want structured training with a social/community component."

### Hypothesis Quality Check

| Criterion | Weak Version | Strong Version |
|-----------|-------------|----------------|
| **Testable** | "People will love our app" | "New users will complete account setup within 5 minutes of downloading" |
| **Precise** | "Customers are interested" | "20% of email list recipients will click through to the pricing page" |
| **Discrete** | "Users prefer our new onboarding and checkout" | "Users who see the new onboarding complete checkout at a higher rate than users who see the old onboarding" |

## The Test Card

The Test Card is a structured document completed before any experiment runs. Its purpose is to force explicit, pre-committed definitions of what you believe, how you will test it, and what result would count as confirmation or denial.

```
TEST CARD
=========

We believe: [customer segment] will [action] because [reason]

To verify this, we will: [describe the experiment in one sentence]

We will measure: [the specific metric]

We are right if: [specific threshold that confirms the hypothesis]
(e.g., "15% or more of ad viewers sign up for the waitlist")

We are wrong if: [specific threshold that denies the hypothesis]
(e.g., "fewer than 5% of ad viewers sign up")
```

**The "ambiguous zone":** Results between right and wrong thresholds are ambiguous. Decide in advance whether you will run a second experiment to clarify or treat the ambiguous zone as "wrong" (conservative) or "right" (aggressive). Document this choice on the card before running.

**Why write it before:** Teams reviewing results after the fact have strong unconscious bias toward confirming their hypothesis. Pre-committed criteria prevent the most common form of self-deception in product development.

## The Learning Card

After each experiment, complete a Learning Card:

```
LEARNING CARD
=============

We observed: [what actually happened, in numbers]

From this we learned: [what the observation means]

Therefore we will: [next action -- persevere, pivot, or kill; and what to test next]

Confidence level: [very low / low / medium / high / very high]
Reason for confidence level: [brief justification]
```

The Learning Card closes the loop: the observation either confirms, denies, or produces an ambiguous result. In all three cases, it drives a next action.

## The Assumptions Map (2x2)

Not all assumptions deserve experiments. The Assumptions Map helps prioritize which assumptions to test first by plotting them on two axes:

**X-axis: Importance to success** (How critical is this assumption? If wrong, does the idea fail?)

**Y-axis: Current evidence level** (How much behavioral evidence do we have for this assumption?)

```
HIGH EVIDENCE
        |
        |   [Confirmed]        [Low priority]
        |   Already validated;  High evidence exists;
        |   continue            no immediate action
        |
        +--------------------------------------
        |   [TEST FIRST]       [Monitor]
        |   Critical AND        Not critical;
        |   unproven            evidence low but risk low
        |
LOW EVIDENCE

LOW IMPORTANCE --------+-------- HIGH IMPORTANCE
```

**Test First quadrant (high importance, low evidence):** These are the assumptions that could kill your idea, and you have little or no evidence for them. Design experiments for these before any others.

**Confirmed quadrant (high importance, high evidence):** Already validated -- proceed with confidence for these.

**Monitor quadrant (low importance, low evidence):** Not urgent, but worth keeping an eye on. May need to test eventually.

**Low priority quadrant (low importance, high evidence):** These assumptions pose low risk.

### Building the Assumptions Map

**Step 1:** List every core assumption in the business idea. Common categories:
- Customer segment assumptions ("These customers have this problem")
- Value proposition assumptions ("Our solution solves the problem")
- Channel assumptions ("We can reach these customers through X")
- Revenue assumptions ("Customers will pay $Y per Z")
- Cost assumptions ("We can deliver at this cost")

**Step 2:** Rate each assumption on importance (1-5) and current evidence level (1-5).

**Step 3:** Plot on the map. Identify the top 3-5 in the "Test First" quadrant.

**Step 4:** Assign a Test Card to each "Test First" assumption.

## Competing Hypotheses

Confirmation bias is the enemy of good experimentation. One protection against it is designing competing hypotheses: hypotheses where opposite outcomes are each pre-assigned a meaning.

**Example:**
- Hypothesis A: "We believe users will prefer self-service onboarding because they value speed and autonomy."
- Hypothesis B: "We believe users will prefer guided onboarding because they value feeling confident before starting."

Running the same experiment to test both simultaneously (e.g., A/B test) produces clear evidence: one side wins, or neither does clearly.

**Competing hypotheses are especially important when:**
- The team is split on which direction to take
- One option is clearly favored by leadership and there is pressure to confirm it
- Prior experiments have been ambiguous

## Experiment Selection Criteria

Choosing the right experiment requires matching the experiment type to the question being asked:

| Question | Experiment Category | Example Types |
|----------|--------------------|-----------   |
| Does the problem exist? | Exploration | Customer interview, ethnography |
| Is there market-level demand? | Discovery | Fake Door ad, landing page |
| Is our concept understood? | Discovery | Discussion prototype, explainer video |
| Does our solution work? | Validation | Concierge, Wizard of Oz, prototype |
| Will people pay? | Validation | Presale, crowdfunding, pricing test |
| Will people keep using it? | Validation | Retention cohort, OLI test |

## Evidence Expiration

Evidence has a shelf life. Customer behavior, market conditions, and competitive landscapes change. Evidence collected 18-24 months ago for a market that has since shifted is outdated.

**Signs evidence may have expired:**
- Market has been disrupted by a new entrant since the evidence was collected
- Customer demographics or behaviors have shifted (e.g., post-pandemic behavior changes)
- The regulatory environment has changed
- Pricing benchmarks in the category have moved significantly
- The evidence was collected in a different geographic market

**Policy:** Any assumption marked "confirmed" based on evidence older than 18 months should be re-evaluated before major investment.

## Experiment Ceremonies

### Before Each Experiment (Test Card Review)
- [ ] Hypothesis is written in testable, precise, discrete format
- [ ] Experiment is described clearly enough that any team member could run it
- [ ] Metric is specific (not "we'll see how many signups" but "we will measure email signup conversion rate")
- [ ] Success and failure criteria are set with specific thresholds
- [ ] Ambiguous zone handling is documented
- [ ] Team has agreed: no result interpretation before criteria check

### After Each Experiment (Learning Card Review)
- [ ] Observed results are stated in numbers, not impressions
- [ ] Results are compared against pre-set criteria
- [ ] Confidence level is assigned and justified
- [ ] Next action is determined: persevere / pivot / kill / run follow-up experiment
- [ ] Assumptions Map is updated based on new evidence

### Monthly Assumption Audit
- [ ] All active "Test First" assumptions reviewed
- [ ] Experiments scheduled for top unaddressed assumptions
- [ ] Previously confirmed assumptions checked for expiration
- [ ] Confidence levels across the map updated

## Hypothesis Writing Practice

These prompts help identify testable hypotheses from vague business beliefs:

**From "People want better X":**
"We believe [specific customer] will [choose our X over current alternatives] because [specific reason they are underserved by current options]."

**From "Our market is growing":**
"We believe [specific search behavior / observable trend] will translate into [specific customer action with our product] because [connection between trend and our offering]."

**From "Customers told us they'd pay for this":**
"We believe [customer segment who expressed interest] will [complete payment for the product] when [specific call-to-action is presented] because [their stated problem is important enough to pay to solve]."

**From "We just need to execute":**
List every assumption embedded in "execution." Each one is a hypothesis. Which is the riskiest? Test it first.
