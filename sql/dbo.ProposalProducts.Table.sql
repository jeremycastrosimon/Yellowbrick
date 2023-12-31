USE [YellowBrick]
GO
/****** Object:  Table [dbo].[ProposalProducts]    Script Date: 10/16/2023 1:02:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProposalProducts](
	[ProposalId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
 CONSTRAINT [PK_ProposalProducts] PRIMARY KEY CLUSTERED 
(
	[ProposalId] ASC,
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ProposalProducts]  WITH CHECK ADD  CONSTRAINT [FK_ProposalProducts_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[ProposalProducts] CHECK CONSTRAINT [FK_ProposalProducts_Products]
GO
ALTER TABLE [dbo].[ProposalProducts]  WITH CHECK ADD  CONSTRAINT [FK_ProposalProducts_Proposals] FOREIGN KEY([ProposalId])
REFERENCES [dbo].[Proposals] ([Id])
GO
ALTER TABLE [dbo].[ProposalProducts] CHECK CONSTRAINT [FK_ProposalProducts_Proposals]
GO
