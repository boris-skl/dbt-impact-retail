-- Kundenwert auf Bestellebene (ORDER_FACT) mit Geografie
select
    o.customer_id,
    g.customer_name,
    g.city_name,
    g.region_name,
    count(distinct o.order_id) as orders,
    sum(o.order_amount)        as order_amount,
    sum(o.order_amount - o.order_cost) as order_margin,
    min(o.order_date)          as first_order_date,
    max(o.order_date)          as last_order_date
from {{ ref('stg_orders') }} o
left join {{ ref('int_customer_geography') }} g on o.customer_id = g.customer_id
group by o.customer_id, g.customer_name, g.city_name, g.region_name
