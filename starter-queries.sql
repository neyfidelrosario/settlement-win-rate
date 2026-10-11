-- Starter queries for the settlement win-rate project.
-- Run these against settlement_offers.csv (import it into SQLite first,
-- table name: offers, column names in first row).

-- 1. The big picture: how many offers, win rate, average discount and speed.
SELECT
  COUNT(*) AS total_offers,
  SUM(CASE WHEN outcome = 'accepted' THEN 1 ELSE 0 END) AS accepted,
  ROUND(100.0 * SUM(CASE WHEN outcome = 'accepted' THEN 1 ELSE 0 END) / COUNT(*), 1) AS win_rate_pct,
  ROUND(AVG(discount_pct), 1) AS avg_discount_pct,
  ROUND(AVG(days_to_decision), 1) AS avg_days_to_decision
FROM offers;

-- 2. Win rate and speed by discount band.
SELECT
  CASE
    WHEN discount_pct < 10 THEN '5-10%'
    WHEN discount_pct < 20 THEN '10-20%'
    WHEN discount_pct < 30 THEN '20-30%'
    ELSE '30%+'
  END AS discount_band,
  COUNT(*) AS offers,
  ROUND(100.0 * SUM(CASE WHEN outcome = 'accepted' THEN 1 ELSE 0 END) / COUNT(*), 1) AS win_rate_pct,
  ROUND(AVG(days_to_decision), 1) AS avg_days_to_decision
FROM offers
GROUP BY discount_band
ORDER BY MIN(discount_pct);

-- 3. Margin cost: discount dollars given away per accepted offer, by band.
-- This is the price of each win. Watch how it climbs in the top band.
SELECT
  CASE
    WHEN discount_pct < 10 THEN '5-10%'
    WHEN discount_pct < 20 THEN '10-20%'
    WHEN discount_pct < 30 THEN '20-30%'
    ELSE '30%+'
  END AS discount_band,
  SUM(CASE WHEN outcome = 'accepted' THEN 1 ELSE 0 END) AS accepted_offers,
  ROUND(SUM(CASE WHEN outcome = 'accepted' THEN discount_dollars ELSE 0 END), 2) AS total_margin_given,
  ROUND(SUM(CASE WHEN outcome = 'accepted' THEN discount_dollars ELSE 0 END)
        / SUM(CASE WHEN outcome = 'accepted' THEN 1 ELSE 0 END), 2) AS margin_per_win
FROM offers
GROUP BY discount_band
ORDER BY MIN(discount_pct);

-- 4. Counter rate by discount band: where do clients push back instead of saying yes or no?
SELECT
  CASE
    WHEN discount_pct < 10 THEN '5-10%'
    WHEN discount_pct < 20 THEN '10-20%'
    WHEN discount_pct < 30 THEN '20-30%'
    ELSE '30%+'
  END AS discount_band,
  COUNT(*) AS offers,
  SUM(CASE WHEN outcome = 'countered' THEN 1 ELSE 0 END) AS countered,
  ROUND(100.0 * SUM(CASE WHEN outcome = 'countered' THEN 1 ELSE 0 END) / COUNT(*), 1) AS counter_rate_pct
FROM offers
GROUP BY discount_band
ORDER BY MIN(discount_pct);
