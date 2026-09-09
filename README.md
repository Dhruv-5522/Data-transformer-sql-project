
# 📊 Data Transformer — SQL Analytics System

## 📌 Project Description
The **Data Transformer** project is a comprehensive SQL database system designed to process, transform, and analyze enterprise data. It simulates real-world corporate operations across **Customer Information**, **Sales Transactions**, and **Employee Performance** using advanced SQL techniques including Joins, Subqueries, Date and String Manipulations, Window Functions, and CASE Expressions.

---

## 🛠️ Database Schema

* **Customers:** `CustomerID` (PK), `FirstName`, `LastName`, `Email`, `RegistrationDate`
* **Orders:** `OrderID` (PK), `CustomerID` (FK), `OrderDate`, `TotalAmount`
* **Employees:** `EmployeeID` (PK), `FirstName`, `LastName`, `Department`, `HireDate`, `Salary`

---

## ⚡ Task Breakdown & SQL Queries Summary

| Task # | Category | Brief Explanation | Key SQL Function |
|---|---|---|---|
| **1** | **INNER JOIN** | Extracts matching records between orders and customer details. | `INNER JOIN` |
| **2** | **LEFT JOIN** | Retrieves all customers including those without any orders. | `LEFT JOIN` |
| **3** | **RIGHT JOIN** | Retrieves all orders along with their customer details. | `RIGHT JOIN` |
| **4** | **FULL OUTER JOIN** | Combines all customer and order records regardless of a match. | `LEFT JOIN` + `UNION` + `RIGHT JOIN` |
| **5** | **Subquery** | Filters customers whose order values exceed the overall average. | `WHERE TotalAmount > (SELECT AVG...)` |
| **6** | **Subquery** | Finds employees earning above the average company salary. | `WHERE Salary > (SELECT AVG...)` |
| **7** | **Date Function** | Extracts the numerical year and month from the transaction date. | `EXTRACT()` |
| **8** | **Date Function** | Calculates the elapsed days between order dates and current date. | `DATEDIFF()` |
| **9** | **Date Function** | Formats raw dates into readable strings (e.g., '01-Jul-2023'). | `DATE_FORMAT()` |
| **10**| **String Function**| Merges first and last names into a clean full-name format. | `CONCAT()` |
| **11**| **String Function**| Replaces specific substring values within customer names. | `REPLACE()` |
| **12**| **String Function**| Standardizes casing to uppercase first names and lowercase last names. | `UPPER()`, `LOWER()` |
| **13**| **String Function**| Cleans up unnecessary spaces surrounding email strings. | `TRIM()` |
| **14**| **Window Function**| Calculates cumulative financial totals across consecutive orders. | `SUM() OVER()` |
| **15**| **Window Function**| Assigns ranking positions to orders based on highest sales amount. | `RANK() OVER()` |
| **16**| **CASE Expression**| Evaluates order amounts to apply tier-based percentage discounts. | `CASE WHEN` |
| **17**| **CASE Expression**| Groups employees into High, Medium, or Low salary categories. | `CASE WHEN` |

---

## 🚀 How to Execute

1. Open **MySQL Workbench** or **VS Code**.
2. Run `CREATE DATABASE DataTransformer; USE DataTransformer;`.
3. Open and execute `data_transformer.sql`.

---

### 👨‍💻 Project Status
* **Status:** 100% Completed & Verified
* **Compatibility:** Standard SQL / MySQL 8.0+
