# dbt Incremental Model Demo

This model demonstrates how to build an **incremental table** in dbt for order data.

## Features
- Uses `is_incremental()` to process only new records
- Ensures uniqueness with `order_id`
- Reduces warehouse costs by avoiding full reloads
- Business impact: faster reporting, lower compute costs, scalable pipelines
