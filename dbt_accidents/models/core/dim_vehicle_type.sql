{{ config(materialized='table') }}

with vehicle_codes as (
    select distinct
        vehicle_type_code
    from {{ ref('int_vehicle_type') }}
),

vehicle_lookup as (
    select 
        vehicle_code,
        vehicle_label
    from {{ ref('vehicle_types') }}
)

select
    v.vehicle_type_code,
    coalesce(l.vehicle_label, 'Code ' || v.vehicle_type_code) as vehicle_type_label
from vehicle_codes v
left join vehicle_lookup l
    on v.vehicle_type_code = l.vehicle_code
