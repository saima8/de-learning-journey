import duckdb
con = duckdb.connect()
con.execute("""
    COPY (
        SELECT * FROM read_parquet('yellow_tripdata_2025-01.parquet')
        LIMIT 1000
    ) TO 'sample_trips.csv' (FORMAT CSV, HEADER)
""")
print('Done — sample_trips.csv created')
