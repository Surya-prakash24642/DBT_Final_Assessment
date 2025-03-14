SELECT 
    CAST(company AS STRING) AS company, 
    CAST(customer_id AS STRING) AS id, 
    CAST(customername AS STRING) AS name 
FROM {{ ref('transform_customers') }}

UNION ALL

SELECT 
    CAST(product_id AS STRING) AS company, 
    CAST(product_family AS STRING) AS id, 
    CAST(product_sub_family AS STRING) AS name 
FROM {{ ref('transform_products') }}

UNION ALL

SELECT 
    CAST(product_id AS STRING) AS company, 
    CAST(quantity AS STRING) AS id, 
    CAST(revenue AS STRING) AS name 
FROM {{ ref('transform_transactions') }}
