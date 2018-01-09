
/* https://metanit.com/sql/sqlserver/4.8.php */

USE productsdb

/* SIMPLE EXAMPLE */
DELETE Products
WHERE Id=9

/* WITH FILTERING */
DELETE Products
WHERE Manufacturer='Xiaomi' AND Price < 15000

/* WITH HARDIER FILTERING */
DELETE Products FROM
(SELECT TOP 2 * FROM Products WHERE Manufacturer='Apple]') AS Selected
WHERE Products.Id = Selected.Id