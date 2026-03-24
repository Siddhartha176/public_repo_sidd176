{% macro assert_positive(column) %}
    SELECT *
    FROM {{ ref('orders_clean') }}
    WHERE {{ column }} < 0
{% endmacro %}
