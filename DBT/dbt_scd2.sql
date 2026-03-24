{{ config(
    materialized='incremental',
    unique_key='customer_id'
) }}

WITH source AS (
    SELECT * FROM {{ source('crm', 'customers') }}
)

SELECT
    customer_id,
    name,
    address,
    effective_date,
    current_flag
FROM source

{% if is_incremental() %}
-- Update changed records
WHERE effective_date > (SELECT MAX(effective_date) FROM {{ this }})
{% endif %}
