
/* CASE IIF */
/* https://metanit.com/sql/sqlserver/8.5.php */

USE productsdb

/* CASE */
SELECT	ProductName,
		Manufacturer,
	CASE ProductCount
        WHEN 1 THEN 'Товар заканчивается'
        WHEN 2 THEN 'Мало товара'
        WHEN 3 THEN 'Есть в наличии'
        ELSE 'Много товара'
    END AS EvaluateCount
FROM Products

/* WITH ELSE LIKE A DEFAULT IN C# */
SELECT ProductName, Manufacturer,
    CASE
        WHEN Price > 50000 THEN 'Категория A'
        WHEN Price BETWEEN 40000 AND 50000 THEN 'Категория B'
        WHEN Price BETWEEN 30000 AND 40000 THEN 'Категория C'
        ELSE 'Категория D'
    END AS Category
FROM Products

/* IIF */
SELECT ProductName, Manufacturer,
    IIF(ProductCount > 3, 'Много товара', 'Мало товара')
FROM Products

