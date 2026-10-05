-- Alle Modelle landen genau im Schema aus profiles.yml (DBT_IMPACT),
-- statt dbt-Standard "<schema>_<custom>" - einfacher zu finden und zu scannen.
{% macro generate_schema_name(custom_schema_name, node) -%}
    {{ target.schema }}
{%- endmacro %}
