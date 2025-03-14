-- WITH revenue_summary AS (
--     SELECT
--         PAYMENT_MONTH,
--         SUM(REVENUE) AS total_revenue,
--         SUM(CASE WHEN REVENUE_TYPE = '0' THEN REVENUE ELSE 0 END) AS expansion_revenue,
--         SUM(CASE WHEN REVENUE_TYPE = '1' THEN REVENUE ELSE 0 END) AS renewal_revenue
--     FROM {{ ref('transform_final') }}
--     GROUP BY PAYMENT_MONTH
-- )
-- SELECT
--     PAYMENT_MONTH,
--     (renewal_revenue + expansion_revenue) / total_revenue AS NRR,
--     renewal_revenue / total_revenue AS GRR
-- FROM revenue_summary
-- ORDER BY PAYMENT_MONTH