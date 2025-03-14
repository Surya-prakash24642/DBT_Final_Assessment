SELECT 
    *
FROM 
    {{ ref('stg_countryandregion') }}
WHERE
    customer_id IS NOT NULL
