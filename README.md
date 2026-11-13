# SQL Project: Job Data Analysis 📊

## 🚀 Introduction & Background
Welcome to the **SQL Job Data Analysis** project! In the modern job market, understanding data analyst roles, salary expectations, and required technical skills is critical for career positioning and hiring insights. 

This project dives deep into job market data to answer key analytical questions through robust SQL querying. It explores top-paying remote roles, highest-demanded skills, and optimal skills that balance both high salaries and high demand.

---

## 🛠️ Tools I Used
To build, manage, and analyze this project, I utilized the following modern data stack and development tools:
* **Visual Studio Code (VS Code):** Used as the primary code editor for writing, organizing, and executing SQL queries via extensions like SQLTools.
* **PostgreSQL:** The powerful relational database management system used to store and query the job market dataset.
* **pgAdmin 4:** Utilized for database administration, schema management, and initial data verification.
* **Git & GitHub:** For version control, managing project history, and publishing the codebase cleanly.

---

## 🔍 Analysis & Key Insights
Through the five core analytical queries in `project_sql/`, each script focused on a specific facet of the Data Analyst job market:

1. **Top-Paying Remote Roles (`1_top_paying_jobs.sql`):**
   * Filtering specifically for remote Data Analyst positions with non-null salaries revealed a wide compensation spectrum, with top-tier roles offering competitive annual packages exceeding $180,000–$250,000+ depending on seniority and domain specialization.
2. **Skills Required for Top-Paying Jobs (`2_top_paying_jobs_skills.sql`):**
   * Joining top-paying roles with skill mappings highlighted that foundational tools like **SQL** and **Python** remain mandatory across almost all high-earning positions, often paired with cloud or visualization platforms like **Tableau**, **R**, or **Snowflake**.
3. **Most In-Demand Skills (`3_top_demanded_skills.sql`):**
   * Aggregating skill frequencies across all remote Data Analyst postings confirmed that **SQL**, **Excel**, **Python**, **Tableau**, and **Power BI** dominate employer requirements in sheer volume.
4. **Highest-Paying Skills on Average (`4_top_paying_skills.sql`):**
   * Calculating average salaries grouped by skill showed that specialized big data, cloud, and engineering-adjacent tools (such as **PySpark**, **Bitbucket**, **Couchbase**, **Databricks**, and **Pandas**) command the highest average compensation, even if their overall posting volume is smaller.
5. **Optimal Skills to Learn (`5_optimal_skills.sql`):**
   * Combining demand counts with average salary using multi-field hierarchical sorting (`ORDER BY demand_count DESC, average_salary DESC`) identified the sweet spot for career growth: core programming and database skills (**SQL**, **Python**) alongside modern BI and cloud tools (**Tableau**, **Snowflake**, **AWS/Azure**) offer both high job security and strong financial return.

---

## 📂 Project Structure & Overview

The repository is organized into three core directories:

### 1. `project_sql/` (Analytical Queries)
Contains the core business and data analysis queries answering key job market questions:
* **`1_top_paying_jobs.sql`**: Identifies the top 10 highest-paying remote Data Analyst roles with specified salaries.
* **`2_top_paying_jobs_skills.sql`**: Explores the specific technical skills required for those top-paying jobs.
* **`3_top_demanded_skills.sql`**: Finds the most frequently requested skills across all job postings.
* **`4_top_paying_skills.sql`**: Analyzes which skills command the highest average yearly salaries.
* **`5_optimal_skills.sql`**: Combines demand and salary metrics to find the most "optimal" skills to learn.

### 2. `sql_load/` (Database Setup & Loading)
Contains scripts responsible for database creation, table schemas, and data ingestion handling:
* `1_create_database.sql`
* `2_create_tables.sql` & date partitioning scripts
* Case modifications and table alterations (`3_cases.sql`, `3_modify_tables.sql`, `4_SUBQUERIES_CTE.sql`, `5_unions`)

### 3. `table_structure/` (Schema Maintenance)
Contains modular SQL scripts for structural adjustments:
* `create_table.sql`
* `Alter_Table.sql`
* `Insert_Table.sql`
* `Update_Table.sql`

---

## 💡 What I Learned
Building this project from database setup to final insights strengthened both my technical SQL capabilities and data engineering workflow:

* **Complex Query Architecture:** Mastered writing clean, readable queries using **Common Table Expressions (CTEs)** and subqueries to break multi-step analytical problems into logical blocks.
* **Relational Data Modeling & Joins:** Gained hands-on experience linking fact tables (`job_postings_fact`) with dimension and bridge tables (`company_dim`, `skills_job_dim`, `skills_dim`) using `INNER JOIN` and `LEFT JOIN`.
* **Advanced Aggregation & Multi-Column Sorting:** Learned how aggregate functions (`COUNT`, `AVG`, `ROUND`) pair with `GROUP BY` and `HAVING` clauses, as well as how multi-field `ORDER BY` clauses act as hierarchical tie-breakers.
* **Database Administration & Local Environment Setup:** Configured PostgreSQL locally, loaded large CSV datasets into structured schemas via `pgAdmin 4`, and connected VS Code directly to the database using SQLTools.
* **Git & Version Control Best Practices:** Learned how to manage repositories cleanly using `.gitignore` to exclude large raw datasets (>100 MB) and local environment configuration files (`.vscode/`).

---

## 🏁 Conclusion
This project demonstrates how raw, large-scale job posting data can be transformed into actionable career intelligence using SQL. From the analysis, a clear strategic takeaway emerges for aspiring and current Data Analysts:

* **Master the Core Foundation:** **SQL** and **Python** are non-negotiable pillars—they appear consistently at the top of both demand volume and high-paying job requirements.
* **Specialize for Compensation Growth:** Pairing core analytics skills with cloud data warehouses, big data frameworks, or modern BI ecosystems significantly increases earning potential.

Overall, this end-to-end analysis reinforced how structured querying, thoughtful data filtering, and clean repository management come together to solve real-world data problems.

