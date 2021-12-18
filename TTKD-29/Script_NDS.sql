USE [UK_Accidents_NDS]
GO

/****** Object:  Table [dbo].[Geography]    Script Date: 12/18/2021 2:55:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Geography_NDS](
	[GeographyID] [int] IDENTITY(1,1) NOT NULL,
	[PostcodeNK] [varchar](50) NULL,
	[City] [varchar](50) NULL,
	[County] [varchar](50) NULL,
	[Country_name] [varchar](50) NULL,
	[Region_name] [varchar](50) NULL
) ON [PRIMARY]
GO


