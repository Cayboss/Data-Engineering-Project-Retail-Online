Data Engineering Project - Retail Online
========

---add pipline image

This project involves building a data pipeline from A to Z, that extracts data from a CSV file, stores the data in BigQuery, interacts with DBT, implement and run data quality checks with Soda, and finally creating a dashboard with Power Bi. 

Table of Content
================
1. Prerequisites
2. Dataset
3. Data Modelling
4. Project Summary
5. Results


1. Prerequisites
================
- Docker
- Astro CLI
- Soda
- GC account


2. Dataset
================
Raw data was downloaded from [kaggle](https://www.kaggle.com/datasets/tunguz/online-retail)

| Column | Description |
| --- | --- |
| InvoiceNo | Invoice number. Nominal, a 6-digit integral number uniquely assigned to each transaction. If this code starts with letter 'c', it indicates a cancellation. |
| StockCode | Product (item) code. Nominal, a 5-digit integral number uniquely assigned to each distinct product. |
| Description | Product (item) name. Nominal. |
| Quantity | The quantities of each product (item) per transaction. Numeric. |
| InvoiceDate | Invice Date and time. Numeric, the day and time when each transaction was generated. |
| UnitPrice | Unit price. Numeric, Product price per unit in sterling. |
| CustomerID | Customer number. Nominal, a 5-digit integral number uniquely assigned to each customer. |
| Country | Country name. Nominal, the name of the country where each customer resides. |


3. Data Modelling
================
---add image

4. Project Summary
=================
The project has the following components:
- Data Injection (CSV): The CSV file `online_retail.csv` was ingested into Google Cloud Storage to prepare for further processing.
- Data Storage (Google BigQuery): Two tables were created; raw_invoices table contains the data loaded from the GC bucket, and country table which contains country names and iso.
- Data Transformation (DBT): This is divided into 3 stages;
    - sources: `sources.yml` specifies the tables (in Big Query) from which the data is to be transformed.
    - tranform: `dim_customer.sql`, `dim_datetime.sql`, `dim_product.sql` and `fct_invoices.sql` models transform the data form source.
    - report: `report_customer_invoices.sql`, `report_product_invoices.sql` and `report_year_invoices.sql` models create report-ready tables from tranformed data.
- Data Quality Check (Soda): Files under `include\soda\checks` conduct quality check at specified stages with the assist of `check_function.py` file.
- Data Orchestration (Apache Airflow): A dag with contains tasks for each step/stage was created in `retail.py` file.
- Container Deployment (Docker)
- Data Visualization (Power BI): A basic report was created with Power BI, check results.


5. Results
===============
Please find the screenshots below.

