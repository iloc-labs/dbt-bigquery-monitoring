select
    timestamp_trunc(period_start, hour) as usage_time,
    cast(timestamp_trunc(period_start, day) as date) as usage_date,
    reservation_id,
    project_id,
    job_type,
    user,
    sum(period_slot_ms) / (1000 * 60 * 60) as average_hourly_slot_usage
from {{ ref('stg_bigquery__jobs_timeline') }}
where (statement_type != "SCRIPT" or statement_type is null) 
group by 1, 2, 3, 4, 5, 6
order by 1 asc