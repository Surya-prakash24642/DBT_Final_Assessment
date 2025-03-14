WITH RANKED_CUSTOMERS AS (
    SELECT 
        CUSTOMER_ID,
        COMPANY,
        CUSTOMERNAME,
        ROW_NUMBER() OVER (PARTITION BY CUSTOMER_ID ORDER BY CUSTOMERNAME) AS ROW_NUM
    FROM 
        {{ ref('stg_customers') }}
)
SELECT 
    *
FROM 
    ranked_customers
WHERE
    customer_id IS NOT NULL AND ROW_NUM=1
