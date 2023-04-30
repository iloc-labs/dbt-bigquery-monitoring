select
    project_id,
    dbt_profile_name,
    dbt_target_name,
    dbt_node_id,
    creation_date,
    round(safe_divide(sum(total_bytes_billed), 1024*1024*1024*1024) * 5, 4) as on_demand_cost
from {{ ref('stg_bigquery__jobs') }}
where state = "DONE" and statement_type != 'SCRIPT' and is_dbt_query
group by 1, 2, 3, 4, 5