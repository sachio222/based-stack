---
name: testing-business-ideas
description: 'Design and run experiments to validate business ideas before building. Use when the user mentions "testing assumptions", "validating ideas", "fake door test", "pretotyping", "concierge MVP", "desirability risk", "ILI/OLI", or "Wizard of Oz experiment". Covers hypothesis design, evidence evaluation, and the full experiment library. For ongoing product discovery, see continuous-discovery. For build-measure-learn cycles, see lean-startup.'
license: MIT
metadata:
  author: avery
  source: "Testing Business Ideas by David Bland and Alex Osterwalder (Strategyzer) + Pretotype It by Alberto Savoia"
---

# Testing Business Ideas

A systematic approach to reducing the risk that you build a product nobody wants. Before writing code, spending money, or building a team, design targeted experiments that generate real evidence about whether your business idea is desirable, feasible, and viable.

## Core Principle

**Most products fail not from bad execution, but from building the wrong thing.** The question is not "can we build this?" but "should we build this, and will anyone care?"

**The foundation:** Every unvalidated business idea is a collection of assumptions. Some of those assumptions, if wrong, will cause the idea to fail. The goal of testing is to identify the riskiest assumptions first and design the cheapest possible experiment that produces real evidence -- evidence from what people actually do, not what they say they will do.

## Scoring

**Goal: 10/10.** When reviewing business plans, product roadmaps, or feature proposals, rate them 0-10 based on how well they test assumptions before committing resources. A 10/10 means the riskiest assumptions are identified, experiments are designed to generate behavioral evidence, and decisions are made based on data rather than opinions. Lower scores indicate work built on untested assumptions, reliance on stated preferences, or skipping desirability testing to jump to feasibility.

## Testing Business Ideas Framework Overview

| Section | Focus | Key Output |
|---------|-------|------------|
| **Validation Mindset** | Why testing is necessary and what counts as evidence | Shift from Thoughtland to data |
| **Hypothesis Design** | How to form testable, precise hypotheses | Test Card, Assumptions Map |
| **Evidence Spectrum** | Evaluating what counts as strong vs. weak evidence | Evidence confidence levels |
| **Discovery Experiments** | Low-cost experiments to explore desirability | Fake doors, interviews, pretotypes |
| **Validation Experiments** | Higher-commitment experiments to confirm desirability and viability | Concierge, presale, Wizard of Oz |

---

### 1. The Validation Mindset

**Core concept:** Most founders and product teams spend their time in Thoughtland -- a world of opinions, arguments, and internal debates about what might work. Data beats opinions. The market is the only judge that matters, and the market reveals itself through behavior, not surveys.

**Why it works:** The Law of Failure states that 70-90% of new products fail after launch. Most of those failures were predictable with even basic testing. The root cause is almost always that someone assumed a problem existed, assumed customers wanted the solution, and assumed people would pay -- without ever testing those assumptions against reality.

**Key insights:**
- **Thoughtland is dangerous** -- every hour spent debating internally is an hour not spent getting real evidence from customers
- **The Law of Failure is real** -- 70-90% of new products fail; this is not bad luck, it is predictable from skipped validation
- **Three risk types must all be addressed** -- desirability (do people want it?), feasibility (can we build it?), viability (can we make money?)
- **Test desirability first** -- there is no point proving feasibility if no one wants the product
- **Pretotyping ≠ prototyping** -- a prototype tests whether you can build it; a pretotype tests whether you should build it
- **Behavioral evidence beats stated intent** -- someone clicking "buy" is stronger evidence than someone saying "I would buy that"

**Product applications:**

| Context | Application | Example |
|---------|-------------|---------|
| Founder has a "brilliant" idea | Map the assumptions before writing code | "I assume adults in this neighborhood want structured fitness classes" -- test it |
| Team debate about which feature to build | Identify which camp's assumption is riskier | Riskiest assumption gets an experiment, not more debate |
| Business plan written with projections | Audit every number for its underlying assumption | "10% market penetration" assumes awareness, interest, and willingness to pay |
| Investor asks for traction | Design experiment to generate real traction signal | Presale campaign, not a survey |
| Product launched but not growing | Diagnose which risk type failed | Is it desirability, feasibility, or viability? |
| New market being entered | Start with desirability before anything else | Fake door ad before building product for that market |

