select
    order_id,
    customer_id,
    emp_id,
    order_date,
    ship_date,
    order_amt          as order_amount,
    order_cost,
    gross_dollar_sales as gross_revenue,
    freight,
    qty_sold           as units_sold,
    rush_order,
    pymt_type          as payment_type
from {{ source('raw_retail', 'ORDER_FACT') }}
where not coalesce(_fivetran_deleted, false)
