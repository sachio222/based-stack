# Validation Experiments: Generating OLI Before Major Investment

Validation experiments are run after discovery experiments have established initial interest. Where discovery experiments generate ILI (initial signal that anyone cares), validation experiments test whether interest is real enough to build on: whether people will pay, use the product repeatedly, and refer others.

Validation experiments cost more to run than discovery experiments -- in time, money, and customer relationship capital. Run them after discovery has reduced the risk that you are testing the wrong idea entirely.

## Experiment Library: Interaction Prototypes

### Clickable Prototype

**Definition:** A digital mockup of the product's interface that simulates interactions -- screens advance, buttons respond -- without any back-end functionality.

**Purpose:** Test whether the UX flow makes sense to users. Identify confusion, drop-off points, and missing affordances before building.

**When to use:**
- After paper prototyping has validated the concept
- Before investing in front-end development
- When testing checkout flows, onboarding sequences, or complex interactions

**How to run:**
1. Build in Figma, Marvel, or InVision with linked screens
2. Recruit 5-8 target customers
3. Give them a task to complete without explanation
4. Observe where they get stuck; note the points of confusion
5. Do not help them during the session

**Evidence generated:** Usability insights; UX validation. Not demand evidence.

**Time/cost:** 1-5 days, low to medium cost

**Evidence strength:** Moderate for UX; weak for demand

---

### Single Feature MVP

**Definition:** A fully functional product with only the one feature that most directly tests the core value hypothesis. Everything else is stripped.

**Purpose:** Test whether real users actually use and return to the core value proposition -- with real code, real data, real conditions.

**When to use:**
- After usability is validated via prototype
- When you need real usage data, not just intent
- When the core value is a specific interaction or workflow

**How to run:**
- Build only the single feature that tests the value hypothesis
- No settings, profiles, dashboards, or administrative features
- Recruit 20-50 target users
- Instrument every interaction
- Measure: activation (did they use it once?), retention (did they return?), and engagement (how deeply?)

**Evidence generated:** Real behavioral usage data; OLI if retention is measured

**Time/cost:** 2-6 weeks, medium to high cost

**Evidence strength:** High; real usage under real conditions

---

### Concierge Experiment

**Definition:** Deliver the product's value proposition manually to a small number of customers, with the customer knowing it is manual. No technology. Just humans doing the work.

**Purpose:** Test whether the core value delivery generates real customer behavior -- willingness to pay, return usage, referrals -- before automating anything.

**When to use:**
- When the product automates a service that could be done manually
- When you want to deeply understand the customer workflow
- As the first step before building any technology

**How to run:**
1. Identify 3-10 target customers who have the problem
2. Offer to solve it for them manually (be transparent about this)
3. Charge for it, or at minimum ask for a clear commitment
4. Deliver the service
5. Observe: what do they value? What do they ignore? What do they ask for that you did not offer?

**Real example:** Food on the Table (acquired by Univision) -- founder visited one family's home, learned their food preferences, checked local store sales by hand, and created a grocery list. He did this for 1 family, then 5, then dozens -- before writing a single line of code. Validated demand and understood the workflow simultaneously.

**Evidence generated:** Behavioral OLI if charged; qualitative insight on value delivery

**Time/cost:** 1-3 weeks, low technology cost; significant human time

**Evidence strength:** High; real customer behavior with real service delivery

---

### Wizard of Oz Experiment

**Definition:** The customer-facing experience appears to be a working product. Behind the scenes, humans perform the operations manually.

**Purpose:** Test the full customer experience -- UX, value delivery, and willingness to pay -- before building the back-end engine.

**When to use:**
- When the front-end experience is critical to test but the back-end is complex
- When you want to test the complete user journey including fulfillment
- When building the real system would take months but the experience can be simulated manually

**How to run:**
1. Build the front-end experience (website, app, or interface) with working UI
2. When a customer submits a request, a human processes it manually instead of software
3. Deliver the result through the same channel the product would use (email, app response, etc.)
4. Measure: do customers complete the action? Do they return? Do they pay?

