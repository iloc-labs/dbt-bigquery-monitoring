# Google Bigquery monitoring dbt package ([Docs](https://iloc-labs.github.io/dbt-bigquery-monitoring))

The package transforms BigQuery's INFORMATION_SCHEMA metadata tables into analytics-ready models to help you monitor BigQuery utilization and performance.

> Tip: More details in the [Bigquery documentation](https://cloud.google.com/bigquery/docs/information-schema-jobs) and [Google Cloud Platform repository](https://github.com/GoogleCloudPlatform/bigquery-utils/tree/master/dashboards/system_tables)

| Model | Description |
| --- | --- |
| bigquery__bytes_billed | Daily bytes billed by project, job type, query and user |
| bigquery__daily_utilization | Daily BigQuery usage by reservation, project, job type, and user |
| bigquery__hourly_utilization | Hourly BigQuery usage by reservation, project, job type, and user |
| bigquery__weekly_utilization | Daily BigQuery usage by reservation, project, job type, and user |
| bigquery__jobstage_max_slots | Average slot utilization per job and the max number of slots used at any job stage. [More details](https://cloud.google.com/bigquery/docs/information-schema-jobs#estimate_slot_usage_and_cost_for_queries) |
| bigquery__on_demand_cost | Daily on-demand cost estimate for project, job type, query, and user |
| bigquery__dbt_bytes_billed | dbt daily bytes billed by project, dbt profile, target, and node_id |
| bigquery__dbt_on_demand_cost | dbt daily on-demand cost estimate for project, dbt profile, target, and node_id |


#  Quickstart

## Step 1: Prerequisites

To use the dbt package, you must have the following:

- Service account with the [BigQuery Resource Viewer](https://cloud.google.com/iam/docs/understanding-roles#bigquery.resourceViewer) (roles/bigquery.resourceViewer) IAM role. 


## Step 2: Install the package

Include the following package version in your `packages.yml` file:
```yaml
packages:
  - package: iloc-labs/dbt-bigquery-monitoring
    version: [">=0.1.0", "<0.9.0"]
```

## Step 3: Define project variables

### Database and location

By default, the package runs using the target database and location for INFORMATION_SCHEMA. If this is not where your INFORMATION_SCHEMA data is, add the following configuration to your root `dbt_project.yml` file:
```yaml
# dbt_project.yml

vars:
  bigquery_source_database: your_database_name
  bigquery_source_location: your_project_location
```

### Setting timezone
To convert the timezone of all timestamps in the package, update the source zone (UTC) to your target zone (bigquery_target_tz) in [IANA tz Database format](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones):

```yaml
# dbt_project.yml

vars:
  bigquery_target_tz: "America/New_York"
```

### Setting on-demand compute pricing (per TB)
Check [BigQuery pricing](https://cloud.google.com/bigquery/pricing) for more information.

```yaml
# dbt_project.yml

vars:
  bigquery_on_demand_compute_pricing_per_tb: "your_on_demand_compute_pricing_per_tb"
```

# Package dependencies
This dbt package is dependent on the following dbt packages. Please be aware that these dependencies are installed by default within this package.

> If you have any of these dependent packages in your own packages.yml file, we highly recommend that you remove them from your root packages.yml to avoid package version conflicts.
```yaml
packages:
- package: calogica/dbt_date
  version: [">=0.7.0", "<0.8.0"]

- package: dbt-labs/dbt_utils
  version: [">=0.8.0", "<2.0.0"]
```

# Package Maintenance
I highly encourage and welcome contributions to this package.
