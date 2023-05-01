select 
    project_id,
    job_id,
    creation_time,
    job_type,
    user,
    job_avg_slots,
    query,
    max(safe_divide(unnest_job_stages.slot_ms, unnest_job_stages.end_ms - unnest_job_stages.start_ms)) AS jobstage_max_slots
from {{ ref('stg_bigquery__jobs') }} as job
cross join unnest(job_stages) as unnest_job_stages
where state = "DONE"
group by 1,2,3,4,5,6,7