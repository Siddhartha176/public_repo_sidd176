{{ config(
    materialized='incremental',
    unique_key='event_id'
) }}

SELECT
    event_id,
    user_id,
    event_timestamp,
    event_type
FROM {{ source('raw', 'events') }}

{% if is_incremental() %}
WHERE event_timestamp > (SELECT MAX(event_timestamp) FROM {{ this }})
{% endif %}
