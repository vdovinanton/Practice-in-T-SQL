
/* TABLE VIEWS */
/* https://metanit.com/sql/sqlserver/10.1.php */

USE productsdb


CREATE VIEW OrdersProductsCustomers AS
SELECT	Orders.CreatedAt AS OrderDate, 
		Customers.FirstName AS Customer,
        Products.ProductName As Product  
FROM Orders 
INNER JOIN Products ON Orders.ProductId = Products.Id
INNER JOIN Customers ON Orders.CustomerId = Customers.Id

CREATE VIEW OrdersProductsCustomers2 (OrderDate, Customer,Product)
AS SELECT Orders.CreatedAt,
        Customers.FirstName,
        Products.ProductName
FROM Orders INNER JOIN Products ON Orders.ProductId = Products.Id
INNER JOIN Customers ON Orders.CustomerId = Customers.Id

/* CHANGE VIEW */
ALTER VIEW OrdersProductsCustomers
AS SELECT Orders.CreatedAt AS OrderDate, 
        Customers.FirstName AS Customer,
        Products.ProductName AS Product,
        Products.Manufacturer AS Manufacturer
FROM Orders INNER JOIN Products ON Orders.ProductId = Products.Id
INNER JOIN Customers ON Orders.CustomerId = Customers.Id

SELECT * FROM OrdersProductsCustomers2
DROP VIEW OrdersProductsCustomer
