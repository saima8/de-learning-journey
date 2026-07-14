import duckdb

duckdb.sql("""
    copy (
        select * from read_parquet('data/yellow_tripdata_2025-01.parquet')
        limit 10000
    ) to 'data/ci/sample.parquet' (format parquet)
""")

print(duckdb.sql("select count(*) from read_parquet('data/ci/sample.parquet')"))