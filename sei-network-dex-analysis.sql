--seaswap dex
-- fuzio dex
-- astroport dex

-- columns

-- DAY
-- PLATFORM
-- DAILY_TRANSACTIONS
-- DAILY_SWAPPERS
-- DAILY_AMOUNT_IN
-- DAILY_AMOUNT_OUT

SELECT
  DATE_TRUNC('day', BLOCK_TIMESTAMP) AS day,
  PLATFORM,
  COUNT(DISTINCT TX_ID) AS daily_transactions,
  COUNT(DISTINCT SWAPPER) AS daily_swappers,
  SUM(AMOUNT_IN) AS daily_amount_in,
  SUM(AMOUNT_OUT) AS daily_amount_out
FROM
  sei.defi.fact_dex_swaps
GROUP BY
  day,
  PLATFORM
ORDER BY
  day,
  PLATFORM;SELECT
  DATE_TRUNC('day', BLOCK_TIMESTAMP) AS day,
  PLATFORM,
  COUNT(DISTINCT TX_ID) AS daily_transactions,
  COUNT(DISTINCT SWAPPER) AS daily_swappers,
  SUM(AMOUNT_IN) AS daily_amount_in,
  SUM(AMOUNT_OUT) AS daily_amount_out
FROM
  sei.defi.fact_dex_swaps
GROUP BY
  day,
  PLATFORM
ORDER BY
  day,
  PLATFORM;