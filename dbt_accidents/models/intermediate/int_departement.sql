{{ config(materialized='view') }}
with caracteristiques as (
    select *
    from {{ ref('stg_accident_caracteristics') }}
)

select distinct
    dep as departement_code
from caracteristiques
where dep is not null
