
USE WorldEvents

--1. Create a query to list out the following columns from the tblEvent table, with the most recent first (for which you'll need to use an ORDER BY clause):
-- https://www.wiseowl.co.uk/training/exercises/ex-4100.htm
SELECT te.EventName, te.EventDate 
	FROM	dbo.tblEvent te
	ORDER BY te.EventDate DESC
;

--2. Create a query to list out for each event the category number that it belongs to:
--Создайте запрос для перечисления для каждого события номера категории, к которому он принадлежит:
-- https://www.wiseowl.co.uk/training/exercises/ex-4110.htm
SELECT (te.EventName + ' (category ' + CONVERT(varchar(1), te.CategoryID)  +')') as 'Event (category5)',
	te.EventDate
	FROM dbo.tblEvent te
	WHERE te.CountryID = 1	
;

--3. Create a query to list out the id number and name of the last 3 categories from the tblCategory table in alphabetical order:
-- https://www.wiseowl.co.uk/training/exercises/ex-4101.htm
SELECT TOP 3	tc.CategoryID, tc.CategoryName 
	FROM dbo.tblCategory tc
	ORDER BY tc.CategoryName DESC
;

--4. Write a query to divide countries into these groups:
-- https://www.wiseowl.co.uk/training/exercises/ex-4111.htm
-- http://www.dotnettricks.com/learn/sqlserver/understanding-case-expression-in-sql-server-with-example
SELECT	tc.CountryName, 
		CountryLoaction =
			(
				CASE 
					WHEN tc.ContinentID BETWEEN 1 AND 3 THEN 'Eurasia'
					WHEN tc.ContinentID BETWEEN 5 AND 6 THEN 'Americans'
					WHEN tc.ContinentID BETWEEN 2 AND 4 THEN 'Somewhere hot'
					WHEN tc.ContinentID = 7 THEN 'Somewhere cold'
					ELSE 'Somewhere else'
				END
			),
			'Actual continent' =
			(
				CASE 
					WHEN tc.ContinentID BETWEEN 1 AND 3 THEN 'Europa or Asia'
					WHEN tc.ContinentID BETWEEN 5 AND 6 THEN 'North and South America'
					WHEN tc.ContinentID BETWEEN 2 AND 4 THEN 'Africa and Australia'
					WHEN tc.ContinentID = 7 THEN 'Antarctica'
					ELSE 'International'
				END
			)
	FROM dbo.tblCountry tc
	ORDER BY CountryLoaction DESC
;

--5. Write a query to show the first 5 events (in date order) from the tblEvent table:
-- https://www.wiseowl.co.uk/training/exercises/ex-4102.htm
SELECT TOP 5 te.EventName AS Waht, te.EventDetails as Details 
	FROM dbo.tblEvent te
	ORDER BY te.EventDate
;

--6. The tblContinent table lists out the world's continents, but there are gaps:
-- https://www.wiseowl.co.uk/training/exercises/ex-4112.htm
-- https://www.w3schools.com/sql/sql_isnull.asp
SELECT	tc.*,
		ISNULL(tc.Summary, 'No summory') AS 'Using ISNULL',
		COALESCE(tc.Summary, 'No summory') AS 'Using COALESCE',
		'Using CASE' = 
		(
			CASE 
				WHEN tc.Summary IS NULL THEN	'No summory'
				ELSE tc.Summary
			END
		) 
	FROM dbo.tblContinent tc
;

--7. Create a query which uses two separate SELECT statements to show the first and last 2 events in date order from the tblEvent table:
-- https://www.wiseowl.co.uk/training/exercises/ex-4103.htm
SELECT TOP	2	
		te.EventName AS What,
		te.EventDate AS 'When'
	FROM dbo.tblEvent te
	ORDER BY te.EventDate

SELECT TOP	2	
		te.EventName AS What,
		te.EventDate AS 'When'
	FROM dbo.tblEvent te
	ORDER BY te.EventDate DESC
;

--8. The aim of this exercise is to find this and that in the EventDetails column (in that order).  Your final query should show this:
-- https://www.wiseowl.co.uk/training/exercises/ex-4113.htm
-- https://www.w3schools.com/sql/func_sqlserver_charindex.asp
PRINT CHARINDEX( 'Trump', 'Donald Trump', 1) -- for practise in use CHARINDEX
SELECT	te.EventName,
		te.EventDate,
		CHARINDEX('this', te.EventName) AS thisPosition,
		CHARINDEX('that', te.EventName) AS thatPosition
		--CHARINDEX() AS Offset
	FROM dbo.tblEvent te
	ORDER BY thatPosition DESC	
;

--9. In the tblCategory table, category number 11 is Love and Relationships:
SELECT	te.EventName, te.EventDate 
	FROM dbo.tblCategory tc
	JOIN dbo.tblEvent te ON tc.CategoryID = te.CategoryID AND tc.CategoryID = 11
;

--10. 
-- https://www.wiseowl.co.uk/training/exercises/ex-4114.htm

--11. Create a query which lists out all of the tblEvent events which include the word Teletubbies:
-- https://www.wiseowl.co.uk/training/exercises/ex-4105.htm
SELECT	te.EventName,
		te.EventDate
	FROM dbo.tblEvent te
	WHERE te.EventName LIKE	'%Teletubbies%' OR te.EventName LIKE '%Pandy%'

--12. write a query to list out all of the non-boring events:
-- https://www.wiseowl.co.uk/training/exercises/ex-4115.htm
-- for example 2016-05-27 at now
DECLARE	@DateTimeNow datetime = '2016-05-27'
PRINT @DateTimeNow
SELECT	te.EventName, te.EventDate FROM dbo.tblEvent te
	WHERE te.EventDate >= @DateTimeNow
	ORDER BY te.EventDate DESC

--13. Create a query which lists out all of the events which took place in February 2005:
-- https://www.wiseowl.co.uk/training/exercises/ex-4106.htm
SELECT	te.EventName AS What, 
		te.EventDate AS 'When' 
	FROM dbo.tblEvent te
	WHERE MONTH(te.EventDate) = 2 AND YEAR(te.EventDate) = 2005
;

--14. First create a query showing events which took place in your year of birth, neatly formatted.
--запрос, показывающий события, которые произошли в вашем году рождения, аккуратно отформатированные.
-- https://www.wiseowl.co.uk/training/exercises/ex-4116.htm
DECLARE @DateTimeBirth datetime = '1978'
PRINT @DateTimeBirth

SELECT	te.EventName,
		te.EventDate
	FROM dbo.tblEvent te
	WHERE YEAR(te.EventDate) = YEAR(@DateTimeBirth)

--15. Query to show:
--		1. Events which aren't in the Transport category (number 14), but which nevertheless include the word Train in the EventDetails column.	
--		2. Events which are in the Space country (number 13), but which don't mention Space in either the event name or the event details columns.	
--																но которые не упоминают Пробел ни в имени события, ни в столбцах сведений о событии.
--		3. Events which are in categories 5 or 6 (War/conflict and Death/disaster), but which don't mention either War or Death in the EventDetails column.	
--																					но которые не упоминают ни войны, ни смерти в столбце EventDetails.
-- https://www.wiseowl.co.uk/training/exercises/ex-4107.htm
-- 1
SELECT	te.* 
	FROM dbo.tblEvent te	
	WHERE te.EventDetails LIKE	'%train' AND te.CategoryID != 14 
;
-- 2
SELECT te.* 
	FROM dbo.tblEvent te
	WHERE te.CountryID = 13 AND te.EventDetails NOT LIKE '%space%'
;
--3
SELECT	te.* 
	FROM dbo.tblEvent te
	WHERE (te.CategoryID != 5 OR te.CategoryID != 6) 
		AND (te.EventDetails NOT LIKE '%war%' OR te.EventDetails NOT LIKE '%death%')
;

--16. What happening in the world around the time when you were born (but you can use any reference date)
-- https://www.wiseowl.co.uk/training/exercises/ex-4117.htm
DECLARE	@MyBirthDayDate datetime = '1992-08-30'
SELECT te.* 
	FROM dbo.tblEvent te
	WHERE te.EventDate BETWEEN @MyBirthDayDate AND GETDATE()
;

--17.  The Wise Owl interpretation of this is that one or more of the following is true:
-- https://www.wiseowl.co.uk/training/exercises/ex-4108.htm
/*
  -	They take place in one of the island countries (8, 22, 30 and 35, corresponding to Japan, the Marshall Islands, Cuba and Sri Lanka respectively)
  -	Their EventDetails column contains the word Water (not the text Water, but the word)
  -	Their category is number 4 (Natural World)
*/
SELECT	te.EventName,
		te.EventDetails,
		te.EventDate 
	FROM dbo.tblEvent te
	WHERE (te.CategoryID = 4
		OR te.CategoryID IN (8, 22, 30, 35)
		OR te.EventDetails LIKE '%water%')
		AND	YEAR(te.EventDate) > 1970
	ORDER BY te.EventDate
;

--18. Create a query to show the day of the week and also the day number on which each event occurred:
/*
	-	That mercifully there weren't any events on Friday the 13th;
	-	That there was one event on Thursday 12th (the day before); and
	-	That there were two events on Saturday the 14th (the day after).
*/
-- https://www.wiseowl.co.uk/training/exercises/ex-4118.htm
SELECT	te.EventName,
			te.EventDate,
			DATENAME(dw, te.EventDate) AS 'DayOfWeek',
			DAY(te.EventDate) AS 'Day number'
		FROM dbo.tblEvent te
	;
-- 1
SELECT	te.EventName,
			te.EventDate,
			DATENAME(dw, te.EventDate) AS 'DayOfWeek',
			DAY(te.EventDate) AS 'Day number'
		FROM dbo.tblEvent te
	WHERE DATEPART(dw, te.EventDate) = 5 AND DAY(te.EventDate) = 12
-- 2
SELECT	te.EventName,
			te.EventDate,
			DATENAME(dw, te.EventDate) AS 'DayOfWeek',
			DAY(te.EventDate) AS 'Day number'
		FROM dbo.tblEvent te
	WHERE DATEPART(dw, te.EventDate) = 6 AND DAY(te.EventDate) = 13
-- 3
SELECT	te.EventName,
			te.EventDate,
			DATENAME(dw, te.EventDate) AS 'DayOfWeek',
			DAY(te.EventDate) AS 'Day number'
		FROM dbo.tblEvent te
	WHERE DATEPART(dw, te.EventDate) = 7 AND DAY(te.EventDate) = 14

--19. Use this nugget of information to create a query listing out each event with the length of its name, with the "shortest event" first:
-- https://www.wiseowl.co.uk/training/exercises/ex-4109.htm
SELECT te.EventName, LEN(te.EventName) AS 'Length of name' 
	FROM dbo.tblEvent te
	ORDER BY LEN(te.EventName)
;

--20 Create a query to show the day of the week and also the day number on which each event occurred:
-- https://www.wiseowl.co.uk/training/exercises/ex-4119.htm
GO
SELECT	te.EventName,
		( DATENAME(dw, te.EventDate) + ' ' + CONVERT(nvarchar(10), DAY(te.EventDate)) 
		+ 
		(
			CASE DAY(te.EventDate)
				WHEN 1 THEN 'st'
				WHEN 2 THEN 'nd'
				WHEN 3 THEN 'sd'
				ELSE 'th'
			END
		) + ' '
		+ DATENAME(month, te.EventDate) + ' ' + CONVERT(nvarchar(10), YEAR(te.EventDate)) ) as 'Full date'
	FROM dbo.tblEvent te