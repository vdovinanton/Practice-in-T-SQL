
/* FOR MORE EXAMPLES */
/* https://metanit.com/sql/sqlserver/4.3.php */

USE productsdb

/* SIMPLE SORT */
SELECT *
FROM Products
ORDER BY ProductCount 

/* SORT BY CREATED COLUMN */
SELECT ProductName, ProductCount * Price AS TotalSum
FROM Products 
ORDER BY TotalSum

/* SORT BY CREATED COLUMN WITH DESCEDING*/
SELECT ProductName, ProductCount * Price AS TotalSum
FROM Products 
ORDER BY TotalSum DESC

/* INTEGRATE SORT COLUMNS */
SELECT ProductName, Price, Manufacturer
FROM Products
ORDER BY Manufacturer, ProductName
--ORDER BY Manufacturer ASC, ProductName DESC

/* SORT BY THE COLUMNS RESULT */
SELECT ProductName, Price, ProductCount, ProductCount
FROM Products
ORDER BY ProductCount * Price DESC