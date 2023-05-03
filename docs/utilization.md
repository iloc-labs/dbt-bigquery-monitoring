{% docs daily_utilization %}

Daily average slot utilization.

Slot days are derived by dividing the total number of slot-milliseconds (`total_slot_ms`) consumed by all jobs on a given day by the number of milliseconds in a day (1000 * 60 * 60 * 24). This aggregate-level computation provides the most accurate approximation of the overall slot utilization for a given day. Note that this calculation is most accurate for organizations with consistent daily slot usage. If your organization does not have consistent slot usage this number might be lower than expected.

{% enddocs %}


{% docs hourly_utilization %}

Hourly average slot utilization.

Slot hours are derived by dividing the total number of slot-milliseconds (total_slot_ms) consumed by all jobs in a given hour by the number of milliseconds in an hour (1000 * 60 * 60). This aggregate-level computation provides the most accurate approximation of the overall slot utilization for a given hour. Note that this calculation is most accurate for organizations with consistent hourly slot usage. If your organization does not have consistent slot usage this number might be lower than expected.

{% enddocs %}

{% docs weekly_utilization %}

Weekly average slot utilization.

Slot week are derived by dividing the total number of slot-milliseconds (total_slot_ms) consumed by all jobs in a given week by the number of milliseconds in an week (1000 * 60 * 60 * 24 * 7). This aggregate-level computation provides the most accurate approximation of the overall slot utilization for a given week. Note that this calculation is most accurate for projects that have consistent slot usage throughout the week. If your project does not have consistent slot usage, this number might be lower than expected.

{% enddocs %}

