
/* IF ELSE */
/* https://metanit.com/sql/sqlserver/9.3.php */

DECLARE @lastDate DATE
 
SELECT @lastDate = MAX(CreatedAt) FROM Orders
 
IF DATEDIFF(day, @lastDate, GETDATE()) > 10
    PRINT 'За последние десять дней не было заказов'
ELSE 
	PRINT 'За последние десять дней были заказы'

/* WITH BIGGIER CONSTRUCTIONS */
DECLARE @lastDate DATE,
		@count INT,
		@sum MONEY
 
SELECT	@lastDate = MAX(CreatedAt), 
        @count = SUM(ProductCount) ,
        @sum = SUM(ProductCount * Price)
FROM	Orders
 
IF @count > 0
    BEGIN
        PRINT 'Дата последнего заказа: ' + CONVERT(NVARCHAR, @lastDate) 
        PRINT 'Продано ' + CONVERT(NVARCHAR, @count) + ' единиц(ы)'
        PRINT 'На общую сумму ' + CONVERT(NVARCHAR, @sum)
    END;
ELSE
    PRINT 'Заказы в базе данных отсутствуют'