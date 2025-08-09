{{ config(materialized='table') }}

with departement_codes as (
    select distinct
        departement_code
    from {{ ref('int_departement') }}
),

departement_lookup as (
    select 
        safe_cast(code_departement as integer) as departement_code,
        nom_departement as departement_name,
        nom_region as region_name
    from {{ ref('departements-france') }}  
    where safe_cast(code_departement as integer) is not null
)

select
    d.departement_code,
    coalesce(l.departement_name, cast(d.departement_code as string)) as departement_name,
    l.region_name
from departement_codes d
left join departement_lookup l
    on d.departement_code = l.departement_code