{{ 
    config(
        materialized = 'view'
    ) 
}}

with caracteristiques as (
    select *
    from {{ ref('stg_accident_caracteristics') }}
),
lieux as (
    select *
    from {{ ref('stg_accident_lieux') }}
)

select
    c.Num_Acc as accident_number,
    c.an as year,
    c.mois as month,
    c.jour as day,
    {{ date_key('c.an', 'c.mois', 'c.jour') }} as date_key,
    c.dep as departement_code,
    l.vma as location_speed_limit,
    l.prof as road_profile,
    l.plan as road_plan,
    l.lartpc as median_width,
    l.larrout as roadway_width


from caracteristiques c
left join lieux l on c.Num_Acc = l.Num_Acc
