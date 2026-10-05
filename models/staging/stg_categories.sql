select category_id, category_desc as category_name
from {{ source('demo_dwh', 'LU_CATEGORY') }}
