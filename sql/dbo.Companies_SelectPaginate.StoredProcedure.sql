USE [YellowBrick]
GO
/****** Object:  StoredProcedure [dbo].[Companies_SelectPaginate]    Script Date: 10/16/2023 1:02:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author: Jeremy Simon
-- Create date: 07/31/2023
-- Description: Retrieve a paginated list of company information from dbo.Companies
-- Code Reviewer: Roberto Moreno

-- MODIFIED BY:
-- MODIFIED DATE:
-- Code Reviewer: Andre Darnell Jr
-- Note:
-- =============================================

CREATE proc [dbo].[Companies_SelectPaginate]
	@PageIndex int,
	@PageSize int

AS

/* ---- Test Code ----

DECLARE 

	@pageIndex int = 0,
	@pageSize int = 6

EXECUTE dbo.Companies_SelectPaginate

	@pageIndex,
	@pageSize

*/ --- Test Code ----

BEGIN

DECLARE @offset int = @PageIndex * @PageSize

	SELECT 
		c.[Id],
		c.[Name],
		c.[Headline],
		c.[Description],
		c.[Logo],
		c.[Phone],
		c.[SiteUrl],
		st.[Id] AS StatusId,
		st.[Name] AS StatusName,
		c.[DateCreated],
		c.[DateModified],
		u.[Id] AS CreatedBy,
		u.[FirstName],
		u.[LastName],
		u.[Mi],
		u.[AvatarUrl],

		TotalCount = COUNT(1) OVER()
	
		
	FROM dbo.Companies AS c 
	INNER JOIN dbo.StatusTypes AS st 
	ON c.StatusId = st.Id
	INNER JOIN dbo.Users AS u
	ON c.CreatedBy = u.Id
		
	ORDER by c.Id

	OFFSET @offset ROWS
	FETCH NEXT @PageSize ROWS Only

		
END
GO
