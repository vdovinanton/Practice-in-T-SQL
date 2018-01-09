
USE productsdb

CREATE TABLE Products
(
����Id INT IDENTITY PRIMARY KEY,
����ProductName NVARCHAR(30) NOT NULL,
����Manufacturer NVARCHAR(20) NOT NULL,
����ProductCount INT DEFAULT 0,
����Price MONEY NOT NULL
);
��
INSERT INTO Products 
VALUES
('iPhone 6', 'Apple', 3, 36000),
('iPhone 6S', 'Apple', 2, 41000),
('iPhone 7', 'Apple', 5, 52000),
('Galaxy S8', 'Samsung', 2, 46000),
('Galaxy S8 Plus', 'Samsung', 1, 56000),
('Mi6', 'Xiaomi', 5, 28000),
('OnePlus 5', 'OnePlus', 6, 38000)