/* https://metanit.com/sql/sqlserver/5.2.php */

USE productsdb


/* GROUP BY */
SELECT Manufacturer, COUNT(*) AS ModelsCount
FROM Products
GROUP BY Manufacturer

SELECT Manufacturer, ProductCount, COUNT(*) AS ModelsCount
FROM Products
GROUP BY Manufacturer, ProductCount

/* ! GROUP BY MUST BE AFTER WHERE EXPRESSION AND BEFORE ORDER BY EXPRESSION ! */
SELECT Manufacturer, COUNT(*) AS ModelsCount
FROM Products
WHERE Price > 30000
GROUP BY Manufacturer
ORDER BY ModelsCount DESC


/* HAVING */
/* ITS LIKE A 'WHERE' BUT 'WHERE' FOR THE STRING EXPRESSION AND 'HAVING' EXPRESSION FOR THE GROUP EXPRESSION */
SELECT Manufacturer, COUNT(*) AS ModelsCount
FROM Products
GROUP BY Manufacturer
HAVING COUNT(*) > 1

/* COMBINATE WHERE AND HAVING */
SELECT Manufacturer, COUNT(*) AS ModelsCount
FROM Products
WHERE Price * ProductCount > 80000
GROUP BY Manufacturer
HAVING COUNT(*) > 1

/* WHAAAAAAT ? */
SELECT Manufacturer, COUNT(*) AS Models, SUM(ProductCount) AS Units
FROM Products
WHERE Price * ProductCount > 80000
GROUP BY Manufacturer
HAVING SUM(ProductCount) > 2
ORDER BY Units DESC