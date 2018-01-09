
/* SOME EXAMPLES TO INSERT ROWS WITH DIFFERENCE TYPES */
/* FOR DESCRIPTION: https://metanit.com/sql/sqlserver/4.1.php*/

CREATE DATABASE productsdb;
GO

USE productsdb;
CREATE TABLE Products 
(
	Id INT IDENTITY PRIMARY KEY,
	ProductName NVARCHAR(30) NOT NULL,
	Manufacturer NVARCHAR(20) NOT NULL,
	ProductCount INT DEFAULT 0,
	Price MONEY NOT NULL
)

-- INSERT Products VALUES ('iPhone 7', 'Apple', 5, 52000)

--INSERT INTO Products (ProductName, Price, Manufacturer) 
--VALUES ('iPhone 6S', 41000, 'Apple')

--INSERT INTO Products 
--VALUES
--('iPhone 6', 'Apple', 3, 36000),
--('Galaxy S8', 'Samsung', 2, 46000),
--('Galaxy S8 Plus', 'Samsung', 1, 56000)

INSERT INTO Products (ProductName, Manufacturer, ProductCount, Price)
VALUES ('Mi6', 'Xiaomi', DEFAULT, 28000)