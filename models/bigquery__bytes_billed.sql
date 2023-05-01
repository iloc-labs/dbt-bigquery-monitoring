select
    project_id,
    user,
    query,
    job_type,
    creation_date,
    sum(total_bytes_billed) as total_bytes_billed,
    round(sum(total_bytes_billed) / (1024*1024), 2) as total_megabytes_billed,
    round(sum(total_bytes_billed) / (1024*1024*1024), 3) as total_gigabytes_billed
from {{ ref('stg_bigquery__jobs') }}
where state = "DONE" and statement_type != 'SCRIPT'
group by 1, 2, 3, 4, 5