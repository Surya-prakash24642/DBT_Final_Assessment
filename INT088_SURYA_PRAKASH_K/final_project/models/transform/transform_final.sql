SELECT 
    t.customer_id,
    c.company,
    c.customername,
    cr.country,
    cr.region,
    t.product_id,
    p.product_family,
    p.product_sub_family,
    t.payment_month :: DATE AS payment_month,
    t.revenue_type,
    t.revenue,
    t.quantity,
    t.dimension_1,
    t.dimension_2,
    t.dimension_3,
    t.dimension_4,
    t.dimension_5,
    t.dimension_6 :: VARCHAR(50) AS dimension_6,
    t.dimension_7,
    t.dimension_8,
    t.dimension_9,
    t.dimension_10
FROM {{ ref('transform_transactions') }} t
LEFT JOIN {{ ref('transform_customers') }} c 
    ON t.customer_id = c.customer_id
LEFT JOIN {{ ref('transform_products') }} p 
    ON t.product_id = p.product_id
LEFT JOIN {{ ref('transform_countryandregion') }} cr
    ON t.customer_id = cr.customer_id