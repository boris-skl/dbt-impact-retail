select cust_city_id as city_id, cust_city_name as city_name, cust_state_id as state_id
from {{ source('raw_retail', 'LU_CUST_CITY') }}
where not coalesce(_fivetran_deleted, false)
