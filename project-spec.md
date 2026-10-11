# Settlement Win-Rate Analysis: Which Discounts Close Deals Without Wasting Margin

## What this is

A portfolio project built from a real collections workflow: when a client can't pay in full, you offer a settlement — pay less than the full balance, but pay now. The question every negotiator faces: how big a discount does it take to get a yes, and when is a bigger discount just giving money away?

All names, companies, and figures here are fictional and representative. This is a portfolio exercise. It is not advice about any real employer's systems.

## The business question

"Which discount levels get accepted fastest — and which ones just waste margin?"

## The dataset

One file: `settlement_offers.csv` — 60 anonymized settlement offers. Each row is one offer, with:

- **offer_id** — anonymous label (OFFER-001, OFFER-002, ...)
- **account_id** — anonymous client label
- **balance_owed** — the full amount the client owed
- **discount_pct** — the discount offered, as a percent (5–40%)
- **settlement_amount** — what the client would pay if they accept
- **discount_dollars** — the dollars of margin given away by the discount
- **outcome** — accepted, rejected, or countered
- **days_to_decision** — how many days until the client decided
- **contact_round** — which negotiation round the offer was (1st, 2nd, or 3rd)
- **balance_age_days** — how overdue the balance was when the offer was made
- **client_tenure_months** — how long the client has been around
- **industry** — the client's line of business (kept generic)

## The method

Group offers into discount bands (5–10%, 10–20%, 20–30%, 30%+) and compare three things per band:

1. **Win rate** — what share of offers get accepted. Bigger discounts should win more often. The question is how much more.
2. **Speed** — average days to a decision. Bigger discounts should close faster. Again: how much faster?
3. **Margin cost** — discount dollars given away per accepted offer. This is the price of the win.

The insight comes from putting all three together. If the 30%+ band wins only slightly more often and slightly faster than the 20–30% band but costs twice the margin per win, that extra discount is waste. The band with the best balance of wins, speed, and margin kept is the sweet spot.

## The deliverable

A one-page write-up answering:

- Which discount band is the sweet spot, and why (wins, speed, and margin together)
- Roughly how much margin is being wasted on over-discounted offers
- One concrete recommendation: e.g., "cap first offers at X%, escalate to Y% only after Z days"
- Which offers get countered most, and what that says about the opening discount
- One honest limitation of the analysis

## Starter files

- `settlement_offers.csv` — the dataset (60 offers, described above)
- `starter-queries.sql` — four SQL queries to begin:
  1. The big picture: total offers, overall win rate, average discount, average days to decision
  2. Win rate, speed, and count by discount band
  3. Margin cost: discount dollars given away per accepted offer, by band
  4. Counter rate by discount band
- `interview-talking-points.md` — how to talk about this project in interviews

## Weekend plan

**Day 1 — Explore (2–3 hours).** Load the CSV into SQLite (table name: `offers`, column names in first row). Run the starter queries. Sanity-check the data: any impossible values, any missing outcomes? Write down what you find.

**Day 2 — Conclude and write up (2–3 hours).** Name the sweet-spot band. Estimate the wasted margin. Write the one-page summary: the recommendation, the numbers behind it, and one limitation.

## How to present it

- Add it to the same GitHub account as the collections project, as a second repository.
- Link it from LinkedIn's Featured section next to the first project. Two projects side by side tell a story: this person does this kind of thinking repeatedly.
- In interviews, walk through it using the talking points.
- Never present the figures as real. If asked, say: "The data is fictional and representative; the workflow is real."