**Real example:** Zappos -- Nick Swinmurn built a website for buying shoes online. When someone ordered, he went to a local shoe store, bought the shoes at retail price, and shipped them. Validated that people would buy shoes online before building inventory systems, supplier relationships, or fulfillment infrastructure.

**Evidence generated:** Behavioral OLI (real purchase, real usage, real return rate)

**Time/cost:** 1-3 weeks for front-end; ongoing human labor for fulfillment

**Evidence strength:** Very high; complete customer experience with real behavioral data

---

### Mash-Up / Piecemeal MVP

**Definition:** Combine existing off-the-shelf tools to deliver the product experience without building custom technology.

**Purpose:** Test the full customer workflow and value delivery using Zapier, Airtable, Typeform, Calendly, Stripe, and other SaaS tools -- before building anything custom.

**When to use:**
- When your product orchestrates existing capabilities in a new way
- When speed to test is more important than scalability
- When you want to understand the workflow before committing to custom architecture

**Real example:** Groupon began as a WordPress blog. Each deal was a manually created PDF coupon emailed to subscribers via Apple Mail. No custom platform, no payment processing, no coupon system. The piecemeal stack validated the model before any custom development.

**Evidence generated:** Real behavioral data; OLI if charging

**Time/cost:** 3-10 days, low cost

**Evidence strength:** High; real customer behavior, limited by UX rough edges

---

## Experiment Library: Call to Action

### Landing Page with Paid CTA

**Definition:** A landing page that includes a real payment option or formal commitment action (pay now, pre-order, sign a commitment form).

**Purpose:** Cross the call-to-action threshold from ILI to OLI. Measure whether interest converts to real commitment.

**When to use:**
- After email-capture landing page has established ILI
- When you want to test willingness to pay at a specific price
- When comparing pricing tiers

**Evidence generated:** Behavioral OLI (payment or commitment action)

**Time/cost:** 1-3 days, low to medium cost

**Evidence strength:** High for desirability and willingness to pay

---

### Presale / Pre-Order

**Definition:** Charge customers for the product before it exists. Use the revenue and order count as evidence of demand.

**Purpose:** Generate the strongest possible single demand signal. If people pay for something that does not exist, interest is real.

**When to use:**
- After ILI is established
- When you want to validate at a specific price point
- Before making a major development investment

**How to run:**
1. Set up a payment page (Stripe, Gumroad, Kickstarter, a direct form)
2. Describe the product and its value clearly
3. Set a specific price
4. Accept payment; commit to delivering or providing a clear refund policy
5. Measure number of orders and total revenue against your success criteria

**Real example:** Pebble Watch raised $10.3M from 68,929 backers on Kickstarter in 2012, before manufacturing. The presale funded production and proved demand simultaneously.

**Ethical note:** Presales create real obligations. Be prepared to deliver or to refund clearly and promptly. Do not run presales if you are not committed to delivering.

**Evidence generated:** Revenue and order count -- the strongest possible ILI/OLI signal

**Time/cost:** 1 week to set up, variable duration to collect orders

**Evidence strength:** Highest; real money from real customers

---

### Crowdfunding Campaign

**Definition:** A public fundraising campaign (Kickstarter, Indiegogo) that collects pre-orders and validates demand publicly.

**Purpose:** Test demand at scale, with social proof amplification. The campaign page tells the product story; backers vote with money.

**Additional benefit over direct presale:** Crowdfunding platforms drive organic discovery from their existing audiences. A successful campaign attracts press coverage. Social proof accumulates publicly.

**Evidence generated:** Revenue, backer count, geographic distribution, media pickup

**Time/cost:** 2-4 weeks to prepare, 30-60 day campaign

**Evidence strength:** Very high

---

### A/B Test

**Definition:** Show different versions of a page, CTA, pricing, or value proposition to different segments of users. Measure which version drives the desired behavior.

**Purpose:** Test specific hypotheses about what drives customer behavior -- which message converts better, which price converts better, which feature drives more engagement.

**When to use:**
- With an existing user base large enough for statistical significance
- When making optimization decisions, not go/no-go decisions
- When testing positioning or pricing within an established product

**Minimum sample size:** Typically 100-500 completed actions per variant for meaningful results. Do not run A/B tests with too-small samples and claim statistical significance.

