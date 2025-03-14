{% macro deduplicate_values_handle(table_name, unique_columns) %}
WITH ranked_data AS (
    SELECT
        *,
        ROW_NUMBER() OVER (PARTITION BY {{ unique_columns | join(', ') }} ORDER BY {{ unique_columns[0] }}) AS row_num
    FROM {{ ref(table_name) }}
)
SELECT *
FROM ranked_data
WHERE row_num = 1;
{% endmacro %}