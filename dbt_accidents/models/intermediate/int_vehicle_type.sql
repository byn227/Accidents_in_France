{{ 
    config(
        materialized = 'view'
    ) 
}}

with vehicule as (
    select *
    from {{ ref('stg_accident_vehicules') }}
)

select distinct
    cast(catv as integer) as vehicle_type_code
from vehicule
where catv is not null
