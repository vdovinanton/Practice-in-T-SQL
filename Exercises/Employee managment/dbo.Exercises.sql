
--1. Select the last name of all employees.
SELECT LastName FROM Employees;

--2. Select the last name of all employees, without duplicates.
--SELECT DISTINCT LastName FROM Employees;

--3. Select all the data of employees whose last name is "Smith".
SELECT * FROM Employees WHERE CONVERT(varchar(10), LastName) = 'Smith'

--4. Select all the data of employees whose last name is "Smith" or "Doe".
SELECT * FROM Employees 
WHERE CONVERT(varchar(10), LastName) = 'Smith' 
    OR CONVERT(varchar(10), LastName) = 'Doe'

SELECT * FROM Employees 
    WHERE CONVERT(varchar(10), LastName) IN ('Smith','Doe')

--5. Select all the data of employees that work in department 14.
SELECT * FROM Employees 
    WHERE Department = 14

--6. Select all the data of employees that work in department 37 or department 77.
SELECT * FROM Employees 
    WHERE Department in (14, 77)

--7. Select all the data of employees whose last name begins with an "S".
SELECT * FROM Employees
    WHERE RIGHT(CONVERT(varchar(10), LastName), 1) = 'S'

--8. Select the sum of all the departments' budgets.
SELECT SUM(Budget) FROM Departments

--9. Select the number of employees in each department 
--   (you only need to show the department code and the number of employees).
SELECT Department, COUNT(*) as EmployeesCount
    FROM Employees
    GROUP BY Department

--10. Select all the data of employees, including each employee's department's data.
SELECT *
FROM Employees
JOIN Departments ON Departments.Code = Department

--11. Select the name and last name of each employee, 
--    along with the name and budget of the employee's department.
SELECT Employees.Name as EmployeeName, 
       LastName,
       Departments.Name as DepartmentsName,
       Departments.Code
FROM Employees
JOIN Departments ON Departments.Code = Employees.Department

--12. Select the name and last name of employees working for 
--    departments with a budget greater than $60,000.
SELECT Employees.Name, LastName
    FROM Employees
    JOIN Departments ON Departments.Code = Employees.Department
    WHERE Departments.Budget > 60000

--13. Select the departments with a budget larger than the average 
--    budget of all the departments.
SELECT * 
    FROM Departments
    WHERE Budget > (SELECT AVG(Budget) FROM Departments)

--14*. Select the names of departments with more than two employees.
SELECT Departments.Name
    FROM Employees
    JOIN Departments ON Departments.Code = Employees.Department
    GROUP BY Departments.Name
    HAVING COUNT(*) > 2

--15**. Select the name and last name of employees working for 
--    departments with second lowest budget.
Select Name, LastName
FROM Employees
WHERE Department =
    (
        SELECT Code 
        FROM Departments
        WHERE Budget = (
            SELECT TOP 1 Budget
            FROM Departments
            WHERE Budget IN
            (
                SELECT DISTINCT TOP 2 Budget
                FROM Departments
                ORDER BY Budget ASC
            )
            ORDER BY Budget DESC
        )
    )


--16. Add a new department called 
--    "Quality Assurance", with a budget of $40,000 and departmental code 11. 
--    Add an employee called "Mary Moore" in that department, with SSN 847-21-9811.
INSERT INTO Departments
( 
 Code, Name, Budget
)
VALUES
( 
 11, 'Quality Assurance', 40000
)
GO

INSERT INTO Employees
( 
 SSN, Name, LastName, Department
)
VALUES
( 
 '847219811', 'Mary', 'Moore', 11
)
GO

--17. Reduce the budget of all departments by 10%.
UPDATE Departments
SET Budget = Budget - (Budget * 0.10)

--18. Reassign all employees from the Research department (code 77) to the IT department (code 14).
UPDATE Employees
    SET Department = 14
    WHERE Department = 77

--19. Delete from the table all employees in the IT department (code 14).
DELETE Employees
    WHERE Department = 14

--20. Delete from the table all employees who work in departments with a budget greater than or equal to $60,000.
DELETE Employees
    WHERE Department = 
        (
            SELECT Code
            FROM Departments
            WHERE Budget >= 60000
        )


