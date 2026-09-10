-- ============================================================
-- QUESTION 4: Snowflake Time Travel
-- ============================================================

USE WAREHOUSE ASSIGNMENT_WH;
USE DATABASE SNOWFLAKE_ASSIGNMENT_DB;
USE SCHEMA STUDENT_SCHEMA;

-- Create a separate table for the Time Travel demonstration
CREATE OR REPLACE TABLE TIME_TRAVEL_STUDENTS (
    STUDENT_ID  INTEGER,
    NAME        VARCHAR(50),
    DEPARTMENT  VARCHAR(50),
    MARKS       INTEGER
);

-- Insert initial records
INSERT INTO TIME_TRAVEL_STUDENTS VALUES
(301, 'Aman', 'CSE', 80),
(302, 'Bhavna', 'ECE', 75),
(303, 'Charan', 'IT', 90),
(304, 'Divya', 'CSE', 85);

-- Display the original table
SELECT * FROM TIME_TRAVEL_STUDENTS
ORDER BY STUDENT_ID;

-- IMPORTANT:
-- Run this statement BEFORE UPDATE and DELETE.
-- Copy the returned timestamp for the Time Travel query.
SELECT CURRENT_TIMESTAMP() AS BEFORE_CHANGE_TIMESTAMP;

-- UPDATE operation
UPDATE TIME_TRAVEL_STUDENTS
SET MARKS = 95
WHERE STUDENT_ID = 301;

-- DELETE operation
DELETE FROM TIME_TRAVEL_STUDENTS
WHERE STUDENT_ID = 304;

-- Display current state after UPDATE and DELETE
SELECT * FROM TIME_TRAVEL_STUDENTS
ORDER BY STUDENT_ID;

-- ============================================================
-- TIME TRAVEL QUERY
-- Replace the timestamp below with the actual timestamp
-- captured BEFORE the UPDATE and DELETE.
--
-- Example format:
-- SELECT *
-- FROM TIME_TRAVEL_STUDENTS
-- AT (TIMESTAMP => '2026-09-10 12:05:31.123 +0000'::TIMESTAMP_TZ);
-- ============================================================

-- Example template (replace before executing):
-- SELECT *
-- FROM TIME_TRAVEL_STUDENTS
-- AT (TIMESTAMP => '<YOUR_BEFORE_CHANGE_TIMESTAMP>'::TIMESTAMP_TZ)
-- ORDER BY STUDENT_ID;
