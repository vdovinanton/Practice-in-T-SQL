
/* https://metanit.com/sql/sqlserver/4.6.php */

USE productsdb

/* IN */
SELECT * FROM Products
WHERE Manufacturer IN ('Samsung', 'Xiaomi', 'Huawei')

SELECT * FROM Products
WHERE Manufacturer NOT IN ('Samsung', 'Xiaomi', 'Huawei')

/* BETWEEN */
SELECT * FROM Products
WHERE Price BETWEEN 20000 AND 40000

SELECT * FROM Products
WHERE Price NOT BETWEEN 20000 AND 40000

/* LIKE */
SELECT * FROM Products
WHERE ProductName LIKE 'iPhone [6-8]%'
