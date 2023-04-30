select
    project_id,
    dbt_profile_name,
    dbt_target_name,
    dbt_node_id,
    creation_date,
    sum(total_bytes_billed) as total_bytes_billed,
    round(sum(total_bytes_billed) / (1024*1024), 2) as total_megabytes_billed,
    round(sum(total_bytes_billed) / (1024*1024*1024), 3) as total_gigabytes_billed,
    round(sum(total_bytes_billed) / (1024*1024*1024*1024), 4) as total_terabytes_billed
from {{ ref('stg_bigquery__jobs') }}
where state = "DONE" and statement_type != 'SCRIPT' and is_dbt_query
group by 1, 2, 3, 4, 5