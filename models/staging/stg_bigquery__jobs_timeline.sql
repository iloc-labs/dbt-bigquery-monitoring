select
    {{ dbt_date.convert_timezone(
        column='cast(period_start as ' ~ dbt.type_timestamp() ~ ')',
        target_tz=var('bigquery_target_tz', "UTC"),
        source_tz=var('bigquery_source_tz', "UTC"))
    }} as period_start,
    period_slot_ms,
    period_shuffle_ram_usage_ratio,
    project_id,
    project_number,
    user_email as user,
    job_id,
    job_type,
    statement_type,
    {{ dbt_date.convert_timezone(
        column='cast(job_creation_time as ' ~ dbt.type_timestamp() ~ ')',
        target_tz=var('bigquery_target_tz', "UTC"),
        source_tz=var('bigquery_source_tz', "UTC"))
    }} as job_creation_time,
    {{ dbt_date.convert_timezone(
        column='cast(job_start_time as ' ~ dbt.type_timestamp() ~ ')',
        target_tz=var('bigquery_target_tz', "UTC"),
        source_tz=var('bigquery_source_tz', "UTC"))
    }} as job_start_time,
    {{ dbt_date.convert_timezone(
        column='cast(job_end_time as ' ~ dbt.type_timestamp() ~ ')',
        target_tz=var('bigquery_target_tz', "UTC"),
        source_tz=var('bigquery_source_tz', "UTC"))
    }} as job_end_time,
    state,
    reservation_id,
    total_bytes_processed,
    error_result,
    cache_hit,
    period_estimated_runnable_units
from {{ source('bigquery', 'JOBS_TIMELINE') }}