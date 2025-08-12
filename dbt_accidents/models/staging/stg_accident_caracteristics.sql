{{ 
    config(
        materialized = 'view'
    ) 
}}

with caracteristiques as (
  select *,
    row_number() over (partition by Num_Acc) as rn
  from {{ source('staging_caracteristic', 'caracteristic') }}
  where Num_Acc is not null
)

select
  -- identifiers
  {{ dbt_utils.generate_surrogate_key(['Num_Acc']) }} as accident_id,

  -- numeric columns
  {{ dbt.safe_cast("Num_Acc", api.Column.translate_type("integer")) }} as Num_Acc,
  {{ dbt.safe_cast("an", api.Column.translate_type("integer")) }} as an,
  {{ dbt.safe_cast("mois", api.Column.translate_type("integer")) }} as mois,
  {{ dbt.safe_cast("jour", api.Column.translate_type("integer")) }} as jour,
  {{ dbt.safe_cast("hrmn", api.Column.translate_type("string")) }} as hrmn,
  {{ dbt.safe_cast("lum", api.Column.translate_type("integer")) }} as lum,
  {{ dbt.safe_cast("dep", api.Column.translate_type("string")) }} as dep,
  {{ dbt.safe_cast("agg", api.Column.translate_type("integer")) }} as agg,
  {{ dbt.safe_cast("int", api.Column.translate_type("integer")) }} as int,
  {{ dbt.safe_cast("atm", api.Column.translate_type("integer")) }} as atm,
  {{ dbt.safe_cast("col", api.Column.translate_type("integer")) }} as col,
  {{ dbt.safe_cast("com", api.Column.translate_type("string")) }} as com,
  {{ dbt.safe_cast("adr", api.Column.translate_type("string")) }} as adr,
  {{ dbt.safe_cast("lat", api.Column.translate_type("float")) }} as lat,
  {{ dbt.safe_cast("long", api.Column.translate_type("float")) }} as long

from caracteristiques
where rn = 1


