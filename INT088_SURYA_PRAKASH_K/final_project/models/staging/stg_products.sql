SELECT 
    * 
FROM 
    {{ source('raw_source', 'products') }}
