{{ config(materialized='view') }}

with usagers as (
    select *
    from {{ ref('stg_accident_usagers') }}
)

select
    Num_Acc as accident_number,
    id_usager,
    id_vehicule,
    cast(grav as integer) as injury_severity,
    cast(sexe as integer) as gender,
    cast(an_nais as integer) as birth_year,
    trajet as user_trip_type
from usagers
where grav is not null
