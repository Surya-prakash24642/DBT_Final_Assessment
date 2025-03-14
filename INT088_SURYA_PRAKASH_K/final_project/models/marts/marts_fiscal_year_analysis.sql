WITH first_appearance AS (
    SELECT
        CUSTOMER_ID,
        MIN(PAYMENT_MONTH) AS first_purchase_month
    FROM {{ ref('transform_final') }}
    GROUP BY CUSTOMER_ID
)
SELECT
    YEAR(first_purchase_month) AS fiscal_year,
    COUNT(DISTINCT CUSTOMER_ID) AS new_logos
FROM first_appearance
GROUP BY fiscal_year
ORDER BY fiscal_year
