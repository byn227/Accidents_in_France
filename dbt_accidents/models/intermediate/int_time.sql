{{ 
    config(
        materialized = 'view'
    ) 
}}

with caracteristiques as (
    select 
      an as year,
      mois as month,
      jour as day
    from {{ ref('stg_accident_caracteristics') }}
)

select distinct
    {{ date_key('year', 'month', 'day') }} as date_key,
    year,
    month,
    day
from caracteristiques
where year is not null and month is not null and day is not null
