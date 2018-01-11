
/* DETERMINATE TRIGGERS */
/* https://metanit.com/sql/sqlserver/12.1.php */

/* CREATE TRIGGER*/
USE productsdb;
GO
CREATE TRIGGER Products_INSERT_UPDATE
ON Products
AFTER INSERT, UPDATE
AS
UPDATE Products
SET Price = Price + Price * 0.38
WHERE Id = (SELECT Id FROM inserted)

select * from Products

insert into Products values ('iPhone 4 3g', 'Apple', 2, 8000)

/* REMOVE TRIGGER */
DROP TRIGGER Products_INSERT_UPDATE

/* DISABLE OR ENABLE TRIGGER*/
USE productsdb;
GO
DISABLE TRIGGER Products_INSERT_UPDATE ON Products
ENABLE TRIGGER Products_INSERT_UPDATE ON Products