**Evidence generated:** Relative behavioral difference between variants

**Time/cost:** 1 week to set up, variable duration to reach significance

**Evidence strength:** High for optimization; not appropriate for go/no-go decisions

---

## Experiment Library: Simulation

### Wizard of Oz / Mechanical Turk

The Mechanical Turk variant names the full simulation experiment: customers interact with what appears to be automated AI or software, but the responses are generated by humans.

**When to use for AI/ML products:** Before building the ML model, simulate the output with human reviewers. Test whether customers value the output before investing in training.

---

### Pop-Up Store / Event

**Definition:** Temporarily operate a physical version of the business to test demand, workflow, and customer behavior in real conditions.

**Purpose:** Test a physical or service product concept at minimal permanent commitment.

**When to use:**
- Physical product or location-based service concepts
- When real customer behavior requires a physical touchpoint
- When you want to test operations and customer experience simultaneously

**Evidence generated:** Real sales data, customer behavior, operational learning

**Time/cost:** 1-3 days plus setup, medium cost

**Evidence strength:** High; real purchase behavior in real conditions

---

### Letter of Intent (LOI)

**Definition:** A signed document from a potential customer expressing their intent to purchase the product once it is available.

**Purpose:** Validate demand for B2B products before development begins. An LOI is a soft commitment -- not a contract, but a meaningful signal.

**When to use:**
- B2B products where direct sales is the go-to-market motion
- When the product needs 6-18 months to build
- When investor due diligence requires demand signals

**Evidence generated:** Named potential customers with signed intent documents

**Time/cost:** 2-4 weeks of sales conversations, minimal cost

**Evidence strength:** High for B2B context; "soft" commitment but real reputational stake

---

## Experiment Library: XP Spike

### XP Spike (Feasibility Test)

**Definition:** A time-boxed technical experiment (typically 1-2 weeks) designed to answer one specific feasibility question: "Can we build X at all, and at what cost?"

**Purpose:** Reduce feasibility risk on a critical technical component before committing to building the full product.

**When to use:**
- When a critical component of the product has never been built before
- When an integration or API dependency is uncertain
- When the cost model depends on a technical assumption that has not been tested
- Before betting on a full cycle for technically novel work

**How to run:**
1. Define the specific technical question (not the product, the question)
2. Time-box: 1-2 weeks maximum
3. Build only what is needed to answer the question
4. Document: can it be done? At what cost? At what scale?

**Output:** A go/no-go decision on the technical approach, not a shippable feature.

**Evidence generated:** Technical feasibility data; cost estimates; architecture proof-of-concept

**Time/cost:** 1-2 weeks, developer time only

**Evidence strength:** High for feasibility; irrelevant for desirability

---

## Validation Experiment Selection Guide

| Situation | Recommended Experiment |
|-----------|----------------------|
| Have ILI; need OLI before building | Concierge, Wizard of Oz, presale |
| Complex workflow; need to understand before automating | Concierge (transparent) |
| Full experience needs testing; back-end complex | Wizard of Oz |
| Need price point validation | Presale at target price |
| B2B; need named customers | Letter of Intent |
| Technical feasibility uncertain | XP Spike |
| Existing user base; optimizing conversion | A/B test |
| Physical product or local service | Pop-up store |
| Want public social proof + funding | Crowdfunding |
| Need to test the AI/ML output before building the model | Mechanical Turk simulation |

## Pretotype Types That Map to Validation

### Mechanical Turk Pretotype (Savoia)

Simulate an automated or AI-powered experience with human intelligence. Customers interact with what appears to be software; a human generates the responses.

**Key difference from Wizard of Oz:** In Mechanical Turk, the emphasis is on testing whether the output has value, not the overall experience. Used specifically for AI, recommendation, or automation products.

### Pretend-to-Own Pretotype

Borrow, rent, or temporarily acquire an existing product to test customer behavior with the product type before building your own version.

**Example:** Before building a new fitness tracking device, give target customers a competitor's device to use for 30 days. Measure whether they change their fitness behavior at all. If they do not change behavior with a proven device, they will not change behavior with yours.
