# Task 9: SQL Data Modeling - Amazon Sales Star Schema
[cite_start]**Internship:** Data Analyst Internship (MSME) [cite: 53, 54]

## 📌 Project Overview
This task involved transforming a flat Amazon Sales dataset into a normalized **Star Schema**. [cite_start]By separating descriptive data into **Dimension Tables** and quantitative data into a central **Fact Table**, the model ensures higher data integrity and faster query performance for Business Intelligence reporting[cite: 56, 80].

## 🛠️ Modeling Approach
* [cite_start]**Fact Table (`Sales_Fact`)**: Stores transactional data including Weekly Sales, CPI, and Unemployment metrics[cite: 66, 68].
* **Dimension Tables**:
    * [cite_start]`Dim_Store`: Contains store-specific attributes like Type and Size[cite: 66, 67].
    * `Dim_Date`: Contains date-related descriptors and holiday flags[cite: 66, 67].
* [cite_start]**Normalization**: Utilized `PRIMARY KEY` and `FOREIGN KEY` constraints to establish relationships and prevent data redundancy[cite: 67, 68].



## 📂 Deliverables
* [cite_start]**`task9_star_schema.sql`**: Complete DDL and DML scripts.
* **`star_schema_diagram.png`**: Visual ERD of the modeled Star Schema.
* [cite_start]**`analysis_outputs.csv`**: Sample query output demonstrating successful table joins.

## 💡 Key Business Insights
1. **Reporting Efficiency**: The Star Schema reduced the need for complex filtering on large datasets by providing pre-organized lookup tables.
2. **Data Integrity**: Implementing unique constraints on dimensions prevented duplicate record entries for stores and dates.
3. **Analytical Readiness**: The schema is now optimized for direct connection to BI tools like Power BI or Tableau.
