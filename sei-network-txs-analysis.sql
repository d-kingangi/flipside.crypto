-- columns 

-- DAILY_ADDRESSES
-- DAILY_NEW_ADDRESSES
-- DAILY_TRANSACTIONS

WITH first_seen_day AS (
  SELECT
    TX_FROM,
    MIN(DATE_TRUNC('day', BLOCK_TIMESTAMP)) AS FIRST_SEEN_DAY
  FROM
    sei.core.fact_transactions
  GROUP BY
    TX_FROM
),
daily_summary AS (
  SELECT
    DATE_TRUNC('day', t.BLOCK_TIMESTAMP) AS day,
    COUNT(DISTINCT t.TX_FROM) AS daily_addresses,
    COUNT(
      DISTINCT CASE
        WHEN f.FIRST_SEEN_DAY = DATE_TRUNC('day', t.BLOCK_TIMESTAMP) THEN t.TX_FROM
      END
    ) AS daily_new_addresses,
    COUNT(DISTINCT t.TX_ID) AS daily_transactions
  FROM
    sei.core.fact_transactions t
    JOIN first_seen_day f ON t.TX_FROM = f.TX_FROM
  GROUP BY
    day
)
SELECT
  day,
  daily_addresses,
  daily_new_addresses,
  daily_transactions
FROM
  daily_summary
ORDER BY
  day;