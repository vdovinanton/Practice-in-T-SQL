
USE DoctorWho

-- 1. so that it shows who wrote the "special" episodes (there should be 13 listed out, of which the first few in alphabetical order are shown below):
-- https://www.wiseowl.co.uk/training/exercises/ex-4031.htm
SELECT ta.AuthorName, te.Title, te.EpisodeType FROM dbo.tblEpisode te
	JOIN dbo.tblAuthor ta ON te.AuthorId = ta.AuthorId AND te.EpisodeType LIKE '%special%'
	ORDER BY ta.AuthorName DESC
;

--2. Use this to show for each author:
/*
	- the number of episodes they wrote;
	- their earliest episode date; and
	- their latest episode date.
*/
-- https://www.wiseowl.co.uk/training/exercises/ex-4036.htm
SELECT	ta.AuthorName, 
		COUNT(*) as Episodes,
		MIN(te.EpisodeDate) AS EarliestDate,
		MAX(te.EpisodeDate) AS LatestDate
	FROM dbo.tblAuthor ta
	JOIN dbo.tblEpisode te ON ta.AuthorId = te.AuthorId
	GROUP BY ta.AuthorName
	ORDER BY Episodes DESC
;

--3. Create a query to list out the following statistics from the table of events:
-- https://www.wiseowl.co.uk/training/exercises/ex-4125.htm
USE WorldEvents
GO	
SELECT	tc.CountryName, 

		te.EventName AS 'What happened',
		te.EventDate AS 'When happened'
	FROM dbo.tblCountry tc
	JOIN dbo.tblEvent te ON tc.CountryID = te.CountryID
	ORDER BY 'When happened'
;

--4. Create a query to list out the following statistics from the table of events:
-- https://www.wiseowl.co.uk/training/exercises/ex-4125.htm
SELECT	count(*) AS 'Number of events',
		max(te.EventDate) AS 'Last date',
		min(te.EventDate) AS 'First date'
	FROM dbo.tblEvent te
;

--5. When you run your query, you should see that all but one of the 15 episodes made in this year starred Matt Smith:
-- https://www.wiseowl.co.uk/training/exercises/ex-4032.htm
USE DoctorWho
GO
SELECT	td.DoctorName, te.Title 
	EpisodeNumber FROM dbo.tblEpisode te
	JOIN dbo.tblDoctor td ON te.DoctorId = td.DoctorId AND year(te.EpisodeDate) = 2014
	ORDER BY te.Title DESC
;

--6. Create a query which:
/*
	- groups by the category name from the category table; and
	- counts the number of events for each.
*/
-- https://www.wiseowl.co.uk/training/exercises/ex-4126.htm
USE WorldEvents
GO	
SELECT	tc.CategoryName,
		count(te.EventID) AS 'Number of events'
	FROM dbo.tblCategory tc
	JOIN dbo.tblEvent te ON tc.CategoryID = te.CategoryID
	GROUP BY tc.CategoryName
	ORDER BY 'Number of events' DESC
;

--7. Write a query using inner joins to show all of the authors who have written episodes featuring the Daleks.  You may find the following relationship diagram useful to refer to:
-- https://www.wiseowl.co.uk/training/exercises/ex-4033.htm
USE DoctorWho
GO
SELECT	ta.AuthorName FROM dbo.tblEnemy te
	JOIN dbo.tblEpisodeEnemy tee ON te.EnemyId = tee.EnemyId
	JOIN dbo.tblEpisode te2 ON te2.EpisodeId = tee.EpisodeId AND te.EnemyName = 'Daleks'
	JOIN dbo.tblAuthor ta ON te2.AuthorId = ta.AuthorId
;

--8. Write a query to list out for each author and doctor the number of episodes made,
--   but restrict your output to show only the author/doctor combinations for which more than 5 episodes have been written.  Here's what you should see:
-- https://www.wiseowl.co.uk/training/exercises/ex-4037.htm
SELECT	ta.AuthorName,
		td.DoctorName,
		count(te.EpisodeId) AS Episodes
	FROM dbo.tblAuthor ta
	JOIN dbo.tblEpisode te ON ta.AuthorId = te.AuthorId
	JOIN dbo.tblDoctor td ON te.DoctorId = td.DoctorId
	GROUP BY ta.AuthorName, td.DoctorName
	ORDER BY Episodes DESC	
;

--9. Create a query which uses an inner join to link the categories table to the events table (they share a column/field called CategoryId):
--	 Change the inner join to an outer join, so that you show for each category its events - even when there aren't any:
--   Add a WHERE clause to show only those categories which don't have any corresponding events:
-- https://www.wiseowl.co.uk/training/exercises/ex-4121.htm
USE WorldEvents
GO	
SELECT	te.EventName, te.EventDate, tc.CategoryName FROM dbo.tblEvent te
	FULL OUTER JOIN dbo.tblCategory tc ON te.CategoryID = tc.CategoryID
	WHERE TE.EventName IS NULL
;
	
--10. Create a query listing out for each continent and country the number of events taking place therein:
-- https://www.wiseowl.co.uk/training/exercises/ex-4127.htm
USE WorldEvents
GO	
SELECT	tc.CountryName, tc2.ContinentName, count(te.EventID) AS 'Number of events'
	FROM dbo.tblCountry tc
	JOIN dbo.tblEvent te ON tc.CountryID = te.CountryID
	JOIN dbo.tblContinent tc2 ON tc.ContinentID = tc2.ContinentID
	GROUP BY tc.CountryName, tc2.ContinentName
	ORDER BY 'Number of events' DESC
;