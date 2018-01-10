
/* COMBINATE GROUPING AND JOINS */
/* https://metanit.com/sql/sqlserver/7.4.php */

USE productsdb

/* FOR EACH USER PRINT AMOUNT OF ORDERS WHISH HIS MADE */
SELECT	FirstName, 
		COUNT(Orders.Id)
FROM	Customers 
LEFT JOIN	Orders 
			ON Orders.CustomerId = Customers.Id
GROUP	BY Customers.Id, Customers.FirstName;

/* PRINT PRODUCTS WITH SOMMURY PRICE OF ORDERS */
SELECT	Products.ProductName,
		Products.Manufacturer, 
        SUM(Orders.ProductCount * Orders.Price) AS Units
FROM Products 
LEFT	JOIN Orders
			ON Orders.ProductId = Products.Id
GROUP	BY Products.Id, Products.ProductName, Products.Manufacturer
