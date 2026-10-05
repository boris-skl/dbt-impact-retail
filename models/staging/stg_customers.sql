select
    customer_id,
    cust_first_name || ' ' || cust_last_name as customer_name,
    email,
    cust_city_id    as city_id,
    zipcode,
    age_years,
    gender_id,
    income_id,
    first_order,
    last_order
from {{ source('demo_dwh', 'LU_CUSTOMER') }}
