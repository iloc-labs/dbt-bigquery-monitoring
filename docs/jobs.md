{% docs jobs %}

[GCP link](https://cloud.google.com/bigquery/docs/information-schema-jobs).

The JOBS view contains the real-time metadata about all BigQuery jobs in the current project.

The underlying data is partitioned by the creation_time column and clustered by project_id and user_email. The query_info column contains additional information about your query jobs.

{% enddocs %}

{% docs jobs_dml_statistics %}

If the job is a query with a DML statement, the value is a record with the following fields: 
- inserted_row_count: The number of rows that were inserted.
- deleted_row_count: The number of rows that were deleted.
- updated_row_count: The number of rows that were updated.

For all other jobs, the value is NULL.
This column is present in the INFORMATION_SCHEMA.JOBS_BY_USER and INFORMATION_SCHEMA.JOBS_BY_PROJECT views.

{% enddocs %}

{% docs jobs_reservation_id %}

Name of the primary reservation assigned to this job, in the format RESERVATION_ADMIN_PROJECT:RESERVATION_LOCATION.RESERVATION_NAME

In this output:
- RESERVATION_ADMIN_PROJECT: the name of the Google Cloud project that administers the reservation
- RESERVATION_LOCATION: the location of the reservation
- RESERVATION_NAME: the name of the reservation

{% enddocs %}