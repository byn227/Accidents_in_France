{{
    config(
        materialized = 'view'
    )
}}

with usagers as (
  select *,
    row_number() over (partition by Num_Acc, id_usager) as rn
  from {{ source('staging_usagers', 'usagers') }}
  where Num_Acc is not null
)

select
  -- Surrogate key:
  {{ dbt_utils.generate_surrogate_key(['Num_Acc', 'id_usager']) }} as usager_id,

  -- Original keys
  {{ dbt.safe_cast("Num_Acc", api.Column.translate_type("integer")) }} as Num_Acc,
  {{ dbt.safe_cast("id_usager", api.Column.translate_type("string")) }} as id_usager,
  {{ dbt.safe_cast("id_vehicule", api.Column.translate_type("string")) }} as id_vehicule,

  -- Columns
  {{ dbt.safe_cast("num_veh", api.Column.translate_type("string")) }} as num_veh,
  {{ dbt.safe_cast("place", api.Column.translate_type("integer")) }} as place,
  {{ dbt.safe_cast("catu", api.Column.translate_type("integer")) }} as catu,
  {{ dbt.safe_cast("grav", api.Column.translate_type("integer")) }} as grav,
  {{ dbt.safe_cast("sexe", api.Column.translate_type("float")) }} as sexe,
  {{ dbt.safe_cast("an_nais", api.Column.translate_type("string")) }} as an_nais,
  {{ dbt.safe_cast("trajet", api.Column.translate_type("integer")) }} as trajet,
  {{ dbt.safe_cast("secu1", api.Column.translate_type("integer")) }} as secu1,
  {{ dbt.safe_cast("secu2", api.Column.translate_type("integer")) }} as secu2,
  {{ dbt.safe_cast("secu3", api.Column.translate_type("integer")) }} as secu3,
  {{ dbt.safe_cast("locp", api.Column.translate_type("integer")) }} as locp,
  {{ dbt.safe_cast("actp", api.Column.translate_type("string")) }} as actp,
  {{ dbt.safe_cast("etatp", api.Column.translate_type("integer")) }} as etatp

from usagers
where rn = 1

