
/* TEMPORARY AND DERIVATIVE */
/* https://metanit.com/sql/sqlserver/10.4.php */


USE productsdb

/* TEMPORARY */
CREATE TABLE #ProductSummary (ProdId INT IDENTITY, ProdName NVARCHAR(20), Price MONEY)
 
INSERT INTO #ProductSummary
VALUES	('Nokia 8', 18000),
		('iPhone 8', 56000)
 
SELECT * FROM #ProductSummary

/*  */
SELECT	ProductId, 
        SUM(ProductCount) AS TotalCount, 
        SUM(ProductCount * Price) AS TotalSum
INTO	#OrdersSummary
FROM	Orders
GROUP	BY ProductId
 
SELECT	Products.ProductName, 
		#OrdersSummary.TotalCount,
		#OrdersSummary.TotalSum
FROM	Products
JOIN	#OrdersSummary ON Products.Id = #OrdersSummary.ProductId

/* GLOABAL */
--CREATE TABLE ##OrderDetails
--(ProductId INT, TotalCount INT, TotalSum MONEY)
 
--INSERT INTO ##OrderDetails
--SELECT ProductId, SUM(ProductCount), SUM(ProductCount * Price)
--FROM Orders
--GROUP BY ProductId
 
--SELECT * FROM ##OrderDetails

/* DERIVATIVE */
WITH OrdersInfo AS
(
    SELECT ProductId, 
        SUM(ProductCount) AS TotalCount, 
        SUM(ProductCount * Price) AS TotalSum
    FROM Orders
    GROUP BY ProductId
)
 
SELECT * FROM OrdersInfo -- çäåñü íîðìàëüíî
--SELECT * FROM OrdersInfo -- çäåñü îøèáêà
--SELECT * FROM OrdersInfo -- çäåñü îøèáêà
