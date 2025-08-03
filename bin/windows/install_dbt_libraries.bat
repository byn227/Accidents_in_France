@echo off
call venv\Scripts\activate
pip install dbt-bigquery
dbt clean
dbt deps
