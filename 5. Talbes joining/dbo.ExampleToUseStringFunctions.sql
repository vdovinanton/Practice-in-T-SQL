
/* INNER FUNCTIONS */
/* https://metanit.com/sql/sqlserver/8.1.php */

USE productsdb

SELECT UPPER(LEFT(Manufacturer,2))					AS Abbreviation,
       CONCAT(ProductName, ' - ',  Manufacturer)	AS FullProdName
FROM Products
ORDER BY Abbreviation