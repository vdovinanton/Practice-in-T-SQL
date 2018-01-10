

/* UNION */
/* https://metanit.com/sql/sqlserver/7.5.php */

/* THERE IS A TWO TABLES WITH SAME COLUMN SENSE, WE CAN ADD THEIR TO EACH OTHER */
SELECT FirstName, LastName 
FROM Customers
UNION SELECT FirstName, LastName FROM Employees


SELECT FirstName + ' ' +LastName AS FullName
FROM Customers
UNION SELECT FirstName + ' ' + LastName AS EmployeeName 
FROM Employees
ORDER BY FullName DESC

/* WILL BE ERROR BECAOUSE IN FIRST QUERY MORE COLUMNS THEN IN SECOND TABLE*/
SELECT FirstName, LastName, AccountSum
FROM Customers
UNION SELECT FirstName, LastName 
FROM Employees

/* WILL BE ERROR BEACOUSE DIFFERENCE DATA TYPE OF COLUMNS */
SELECT FirstName, LastName
FROM Customers
UNION SELECT Id, LastName 
FROM Employees
