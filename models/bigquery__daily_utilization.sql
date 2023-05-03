select 
    cast(timestamp_trunc(period_start, day) as date) as usage_date,
    reservation_id,
    project_id,
    job_type,
    user,
    sum(period_slot_ms) / (1000 * 60 * 60 * 24) as average_daily_slot_usage
from {{ ref('stg_bigquery__jobs_timeline') }}
-- Avoid duplicate byte counting in parent and children jobs.
where (statement_type != "SCRIPT" OR statement_type IS NULL)
group by 1, 2, 3, 4, 5
order by 1 asc