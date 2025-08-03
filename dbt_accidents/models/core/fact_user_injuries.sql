{{ config(materialized='table') }}

with injuries as (
    select
        u.accident_number,
        u.id_usager,
        u.id_vehicule,
        u.injury_severity,
        u.gender,
        u.birth_year,
        u.user_trip_type,
        a.date_key,
        a.departement_code
    from {{ ref('int_user_injuries') }} u
    left join {{ ref('int_accidents') }} a
      on u.accident_number = a.accident_number
)

select
    accident_number,
    id_usager,
    id_vehicule,
    injury_severity,
    gender,
    birth_year,
    user_trip_type,
    date_key,
    departement_code
from injuries
