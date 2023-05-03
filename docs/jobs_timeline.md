{% docs jobs_timeline %}

[GCP link](https://cloud.google.com/bigquery/docs/information-schema-jobs-timeline).

The INFORMATION_SCHEMA.JOBS_TIMELINE view contains near real-time BigQuery metadata by timeslice for all jobs submitted in the current project. This view contains currently running and completed jobs.

When you query the INFORMATION_SCHEMA.JOBS_TIMELINE_BY_* views, the query results contain one row for every second of execution of every BigQuery job. Each period starts on a whole-second interval and lasts exactly one second.

{% enddocs %}