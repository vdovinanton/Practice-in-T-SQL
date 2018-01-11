
/* NEWID, ISNULL, COALESCE */
/* https://metanit.com/sql/sqlserver/8.6.php */

USE productsdb

/* DATA SET */
CREATE TABLE Clients
(
    Id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(),
    FirstName NVARCHAR(20) NOT NULL,
    LastName NVARCHAR(20) NOT NULL,
    Phone NVARCHAR(20) NULL,
    Email NVARCHAR(20) NULL
)
 
INSERT INTO Clients (FirstName, LastName, Phone, Email)
VALUES	('Tom', 'Smith', '+36436734', NULL),
		('Bob', 'Simpson', NULL, NULL)


/* ISNULL */
SELECT FirstName, LastName,
        ISNULL(Phone, 'νε ξοπεδελενξ') AS Phone,
        ISNULL(Email, 'νεθηβερςνξ') AS Email
FROM Clients

/* COALESCE: GETS LIST OF COLUMNS AND RETURNE FIRST THAT IS NOT NULL */
SELECT FirstName, LastName,
        COALESCE(Phone, Email, 'νε ξοπεδελενξ') AS Contacts
FROM Clients


