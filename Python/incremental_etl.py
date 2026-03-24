import pandas as pd
import sqlalchemy

# Extract
df = pd.read_csv("raw_sales.csv")

# Transform
df["order_date"] = pd.to_datetime(df["order_date"])
df["sales_usd"] = df["sales"] * df["exchange_rate"]

# Load
engine = sqlalchemy.create_engine("postgresql://user:pass@localhost:5432/analytics")
df.to_sql("sales_clean", engine, if_exists="replace", index=False)

print("ETL pipeline executed successfully!")
