
/* PARAMETERS IN SPS */
/* https://metanit.com/sql/sqlserver/11.2.php */

/* CREATE SP */
USE productsdb;
GO
CREATE PROCEDURE AddProduct
    @name NVARCHAR(20),
    @manufacturer NVARCHAR(20),
    @count INT,
    @price MONEY
AS
INSERT INTO Products(ProductName, Manufacturer, ProductCount, Price) 
VALUES(@name, @manufacturer, @count, @price)


/* USE SP */
USE productsdb;
DECLARE @prodName NVARCHAR(20), 
		@company NVARCHAR(20);
DECLARE @prodCount INT,
		@price MONEY
SET @prodName = 'Galaxy C7'
SET @company = 'Samsung'
SET @price = 22000
SET @prodCount = 5
 
EXEC AddProduct @prodName, @company, @prodCount, @price
 
SELECT * FROM Products

/* WITH  OPTIONAL PARAMETHER */
USE productsdb;
GO
CREATE PROCEDURE AddProductWithOptionalCount
    @name NVARCHAR(20),
    @manufacturer NVARCHAR(20),
    @price MONEY,
    @count INT = 1 -- OPIONAL. NOTE: RECOMMENTED USE IN THE LAST OF LIST
AS
INSERT INTO Products(ProductName, Manufacturer, ProductCount, Price) 
VALUES(@name, @manufacturer, @count, @price)