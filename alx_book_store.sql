-- -Database: alx_book_store
-- Create the database if it doesn't exist
CREATE DATABASE IF NOT EXISTS alx_book_store;

-- Use the database
USE alx_book_store;

-- This script defines and entire book store schema with setup relationships,
-- Ensuring automatic updates and clean deletions
-- 2.Authors table
CREATE TABLE Authors (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    author_name VARCHAR(215) NOT NULL
);

-- 1. Books table
CREATE TABLE Books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(130) NOT NULL,
    author_id INT,
    price DOUBLE,
    publication_date DATE,
    FOREIGN KEY (author_id) REFERENCES Authors(author_id) -- Define a relationship between Books and Authors
    ON DELETE SET NULL       -- If an author is deleted, set author_id in Books to NULL
    ON UPDATE CASCADE        -- If an author’s ID changes, update it automatically in Books
    
);


-- 3. Customers table
CREATE TABLE Customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(215) NOT NULL,
    email VARCHAR(215),
    address TEXT
);

-- 4. Orders table
CREATE TABLE Orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
     ON DELETE CASCADE                        -- If a customer is deleted, delete their orders too
        ON UPDATE CASCADE                        -- Update customer_id automatically if it changes
);

-- 5. Order Details table
CREATE TABLE Order_Details (
    orderdetailid INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    book_id INT,
    quantity DOUBLE NOT NULL DEFAULT 1,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id) -- Connect to Orders table
        ON DELETE CASCADE                         -- If an order is deleted, delete its details too
        ON UPDATE CASCADE,                        -- Update order_id if it changes
    FOREIGN KEY (book_id) REFERENCES Books(book_id) -- Connect to Books table
        ON DELETE CASCADE                         -- If a book is deleted, remove related order details
        ON UPDATE CASCADE                         -- Update book_id automatically if it changes
);

