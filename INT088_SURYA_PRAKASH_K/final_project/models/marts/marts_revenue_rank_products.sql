WITH customer_revenue AS (
    SELECT
        customer_id,
        customername,
        SUM(CAST(revenue AS DECIMAL(10,2))) AS total_revenue,
        COUNT(*) AS transaction_count  
    FROM {{ ref('transform_final') }}
    GROUP BY customer_id, customername
),
 
ranked_customers AS (
    SELECT
        customer_id,
        customername,
        total_revenue,
        transaction_count,  
        RANK() OVER (ORDER BY total_revenue DESC) AS revenue_rank
    FROM customer_revenue
)
 
SELECT * FROM ranked_customers