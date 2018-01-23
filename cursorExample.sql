USE WorldEvents
GO	
DECLARE	@EventId INT;
DECLARE @EventDetelis nvarchar(50);

DECLARE @EventCursor CURSOR;

SET @EventCursor = CURSOR FOR SELECT te.EventID, te.EventName 
	FROM dbo.tblEvent te
;

OPEN @EventCursor
FETCH NEXT FROM @EventCursor INTO @EventId, @EventDetelis
WHILE @@FETCH_STATUS = 0
	BEGIN
	PRINT cast(@EventId AS varchar(50)) + ' ' + @EventDetelis;
	FETCH NEXT FROM @EventCursor INTO @EventId, @EventDetelis;
END
CLOSE @EventCursor
DEALLOCATE @EventCursor