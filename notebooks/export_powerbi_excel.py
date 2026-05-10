import pandas as pd
from pathlib import Path

export_folder = Path("../data/powerbi_exports")
excel_path = export_folder / "superstore_powerbi_views.xlsx"

files = {
    "orders": "superstore_orders.tsv",
    "monthly_sales": "vw_monthly_sales.tsv",
    "category_perf": "vw_category_performance.tsv",
    "segment_perf": "vw_segment_performance.tsv",
    "region_perf": "vw_region_performance.tsv",
    "discount_perf": "vw_discount_performance.tsv",
}

with pd.ExcelWriter(excel_path, engine="openpyxl") as writer:
    for sheet_name, file_name in files.items():
        file_path = export_folder / file_name

        if not file_path.exists():
            raise FileNotFoundError(f"Missing file: {file_path}")

        df = pd.read_csv(file_path, sep="\t")
        df.to_excel(writer, sheet_name=sheet_name, index=False)

        print(f"Added sheet: {sheet_name}")

print(f"\nSaved Excel workbook: {excel_path}")
