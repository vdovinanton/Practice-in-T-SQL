
/* VARRIBLES IN SELECTS */
/* https://metanit.com/sql/sqlserver/9.2.php */

DECLARE @maxPrice MONEY, 
����	@minPrice MONEY, 
����	@dif MONEY, 
����	@count INT
�
SET @count = (SELECT SUM(ProductCount) FROM Orders);
�
SELECT	@minPrice = MIN(Price), 
		@maxPrice = MAX(Price) 
FROM	Products
�
SET @dif = @maxPrice - @minPrice;
�
PRINT '����� �������: ' + STR(@count, 5) + ' �����a(��)';
PRINT '������� ����� ������������ � ����������� �����: ' + STR(@dif)



DECLARE	@sum MONEY,
		@id INT,
		@prodid INT,
		@name NVARCHAR(20);
SET		@id=2;
�
SELECT	@sum = SUM(Orders.Price * Orders.ProductCount), 
		@name = Products.ProductName,
		@prodid = Products.Id
FROM	Orders
INNER JOIN Products ON ProductId = Products.Id
GROUP	BY Products.ProductName, Products.Id
HAVING	Products.Id = @id
�
PRINT '����� ' + @name + ' ������ �� ����� ' + STR(@sum)