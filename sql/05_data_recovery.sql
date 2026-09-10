-- ============================================================
-- QUESTION 5: Data Recovery Using Time Travel
-- ============================================================

USE WAREHOUSE ASSIGNMENT_WH;
USE DATABASE SNOWFLAKE_ASSIGNMENT_DB;
USE SCHEMA STUDENT_SCHEMA;

-- Create a separate recovery demonstration table
CREATE OR REPLACE TABLE RECOVERY_STUDENTS (
    STUDENT_ID  INTEGER,
    NAME        VARCHAR(50),
    DEPARTMENT  VARCHAR(50),
    MARKS       INTEGER
);

-- Insert original records
INSERT INTO RECOVERY_STUDENTS VALUES
(401, 'Aditya', 'CSE', 87),
(402, 'Neha', 'ECE', 92),
(403, 'Ravi', 'IT', 81),
(404, 'Pooja', 'CSE', 95),
(405, 'Sanjay', 'EEE', 73);

-- Verify original data
SELECT * FROM RECOVERY_STUDENTS
ORDER BY STUDENT_ID;

-- IMPORTANT:
-- Run this BEFORE the DELETE and copy the returned timestamp.
SELECT CURRENT_TIMESTAMP() AS RECOVERY_TIMESTAMP;

-- Simulate accidental deletion of two records
DELETE FROM RECOVERY_STUDENTS
WHERE STUDENT_ID IN (403, 404);

-- Verify that Ravi and Pooja are missing
SELECT * FROM RECOVERY_STUDENTS
ORDER BY STUDENT_ID;

-- ============================================================
-- STEP 1: Find the deleted records using Time Travel
-- Replace <YOUR_RECOVERY_TIMESTAMP> with the timestamp captured
-- BEFORE the DELETE.
-- ============================================================

-- SELECT *
-- FROM RECOVERY_STUDENTS
-- AT (TIMESTAMP => '<YOUR_RECOVERY_TIMESTAMP>'::TIMESTAMP_TZ)
-- WHERE STUDENT_ID IN (403, 404)
-- ORDER BY STUDENT_ID;

-- ============================================================
-- STEP 2: Recover the deleted records
-- Replace <YOUR_RECOVERY_TIMESTAMP> with your actual timestamp.
-- ============================================================

-- INSERT INTO RECOVERY_STUDENTS
-- SELECT *
-- FROM RECOVERY_STUDENTS
-- AT (TIMESTAMP => '<YOUR_RECOVERY_TIMESTAMP>'::TIMESTAMP_TZ)
-- WHERE STUDENT_ID IN (403, 404);

-- ============================================================
-- STEP 3: Verify that the records have been restored
-- ============================================================

-- SELECT *
-- FROM RECOVERY_STUDENTS
-- ORDER BY STUDENT_ID;

-- Optional: create a separate recovered copy for evidence
-- CREATE OR REPLACE TABLE RECOVERED_STUDENTS AS
-- SELECT *
-- FROM RECOVERY_STUDENTS
-- AT (TIMESTAMP => '<YOUR_RECOVERY_TIMESTAMP>'::TIMESTAMP_TZ);

-- SELECT * FROM RECOVERED_STUDENTS ORDER BY STUDENT_ID;
