
/* RETURNED PARAMETHERS AND VALUES */
/* https://metanit.com/sql/sqlserver/11.3.php */


/* CREATE SP */
USE productsdb;
GO
CREATE PROCEDURE GetPriceStats
††††@minPrice MONEY OUTPUT,
††††@maxPrice MONEY OUTPUT
AS
SELECT	@minPrice = MIN(Price),† 
		@maxPrice = MAX(Price)
FROM Products

/* USE SP*/
USE productsdb;
DECLARE @minPrice MONEY, @maxPrice MONEY
†
EXEC GetPriceStats @minPrice OUTPUT, @maxPrice OUTPUT
†
PRINT 'ÃËÌËÏ‡Î¸Ì‡ˇ ˆÂÌ‡ ' + CONVERT(VARCHAR, @minPrice)
PRINT 'Ã‡ÍÒËÏ‡Î¸Ì‡ˇ ˆÂÌ‡ ' + CONVERT(VARCHAR, @maxPrice)

/* CREATE SP, WILL CRATE ROW AND RETURN ID */
USE productsdb;
GO
†
CREATE PROCEDURE CreateProduct
††††@name NVARCHAR(20),
††††@manufacturer NVARCHAR(20),
††††@count INT,
††††@price MONEY,
††††@id INT OUTPUT
AS
††††INSERT INTO Products(ProductName, Manufacturer, ProductCount, Price)
††††VALUES(@name, @manufacturer, @count, @price)
††††SET @id = @@IDENTITY

/* USE SP */
USE productsdb;
†
DECLARE @id INT
†
EXEC CreateProduct 'LG V30', 'LG', 3, 28000, @id OUTPUT
†
PRINT @id

/*WITH RETURN KEYWORD*/
USE productsdb;
GO
CREATE PROCEDURE GetAvgPrice AS
DECLARE @avgPrice MONEY
SELECT @avgPrice = AVG(Price)
FROM Products
RETURN @avgPrice;

/* USE SP */
USE productsdb;
†
DECLARE @result MONEY
†
EXEC @result = GetAvgPrice
PRINT @result