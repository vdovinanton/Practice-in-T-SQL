
/* NUMERIC FUNCTIONS */
/* https://metanit.com/sql/sqlserver/8.2.php */

USE productsdb

SELECT ProductName, ROUND(Price * ProductCount, 2)
FROM Products
