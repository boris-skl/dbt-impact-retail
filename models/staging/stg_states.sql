select cust_state_id as state_id, cust_state_name as state_name, cust_region_id as region_id
from {{ source('raw_retail', 'LU_CUST_STATE') }}
where not coalesce(_fivetran_deleted, false)