**Copy patterns:**
- "What's the assumption behind that? How would we test it?"
- "That's Thoughtland. What would the data say?"
- "We're debating opinions. Let's design an experiment."
- "Test desirability first. Feasibility doesn't matter if nobody wants it."

**Ethical boundary:** The goal of testing is to find the truth, not to confirm the founder's belief. Experiments must be designed to falsify hypotheses, not just collect cherry-picked positive signals. Cherry-picked validation is worse than no validation -- it creates false confidence.

See: [references/validation-mindset.md](references/validation-mindset.md)

---

### 2. Hypothesis and Experiment Design

**Core concept:** A well-formed hypothesis is testable, precise, and discrete. Vague hypotheses generate ambiguous results that support any interpretation. The Test Card is a structured format for defining what you believe, how you will test it, what you will measure, and what result would confirm or deny it.

**Why it works:** Without a precise hypothesis written before the experiment, teams interpret results to confirm what they already believed. The Test Card forces the team to commit to success criteria upfront -- before they see the data.

**Key insights:**
- **Hypothesis format: "We believe [customer] will [action] because [reason]"** -- fills in who does what and why
- **Testable means falsifiable** -- if there is no possible result that would deny the hypothesis, it is not a hypothesis, it is an assumption masquerading as one
- **Discrete means one thing at a time** -- testing multiple things in one experiment produces ambiguous results
- **The Assumptions Map (2x2)** -- plot assumptions on importance x evidence axes to find the most critical and least-evidenced assumptions to test first
- **Competing hypotheses** -- always design experiments that could produce opposite conclusions; this prevents confirmation bias
- **Success criteria must be set before running** -- post-hoc success criteria are always conveniently met

**Product applications:**

| Context | Application | Example |
|---------|-------------|---------|
| Multiple assumptions to test | Use Assumptions Map to prioritize | "Do adults in this market want structured fitness classes?" is high-importance, low-evidence -- test it first |
| Team argues what "success" looks like | Fill Test Card before running experiment | "Success = 20% of ad clicks convert to email signup" |
| Experiment produces ambiguous results | Check if hypothesis was precise enough | If yes, run a sharper experiment; if no, rewrite the hypothesis |
| Product has been built on assumptions | Audit the existing assumptions | Map every claim in the business plan to evidence level |
| Two features compete for roadmap slot | Design competing hypotheses | "Users prefer X over Y" vs. "Users prefer Y over X" -- run A/B or test sequentially |
| Post-launch data looks good | Check for confirmation bias | Are you measuring what you predicted, or what happened to be good? |

**Copy patterns:**
- "Write the hypothesis in the format: we believe [who] will [do what]. Now write the Test Card."
- "What result would prove this hypothesis wrong? If you can't answer, it's not testable."
- "Set the success criteria now, before you look at the data."
- "Put this assumption on the map -- how important is it, and how much evidence do we have?"

**Ethical boundary:** Experiment design must include genuine success and failure criteria. Designing an experiment where any outcome can be interpreted as success is manipulative -- to the team, investors, and yourself.

See: [references/experiment-design.md](references/experiment-design.md)

---

### 3. The Evidence Spectrum

**Core concept:** Not all evidence is equal. What people say is weak evidence. What people do is strong evidence. The distance between "I would use that" and "I am using that" is enormous. The Evidence Spectrum ranks evidence types from weakest to strongest and defines what "confident" actually means.

**Why it works:** Teams naturally over-weight positive signals from people they talk to. Customer interviews feel like validation when they are often just politeness. The Evidence Spectrum forces teams to ask: what type of evidence do we actually have, and is it strong enough to justify the next commitment?

