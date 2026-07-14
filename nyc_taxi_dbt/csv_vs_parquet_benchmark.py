"""
CSV vs Parquet benchmark — run this on YOUR machine against your existing
NYC taxi data from the Week 4-5 project.

Set SOURCE_FILE below to point at whichever raw file you already have
(doesn't matter if it's .csv or .parquet — the script detects it and
generates the other format for comparison).
"""

import duckdb
import time
import os

# ---- SET THIS to your actual raw taxi file ----
SOURCE_FILE = "C:\\Users\\skhan9\\de-learning-journey\\nyc_taxi_dbt\\data\\yellow_tripdata_2025-01.parquet"  # or .csv — either works

con = duckdb.connect()

base, ext = os.path.splitext(SOURCE_FILE)
ext = ext.lower()

if ext == ".parquet":
    parquet_path = SOURCE_FILE
    csv_path = base + "_converted.csv"
    print(f"Generating CSV from your Parquet file...")
    con.execute(f"COPY (SELECT * FROM read_parquet('{parquet_path}')) TO '{csv_path}' (FORMAT CSV, HEADER)")
elif ext == ".csv":
    csv_path = SOURCE_FILE
    parquet_path = base + "_converted.parquet"
    print(f"Generating Parquet from your CSV file...")
    con.execute(f"COPY (SELECT * FROM read_csv_auto('{csv_path}')) TO '{parquet_path}' (FORMAT PARQUET)")
else:
    raise ValueError("SOURCE_FILE must end in .csv or .parquet")

# --- Compare file sizes on disk ---
csv_size_mb = os.path.getsize(csv_path) / (1024 * 1024)
parquet_size_mb = os.path.getsize(parquet_path) / (1024 * 1024)

print("\n--- FILE SIZE ---")
print(f"CSV:     {csv_size_mb:,.2f} MB")
print(f"Parquet: {parquet_size_mb:,.2f} MB")
print(f"Parquet is {csv_size_mb / parquet_size_mb:.1f}x smaller")

# --- Time a column aggregation: average trip_distance ---
# This is the query that should expose the row-based vs column-based difference
t0 = time.time()
con.execute(f"SELECT AVG(trip_distance) FROM read_csv_auto('{csv_path}')").fetchall()
csv_time = time.time() - t0

t0 = time.time()
con.execute(f"SELECT AVG(trip_distance) FROM read_parquet('{parquet_path}')").fetchall()
parquet_time = time.time() - t0

print("\n--- QUERY TIME: AVG(trip_distance) ---")
print(f"CSV:     {csv_time:.3f}s")
print(f"Parquet: {parquet_time:.3f}s")
print(f"Parquet was {csv_time / parquet_time:.1f}x faster")
