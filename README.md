# RTO Database Project

A structured SQL-based database system designed for the Regional Transport Office (RTO), focused on efficient storage, retrieval, and management of vehicle registration, licenses, and ownership data.

## 📌 Features

- Vehicle registration and license record management
- Owner and vehicle relationship tracking
- Normalized schema for minimal redundancy
- Functional dependencies and relational modeling
- Optimized SQL queries for real-world use cases and reporting
- ER Diagram and Relational Model diagrams included

## 🧩 Technologies Used

- **PostgreSQL** – Database system
- **pgAdmin 4** – GUI for managing PostgreSQL databases
- Standard **SQL**
- DBMS concepts (Normalization, Functional Dependencies, Relational Algebra)
- Python (for optional query execution)

## 🛠️ How to Run

1. Install **PostgreSQL** and **pgAdmin 4** if not already installed.
2. Open `pgAdmin 4` and create a new database (e.g., `rto_db`).
3. Use the Query Tool in pgAdmin to:
   - Run `RTO DDL Statements.sql` to create the schema.
   - Run `RTO Data.sql` to insert sample records.
   - Run queries from `RTO Query Statements.sql` to test functionality.
4. (Optional) Use `RTO API (python).py` to interact with the database programmatically via Python.

## 📊 ER & Relational Model

![ER Diagram](./RTO%20ER%20Diagram.png)
![Relational Model](./RTO%20Relational%20model.png)

## 📄 License

This project is for academic and learning purposes. Feel free to use or modify it.