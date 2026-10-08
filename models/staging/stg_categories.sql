select category_id, category_desc as category_name
from {{ source('raw_retail', 'LU_CATEGORY') }}
where not coalesce(_fivetran_deleted, false)
