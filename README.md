# SQL Data Analysis Portfolio

My SQL learning journey from basic to advanced PostgreSQL for Data Analysis.

## Day 01 — SQL Fundamentals

### 📌 Project
Basic SQL Database & Table Management

### 🛠️ Tool
PostgreSQL

### 📚 Concepts Practiced

- CREATE DATABASE
- CREATE TABLE
- PostgreSQL Data Types
- INSERT INTO
- SELECT
- UPDATE
- ALTER TABLE
- ADD COLUMN
- RENAME TABLE
- ALTER COLUMN TYPE
- DELETE
- TRUNCATE
- DROP COLUMN
- DROP TABLE

### 📂 Day 01 Files

1. `create_table_insert_in_table.sql`
   - Database and table creation
   - Data types
   - Data insertion
   - SELECT queries

2. `update_queries.sql`
   - Updating existing records
   - Adding and modifying table structure

3. `deletion_queries.sql`
   - DELETE
   - TRUNCATE
   - DROP operations

### 🎯 Learning Objective

The goal of Day 01 was to understand the fundamentals of PostgreSQL and learn how to create, insert, retrieve, update, modify, and delete database data and structures.

### 🚀 Progress

Day 01 ✅ Completed
## 📅 Day 2 — SQL Filtering, Operators & Functions

### Topics Covered

- SELECT
- WHERE
- Comparison Operators
- Logical Operators
- AND
- OR
- NOT
- IN
- BETWEEN
- LIKE
- Pattern Matching
- NULL checking
- IS NULL
- IS NOT NULL
- String/Text functions
- Date and Time functions

### Practice Focus

In Day 2, I practiced retrieving specific records from tables using different conditions and operators.

I also practiced working with:

- Text data
- String functions
- Dates
- Time-related data
- Filtering records
- Multiple conditions

### Skills Developed

- Filtering data
- Searching specific records
- Working with text
- Working with dates
- Applying multiple conditions

---

# 📅 Day 3 — Aggregate Functions, GROUP BY & HAVING

### Topics Covered

- COUNT()
- SUM()
- AVG()
- MAX()
- MIN()
- GROUP BY
- HAVING
- WHERE + Aggregate Functions
- GROUP BY + Aggregate Functions
- GROUP BY + HAVING
- ORDER BY with Aggregated Results

### Practice Examples

I practiced questions such as:

- Total sales records
- Total quantity sold
- Total sales amount
- Average sales
- Highest sale
- Lowest sale
- Category-wise sales
- City-wise sales
- Salesperson-wise sales
- Category-wise maximum/minimum sales
- Completed sales
- High-performing categories
- High-performing salespersons

### Important Concepts

#### WHERE

`WHERE` filters rows **before grouping**.

```sql
SELECT category, SUM(total_amount)
FROM sales
WHERE is_completed = TRUE
GROUP BY category;
