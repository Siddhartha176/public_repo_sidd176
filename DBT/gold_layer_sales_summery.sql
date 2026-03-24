-- Gold Layer: Sales Summary
{{ config(materialized='table') }}

SELECT
    region,
    SUM(amount) AS total_sales,
    COUNT(DISTINCT customer_id) AS unique_customers
FROM {{ ref('orders_clean') }}
GROUP BY region
