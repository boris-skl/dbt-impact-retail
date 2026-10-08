select subcat_id, subcat_desc as subcategory_name, category_id
from {{ source('raw_retail', 'LU_SUBCATEG') }}
where not coalesce(_fivetran_deleted, false)
