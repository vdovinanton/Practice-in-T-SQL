
/* CREATE AND EXECUTE SP */
/* https://metanit.com/sql/sqlserver/11.1.php */

USE productsdb;
GO
CREATE PROCEDURE ProductSummary AS
BEGIN
    SELECT ProductName AS Product, Manufacturer, Price
    FROM Products
END;

EXEC ProductSummary
DROP PROCEDURE ProductSummary