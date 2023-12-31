USE [YellowBrick]
GO
/****** Object:  StoredProcedure [dbo].[Companies_Delete_ById]    Script Date: 10/16/2023 1:02:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author: Jeremy Simon
-- Create date: 7/31/2023
-- Description: Delete a company record from dbo.Companies
-- Code Reviewer:Andre Darnell Jr

-- MODIFIED BY:
-- MODIFIED DATE:
-- Code Reviewer:
-- Note:
-- =============================================

CREATE PROC [dbo].[Companies_Delete_ById]
	@Id int

AS

/*

DECLARE @Id int = 56

EXECUTE dbo.Companies_Delete_ById @Id

*/

BEGIN

	UPDATE dbo.Companies
				
		SET	[StatusId] = 2
			
		WHERE Id = @Id

END

GO
