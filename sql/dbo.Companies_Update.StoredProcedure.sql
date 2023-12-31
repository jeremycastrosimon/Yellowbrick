USE [YellowBrick]
GO
/****** Object:  StoredProcedure [dbo].[Companies_Update]    Script Date: 10/16/2023 1:02:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author: Jeremy Simon
-- Create date: 07/28/2023
-- Description: Update company information from dbo.Companies
-- Code Reviewer: Andre Darnell Jr

-- MODIFIED BY:
-- MODIFIED DATE:
-- Code Reviewer:
-- Note:
-- =============================================

CREATE proc [dbo].[Companies_Update]
	 @Id int
	,@Name nvarchar(200)
	,@Headline nvarchar(200)
	,@Description nvarchar(200)
	,@Logo nvarchar(200)
	,@Phone nvarchar(50)
	,@SiteUrl nvarchar(255)
	,@UserId int
	
AS

/* ---- Test Code ----

DECLARE  @Id int = 51
		,@Name nvarchar(200) = 'Updated Test2'
		,@Headline nvarchar(200) = 'Updated Test Headline'
		,@Description nvarchar(100) = 'Updated Test Description'
		,@Logo nvarchar(255) = 'updatedtestlogo.jpeg'
		,@Phone nvarchar(100) = 'Updated 562-123-4567'
		,@SiteUrl nvarchar(255) = 'https://sabio.la/updatedtesturl'
		,@UserId int = 1

EXECUTE dbo.Companies_Update
		 @Id
		,@Name 
		,@Headline 
		,@Description 
		,@Logo 
		,@Phone 
		,@SiteUrl 
		,@UserId

Execute dbo.Companies_Select_ById @Id

*/ ---- Test Code ----

BEGIN

DECLARE @Date datetime2 = GETUTCDATE()

UPDATE [dbo].[Companies]
   SET [Name] = @Name
      ,[Headline] = @Headline
      ,[Description] = @Description
      ,[Logo] = @Logo
      ,[Phone] = @Phone
      ,[SiteUrl] = @SiteUrl
      ,[CreatedBy] = @UserId
	  ,[DateModified] = @Date

 WHERE Id = @Id

 END

GO
