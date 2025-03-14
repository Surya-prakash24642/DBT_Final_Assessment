with customer_lifespan as (
    select 
        customer_id,
        revenue,
        min(payment_month) as first_purchase_date,
        max(payment_month) as last_purchase_date,
    from {{ref('transform_final')}}
    where revenue_type=1
    group by customer_id,revenue
)

SELECT
    COUNT(DISTINCT customer_id) AS churned_customers_LTM,sum(revenue) as total_revenue
FROM customer_lifespan
WHERE datediff(month, first_purchase_date,last_purchase_date) < 3
and last_purchase_date < DATEADD(MONTH, -3, '2020-06-1')
