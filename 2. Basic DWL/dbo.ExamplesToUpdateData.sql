
USE productsdb

/* ADD 5000 TO ALL PRODUCTS PRICE */
UPDATE Products
SET Price = Price + 5000

/* BY WHERE */
UPDATE Products
SET Manufacturer = 'Samsung Inc.'
WHERE Manufacturer = 'Samsung'


UPDATE Products
SET Manufacturer = 'Apple Inc.'
FROM
(SELECT TOP 2 * FROM Products WHERE Manufacturer='Apple') AS Selected
WHERE Products.Id = Selected.Id