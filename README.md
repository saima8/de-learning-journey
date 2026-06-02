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
![Git](https://img.shields.io/badge/Git-2.54-red)

## Progress
| Week | Topic | Status |
|------|-------|--------|
| 1-2 | Git & GitHub | ✅ Complete |
| 3-4 | dbt (data build tool) | 🔄 In progress |
| 5-6 | First dbt project | 🔲 Upcoming |
| 7 | Advanced dbt | 🔲 Upcoming |
| 8-11 | AWS (S3, Lambda, Glue, Athena, Redshift) | 🔲 Upcoming |
| 12 | Portfolio complete | 🔲 Upcoming |

## Projects

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

## Certifications
- dbt Fundamentals — dbt Labs (May 2026)