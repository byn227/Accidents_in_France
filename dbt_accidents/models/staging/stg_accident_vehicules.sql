{{
    config(
        materialized = 'view'
    )
}}

with vehicules as (
  select *,
    row_number() over (partition by Num_Acc, id_vehicule) as rn
  from {{ source('staging_vehicule', 'vehicule') }}
  where Num_Acc is not null
)

select
  -- Surrogate key:
  {{ dbt_utils.generate_surrogate_key(['Num_Acc', 'id_vehicule']) }} as vehicule_id,

  -- Original keys
  {{ dbt.safe_cast("Num_Acc", api.Column.translate_type("integer")) }} as Num_Acc,
  {{ dbt.safe_cast("id_vehicule", api.Column.translate_type("string")) }} as id_vehicule,

  -- Columns
  {{ dbt.safe_cast("num_veh", api.Column.translate_type("string")) }} as num_veh,
  {{ dbt.safe_cast("senc", api.Column.translate_type("integer")) }} as senc,
  {{ dbt.safe_cast("catv", api.Column.translate_type("integer")) }} as catv,
  {{ dbt.safe_cast("obs", api.Column.translate_type("integer")) }} as obs,
  {{ dbt.safe_cast("obsm", api.Column.translate_type("integer")) }} as obsm,
  {{ dbt.safe_cast("choc", api.Column.translate_type("integer")) }} as choc,
  {{ dbt.safe_cast("manv", api.Column.translate_type("integer")) }} as manv,
  {{ dbt.safe_cast("motor", api.Column.translate_type("integer")) }} as motor,
  {{ dbt.safe_cast("occutc", api.Column.translate_type("integer")) }} as occutc

from vehicules
where rn = 1

{% if var('is_test_run', default=true) %}
  limit 1000
{% endif %}
