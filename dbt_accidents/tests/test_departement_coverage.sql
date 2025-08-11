-- Test to ensure we have good departement coverage (not too many missing names)
with dept_stats as (
  select 
    count(*) as total_accidents,
    count(case when d.departement_name != cast(f.departement_code as string) then 1 end) as named_accidents,
    count(case when d.departement_name = cast(f.departement_code as string) then 1 end) as unnamed_accidents
  from {{ ref('fact_accidents') }} f
  left join {{ ref('dim_departement') }} d
    on f.departement_code = d.departement_code
)
select 
  *,
  unnamed_accidents * 100.0 / total_accidents as unnamed_percentage
from dept_stats
where unnamed_accidents * 100.0 / total_accidents > 20  -- More than 20% unnamed
