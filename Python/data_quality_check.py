def validate_data(df):
    assert df["order_id"].is_unique, "Duplicate order IDs found!"
    assert df["sales"].ge(0).all(), "Negative sales detected!"
    assert df["customer_id"].notnull().all(), "Missing customer IDs!"

    print("Data validation passed ✅")

# Example usage
import pandas as pd
df = pd.read_csv("orders.csv")
validate_data(df)
