
/* DATE TIME */
/* https://metanit.com/sql/sqlserver/8.3.php */


/* GET ORDERS WITH 16 DAYS OLD */
SELECT * FROM Orders
WHERE DATEDIFF(day, CreatedAt, GETDATE()) = 16