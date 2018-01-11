
/* VARRIBLES IN T-SQL */
/* https://metanit.com/sql/sqlserver/9.1.php */

DECLARE @name NVARCHAR(20), @age INT;
SET @name='Tom';
SET @age = 18;

--PRINT 'Name: ' + @name;
--PRINT 'Age: ' + CONVERT(CHAR, @age);

SELECT @name, @age;