-- ============================================================
-- QUESTION 1: SnowSQL Login and Connection
-- ============================================================
-- Note:
-- The actual SnowSQL login is performed from the SnowSQL terminal:
-- snowsql -a <ACCOUNT_IDENTIFIER> -u <USERNAME>
-- The password must NOT be stored in this file or uploaded to GitHub.
--
-- Run the SQL below after connecting to Snowflake.

SELECT
    CURRENT_USER()      AS CURRENT_USER,
    CURRENT_ROLE()      AS CURRENT_ROLE,
    CURRENT_WAREHOUSE() AS CURRENT_WAREHOUSE,
    CURRENT_DATABASE()  AS CURRENT_DATABASE,
    CURRENT_SCHEMA()    AS CURRENT_SCHEMA;

-- Optional session verification
SELECT CURRENT_VERSION() AS SNOWFLAKE_VERSION;
