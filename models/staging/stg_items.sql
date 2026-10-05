select item_id, item_name, subcat_id, brand_id
from {{ source('demo_dwh', 'LU_ITEM') }}
