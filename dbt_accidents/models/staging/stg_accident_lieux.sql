{{
    config(
        materialized = 'view'
    )
}}

with lieux as (
  select *,
    row_number() over (partition by Num_Acc) as rn
  from {{ source('staging_lieux', 'lieux') }}
  where Num_Acc is not null
)

select
  -- Surrogate key
  {{ dbt_utils.generate_surrogate_key(['Num_Acc']) }} as lieu_id,

  -- Original keys
  {{ dbt.safe_cast("Num_Acc", api.Column.translate_type("integer")) }} as Num_Acc,

  -- Columns
  {{ dbt.safe_cast("catr", api.Column.translate_type("integer")) }} as catr,
  {{ dbt.safe_cast("voie", api.Column.translate_type("string")) }} as voie,
  {{ dbt.safe_cast("v1", api.Column.translate_type("string")) }} as v1,
  {{ dbt.safe_cast("v2", api.Column.translate_type("string")) }} as v2,
  {{ dbt.safe_cast("circ", api.Column.translate_type("integer")) }} as circ,
  {{ dbt.safe_cast("nbv", api.Column.translate_type("integer")) }} as nbv,
  {{ dbt.safe_cast("vosp", api.Column.translate_type("integer")) }} as vosp,
  {{ dbt.safe_cast("prof", api.Column.translate_type("integer")) }} as prof,
  {{ dbt.safe_cast("plan", api.Column.translate_type("integer")) }} as plan,
  {{ dbt.safe_cast("lartpc", api.Column.translate_type("integer")) }} as lartpc,
  {{ dbt.safe_cast("larrout", api.Column.translate_type("integer")) }} as larrout,
  {{ dbt.safe_cast("surf", api.Column.translate_type("integer")) }} as surf,
  {{ dbt.safe_cast("infra", api.Column.translate_type("integer")) }} as infra,
  {{ dbt.safe_cast("situ", api.Column.translate_type("integer")) }} as situ,
  {{ dbt.safe_cast("vma", api.Column.translate_type("integer")) }} as vma,
  {{ dbt.safe_cast("pr", api.Column.translate_type("string")) }} as pr,
  {{ dbt.safe_cast("pr1", api.Column.translate_type("string")) }} as pr1

from lieux
where rn = 1

{% if var('is_test_run', default=true) %}
  limit 1000
{% endif %}
