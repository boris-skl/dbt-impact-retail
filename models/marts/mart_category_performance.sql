select
    order_month,
    category_name,
    subcategory_name,
    sum(units_sold) as units_sold,
    sum(revenue)    as revenue,
    sum(margin)     as margin
from {{ ref('int_order_lines_enriched') }}
group by order_month, category_name, subcategory_name
