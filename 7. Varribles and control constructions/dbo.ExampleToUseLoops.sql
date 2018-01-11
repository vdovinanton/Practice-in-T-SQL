
/* LOOPS */
/* https://metanit.com/sql/sqlserver/9.4.php */

USE productsdb

DECLARE @number INT, 
		@factorial INT
SET @factorial = 1;
SET @number = 5;
 
WHILE @number > 0
    BEGIN
        SET @factorial = @factorial * @number
        SET @number = @number - 1
		PRINT 'Corrent: ' + STR(@factorial)
    END;

PRINT '' 
PRINT 'Total factorial: ' + STR(@factorial)

/* CALCULATE BALANCE WITH DEPENCE ON INSERT RATE */
CREATE TABLE #Accounts ( CreatedAt DATE, Balance MONEY)
 
DECLARE @rate FLOAT, @period INT, @sum MONEY, @date DATE
SET @date = GETDATE()
SET @rate = 0.065;
SET @period = 5;
SET @sum = 10000;
 
WHILE @period > 0
    BEGIN
        INSERT INTO #Accounts VALUES(@date, @sum)
        SET @period = @period - 1
        SET @date = DATEADD(year, 1, @date)
        SET @sum = @sum + @sum * @rate
    END;
 
SELECT * FROM #Accounts

/* BREAK CONTINUE */
DECLARE @number INT
SET @number = 1
 
WHILE @number < 10
    BEGIN
        PRINT CONVERT(NVARCHAR, @number)
        SET @number = @number + 1
        IF @number = 7
            BREAK;
        IF @number = 4
            CONTINUE;
        PRINT 'Êîíåö èòåðàöèè'
    END;


