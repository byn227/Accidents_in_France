{{ config(materialized='table') }}

with departement as (
    select distinct
        departement_code
    from {{ ref('int_departement') }}
)

select
    departement_code,
    departement_code as departement_name 
from departement
