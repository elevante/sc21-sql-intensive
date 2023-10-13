# SQL Bootcamp

<span>
	<img src="https://img.shields.io/badge/SQL-white?style=for-the-badge&logo=databricks">
</span>
<span>
	<img src="https://img.shields.io/badge/postgresql-white?style=for-the-badge&logo=postgresql">
</span>

## 📝 Description
SQL Bootcamp at School21 is an introduction to SQL language and databases in the intensive format: you need to complete exercises and present your solutions to other students every day to succeed at the Bootcamp.
Each module (day) in Bootcamp contains tasks dedicated to implementation of SQL statements to retrieve needed data from given database.

Database Management System used in Bootcamp is <code>PostgreSQL</code>.

IDE I used: ***DataGRIP*** from JetBrains.

## 🔃 Schemas

### Main database schema

<img style="width: 580px" src="info/imgs/DB_schema.png">

### Database schema for Team01 Project

<img style="width: 580px" src="info/imgs/DB_schema_Team01.png">

## 💻 Exercises

***DAY00-DAY03***

Basic SQL syntax: use of SELECT, JOIN, UNION etc.

***DAY04***

Task is dedicated to virtual views and physical snapshots of data.

***DAY05 - DAY07***

 Data Governance Policies, Database indexes, Database Sequences.

***DAY08***

Transactions and isolation levels.

***DAY09***

The task of the day is to create PostgreSQL functions to process the data.

***TEAM01***

DWH, ETL process, data with anomalies.

ex00

```
The task is to write a SQL statement that returns 
the total volume (sum of all money) of transactions 
from user balance aggregated by user and balance type.
```

ex01

```
The task is to write a SQL statement that returns
all Users, all Balance transactions (not including currencies that do not have a key in the Currency table) 
with currency name and calculated value of currency in USD for the nearest day.
```
