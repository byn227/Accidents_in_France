{{ config(materialized='table') }}

with vehicle_type as (
    select distinct
        vehicle_type_code
    from {{ ref('int_vehicle_type') }}
)

select
    vehicle_type_code,
    vehicle_type_code as vehicle_type_label
from vehicle_type
