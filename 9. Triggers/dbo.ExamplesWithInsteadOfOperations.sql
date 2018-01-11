
/* EXAMPLES WITH INSTEAD OF OPERATIONS */
/* https://metanit.com/sql/sqlserver/12.3.php */

CREATE DATABASE prods;
GO
USE prods;
CREATE TABLE Products
(
    Id INT IDENTITY PRIMARY KEY,
    ProductName NVARCHAR(30) NOT NULL,
    Manufacturer NVARCHAR(20) NOT NULL,
    Price MONEY NOT NULL,
    IsDeleted BIT NULL DEFAULT 0
);

/* CREATE TRIGGER FOR DELETE */
USE prods
GO
CREATE TRIGGER products_delete
ON Products
INSTEAD OF DELETE
AS
UPDATE Products
SET IsDeleted = 1
WHERE ID = (SELECT Id FROM deleted)

/* USE DELETE TRIGGER */
USE prods;
 
INSERT INTO Products (ProductName, Manufacturer, Price)
VALUES	('iPhone X', 'Apple', 79000),
		('Pixel 2', 'Google', 60000);
 
DELETE FROM Products 
WHERE ProductName = 'Pixel 2';
 
SELECT * FROM Products;

--UPDATE Products
--SET IsDeleted = 0
--WHERE ID = 3