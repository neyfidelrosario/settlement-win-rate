# Settlement Win-Rate Analysis: Which Discounts Close Deals Without Wasting Margin

A portfolio project built from a real collections workflow: when a client can't pay in full, you offer a settlement. How big a discount does it take to get a yes — and when is a bigger discount just giving money away?

All names, companies, and figures are fictional and representative. This is a portfolio exercise, not advice about any real employer's systems.

## What's inside

- `project-spec.md` — the full spec: business question, dataset description, method, weekend plan
- `settlement_offers.csv` — 60 anonymized settlement offers (balances, discounts, outcomes, decision times)
- `starter-queries.sql` — four SQL queries: big picture, win rate and speed by discount band, margin cost per win, counter rates
- `interview-talking-points.md` — how to talk about this project in interviews, each point tied to a business-analysis skill

## Run it yourself

1. Import `settlement_offers.csv` into SQLite (table name: `offers`, column names in first row)
2. Run the queries in `starter-queries.sql` in order
3. Compare the bands: win rate, speed, and margin cost together

## The finding in one paragraph

The 20–30% discount band won every offer at a reasonable margin cost. The 30%+ band won less often, closed only slightly faster, and cost more than double the margin per win — mostly waste. The 5–10% band got countered 30% of the time: too low to close. The sweet spot is clear, and so is the recommendation: cap first offers, escalate deliberately.
