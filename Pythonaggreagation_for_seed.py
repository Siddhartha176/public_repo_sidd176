import pandas as pd

df = pd.read_csv("sales_clean.csv")

summary = df.groupby("region")["sales_usd"].sum().reset_index()
summary["contribution_pct"] = (summary["sales_usd"] / summary["sales_usd"].sum()) * 100

print(summary.sort_values("sales_usd", ascending=False))
