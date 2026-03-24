{{ config(
    materialized='incremental',
    unique_key='order_id',
    incremental_strategy='insert_overwrite'
) }}

WITH source AS (
    SELECT
        order_id,
        customer_id,
        order_date,
        amount
    FROM {{ source('raw', 'orders') }}
)

SELECT
    order_id,
    customer_id,
    order_date,
    amount
FROM source

{% if is_incremental() %}
-- Only bring in records newer than the max order_date already in the table
WHERE order_date > (SELECT MAX(order_date) FROM {{ this }})
{% endif %}
