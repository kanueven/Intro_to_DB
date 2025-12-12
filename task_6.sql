-- Write a script that inserts multiple rows in the table customer (database alx_book_store) in your MySQL server.
USE alx_book_store;
INSERT INTO Customers (customer_name, email, address) 
VALUES
(    'Blessing Malik','bmalik@sandtech.com','124 Happiness  Ave'),
('Obed Ehoneah','eobed@sandtech.com','125 Happiness  Ave'),
('Nehemial Kamolu','nkamolu@sandtech.com','126 Happiness  Ave');