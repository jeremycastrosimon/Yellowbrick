USE [YellowBrick]
GO
/****** Object:  StoredProcedure [dbo].[Companies_Insert]    Script Date: 10/16/2023 1:02:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author: Jeremy Simon
-- Create date: 07/28/2023
-- Description: Insert company information to dbo.Companies
-- Code Reviewer: Roberto Moreno

-- MODIFIED BY:
-- MODIFIED DATE:
-- Code Reviewer: Andre Darnell Jr
-- Note:
-- =============================================

CREATE PROCEDURE [dbo].[Companies_Insert]

     @Name nvarchar(200)
	,@Headline nvarchar(200)
	,@Description nvarchar(200)
	,@Logo nvarchar(200)
	,@Phone nvarchar(50)
	,@SiteUrl nvarchar(255)
	,@UserId int
	,@Id int OUTPUT

AS

/* ---- Test Code ----

DECLARE @Id int = 0

DECLARE @Name nvarchar(200) = 'Test'
       ,@Headline nvarchar(200) = 'Test Headline'
	   ,@Description nvarchar(200) = 'Test Description'
	   ,@Logo nvarchar(200) = 'testlogo.jpeg'
	   ,@Phone nvarchar(50) = '562-123-4567'
	   ,@SiteUrl nvarchar(255) = 'https://sabio.la/testurl'
	   ,@UserId int = 1
	   ,@CompanyId int

EXECUTE dbo.Companies_Insert
     @Name
	,@Headline
	,@Description
	,@Logo
	,@Phone
	,@SiteUrl
	,@UserId 
	,@Id = @CompanyId OUTPUT

Execute dbo.Companies_Select_ById @CompanyId		

*/ ---- Test Code ----

BEGIN

	DECLARE @CompanyId int

    INSERT INTO dbo.Companies 
	(
	  [Name]
	, [Headline]
	, [Description]
	, [Logo]
	, [Phone]
	, [SiteUrl]
	, [StatusId]
	, [CreatedBy]
	)
    VALUES 
	(
	 @Name
	,@Headline
	,@Description
	,@Logo
	,@Phone
	,@SiteUrl
	,1
	,@UserId
	)
     
    SET @Id = SCOPE_IDENTITY()

END
GO
