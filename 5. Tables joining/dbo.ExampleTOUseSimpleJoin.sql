
/* SIMPLE JOIN */
/* https://metanit.com/sql/sqlserver/7.2.php */

USE productsdb

SELECT *
FROM Orders, Customers
WHERE Orders.CustomerId = Customers.Id

/* GET ALL ORDERS WITH CUSTOMER AND PRODUCT INFO */
SELECT	Customers.FirstName,
		Products.ProductName,
		Orders.CreatedAt
FROM	Orders, Customers, Products
WHERE	Orders.CustomerId = Customers.Id AND Products.Id = Orders.ProductId

/* SUCH AS BEFORE */
SELECT	C.FirstName,
		P.ProductName,
		O.CreatedAt -- O.* -- AVALIBLE TOO FOR ALL COLUMNS
FROM	Orders		AS O, 
		Customers	AS C, 
		Products	AS P
WHERE	O.CustomerId = C.Id AND P.Id = O.ProductId