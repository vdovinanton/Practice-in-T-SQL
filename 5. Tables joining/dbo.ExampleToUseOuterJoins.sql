
/* OUTER JOIN */
/* https://metanit.com/sql/sqlserver/7.3.php */

USE productsdb

SELECT	FirstName,
		CreatedAt,
		ProductCount,
		Price, 
		ProductId 
FROM	Orders
LEFT	JOIN	Customers 
				ON Orders.CustomerId = Customers.Id

-- INNER JOIN
SELECT FirstName, CreatedAt, ProductCount, Price 
FROM Customers JOIN Orders 
ON Orders.CustomerId = Customers.Id
 
-- LEFT JOIN
SELECT FirstName, CreatedAt, ProductCount, Price 
FROM Customers LEFT JOIN Orders 
ON Orders.CustomerId = Customers.Id

-- RIGHT JOIN
SELECT	FirstName,
		CreatedAt,
		ProductCount,
		Price,
		ProductId 
FROM	Orders
RIGHT	JOIN	Customers 
				ON Orders.CustomerId = Customers.Id

SELECT	Customers.FirstName, Orders.CreatedAt, 
		Products.ProductName, Products.Manufacturer
FROM	Orders
LEFT	JOIN Customers ON Customers.Id = Orders.CustomerId
LEFT	JOIN Products ON Products.Id = Orders.ProductId

SELECT	FirstName 
FROM	Customers
LEFT	JOIN Orders 
		ON Customers.Id = Orders.CustomerId
WHERE Orders.CustomerId IS NULL

SELECT Customers.FirstName, Orders.CreatedAt, 
       Products.ProductName, Products.Manufacturer
FROM Orders 
JOIN Products ON Orders.ProductId = Products.Id AND Products.Price < 45000
LEFT JOIN Customers ON Orders.CustomerId = Customers.Id
ORDER BY Orders.CreatedAt