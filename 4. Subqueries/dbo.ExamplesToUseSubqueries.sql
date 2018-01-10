
/* SUB QUERIES */
/* https://metanit.com/sql/sqlserver/6.1.php */

USE productsdb

SELECT *
FROM Products
WHERE Price = (SELECT MIN(Price) FROM Products)

/* SUB QUERY WITH MORE THEN TOTAL AVARAGE PRICE*/
SELECT * 
FROM Products
WHERE Price < (SELECT AVG(Price) FROM Products)

/* SUB QUERY WITH LESS THEN TOTAL AVARAGE PRICE*/
SELECT * 
FROM Products
WHERE Price > (SELECT AVG(Price) FROM Products)


/* CORRELATIVE QUERY */
SELECT	CreatedAt,
		Price,
		(SELECT ProductName FROM Products
				WHERE Products.Id = Orders.ProductId) AS Product
FROM	Orders