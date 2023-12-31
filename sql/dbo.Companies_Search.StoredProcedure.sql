USE [YellowBrick]
GO
/****** Object:  StoredProcedure [dbo].[Companies_Search]    Script Date: 10/16/2023 1:02:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author: Jeremy Simon
-- Create date: 08/02/2023
-- Description: Search dbo.Companies to return matching Query
-- Code Reviewer:Andre Darnell Jr

-- MODIFIED BY:
-- MODIFIED DATE:
-- Code Reviewer:
-- Note:
-- =============================================

CREATE proc [dbo].[Companies_Search]
		@PageIndex int,
		@PageSize int,
		@Query nvarchar(255)

AS

/* ---- Test Code ----

DECLARE 

	@pageIndex int = 0,
	@pageSize int = 6,
	@query nvarchar(255) = 'Updated'

EXECUTE dbo.Companies_Search

	@pageIndex,
	@pageSize,
	@query


*/ --- Test Code ----

BEGIN

DECLARE @offset INT = @PageIndex * @PageSize

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

	WHERE
		c.[Id] LIKE '%' + @Query + '%' OR
		c.[Name] LIKE '%' + @Query + '%' OR
		c.[Headline] LIKE '%' + @Query + '%' OR
		c.[Description] LIKE '%' + @Query + '%' OR
		c.[Logo] LIKE '%' + @Query + '%' OR
		c.[Phone] LIKE '%' + @Query + '%' OR
		c.[SiteUrl] LIKE '%' + @Query + '%' OR
		st.[Id] LIKE '%' + @Query + '%' OR
		st.[Name] LIKE '%' + @Query + '%' OR
		c.[DateCreated] LIKE '%' + @Query + '%' OR
		c.[DateModified] LIKE '%' + @Query + '%'
				
	ORDER by c.Id

	OFFSET @offset ROWS
	FETCH NEXT @PageSize ROWS Only

		
END
GO
