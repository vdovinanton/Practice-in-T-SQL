
/* SUBQUERIES WITH GENERAL COMMANDS */
/* https://metanit.com/sql/sqlserver/6.2.php */

USE productsdb

SELECT * 
FROM Products
WHERE Price > (SELECT AVG(Price) FROM Products)

SELECT *
FROM Customers
WHERE Id NOT IN (SELECT CustomerId FROM Orders)


/* ALL, SOME, ANNY */
SELECT * FROM Products
WHERE Price < ALL(SELECT Price FROM Products WHERE Manufacturer = 'Apple')
/* LIKE THIS: */
--WHERE Price < (SELECT MIN(Price) FROM Products WHERE Manufacturer = 'Apple')

SELECT * FROM Products
WHERE Price < ANY(SELECT Price FROM Products WHERE Manufacturer='Apple')
/* AND LIKE THIS: */
--WHERE Price < (SELECT MAX(Price) FROM Products WHERE Manufacturer='Apple')


/* LIKE A SPECIFIC OF COLUMN */
SELECT *, 
(SELECT ProductName FROM Products WHERE Id = Orders.ProductId) AS Product 
FROM Orders

/* UPDATE, DELETE */
/* SET */
UPDATE Orders
SET ProductCount = ProductCount + 2
WHERE CustomerId=(SELECT Id FROM Customers WHERE FirstName='Tom')

/* UPDATE */
UPDATE Orders
SET Price = (SELECT Price FROM Products WHERE Id = Orders.ProductId) + 2000
WHERE Id = 1

/* REMOVE ALL ORDERS WHERE WAS MAKE BY BOB AND FOR THE GALAXY S8 */
DELETE 
FROM	Orders
WHERE	ProductId = (SELECT Id FROM Products WHERE ProductName = 'Galaxy S8')
AND		CustomerId =(SELECT Id FROM Customers WHERE FirstName = 'Bob')

