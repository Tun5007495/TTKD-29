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

/****** Object:  Table [dbo].[Accidents_NDS]    Script Date: 12/31/2021 5:20:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accidents_NDS](
	[AccidentsID] [int] identity(1,1) not null PRIMARY KEY,
	[Accident_Index] [varchar](50) NULL,
	[AccidentSeverityID] [int] NULL,
	[Number_of_Vehicles] [int] NULL,
	[Number_of_Casualties] [int] NULL,
	[LocalAuthorityDistrictID] [int] NULL,
	[Time] [time](7) NULL,
	[TimeOfDayID] [int] NULL,
	[DateID] [int] NULL,
	[RoadTypeID] [int] NULL,
	[Speed_limit] [int] NULL,
	[BuiltUpRoundID] [int] NULL,
	[AreaID] [int] NULL,
	[LocationID] [int] NULL,
	[SourceID] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AccidentSeverity_NDS]    Script Date: 12/30/2021 5:20:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccidentSeverity_NDS](
	[AccidentSeverityID] [int] identity(1,1) not null PRIMARY KEY,
	[code] [int] NULL,
	[label] [nvarchar](255) NULL,
	[SourceID] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AgeBand_NDS]    Script Date: 12/30/2021 5:20:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AgeBand_NDS](
	[AgeBandID] [int] identity(1,1) not null PRIMARY KEY,
	[code] [int] NULL,
	[label] [nvarchar](255) NULL,
	[SourceID] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AgeGroup_NDS]    Script Date: 12/30/2021 5:20:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AgeGroup_NDS](
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
/****** Object:  Table [dbo].[Area_NDS]    Script Date: 12/30/2021 5:20:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Area_NDS](
	[AreaID] [int] identity(1,1) not null PRIMARY KEY,
	[code] [int] NULL,
	[label] [nvarchar](255) NULL,
	[SourceID] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BuiltUpRoad_NDS]    Script Date: 12/30/2021 5:20:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BuiltUpRoad_NDS](
	[BuiltUpRoadID] [int] identity(1,1) not null PRIMARY KEY,
	[BuiltUpRoadCode] [int] NULL,
	[BuildUpRoadLabel] [varchar](50) NULL,
	[SourceID] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Casualties_NDS]    Script Date: 12/30/2021 5:20:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Casualties_NDS](
	[CasualtiesID] [int] identity(1,1) not null PRIMARY KEY,
	[Accident_Index] [varchar](50) NULL,
	[GenderID]  [int] NULL,
	[AgeGroupID]  [int] NULL,
	[AgeBandID]  [int] NULL,
	[CasualtySeverityID]  [int] NULL,
	[CasualtyTypeID]  [int] NULL,
	[SourceID] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CasualType_NDS]    Script Date: 12/30/2021 5:20:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CasualType_NDS](
	[CasualTypeID] [int] identity(1,1) not null PRIMARY KEY,
	[code] [int] NULL,
	[label] [nvarchar](255) NULL,
	[SourceID] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CasualtySeverity_NDS]    Script Date: 12/30/2021 5:20:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CasualtySeverity_NDS](
	[CasualtySeverityID] [int] identity(1,1) not null PRIMARY KEY,
	[code] [int] NULL,
	[label] [nvarchar](255) NULL,
	[SourceID] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GenderOfCasualty_NDS]    Script Date: 12/30/2021 5:20:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GenderOfCasualty_NDS](
	[GenderOfCasualtyID] [int] identity(1,1) not null PRIMARY KEY,
	[code] [int] NULL,
	[label] [nvarchar](255) NULL,
	[SourceID] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[JourneyPurpose_NDS]    Script Date: 12/30/2021 5:20:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JourneyPurpose_NDS](
	[JourneyPurposeID] [int] identity(1,1) not null PRIMARY KEY,
	[code] [int] NULL,
	[label] [nvarchar](255) NULL,
	[SourceID] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LocalAuthorityDistrict_NDS]    Script Date: 12/30/2021 5:20:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LocalAuthorityDistrict_NDS](
	[LocalAuthorityDistrictID] [int] identity(1,1) not null PRIMARY KEY,
	[code] [int] NULL,
	[label] [nvarchar](255) NULL,
	[SourceID] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LSOA_NDS]    Script Date: 12/30/2021 5:20:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LSOA_NDS](
	[LSOAID] [int] identity(1,1) not null PRIMARY KEY,
	[lsoa11cd] [varchar](50) NULL,
	[SourceID] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Postcode_NDS]    Script Date: 12/30/2021 5:20:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Postcode_NDS](
	[PostcodeID] [int] identity(1,1) not null PRIMARY KEY,
	[postcode] [varchar](50) NULL,
	[city] [varchar](50) NULL,
	[county] [varchar](50) NULL,
	[country_code] [varchar](50) NULL,
	[country_name] [varchar](50) NULL,
	[region_code] [varchar](50) NULL,
	[region_name] [varchar](50) NULL,
	[SourceID] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoadType_NDS]    Script Date: 12/30/2021 5:20:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoadType_NDS](
	[RoadTypeID] [int] identity(1,1) not null PRIMARY KEY,
	[code] [int] NULL,
	[label] [nvarchar](255) NULL,
	[SourceID] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vehicles_NDS]    Script Date: 12/30/2021 5:20:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vehicles_NDS](
	[VehiclesID] [int] identity(1,1) not null PRIMARY KEY,
	[Accident_Index] [varchar](50) NULL,
	[Vehicle_Reference] [int] NULL,
	[Vehicle_Type] [int] NULL,
	[Journey_Purpose_of_Driver] [int] NULL,
	[SourceID] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VehicleType_NDS]    Script Date: 12/30/2021 5:20:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VehicleType_NDS](
	[VehicleTypeID] [int] identity(1,1) not null PRIMARY KEY,
	[code] [int] NULL,
	[label] [nvarchar](255) NULL,
	[SourceID] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Location](
	[LocationID] [int] identity(1,1) not null PRIMARY KEY,
	[postcode] [varchar](50) NULL,
	[city] [varchar](50) NULL,
	[county] [varchar](50) NULL,
	[region] [varchar](50) NULL,
	[country] [varchar](50) NULL,
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
	[Date] [varchar](50) NOT NULL,
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