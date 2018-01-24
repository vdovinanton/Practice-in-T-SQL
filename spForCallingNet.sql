USE university
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE GetByName ( @name nvarchar(25) ) 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT s.* 
		FROM dbo.Students s
		WHERE s.FirstName = @name
END
GO

USE [university]
GO

/****** Object:  StoredProcedure [dbo].[GetByName]    Script Date: 1/24/2018 6:13:21 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[GetByName] ( @character nvarchar(10) ) 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT s.* 
		FROM dbo.Students s
		WHERE s.LastName LIKE '%' + @character + '%'
END
GO


EXEC GetByName 'm'