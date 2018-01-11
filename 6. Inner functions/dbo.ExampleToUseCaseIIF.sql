
/* CASE IIF */
/* https://metanit.com/sql/sqlserver/8.5.php */

USE productsdb

/* CASE */
SELECT	ProductName,
		Manufacturer,
	CASE ProductCount
��������WHEN 1 THEN '����� �������������'
��������WHEN 2 THEN '���� ������'
��������WHEN 3 THEN '���� � �������'
��������ELSE '����� ������'
����END AS EvaluateCount
FROM Products

/* WITH ELSE LIKE A DEFAULT IN C# */
SELECT ProductName, Manufacturer,
����CASE
��������WHEN Price > 50000 THEN '��������� A'
��������WHEN Price BETWEEN 40000 AND 50000 THEN '��������� B'
��������WHEN Price BETWEEN 30000 AND 40000 THEN '��������� C'
��������ELSE '��������� D'
����END AS Category
FROM Products

/* IIF */
SELECT ProductName, Manufacturer,
����IIF(ProductCount > 3, '����� ������', '���� ������')
FROM Products

