-- Kunde mit vollstaendiger Geografie (Stadt -> Bundesland -> Region)
select
    c.customer_id,
    c.customer_name,
    ci.city_name,
    st.state_name,
    r.region_name,
    r.country_id
from {{ ref('stg_customers') }} c
left join {{ ref('stg_cities') }}  ci on c.city_id  = ci.city_id
left join {{ ref('stg_states') }}  st on ci.state_id = st.state_id
left join {{ ref('stg_regions') }} r  on st.region_id = r.region_id
