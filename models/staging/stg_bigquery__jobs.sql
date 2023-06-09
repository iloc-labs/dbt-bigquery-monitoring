select
    {{ dbt_date.convert_timezone(
        column='cast(creation_time as ' ~ dbt.type_timestamp() ~ ')',
        target_tz=var('bigquery_target_tz', "UTC"),
        source_tz="UTC")
    }} as creation_time,
    project_id,
    project_number,
    user_email as user,
    job_id,
    job_type,
    statement_type,
    priority,
    {{ dbt_date.convert_timezone(
        column='cast(start_time as ' ~ dbt.type_timestamp() ~ ')',
        target_tz=var('bigquery_target_tz', "UTC"),
        source_tz="UTC")
    }} as start_time,
    {{ dbt_date.convert_timezone(
        column='cast(end_time as ' ~ dbt.type_timestamp() ~ ')',
        target_tz=var('bigquery_target_tz', "UTC"),
        source_tz="UTC")
    }} as end_time,
    query,
    state,
    reservation_id,
    total_bytes_processed,
    total_slot_ms,
    error_result,
    cache_hit,
    destination_table,
    referenced_tables,
    labels,
    timeline,
    job_stages,
    coalesce(total_bytes_billed, 0) as total_bytes_billed,
    transaction_id,
    parent_job_id,
    session_info,
    dml_statistics,
    total_modified_partitions,
    bi_engine_statistics,
    query_info,
    transferred_bytes,
    extract(date from {{ dbt_date.convert_timezone(
        column='cast(creation_time as ' ~ dbt.type_timestamp() ~ ')',
        target_tz=var('bigquery_target_tz', "UTC"),
        source_tz="UTC")
    }}) as creation_date,
    regexp_extract(query, r'"app": "([^,]*)"') = 'dbt' as is_dbt_query,
    regexp_extract(query, r'"dbt_version": "([^,]*)"') as dbt_version,
    regexp_extract(query, r'"profile_name": "([^,]*)"') as dbt_profile_name,
    regexp_extract(query, r'"target_name": "([^,]*)"') as dbt_target_name,
    regexp_extract(query, r'"node_id": "([^,]*)"') as dbt_node_id,
    round(timestamp_diff(end_time, start_time, MILLISECOND) / 1000, 2) AS execution_duration_s,
    round(timestamp_diff(end_time, start_time, MILLISECOND), 2) AS execution_duration_ms,
    row_number() over (partition by job_id order by end_time desc) as _rnk,
    -- Average slot utilization per job is calculated by dividing
    -- total_slot_ms by the millisecond duration of the job
    round(safe_divide(total_slot_ms, timestamp_diff(end_time, start_time, MILLISECOND)), 2) as job_avg_slots
from {{ source('bigquery', 'JOBS') }}