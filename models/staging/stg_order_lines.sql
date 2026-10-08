select
    order_id,
    item_id,
    customer_id,
    emp_id,
    order_date,
    qty_sold    as units_sold,
    unit_price,
    unit_cost,
    discount,
    promotion_id
from {{ source('raw_retail', 'ORDER_DETAIL') }}
where not coalesce(_fivetran_deleted, false)
