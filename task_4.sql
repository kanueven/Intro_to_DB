-- prints the full description of the table books from the database alx_book_store in your MySQL server.
-- You are not allowed to use the DESCRIBE or EXPLAIN statements
SELECT 
COLUMN_NAME AS 'COLUMN',
DATA_TYPE AS 'DATA TYPE',
IS_NULLABLE AS 'IS NULLABLE',
COLUMN_KEY AS 'KEY',
COLUMN_DEFAULT AS 'DEFAULT',
EXTRA AS 'EXTRA'
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'alx_book_store' AND TABLE_NAME = 'books';