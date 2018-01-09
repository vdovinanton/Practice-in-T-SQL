
/* https://metanit.com/sql/sqlserver/4.4.php */

USE productsdb

SELECT TOP 4 ProductName
FROM Products

/* GETS COUNT OF % */
SELECT TOP 75 PERCENT ProductName
FROM Products

/* GETS ALL AFTER TWO ROWS */
SELECT * FROM Products
ORDER BY Id 
    OFFSET 2 ROWS;

/* GETS THREE AFTER TWO ROWS */
SELECT * FROM Products
ORDER BY Id 
    OFFSET 2 ROWS
    FETCH NEXT 3 ROWS ONLY;