**Key insights:**
- **ILI (Initial Level of Interest)** -- first evidence that someone is interested; useful for go/no-go, not for investment decisions
- **OLI (Ongoing Level of Interest)** -- evidence that interest persists through friction; much stronger than ILI
- **The call-to-action threshold** -- any experiment that requires a real commitment (click, sign up, pay) crosses from stated intent to behavioral evidence
- **Stated intent decays under friction** -- "I would definitely use that" becomes "maybe" when the form appears, and "no" when payment is required
- **Confidence levels matter** -- "very confident" requires multiple behavioral experiments at scale; "mildly confident" is one experiment with a small sample
- **Evidence expires** -- evidence from 18 months ago about customer behavior may no longer apply; markets shift

**Product applications:**

| Context | Application | Example |
|---------|-------------|---------|
| Customer interview produced positive feedback | Calibrate confidence as low -- stated intent only | "Interesting signal, not evidence. We need behavioral data." |
| Landing page had 100 signups | Calibrate as medium -- ILI with low friction | "Email signup is ILI. We need a payment or higher-commitment action." |
| 15 people pre-ordered at $99 | Calibrate as high -- OLI with real commitment | "Real money from real people. This is strong evidence." |
| Survey says 80% want the feature | Calibrate as very weak -- stated preference | "Survey data doesn't predict behavior. What do people do when it's real?" |
| Pilot cohort used product for 3 months | Calibrate as very strong -- sustained behavioral evidence | "This is OLI at scale. Now you can invest." |
| Old case study being used to justify new direction | Check evidence expiration | "Is that customer behavior still valid? What's changed?" |

**Copy patterns:**
- "That's what they said. What did they do?"
- "ILI or OLI? Did they commit to anything real?"
- "How confident are we, really? Based on behavior or based on what people told us?"
- "That evidence is from two years ago. Markets change. What's the current signal?"

**Ethical boundary:** Overstating evidence confidence to secure funding or organizational buy-in is a form of fraud. Teams must be honest about what type of evidence they have and what it does and does not prove.

See: [references/evidence-spectrum.md](references/evidence-spectrum.md)

---

### 4. Discovery Experiments

**Core concept:** Discovery experiments are low-cost ways to explore whether a problem is real and whether customers are interested in a solution. They generate ILI -- initial signals of interest -- and are designed for speed and low investment, not definitive proof.

**Why it works:** Before spending weeks building even a minimal product, discovery experiments can eliminate the most obvious wrong directions in hours or days. A fake door ad that gets zero clicks is not a failure -- it is a cheap answer to an important question.

**Key insights:**
- **Exploration experiments** (interviews, ethnography, surveys) generate insight but not behavioral evidence -- treat them as hypothesis generators
- **Fake door tests** are the most important discovery tool -- they measure whether people act on interest, not just express it
- **Pretotypes test initial appeal with minimum investment** -- before the Pinocchio is real, find out if anyone would want a real one
- **Discussion prototypes** (paper mockups, explainer videos, brochures) test whether the concept is understandable and appealing before building
- **The Fake Door pretotype** -- advertise a product that does not exist; measure clicks, signups, or form completions
- **The Pinocchio pretotype** -- build a non-functional version of the product to gauge reaction to the real object

**Product applications:**

| Context | Application | Example |
|---------|-------------|---------|
| Completely new idea, no customer contact yet | Start with customer interviews for problem discovery | 10 interviews to understand the problem before designing a solution |
| Idea exists, want to test interest | Run a fake door ad to measure ILI | Facebook ad for a product that doesn't exist; measure click-through |
| Complex product concept to communicate | Build an explainer video before any code | 2-minute video; measure shares, comments, and ILI signups |
| Want to validate problem severity | Use job shadowing / ethnography | Spend a day observing target customers at work |
| Multiple solution directions | Run a landing page test per direction | Three landing pages with different value propositions; compare conversion |
| New market / geography | Check search trends and forum activity first | Google Trends + Reddit threads before any investment |

**Copy patterns:**
- "Before we build anything, let's run a fake door. If nobody clicks, we have our answer."
- "Let's interview 10 customers -- not to validate our solution, but to understand their problem."
- "An explainer video costs $500 and two days. It will answer the question faster than building."
- "Search trends and forum data are free. Check them before committing to this direction."

**Ethical boundary:** Fake door tests must not deceive customers in harmful ways. If someone clicks "buy" on a fake door, they must receive a clear explanation that the product does not yet exist. Do not collect payment on a fake door unless you intend to fulfill or clearly disclose.

