-- -Database: alx_book_store
-- Create the database if it doesn't exist
CREATE DATABASE IF NOT EXISTS alx_book_store;

-- Use the database
USE alx_book_store;

-- This script defines an entire book store schema with setup relationships,
-- ensuring automatic updates and clean deletions

-- 1. Authors table
CREATE TABLE authors (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    author_name VARCHAR(215) NOT NULL
);

-- 2. Books table
CREATE TABLE IF NOT EXISTS books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(130) NOT NULL,
    author_id INT,
    price DOUBLE,
    publication_date DATE,
    FOREIGN KEY (author_id) REFERENCES authors(author_id)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);

-- 3. Customers table
CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(215) NOT NULL,
    email VARCHAR(215),
    address TEXT
);

-- 4. Orders table
CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
        ON DELETE CASCADE                        -- If a customer is deleted, delete their orders too
        ON UPDATE CASCADE                        -- Update customer_id automatically if it changes
);

-- 5. Order_Details table
CREATE TABLE order_details (
    orderdetailid INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    book_id INT,
    quantity DOUBLE NOT NULL DEFAULT 1,
    FOREIGN KEY (order_id) REFERENCES orders(order_id) -- Connect to Orders table
        ON DELETE CASCADE                         -- If an order is deleted, delete its details too
        ON UPDATE CASCADE,                        -- Update order_id if it changes
    FOREIGN KEY (book_id) REFERENCES books(book_id) -- Connect to Books table
        ON DELETE CASCADE                         -- If a book is deleted, remove related order details
        ON UPDATE CASCADE                         -- Update book_id automatically if it changes
);
