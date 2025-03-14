WITH product_revenue AS (
    SELECT
        product_id,
        product_family,
        product_sub_family,
        SUM(revenue) AS total_revenue
    FROM {{ ref('transform_final') }}
    GROUP BY product_id, product_family,product_sub_family
),
 
ranked_products AS (
    SELECT
        product_id,
        product_family,
        product_sub_family,
        total_revenue,
        DENSE_RANK() OVER (ORDER BY total_revenue DESC) AS revenue_rank
    FROM product_revenue
)
 
SELECT * FROM ranked_products