select
    g.region_name,
    g.state_name,
    count(distinct l.customer_id) as customers,
    sum(l.revenue)                as revenue,
    sum(l.margin)                 as margin,
    case when sum(l.revenue) <> 0 then sum(l.margin) / sum(l.revenue) end as margin_pct
from {{ ref('int_order_lines_enriched') }} l
left join {{ ref('int_customer_geography') }} g on l.customer_id = g.customer_id
group by g.region_name, g.state_name
