{{ 
    config(
        materialized = 'table'
    ) 
}}

with departement_codes as (
    select distinct
        cast(departement_code as string) as departement_code
    from {{ ref('int_departement') }}
),

departement_lookup as (
    select 
        cast(code_departement as string) as departement_code,
        nom_departement as departement_name,
        nom_region as region_name
    from {{ ref('departements-france') }}  
    where code_departement is not null
)

select
    d.departement_code,
    coalesce(l.departement_name, d.departement_code) as departement_name,
    l.region_name
from departement_codes d
left join departement_lookup l
    on d.departement_code = l.departement_code
