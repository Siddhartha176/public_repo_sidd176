import pandas as pd

# Load new batch
new_data = pd.read_csv("new_orders.csv")

# Load existing data
existing_data = pd.read_csv("orders_master.csv")

# Append only new records
merged = pd.concat([existing_data, new_data]).drop_duplicates(subset=["order_id"])

merged.to_csv("orders_master.csv", index=False)
print("Incremental load complete.")
