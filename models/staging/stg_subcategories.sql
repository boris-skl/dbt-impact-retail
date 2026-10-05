select subcat_id, subcat_desc as subcategory_name, category_id
from {{ source('demo_dwh', 'LU_SUBCATEG') }}
