# DE Learning Journey 🚀

A structured 12-week self-directed programme to transition 
from management consulting into Data Engineering.

## About
Senior Consultant at FTI Consulting with an MSc in Data 
Analytics from Dublin Business School. Building hands-on 
DE skills through a project-based curriculum.

## Tech Stack
![Python](https://img.shields.io/badge/Python-3.13-blue)
![dbt](https://img.shields.io/badge/dbt-1.11-orange)
![Snowflake](https://img.shields.io/badge/Snowflake-trial-lightblue)
![DuckDB](https://img.shields.io/badge/DuckDB-1.10-yellow)
![AWS](https://img.shields.io/badge/AWS-Lambda%20%7C%20S3-orange)
![Git](https://img.shields.io/badge/Git-2.54-red)

## Progress
| Week | Topic | Status |
|------|-------|--------|
| 1-2 | Git & GitHub | ✅ Complete |
| 3-4 | dbt fundamentals + Jaffle Shop project | ✅ Complete |
| 5-7 | NYC Taxi dbt project (staging, marts, advanced dbt) | ✅ Complete |
| 8 | AWS foundations (account, IAM, billing, star schema) | ✅ Complete |
| 9 | AWS — S3 + Lambda | ✅ Complete |
| 10 | AWS — Glue + Athena + Redshift | ✅ Complete |
| 11 | AWS — dashboard + full pipeline wrap | 🔄 In progress |
| 12 | Portfolio complete | 🔲 Upcoming |

## Projects

### nyc_taxi_dbt (Week 5-7)
A dbt project on real NYC Yellow Taxi trip data (January 2025, 
3.47M rows) using dbt Core and DuckDB. Star schema with 
`fct_trips` and `dim_locations`, incremental materialisation 
(~11x speed improvement), a custom macro, dbt-utils surrogate 
keys, SCD Type 2 history tracking via snapshots, and 23 passing 
data tests.

**Tools:** dbt Core 1.11, DuckDB, Git  
**Repo:** [`nyc_taxi_dbt`](./nyc_taxi_dbt)

```bash
cd nyc_taxi_dbt
dbt seed
dbt run
dbt test
dbt docs generate && dbt docs serve
```

### jaffle_shop (Week 3-4)
A dbt project built on the classic Jaffle Shop dataset 
using dbt Core and DuckDB locally. Demonstrates staging 
and mart layer architecture, generic tests (not_null, 
unique, accepted_values, relationships), schema.yml 
documentation, and lineage graph generation.

**Tools:** dbt Core 1.11, DuckDB, Git
**Run locally:**
```bash
cd jaffle_shop
dbt run
dbt test
dbt docs generate && dbt docs serve
```

### AWS ETL Pipeline (Week 8-11) — in progress
Building an end-to-end event-driven pipeline: S3 → Lambda → 
Glue → Athena → Redshift → Power BI.

- **Week 8:** AWS account secured (root MFA, IAM admin user, 
  billing alarm). Core architecture concepts covered.
- **Week 9:** S3 bucket pair created (raw/processed). Lambda function
  `transform-taxi-trips` auto-triggers on file upload, filters zero-fare
  trips, writes clean CSV to processed bucket. End-to-end tested.
- **Week 10:** Glue Crawler created, schema inferred (20 columns) and 
  registered in Data Catalog (`nyc_taxi_db`). Athena queries run directly 
  against S3 — trip distance bands, top pickup zones, tip % by payment 
  method. Results consistent with dbt pipeline output. Redshift covered 
  conceptually (account plan limitation).
- **Week 11:** Glue ETL job built (CSV → Parquet, column renaming, type casting). 
  Athena query on Parquet: 7.40KB scanned vs 153KB on CSV (20x reduction). 
  Power BI connected via Athena ODBC — 4-visual dashboard live. 
  Architecture diagram committed.

## Certifications
- dbt Fundamentals — dbt Labs (May 2026)