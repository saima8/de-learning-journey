{% macro rate_code_description(column_name) %}
    case {{ column_name }}
        when 1 then 'Standard rate'
        when 2 then 'JFK'
        when 3 then 'Newark'
        when 4 then 'Nassau'
        when 5 then 'Negotiated fare'
        when 6 then 'Group ride'
        else 'Unknown'
    end
{% endmacro %}