# Data Warehouse and Analytics Project

Welcome to the **Data Warehouse and Analytics Project repository!** 🚀  
This project demonstrates a **comprehensive data warehousing and analytics solution**, from ingesting raw data to delivering business-ready insights.  
It’s designed as a **portfolio project** to showcase real-world, industry-grade practices in **data engineering** and **analytics**.

---

## 🏗️ Data Architecture

This project uses the **Medallion Architecture** pattern consisting of **Bronze**, **Silver**, and **Gold** layers.  
Each layer is purpose-built to progressively improve the quality, structure, and usability of the data.

---

### 🔹 Bronze Layer
- **Purpose:** Stores raw, untransformed data directly from source systems.
- **Sources:** CSV files from CRM and ERP systems.
- **Load Mechanism:** Batch processing, full load using `TRUNCATE & INSERT`.
- **Transformations:** None – raw data is stored *as-is*.
- **Object Type:** Tables
- **Data Model:** None (raw schema)

---

### 🔸 Silver Layer
- **Purpose:** Stores cleaned, standardized, and normalized data ready for transformation.
- **Transformations Include:**
  - Data cleansing
  - Standardization
  - Normalization
  - Derived columns
  - Enrichment
- **Load Mechanism:** Batch processing
- **Object Type:** Tables
- **Data Model:** Cleaned, but not yet modeled (normalized)

---

### ⭐ Gold Layer
- **Purpose:** Provides **business-ready data** for analytics, dashboards, and reporting.
- **Transformations Include:**
  - Data integrations
  - Aggregations
  - Business logic application
- **Load Mechanism:** No physical load – built using SQL Views
- **Object Type:** Views
- **Data Model:** 
  - Star Schema  
  - Flat Tables  
  - Aggregated Tables

---

## 📖 Project Overview

This project encompasses the full data lifecycle — from ingesting raw source files to delivering business-ready insights for analytics and reporting.

- **🔧 Data Architecture** – The system is built on the Medallion Architecture framework, comprising Bronze, Silver, and Gold layers to manage data across its stages: raw, refined, and consumable.
- **🛠️ ETL Development** – SQL Server stored procedures handle the end-to-end ETL process, including batch ingestion, standardization, enrichment, and transformation.
- **🧠 Dimensional Modeling** – A star schema design powers the Gold layer using well-defined fact and dimension tables to support efficient analytical workloads.
- **📊 Insight Generation** – Business metrics and clean datasets are exposed through views and queries, optimized for dashboards, ad hoc reporting, and downstream analytics.


---
## 🧩 Data Integration Flow

The following diagram shows how raw data from CRM and ERP systems is integrated in the Bronze and Silver layers before reaching the Gold layer:

<img width="1522" height="734" alt="data_integration_flow" src="https://github.com/user-attachments/assets/c2a228dd-d45b-4b2b-9e01-e137a354206e" />  
*This diagram outlines the relationships and joins between different raw and enriched datasets.*

---

## 🏪 Sales Data Mart Data Model (Gold Layer)

In the Gold layer, business-ready data is organized using a **Star Schema** with dimensional modeling.  
The `fact_sales` table captures transactional sales data, linked to two key dimensions:

- `dim_customers`: Enriched customer details from CRM and ERP
- `dim_products`: Consolidated product data including cost, category, and maintenance info

---

<img width="1172" height="816" alt="Sales Data Mart" src="https://github.com/user-attachments/assets/2af40196-6862-4fac-a094-8b00d92c9da3" />

*Star schema showing relationships between sales, customers, and products.*

---
## 🎯 Skills Demonstrated

This project showcases capabilities across:

- ✅ SQL Development
- ✅ Data Architecture Design
- ✅ ETL Pipeline Development
- ✅ Data Modeling
- ✅ Data Engineering
- ✅ Analytical Reporting



> 💡 Feel free to customize the image path and update links to dashboards or queries if you're hosting this project online or sharing it with recruiters.
