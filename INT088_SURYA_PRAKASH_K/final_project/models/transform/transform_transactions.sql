SELECT 
    customer_id,
    product_id,
    payment_month,
    revenue_type,
    revenue,
    quantity,
    dimension_1,
    dimension_2,
    dimension_3,
    dimension_4,
    dimension_5,
    dimension_6,
    dimension_7,
    dimension_8,
    dimension_9,
    dimension_10,
    companies
FROM {{ ref('stg_transactions') }}
WHERE NOT (
    customer_id IS NULL
    AND product_id IS NULL
)