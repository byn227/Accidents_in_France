select 
    accident_number,
    count(*) as user_count
from {{ ref('fact_user_injuries') }}
group by accident_number
having count(*) = 0
