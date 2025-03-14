SELECT  
    product_id, 
    product_family, 
    product_sub_family
FROM {{ ref('stg_products') }}
WHERE NOT ( 
    product_id IS NULL 
    AND product_family IS NULL 
    AND product_sub_family IS NULL
)
