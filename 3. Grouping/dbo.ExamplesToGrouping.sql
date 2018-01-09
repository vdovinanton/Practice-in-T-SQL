
/* https://metanit.com/sql/sqlserver/5.1.php */

USE productsdb

/* BY AVARAGE COUNT */
SELECT AVG(Price) AS Avarage_Price FROM Products

/* WITH FILTERING */
SELECT AVG(Price) FROM Products
WHERE Manufacturer='Apple'

/* FILTERING BY TOTAL SUM  AVARAGE*/
SELECT AVG(Price * ProductCount) FROM Products


/* TOTAL COUNT OF ROWS */
SELECT COUNT(*) FROM Products

/* BY TOTAL COUNT OF COLUMN. BY DEFAULT WHERE NOT NULL*/
SELECT COUNT(Manufacturer) FROM Products


/* MIM, MAX */
SELECT MIN(Price) FROM Products

SELECT MAX(Price) FROM Products

/* ALL, DISTINCT */
SELECT AVG(DISTINCT ProductCount) AS Average_Price FROM Products

/* BY DEFAULT USED 'ALL' */
SELECT AVG(ALL ProductCount) AS Average_Price FROM Products


/* COMBINATE SOME GROUPING METHODS */
SELECT COUNT(*) AS ProdCount,
       SUM(ProductCount) AS TotalCount,
       MIN(Price) AS MinPrice,
       MAX(Price) AS MaxPrice,
       AVG(Price) AS AvgPrice
FROM Products