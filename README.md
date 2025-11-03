# CRM Sales Pipeline Database (MySQL Project)

This is a SQL project that models a complete B2B (Business-to-Business) sales pipeline from scratch in MySQL. It demonstrates the ability to design a relational database, write complex queries, and model real-world business logic.

---

## 🚀 Project Overview

The database tracks the entire customer journey, from a new `Lead` to a "Closed-Won" `Opportunity`.

### 1. Database Schema

A normalized, 4-table schema was designed to manage all core business entities and their relationships:

* **Leads:** All unqualified prospects.
* **Accounts:** Qualified companies (our customers).
* **Contacts:** Individuals who work at the Accounts.
* **Opportunities:** The potential sales deals associated with an Account.

**Relationships:**
* `1 Account` -> `Many Contacts`
* `1 Account` -> `Many Opportunities`
* `1 Opportunity` -> `1 Primary Contact`

### 2. Core Business Logic: Lead Conversion

The project uses SQL transactions to simulate a "lead conversion." When a lead is qualified, a single `Lead` record is converted into three separate, linked records:
1.  An **Account** is created.
2.  A **Contact** is created and linked to the new Account.
3.  An **Opportunity** is created and linked to both the Account and Contact.

### 3. Business Insight Queries

The project includes a file of `SELECT` queries to answer common business questions, such as:

* **What is our active sales pipeline?** (Joining 3 tables to show open deals, company names, and contacts).
* **What is our total revenue to date?** (Using `SUM()` and `WHERE` to calculate all "Closed-Won" deals).
* **What is the 360-degree view of a customer?** (Using `UNION` to show all Contacts and Opportunities for a single Account).

---

### Files in this Repository

* **`1_schema.sql`**: The `CREATE TABLE` script to build the database.
* **`2_data_insertion.sql`**: Sample `INSERT` scripts to populate the database and simulate lead conversion.
* **`3_business_queries.sql`**: All the final `SELECT` queries for business analysis.
