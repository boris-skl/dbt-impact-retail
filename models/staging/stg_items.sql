select item_id, item_name, subcat_id, brand_id
from {{ source('raw_retail', 'LU_ITEM') }}
where not coalesce(_fivetran_deleted, false)