See: [references/discovery-experiments.md](references/discovery-experiments.md)

---

### 5. Validation Experiments

**Core concept:** Validation experiments are higher-commitment tests that generate OLI -- evidence that interest persists through friction, up to and including payment. They require more investment to run but produce stronger evidence. Run validation experiments after discovery experiments have established initial interest.

**Why it works:** Discovery experiments answer "is there interest?" Validation experiments answer "is the interest real enough to build on?" The gap between ILI and OLI is where most optimistic projections die. Validation experiments force that gap to be crossed with evidence before major investment.

**Key insights:**
- **Interaction prototypes** test whether the solution actually works for customers -- clickable prototypes, concierge, Wizard of Oz, and single-feature MVPs
- **Call-to-action experiments** cross the behavioral threshold -- presales, crowdfunding, and A/B tests with real stakes
- **The Wizard of Oz experiment** -- a real-looking product powered by humans behind the scenes; tests the full experience before building the engine
- **The concierge experiment** -- the service is delivered manually, with the customer knowing it is manual; tests value delivery without the product
- **XP Spike** -- a time-boxed feasibility experiment that tests whether a critical technical component can be built at all
- **Presale** -- the strongest single validation signal; someone handing over money for something that does not yet exist

**Product applications:**

| Context | Application | Example |
|---------|-------------|---------|
| Discovery says problem is real; need to test solution | Run a concierge experiment with 5 customers | Manually deliver the service your product would automate; charge for it |
| Need to test full user experience without building back-end | Run Wizard of Oz | Front-end looks real; humans fulfill requests; test UX and value |
| Uncertain if technical core is feasible | Run XP Spike before betting on full build | 2-week spike: can we do real-time transcription at this cost? |
| Want strongest possible evidence before major investment | Run a presale campaign | Charge full price before building; require minimum commitments |
| Competing features for next quarter | Run A/B test on two landing pages with different value props | Measure conversion to paid signup |
| Enterprise deal being negotiated | Use letter of intent as validation | Customer signs LOI before product is built |

**Copy patterns:**
- "Let's run a concierge first. If we can't deliver value manually, we can't automate it."
- "Wizard of Oz costs two weeks. Building the real engine costs six months. Let's test first."
- "A presale is the best data we can get. If nobody buys before it's built, reconsider the bet."
- "The XP Spike answers the feasibility question. One week. Yes or no."

**Ethical boundary:** Validation experiments involving real customer commitment (presales, LOIs, pilot fees) create real obligations. Be prepared to deliver or clearly and fairly communicate delays and options. Using validation experiments to collect money without intent to deliver is fraudulent.

See: [references/validation-experiments.md](references/validation-experiments.md)

---

## The Iterative Testing Loop

Validation is not a single event. It is a cycle repeated until confidence is high enough to justify the next level of investment.

```
HYPOTHESIZE
    ↓
SELECT experiment type (discovery or validation)
    ↓
DESIGN (Test Card: hypothesis, method, metric, criteria)
    ↓
RUN the experiment
    ↓
LEARN (Learning Card: what we predicted vs. what happened)
    ↓
DECIDE: Persevere / Pivot / Kill
    ↓
(back to HYPOTHESIZE with refined or new assumptions)
```

**Persevere:** Evidence supports the hypothesis. Continue to the next riskiest assumption.

**Pivot:** Evidence does not support the hypothesis but reveals a different, adjacent opportunity. Reformulate and test.

**Kill:** Evidence refutes the hypothesis and no pivot direction is apparent. Stop investing in this idea.

**The loop always continues:** Even after a successful launch, new assumptions emerge. The testing mindset never ends -- it just shifts from pre-launch risk reduction to post-launch optimization and growth.

---

## Pretotype Sequencing

Pretotyping follows a progression from cheapest (ILI) to most expensive (OLI), matching investment level to evidence quality:

