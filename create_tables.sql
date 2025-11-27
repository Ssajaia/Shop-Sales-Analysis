USE master;

CREATE DATABASE shop;
GO

USE shop;
GO

-- products ცხრილი
CREATE TABLE products(
    product_id INT IDENTITY(1,1) PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    category VARCHAR(100) NOT NULL,
    price NUMERIC(10,2) NOT NULL
);

--customers ცხრილი
CREATE TABLE customers(
    customer_id INT IDENTITY(1,1) PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    country VARCHAR(20) NOT NULL
);

-- orders ცხრილი
CREATE TABLE orders(
    order_id INT IDENTITY(1,1) PRIMARY KEY,
    customer_id INT NOT NULL,
    product_id INT NOT NULL,
    order_date DATETIME NOT NULL,
    quantity INT NOT NULL,
    CONSTRAINT FK_Orders_Customers FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    CONSTRAINT FK_Orders_Products FOREIGN KEY (product_id) REFERENCES products(product_id)
);
