-- Test to ensure all dates are valid (no future dates)
select 
    date_key,
    year,
    month,
    day
from {{ ref('dime_time') }}
where date_key > current_date()
   or cast(year as int64) > extract(year from current_date())
   or cast(month as int64) not between 1 and 12
   or cast(day as int64) not between 1 and 31
