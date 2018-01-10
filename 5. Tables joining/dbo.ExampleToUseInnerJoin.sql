
/* INNER JOIN */
/* https://metanit.com/sql/sqlserver/7.3.php */

USE productsdb

SELECT	O.CreatedAt,
		O.ProductCount,
		P.ProductName
FROM	Orders		AS O
JOIN	Products	AS P
ON		P.Id = O.ProductId

/* COMBAINE JOINS */
SELECT	O.CreatedAt,
		C.FirstName,
		P.ProductName
FROM	Orders		AS O
JOIN	Products	AS P
	ON		P.Id = O.ProductId
JOIN	Customers	AS C
	ON		C.Id = O.CustomerId

/* COMBAINE JOINS WITH FILTERING 'WHERE'*/
SELECT	O.CreatedAt,
		C.FirstName,
		P.ProductName
FROM	Orders		AS O
JOIN	Products	AS P
	ON		P.Id = O.ProductId --AND P.Manufacturer = 'Apple' -- AVALIBLE TOO
JOIN	Customers	AS C
	ON		C.Id = O.CustomerId
WHERE	P.Price < 45000
ORDER	BY	C.FirstName


