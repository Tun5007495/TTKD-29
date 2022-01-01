create database [UK_Accidents_NDS]
GO
USE [UK_Accidents_NDS]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MetaData]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[MetaData](
	[Index] [int] IDENTITY(1,1) NOT NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL
 CONSTRAINT [PK_Metadata] PRIMARY KEY CLUSTERED 
(
	[Index] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

/****** Object:  Table [dbo].[Accident]    Script Date: 12/31/2021 5:20:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accident](
	[AccidentID] [int] identity(1,1) not null PRIMARY KEY,
	[AccidentIndex] [varchar](50) NULL,
	[AccidentSeverityID] [int] NULL,
	[NumberOfVehicles] [int] NULL,
	[NumberOfCasualties] [int] NULL,
	[LocalAuthorityDistrictID] [int] NULL,
	[Time] [time](7) NULL,
	[TimeOfDayID] [int] NULL,
	[DateID] [int] NULL,
	[RoadTypeID] [int] NULL,
	[SpeedLimit] [int] NULL,
	[BuiltUpRoundID] [int] NULL,
	[AreaID] [int] NULL,
	[LocationID] [int] NULL,
	[SourceID] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AccidentSeverity]    Script Date: 12/30/2021 5:20:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccidentSeverity](
	[AccidentSeverityID] [int] identity(1,1) not null PRIMARY KEY,
	[AccidentSeverityCode] [int] NULL,
	[AccidentSeverityLabel] [nvarchar](255) NULL,
	[SourceID] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AgeBand]    Script Date: 12/30/2021 5:20:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AgeBand](
	[AgeBandID] [int] identity(1,1) not null PRIMARY KEY,
	[AgeBandCode] [int] NULL,
	[AgeBandLabel] [nvarchar](255) NULL,
	[SourceID] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AgeGroup]    Script Date: 12/30/2021 5:20:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AgeGroup](
	[AgeGroupID] [int] identity(1,1) not null PRIMARY KEY,
	[AgeGroupCode] [int] NULL,
	[AgeGroupLabel] [varchar](50) NULL,
	[AgeFrom] [int] NULL,
	[AgeGroup] [int] NULL,
	[SourceID] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Area]    Script Date: 12/30/2021 5:20:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Area](
	[AreaID] [int] identity(1,1) not null PRIMARY KEY,
	[AreaCode] [int] NULL,
	[AreaLabel] [nvarchar](255) NULL,
	[SourceID] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BuiltUpRoad]    Script Date: 12/30/2021 5:20:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BuiltUpRoad](
	[BuiltUpRoadID] [int] identity(1,1) not null PRIMARY KEY,
	[BuiltUpRoadCode] [int] NULL,
	[BuildUpRoadLabel] [varchar](50) NULL,
	[SourceID] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Casualties]    Script Date: 12/30/2021 5:20:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Casualty](
	[CasualtyID] [int] identity(1,1) not null PRIMARY KEY,
	[AccidentID] [varchar](50) NULL,
	[CasualtyReference][int] NULL,
	[GenderID]  [int] NULL,
	[Age]  [int] NULL,
	[AgeBandID]  [int] NULL,
	[CasualtySeverityID]  [int] NULL,
	[CasualtyTypeID]  [int] NULL,
	[SourceID] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CasualType]    Script Date: 12/30/2021 5:20:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CasualType](
	[CasualTypeID] [int] identity(1,1) not null PRIMARY KEY,
	[CasualTypeCode] [int] NULL,
	[CasualTypeLabel] [nvarchar](255) NULL,
	[SourceID] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CasualtySeverity]    Script Date: 12/30/2021 5:20:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CasualtySeverity](
	[CasualtySeverityID] [int] identity(1,1) not null PRIMARY KEY,
	[CasualtySeverityCode] [int] NULL,
	[CasualtySeverityLabel] [nvarchar](255) NULL,
	[SourceID] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SexOfCasualty]    Script Date: 12/30/2021 5:20:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SexOfCasualty](
	[GenderID] [int] identity(1,1) not null PRIMARY KEY,
	[GenderCode] [int] NULL,
	[GenderLabel] [nvarchar](255) NULL,
	[SourceID] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[JourneyPurpose]    Script Date: 12/30/2021 5:20:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JourneyPurpose](
	[JourneyPurposeID] [int] identity(1,1) not null PRIMARY KEY,
	[JourneyPurposeCode] [int] NULL,
	[JourneyPurposeLabel] [nvarchar](255) NULL,
	[SourceID] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LocalAuthorityDistrict]    Script Date: 12/30/2021 5:20:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LocalAuthorityDistrict](
	[LocalAuthorityDistrictID] [int] identity(1,1) not null PRIMARY KEY,
	[LocalAuthorityDistrictCode] [int] NULL,
	[LocalAuthorityDistrictLabel] [nvarchar](255) NULL,
	[SourceID] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LSOA]    Script Date: 12/30/2021 5:20:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LSOA](
	[LSOAID] [int] identity(1,1) not null PRIMARY KEY,
	[LocationID] [int] NULL,
	[lsoa11cd] [varchar](50) NULL,
	[SourceID] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Location]    Script Date: 12/30/2021 5:20:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Location](
	[LocationID] [int] identity(1,1) not null PRIMARY KEY,
	[postcode] [varchar](50) NULL,
	[city] [varchar](50) NULL,
	[county] [varchar](50) NULL,
	[country] [varchar](50) NULL,
	[region] [varchar](50) NULL,
	[SourceID] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoadType]    Script Date: 12/30/2021 5:20:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoadType](
	[RoadTypeID] [int] identity(1,1) not null PRIMARY KEY,
	[RoadTypeCode] [int] NULL,
	[RoadTypeLabel] [nvarchar](255) NULL,
	[SourceID] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vehicle]    Script Date: 12/30/2021 5:20:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vehicle](
	[VehicleID] [int] identity(1,1) not null PRIMARY KEY,
	[AccidentID] [int] NULL,
	[VehicleReference] [int] NULL,
	[VehicleType] [int] NULL,
	[JourneyPurpose] [int] NULL,
	[SourceID] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VehicleType]    Script Date: 12/30/2021 5:20:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VehicleType](
	[VehicleTypeID] [int] identity(1,1) not null PRIMARY KEY,
	[VehicleTypeCode] [int] NULL,
	[VehicleTypeLabel] [nvarchar](255) NULL,
	[SourceID] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Date](
	[DateID]  [int] identity(1,1) not null PRIMARY KEY,
	[Date] [date] NOT NULL,
	[Day] [int] NOT NULL,
	[Month] [int] NOT NULL,
	[Quarter] [int] NOT NULL,
	[Year] [int] NOT NULL,
	[SourceID] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TimeOfDate](
	[TimeOfDateID]  [int] identity(1,1) not null PRIMARY KEY,
	[TimeOfDateMeaning] [varchar](50) NOT NULL,
	[SourceID] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL
) ON [PRIMARY]
GO