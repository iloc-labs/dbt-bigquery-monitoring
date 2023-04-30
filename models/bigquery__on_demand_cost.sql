select
    project_id,
    user,
    job_type,
    creation_date,
    round(safe_divide(sum(total_bytes_billed), 1024*1024*1024*1024) * 5, 4) as on_demand_cost
from {{ ref('stg_bigquery__jobs') }}
where state = "DONE" and statement_type != 'SCRIPT'
group by 1, 2, 3, 4