| Stage | Goal | Experiment Types | Evidence Type |
|-------|------|-----------------|---------------|
| **ILI Test** | Is there any interest at all? | Fake Door, Fake Door Ad, Pinocchio, Re-Label | Initial behavioral signal |
| **OLI Test** | Does interest persist with friction? | Landing page with email capture, explainer video + waitlist, pop-up store | Committed interest |
| **Major commitment** | Will people actually pay? | Presale, crowdfunding, concierge (charged), pilot program with fee | Revenue signal |

**Never skip stages.** Jumping to a presale without ILI data is wasteful. Stopping at ILI before OLI data produces over-optimism.

---

## Common Mistakes

| Mistake | Why It Fails | Fix |
|---------|-------------|-----|
| **Building before testing desirability** | You might build the wrong thing perfectly | Test desirability first; feasibility second |
| **Using surveys as validation** | Stated preferences don't predict behavior | Design experiments that require real action |
| **Testing with friends and family** | They tell you what you want to hear | Test with strangers who match your target customer |
| **No pre-set success criteria** | Post-hoc interpretation always confirms the hypothesis | Write success criteria on the Test Card before running |
| **One experiment, one conclusion** | Single data points are unreliable | Triangulate with 2-3 independent experiment types |
| **Treating ILI as OLI** | ILI overpredicts real demand | Always push to OLI before major investment |
| **Testing only desirability** | Viable product still needs feasibility and viability | After desirability, test feasibility (can we build?) and viability (can we make money?) |

---

## Quick Diagnostic

| Question | If No... | Action |
|----------|----------|--------|
| Are the riskiest assumptions identified? | You're testing the easy ones | Map assumptions by importance x evidence |
| Is the hypothesis written in testable form? | Results will be ambiguous | Rewrite: "We believe [who] will [do what]" |
| Are success criteria set before running? | You'll interpret results to confirm bias | Fill in Test Card criteria now |
| Is the experiment generating behavioral data? | You're getting stated preferences | Redesign to require a real action |
| Have you reached OLI evidence on desirability? | You have only initial signals | Run a commitment-level experiment |

---

## Reference Files

- [validation-mindset.md](references/validation-mindset.md): Law of Failure, Thoughtland, pretotyping vs. prototyping, three risk types, Pretotyping Manifesto
- [experiment-design.md](references/experiment-design.md): Hypothesis format, Assumptions Map (2x2), Test Card, Learning Card, competing hypotheses, evidence expiration
- [evidence-spectrum.md](references/evidence-spectrum.md): Evidence strength taxonomy, ILI and OLI, confidence levels, behavioral vs. stated intent
- [discovery-experiments.md](references/discovery-experiments.md): Full discovery experiment library with definitions, when to use, cost/time/evidence ratings. Fake Door, Pinocchio, Re-Label, interviews, ethnography, data analysis
- [validation-experiments.md](references/validation-experiments.md): Full validation experiment library. Concierge, Wizard of Oz, MVP types, presale, crowdfunding, XP Spike, letter of intent

## About the Authors

**David Bland** is a co-founder of Precoil and an expert in testing business ideas before and after product launch. He has coached hundreds of startups and corporate innovation teams on how to apply lean experimentation. **Alex Osterwalder** is the creator of the Business Model Canvas and a co-founder of Strategyzer. Together with the Strategyzer team, they developed the experiment library in *Testing Business Ideas* to bridge the gap between idea generation and evidence-based decisions.

**Alberto Savoia** is a former Engineering Director at Google and the creator of the pretotyping methodology. His work, published in *Pretotype It*, forms the foundation for understanding how to test initial appeal before investing in prototyping or development.

## Further Reading

- [*"Testing Business Ideas"*](https://www.amazon.com/Testing-Business-Ideas-David-Bland/dp/1119551447) by David Bland and Alex Osterwalder
- [*"Pretotype It"*](https://www.pretotyping.org/) by Alberto Savoia (free PDF at pretotyping.org)
- [*"The Lean Startup"*](https://www.amazon.com/Lean-Startup-Entrepreneurs-Continuous-Innovation/dp/0307887898) by Eric Ries
- [*"The Mom Test"*](https://www.amazon.com/Mom-Test-customers-business-everyone/dp/1492180742) by Rob Fitzpatrick
