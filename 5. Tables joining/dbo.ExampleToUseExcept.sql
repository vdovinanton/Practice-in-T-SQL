
/* EXPECT */
/* https://metanit.com/sql/sqlserver/7.6.php */

/* GETS CUSTOMERS WHO DOES'NT EMPLOYE */
SELECT FirstName, LastName
FROM Customers
EXCEPT SELECT FirstName, LastName 
FROM Employees

/* GETS EMPOYES WHO DOES'NT CUSTOMER */
SELECT FirstName, LastName
FROM Employees
EXCEPT SELECT FirstName, LastName 
FROM Customers