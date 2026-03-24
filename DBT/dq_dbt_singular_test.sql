-- tests/no_negative_sales.sql
SELECT *
FROM {{ ref('orders_clean') }}
WHERE sales_amount < 0
