-- macros/date_key.sql

{% macro date_key(year, month, day) %}
    parse_date('%Y-%m-%d', concat(cast({{ year }} as string), '-', lpad(cast({{ month }} as string), 2, '0'), '-', lpad(cast({{ day }} as string), 2, '0')))
{% endmacro %}
