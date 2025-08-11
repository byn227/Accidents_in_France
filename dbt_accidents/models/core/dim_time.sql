{{ 
    config(
        materialized = 'table'
    ) 
}}


with time as (
    select distinct
        date_key,
        year,
        month,
        day
    from {{ ref('int_time') }}
)

select
    date_key,
    year,
    month,
    day,
    format_date('%Y-%m', date_key) as year_month,
    extract(quarter from date_key) as quarter
from time
