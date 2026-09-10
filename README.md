# snowflake-tutorial
# Snowflake Tutorial Assignment

## Overview

This repository contains the implementation of a Snowflake tutorial assignment covering SnowSQL connectivity, Snowflake object creation, data loading, Time Travel, and data recovery.

The assignment demonstrates the basic capabilities of Snowflake for data management, data loading, historical data access, and recovery of accidentally deleted records.

---

## Objectives

The main objectives of this assignment are:

- Establish and verify a connection to Snowflake.
- Create and manage Snowflake objects.
- Perform basic SQL CRUD operations.
- Load CSV data into a Snowflake table.
- Demonstrate Snowflake Time Travel.
- Recover accidentally deleted records using Time Travel.
- Document the complete implementation with SQL scripts and screenshots.

---

## Technologies Used

- Snowflake
- Snowsight
- SnowSQL
- SQL
- CSV

---

## Snowflake Objects Created

The following Snowflake objects were created as part of this assignment:

- Database: `SNOWFLAKE_ASSIGNMENT_DB`
- Schema: `STUDENT_SCHEMA`
- Warehouse: `ASSIGNMENT_WH`
- Tables:
  - `STUDENTS`
  - `LOADED_STUDENTS`
  - `TIME_TRAVEL_STUDENTS`
  - `RECOVERY_STUDENTS`
- Stages:
  - `STUDENT_STAGE`
  - `STUDENT_DATA_STAGE`

---

# Assignment Questions

## 1. SnowSQL Login and Connection

The Snowflake connection was established and verified.

The current Snowflake session was checked using:

```sql
SELECT
    CURRENT_USER() AS CURRENT_USER,
    CURRENT_ROLE() AS CURRENT_ROLE,
    CURRENT_WAREHOUSE() AS CURRENT_WAREHOUSE,
    CURRENT_DATABASE() AS CURRENT_DATABASE,
    CURRENT_SCHEMA() AS CURRENT_SCHEMA;
