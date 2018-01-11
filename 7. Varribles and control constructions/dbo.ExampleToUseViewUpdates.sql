
/* VIEW UPDATES */
/* https://metanit.com/sql/sqlserver/10.2.php */

CREATE VIEW ProductView AS
SELECT  ProductName AS Product,
		Manufacturer,
		Price
FROM Products

/* ADD TO VIEW WILL ADD TO PRODUCTS TABLE */
INSERT INTO ProductView (Product, Manufacturer, Price)
VALUES('Nokia 8', 'HDC Global', 18000)

/* UPDATE */
UPDATE ProductView 
SET Price= 15000 WHERE Product='Nokia 8'

/* DELETE */
DELETE FROM ProductView 
WHERE Product='Nokia 8'

select * from ProductView
select * from Products
