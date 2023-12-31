USE [YellowBrick]
GO
/****** Object:  StoredProcedure [dbo].[Companies_Select_ById]    Script Date: 10/16/2023 1:02:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author: Jeremy Simon
-- Create date: 08/01/2023
-- Description: Retrieve all company information from dbo.Companies
-- Code Reviewer: Andre Darnell Jr

-- MODIFIED BY:
-- MODIFIED DATE:
-- Code Reviewer:
-- Note:
-- =============================================

CREATE proc [dbo].[Companies_Select_ById]
@Id int

AS

/* ---- Test Code ----

DECLARE @Id int = 49

EXECUTE dbo.Companies_Select_ById @Id

*/ ---- Test Code

BEGIN

	SELECT 
		c.[Id],
		c.[Name],
		c.[Headline],
		c.[Description],
		c.[Logo],
		c.[Phone],
		c.[SiteUrl],
		st.[Id] AS StatusId,
		st.[Name],
		c.[DateCreated],
		c.[DateModified],
		u.[Id] AS CreatedBy,
		u.[FirstName],
        u.[LastName],
        u.[Mi],
        u.[AvatarUrl]	

	FROM dbo.Companies AS c 
	INNER JOIN dbo.StatusTypes AS st 
	ON c.StatusId = st.Id
	INNER JOIN dbo.Users AS u
	ON c.CreatedBy = u.Id

	WHERE @Id = c.Id
	
END
GO
