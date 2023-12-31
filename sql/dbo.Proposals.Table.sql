USE [YellowBrick]
GO
/****** Object:  Table [dbo].[Proposals]    Script Date: 10/16/2023 1:02:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Proposals](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ClientId] [int] NOT NULL,
	[SolicitationStateId] [int] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Notes] [nvarchar](4000) NULL,
	[StatusId] [int] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[DateCreated] [datetime2](7) NOT NULL,
	[DateModified] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Proposals] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Proposals] ADD  CONSTRAINT [DF_Proposals_StatusId]  DEFAULT ((6)) FOR [StatusId]
GO
ALTER TABLE [dbo].[Proposals] ADD  CONSTRAINT [DF_Proposals_DateCreated]  DEFAULT (getutcdate()) FOR [DateCreated]
GO
ALTER TABLE [dbo].[Proposals] ADD  CONSTRAINT [DF_Proposals_DateModified]  DEFAULT (getutcdate()) FOR [DateModified]
GO
ALTER TABLE [dbo].[Proposals]  WITH CHECK ADD  CONSTRAINT [FK_Proposals_Clients] FOREIGN KEY([ClientId])
REFERENCES [dbo].[Clients] ([Id])
GO
ALTER TABLE [dbo].[Proposals] CHECK CONSTRAINT [FK_Proposals_Clients]
GO
ALTER TABLE [dbo].[Proposals]  WITH CHECK ADD  CONSTRAINT [FK_Proposals_States] FOREIGN KEY([SolicitationStateId])
REFERENCES [dbo].[States] ([Id])
GO
ALTER TABLE [dbo].[Proposals] CHECK CONSTRAINT [FK_Proposals_States]
GO
ALTER TABLE [dbo].[Proposals]  WITH CHECK ADD  CONSTRAINT [FK_Proposals_StatusTypes] FOREIGN KEY([StatusId])
REFERENCES [dbo].[StatusTypes] ([Id])
GO
ALTER TABLE [dbo].[Proposals] CHECK CONSTRAINT [FK_Proposals_StatusTypes]
GO
ALTER TABLE [dbo].[Proposals]  WITH CHECK ADD  CONSTRAINT [FK_Proposals_Users] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Proposals] CHECK CONSTRAINT [FK_Proposals_Users]
GO
ALTER TABLE [dbo].[Proposals]  WITH CHECK ADD  CONSTRAINT [FK_Proposals_Users1] FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Proposals] CHECK CONSTRAINT [FK_Proposals_Users1]
GO
