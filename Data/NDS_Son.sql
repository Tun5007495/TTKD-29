create database [UK_Accidents_NDS]
GO
USE [UK_Accidents_NDS]
GO


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
	[Date] [date] NULL,
	[RoadTypeID] [int] NULL,
	[SpeedLimit] [int] NULL,
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
CREATE TABLE [dbo].[Casualty](
	[CasualtyID] [int] identity(1,1) not null PRIMARY KEY,
	[AccidentID] int NULL,
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
CREATE TABLE [dbo].[CasualtyType](
	[CasualtyTypeID] [int] identity(1,1) not null PRIMARY KEY,
	[CasualtyTypeCode] [int] NULL,
	[CasualtyTypeLabel] [nvarchar](255) NULL,
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
CREATE TABLE [dbo].[GenderOfCasualty](
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
	[VehicleTypeID] [int] NULL,
	[JourneyPurposeID] [int] NULL,
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

--Add Foregin Key
GO
ALTER TABLE Accident
ADD CONSTRAINT fk_Accident_AccidentSeverity
 FOREIGN KEY (AccidentSeverityID)
 REFERENCES  AccidentSeverity(AccidentSeverityID)
 GO
 ALTER TABLE Accident
 ADD CONSTRAINT fk_Accident_LocalAuthorityDistrict
 FOREIGN KEY (LocalAuthorityDistrictID)
 REFERENCES LocalAuthorityDistrict(LocalAuthorityDistrictID)
 GO
 ALTER TABLE Accident
 ADD CONSTRAINT fk_Accident_RoadType
 FOREIGN KEY (RoadTypeID)
 REFERENCES  RoadType(RoadTypeID)
 GO
 GO
 ALTER TABLE Accident
 ADD CONSTRAINT fk_Accident_Area
 FOREIGN KEY (AreaID)
 REFERENCES   Area(AreaID)
 GO
GO
 ALTER TABLE Accident
 ADD CONSTRAINT fk_Accident_Location
 FOREIGN KEY (LocationID)
 REFERENCES   Location(LocationID)
 GO
  ALTER TABLE Casualty 
 ADD CONSTRAINT fk_Accident_GenderOfCasualty
 FOREIGN KEY (GenderID)
 REFERENCES   GenderOfCasualty(GenderID)
 GO
 GO
  ALTER TABLE Casualty
 ADD CONSTRAINT fk_Accident_AgeBand
 FOREIGN KEY (AgeBandID)
 REFERENCES   AgeBand(AgeBandID)
 GO
  GO
  ALTER TABLE Casualty
 ADD CONSTRAINT fk_Accident_CasualtySeverity
 FOREIGN KEY (CasualtySeverityID)
 REFERENCES  CasualtySeverity(CasualtySeverityID)
 GO
   GO
  ALTER TABLE Casualty
 ADD CONSTRAINT fk_Accident_CasualtyType
 FOREIGN KEY (CasualtyTypeID)
 REFERENCES  CasualtyType(CasualtyTypeID)
 GO
  GO
  ALTER TABLE Vehicle
 ADD CONSTRAINT fk_Accident_VehicleType
 FOREIGN KEY (VehicleTypeID)
 REFERENCES  VehicleType(VehicleTypeID)
 GO
 GO
  ALTER TABLE Vehicle
 ADD CONSTRAINT fk_Accident_JourneyPurpose
 FOREIGN KEY (JourneyPurposeID)
 REFERENCES  JourneyPurpose(JourneyPurposeID)
 GO
 alter table Casualty add constraint FK_Accident_Casualty foreign key (AccidentID) references Accident(AccidentID)
 go
alter table Vehicle add constraint FK_Accident_Vehicle foreign key (AccidentID) references Accident(AccidentID)
  