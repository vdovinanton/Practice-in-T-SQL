/* SAME EXAMPLES WITH ADD AND DROP CONTRAINTS FK, PK, CK */
/* https://metanit.com/sql/sqlserver/3.6.php */

--USE usersdb
--CREATE TABLE Customers
--(
--    Id INT PRIMARY KEY IDENTITY,
--    Age INT DEFAULT 18, 
--    FirstName NVARCHAR(20) NOT NULL,
--    LastName NVARCHAR(20) NOT NULL,
--    Email VARCHAR(30) UNIQUE,
--    Phone VARCHAR(20) UNIQUE
--);
--CREATE TABLE Orders
--(
--    Id INT IDENTITY,
--    CustomerId INT,
--    CreatedAt Date
--);

ALTER TABLE Orders
ADD CONSTRAINT Pk_Orders_Id PRIMARY KEY (Id),
    CONSTRAINT FK_Orders_To_Customers FOREIGN KEY (CustomerId) REFERENCES Customers (Id);

ALTER TABLE Customers 
ADD CONSTRAINT CK_Age_Greate_Then_Zaeo CHECK (Age > 0);

--ALTER TABLE Orders
--DROP FK_Orders_To_Customers