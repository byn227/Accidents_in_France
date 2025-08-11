{{ 
    config(
        materialized = 'table'
    ) 
}}


with accidents as (
    select
        accident_number,
        date_key,
        departement_code,
        location_speed_limit,
        road_profile,
        road_plan,
        art_road,
        road_arrangement
    from {{ ref('int_accidents') }}
)

select
    accident_number,
    date_key,
    departement_code,
    location_speed_limit,
    road_profile,
    road_plan,
    art_road,
    road_arrangement
from accidents
