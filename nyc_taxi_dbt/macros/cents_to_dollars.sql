{% macro cents_to_dollars(column_name) %}
    ({{ column_name }} * 1.0 / 100)
{% endmacro %}