select cust_region_id as region_id, cust_region_name as region_name, cust_country_id as country_id
from {{ source('raw_retail', 'LU_CUST_REGION') }}
where not coalesce(_fivetran_deleted, false)
