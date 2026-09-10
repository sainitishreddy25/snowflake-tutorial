-- ============================================================
-- QUESTION 3: Data Loading Using SnowSQL / Snowflake Stage
-- ============================================================
-- The CSV file students.csv is uploaded separately to the
-- STUDENT_DATA_STAGE internal stage.
--
-- If using SnowSQL, the upload command is:
-- PUT file://C:/path/to/students.csv @STUDENT_DATA_STAGE;
--
-- Do NOT put your personal Windows path in GitHub if it contains
-- sensitive information. The commented command above is only a template.

USE WAREHOUSE ASSIGNMENT_WH;
USE DATABASE SNOWFLAKE_ASSIGNMENT_DB;
USE SCHEMA STUDENT_SCHEMA;

-- Create destination table
CREATE OR REPLACE TABLE LOADED_STUDENTS (
    STUDENT_ID  INTEGER,
    NAME        VARCHAR(50),
    DEPARTMENT  VARCHAR(50),
    YEAR        INTEGER,
    MARKS       INTEGER
);

-- Create an internal stage with CSV file format
CREATE OR REPLACE STAGE STUDENT_DATA_STAGE
FILE_FORMAT = (
    TYPE = CSV
    FIELD_OPTIONALLY_ENCLOSED_BY = '"'
    SKIP_HEADER = 1
);

-- Verify the file uploaded to the stage
LIST @STUDENT_DATA_STAGE;

-- Load the CSV file into the table
COPY INTO LOADED_STUDENTS
FROM @STUDENT_DATA_STAGE
FILE_FORMAT = (
    TYPE = CSV
    FIELD_OPTIONALLY_ENCLOSED_BY = '"'
    SKIP_HEADER = 1
);

-- Verify loaded records
SELECT * FROM LOADED_STUDENTS
ORDER BY STUDENT_ID;

-- Verify number of records
SELECT COUNT(*) AS TOTAL_RECORDS
FROM LOADED_STUDENTS;
