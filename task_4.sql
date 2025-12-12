-- task_4.sql
-- Print the full description of the 'books' table without using DESCRIBE or EXPLAIN

SELECT 
    COLUMN_NAME AS 'COLUMN',
    DATA_TYPE AS 'DATA_TYPE',
    IS_NULLABLE AS 'IS_NULLABLE',
    COLUMN_KEY AS 'KEY',
    COLUMN_DEFAULT AS 'DEFAULT',
    EXTRA AS 'EXTRA'
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'alx_book_store'
  AND TABLE_NAME = 'books';
