
/* DATE TYPE CONVERT */
/* https://metanit.com/sql/sqlserver/8.4.php */

CREATE TABLE Orders
(
    Id INT IDENTITY PRIMARY KEY,
    ProductId INT NOT NULL REFERENCES Products(Id) ON DELETE CASCADE,
    CustomerId INT NOT NULL REFERENCES Customers(Id) ON DELETE CASCADE,
    CreatedAt DATE NOT NULL,
    ProductCount INT DEFAULT 1,
    Price MONEY NOT NULL
);

INSERT INTO Orders
VALUES (1, 1, GETDATE(), 1, 1000)

/* CAST */
SELECT	Id,
		CAST(CreatedAt AS nvarchar) + '; total: ' + CAST(Price * ProductCount AS nvarchar) 
FROM Orders

/* CONVERT */
SELECT CONVERT(nvarchar, CreatedAt, 3), 
       CONVERT(nvarchar, Price * ProductCount, 1) 
FROM Orders

/* TRY_CONVERT */
SELECT CONVERT(int, 'sql')

SELECT TRY_CONVERT(int, 'sql')      -- NULL
SELECT TRY_CONVERT(int, '22')       -- 22

/* OTHER DATA COMVERT METHOODS */
SELECT STR(123.4567, 6,2)   -- 123.46
SELECT CHAR(219)            --  Û
SELECT ASCII('Û')           -- 219
SELECT NCHAR(1067)          -- Û
SELECT UNICODE('Û')     -- 1067