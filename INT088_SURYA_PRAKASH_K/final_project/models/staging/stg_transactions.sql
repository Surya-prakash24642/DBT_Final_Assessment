SELECT 
    customer_id,
    product_id,
    payment_month :: DATE AS payment_month,
    revenue_type,
    revenue,
    quantity,
    dimension_1,
    dimension_2,
    dimension_3,
    dimension_4,
    dimension_5,
    dimension_6 :: VARCHAR(50) AS dimension_6,
    dimension_7,
    dimension_8,
    dimension_9,
    dimension_10,
    companies
FROM 
    {{ source('raw_source', 'transactions') }}
