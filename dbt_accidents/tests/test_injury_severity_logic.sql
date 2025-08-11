select 
    accident_number,
    id_usager,
    injury_severity,
    birth_year,
    extract(year from current_date()) - cast(birth_year as int64) as age
from {{ ref('fact_user_injuries') }}
where injury_severity = 2
  and (
    cast(birth_year as int64) > extract(year from current_date()) - 5
    or cast(birth_year as int64) < 1900  -- born before 1900
  )
