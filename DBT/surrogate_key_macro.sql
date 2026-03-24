{% macro generate_surrogate_key(columns) %}
    md5(concat({{ columns | join(', ') }}))
{% endmacro %}

--Demonstrates reusable macros for consistent key generation.

SELECT
    {{ generate_surrogate_key(['customer_id','order_id']) }} AS sk_order_customer
FROM {{ ref('orders') }}
