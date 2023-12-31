USE [YellowBrick]
GO
/****** Object:  StoredProcedure [dbo].[Proposals_Select_ByClientIdV2]    Script Date: 10/16/2023 1:02:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Author: Jeremy Simon
-- Create date: 08/16/2023
-- Description: Built on top of Proposals_SelectById, here we add a JSON array of products using the ProposalsProducts table and display basic details of a product (Products_SelectById)
-- Code Reviewer:

-- MODIFIED BY: 
-- MODIFIED DATE:
-- Code Reviewer:
-- Note:

CREATE PROC [dbo].[Proposals_Select_ByClientIdV2]
    @ClientId int
   ,@ProposalId int
   ,@PageIndex int 
   ,@PageSize int

AS

/* ---- Test Code ----

DECLARE      @ClientId int = 14
            ,@ProposalId int = 22
 			,@PageIndex int = 0
 			,@PageSize int = 5
EXECUTE [dbo].[Proposals_Select_ByClientIdV2]
			 @ClientId
			,@ProposalId
			,@PageIndex
			,@PageSize

select * from dbo.clients

*/ ---- Test Code ----

BEGIN
    DECLARE @offset int = @PageIndex * @PageSize

    SELECT
        p.[Id],
        c.[Id] as ClientId,
        c.[FirstName],
        c.[LastName],
        c.[Mi],
        s.[Id] as SolicitationStateId,
        s.[Name] as StateName,
        p.[Name],
        p.[Notes],
        st.[Id] as StatusId,
        st.[Name] as StatusType,
        cb.[Id] as UserId,
        cb.[FirstName],
        cb.[LastName],
        cb.[Mi],
        cb.[AvatarUrl],
        mb.[Id] as ModifiedBy,
        p.[DateCreated],
        p.[DateModified],


		(
        SELECT
			p_inner.[Id],
            p_inner.[ProductTypeId] as 'productInfo.id',
            p_inner.[Name] as 'productInfo.name',
            pt_inner.[Id] as 'productType.id',
            pt_inner.[Name] as 'productType.name',
            c_inner.[Name] as CompanyName,
            p_inner.[SKU],
            p_inner.[Amount],
            p_inner.[TermInYears],
            p_inner.[Specifications],
            p_inner.[Description],
            p_inner.[IsActive],
            p_inner.[Image],
            p_inner.[DateCreated],
            p_inner.[DateModified]
        FROM [dbo].[Products] as p_inner
        INNER JOIN [dbo].[Companies] as c_inner ON p_inner.CompanyId = c_inner.Id
        INNER JOIN [dbo].[ProductTypes] as pt_inner ON p_inner.ProductTypeId = pt_inner.Id 
        INNER JOIN [dbo].[ProposalProducts] as pp ON p_inner.Id = pp.ProductId
        WHERE pp.ProposalId = @ProposalId
        FOR JSON path
        ) as ProductsJson,
		TotalCount = COUNT(1) OVER()

    FROM [dbo].[Proposals] as p 
    JOIN dbo.Clients as c ON c.Id = p.ClientId
    JOIN dbo.States as s ON s.Id = p.SolicitationStateId
    JOIN dbo.StatusTypes as st ON st.Id = p.StatusId
    JOIN dbo.Users as cb ON cb.Id = p.CreatedBy
    JOIN dbo.Users as mb ON mb.Id = p.ModifiedBy
    WHERE p.ClientId = @ClientId
    ORDER BY p.Id DESC
    OFFSET @offset ROWS
    FETCH NEXT @PageSize ROWS ONLY
END
GO
