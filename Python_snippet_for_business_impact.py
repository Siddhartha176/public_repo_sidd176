# Python snippet for business impact storytelling
import pandas as pd

# Load YTD and PTD data
ytd = pd.read_csv("ytd_sales.csv")
ptd = pd.read_csv("ptd_sales.csv")

# Merge for comparison
comparison = ytd.merge(ptd, on="region")
comparison["growth_rate"] = (
    (comparison["ytd_sales"] - comparison["qtd_sales"]) / comparison["qtd_sales"]
) * 100

# Business impact framing
for _, row in comparison.iterrows():
    print(f"Region: {row['region']} | YTD Sales: {row['ytd_sales']} | "
          f"PTD Sales: {row['qtd_sales']} | Growth: {row['growth_rate']:.2f}%")