
/* https://metanit.com/sql/sqlserver/5.3.php */

USE productsdb

/* ROLLUP */
/* ADD TO SUMMORY ROW */
SELECT Manufacturer, COUNT(*) AS Models, SUM(ProductCount) AS Units
FROM Products
GROUP BY Manufacturer WITH ROLLUP

/*  */
SELECT Manufacturer, COUNT(*) AS Models, SUM(ProductCount) AS Units
FROM Products
GROUP BY Manufacturer, ProductCount WITH ROLLUP

/* CUBE */
SELECT Manufacturer, COUNT(*) AS Models, SUM(ProductCount) AS Units
FROM Products
GROUP BY Manufacturer, ProductCount WITH CUBE

/* GROUPING SETS */
SELECT Manufacturer, COUNT(*) AS Models, ProductCount
FROM Products
GROUP BY GROUPING SETS(Manufacturer, ProductCount)

/* COMBINATE CUBE AND GROUPING SETS */
SELECT Manufacturer, COUNT(*) AS Models, ProductCount, SUM(ProductCount) AS Units
FROM Products
GROUP BY GROUPING SETS(ROLLUP(Manufacturer), ProductCount)

/* SAME */
SELECT Manufacturer, COUNT(*) AS Models, ProductCount, SUM(ProductCount) AS Units
FROM Products
GROUP BY GROUPING SETS((Manufacturer, ProductCount), ProductCount)

/* OVER */
SELECT ProductName, Manufacturer, ProductCount, COUNT(*) OVER (PARTITION BY Manufacturer) AS Models,
        SUM(ProductCount) OVER (PARTITION BY Manufacturer) AS Units
FROM Products