
/* EXAMPLES WITH CRUD OPERATIONS */
/* https://metanit.com/sql/sqlserver/12.2.php */

/* CREATE TRIGGER WHITCH THE WILL EXECUTE AFTER INSERT */
USE productsdb2
GO
CREATE TRIGGER Products_INSERT
ON Products
AFTER INSERT
AS
INSERT INTO History (ProductId, Operation)
SELECT Id, 'Добавлен товар ' + ProductName + '   фирма ' + Manufacturer
FROM INSERTED

/* USE TRIGGER */
USE productsdb2;
INSERT INTO Products (ProductName, Manufacturer, ProductCount, Price)
VALUES('Lumia 1020', 'Microsoft', 3, 70900)

SELECT * FROM History

/* REMOVE EVENT */
USE productsdb2
GO
CREATE TRIGGER Products_DELETE
ON Products
AFTER DELETE
AS
INSERT INTO History (ProductId, Operation)
SELECT Id, 'Удален товар ' + ProductName + '   фирма ' + Manufacturer
FROM DELETED

/* USE REMOVE TRIGGER */
USE productsdb2;
DELETE FROM Products
WHERE Id = 3
 
SELECT * FROM Products

/* CREATE UPDATE TRIGGER */
USE productsdb2
GO
CREATE TRIGGER Products_UPDATE
ON Products
AFTER UPDATE
AS
INSERT INTO History (ProductId, Operation)
SELECT Id, 'Обновлен товар ' + ProductName + '   фирма ' + Manufacturer
FROM INSERTED

/* USE UPDATE TRIGGER */
USE productsdb2
INSERT INTO Products 
VALUES ('C350', 'Motorola', 10, 2100)

UPDATE Products SET Manufacturer = 'Moto'
WHERE Manufacturer = 'Motorola'

SELECT * FROM History
