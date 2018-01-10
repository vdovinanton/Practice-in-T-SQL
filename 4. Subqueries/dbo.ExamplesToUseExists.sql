
/* EXAMPLES WITH EXISTS */
/* https://metanit.com/sql/sqlserver/6.3.php */

SELECT *
FROM Customers
WHERE EXISTS (SELECT Id FROM Orders 
				WHERE Orders.CustomerId = Customers.Id)

SELECT *
FROM Customers
WHERE NOT EXISTS (SELECT Id FROM Orders 
				WHERE Orders.CustomerId = Customers.Id)

/* PRODUCTS WHERE WAS'NT ORDERS */
SELECT *
FROM Products
WHERE NOT EXISTS (SELECT Id FROM Orders 
					WHERE Orders.ProductId = Products.Id)
