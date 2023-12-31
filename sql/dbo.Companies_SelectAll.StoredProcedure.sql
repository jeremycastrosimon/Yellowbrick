USE [YellowBrick]
GO
/****** Object:  StoredProcedure [dbo].[Companies_SelectAll]    Script Date: 10/16/2023 1:02:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author: Jeremy Simon
-- Create date: 07/31/2023
-- Description: Retrieve all company information from dbo.Companies
-- Code Reviewer: Roberto Moreno

-- MODIFIED BY:
-- MODIFIED DATE:
-- Code Reviewer: Andre Darnell Jr
-- Note:
-- =============================================

CREATE proc [dbo].[Companies_SelectAll]
		
AS

/*

EXECUTE [dbo].[Companies_SelectAll]

*/

BEGIN 

	SELECT	
		 c.[Id]
		,c.[Name]
		,c.[Headline]
		,c.[Description]
		,c.[Logo]
		,c.[Phone]
		,c.[SiteUrl]
		,st.[Id] AS StatusId
		,st.[Name]
		,c.[DateCreated]
		,c.[DateModified]
		,u.[Id] AS CreatedBy
		,u.[FirstName]
        ,u.[LastName]
        ,u.[Mi]
        ,u.[AvatarUrl]
		
	FROM dbo.Companies AS c 
	INNER JOIN dbo.StatusTypes AS st 
	ON c.StatusId = st.Id
	INNER JOIN dbo.Users AS u
	ON c.CreatedBy = u.Id

END
	
GO
