-- Bestellpositionen mit Produkt-Hierarchie und berechnetem Umsatz/Marge
select
    l.order_id,
    l.customer_id,
    l.order_date,
    date_trunc('month', l.order_date)                    as order_month,
    i.item_name,
    sc.subcategory_name,
    ca.category_name,
    l.units_sold,
    l.units_sold * l.unit_price                          as revenue,
    l.units_sold * l.unit_cost                           as cost,
    l.units_sold * (l.unit_price - l.unit_cost)          as margin
from {{ ref('stg_order_lines') }} l
left join {{ ref('stg_items') }}         i  on l.item_id   = i.item_id
left join {{ ref('stg_subcategories') }} sc on i.subcat_id = sc.subcat_id
left join {{ ref('stg_categories') }}    ca on sc.category_id = ca.category_id
