USE [master]
GO
/****** Object:  Database [UK_Accidents_NDS]    Script Date: 1/8/2022 3:27:50 AM ******/
CREATE DATABASE [UK_Accidents_NDS]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'UK_Accidents_NDS', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\UK_Accidents_NDS.mdf' , SIZE = 204800KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'UK_Accidents_NDS_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\UK_Accidents_NDS_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [UK_Accidents_NDS] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [UK_Accidents_NDS].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [UK_Accidents_NDS] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [UK_Accidents_NDS] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [UK_Accidents_NDS] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [UK_Accidents_NDS] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [UK_Accidents_NDS] SET ARITHABORT OFF 
GO
ALTER DATABASE [UK_Accidents_NDS] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [UK_Accidents_NDS] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [UK_Accidents_NDS] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [UK_Accidents_NDS] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [UK_Accidents_NDS] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [UK_Accidents_NDS] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [UK_Accidents_NDS] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [UK_Accidents_NDS] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [UK_Accidents_NDS] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [UK_Accidents_NDS] SET  ENABLE_BROKER 
GO
ALTER DATABASE [UK_Accidents_NDS] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [UK_Accidents_NDS] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [UK_Accidents_NDS] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [UK_Accidents_NDS] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [UK_Accidents_NDS] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [UK_Accidents_NDS] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [UK_Accidents_NDS] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [UK_Accidents_NDS] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [UK_Accidents_NDS] SET  MULTI_USER 
GO
ALTER DATABASE [UK_Accidents_NDS] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [UK_Accidents_NDS] SET DB_CHAINING OFF 
GO
ALTER DATABASE [UK_Accidents_NDS] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [UK_Accidents_NDS] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [UK_Accidents_NDS] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [UK_Accidents_NDS] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'UK_Accidents_NDS', N'ON'
GO
ALTER DATABASE [UK_Accidents_NDS] SET QUERY_STORE = OFF
GO
USE [UK_Accidents_NDS]
GO
/****** Object:  Table [dbo].[Accident]    Script Date: 1/8/2022 3:27:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accident](
	[AccidentID] [int] IDENTITY(1,1) NOT NULL,
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
	[UpdatedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[AccidentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AccidentSeverity]    Script Date: 1/8/2022 3:27:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccidentSeverity](
	[AccidentSeverityID] [int] IDENTITY(1,1) NOT NULL,
	[AccidentSeverityCode] [int] NULL,
	[AccidentSeverityLabel] [nvarchar](255) NULL,
	[SourceID] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[AccidentSeverityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AgeBand]    Script Date: 1/8/2022 3:27:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AgeBand](
	[AgeBandID] [int] IDENTITY(1,1) NOT NULL,
	[AgeBandCode] [int] NULL,
	[AgeBandLabel] [nvarchar](255) NULL,
	[SourceID] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[AgeBandID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Area]    Script Date: 1/8/2022 3:27:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Area](
	[AreaID] [int] IDENTITY(1,1) NOT NULL,
	[AreaCode] [int] NULL,
	[AreaLabel] [nvarchar](255) NULL,
	[SourceID] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[AreaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Casualty]    Script Date: 1/8/2022 3:27:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Casualty](
	[CasualtyID] [int] IDENTITY(1,1) NOT NULL,
	[AccidentID] [int] NULL,
	[CasualtyReference] [int] NULL,
	[GenderID] [int] NULL,
	[Age] [int] NULL,
	[AgeBandID] [int] NULL,
	[CasualtySeverityID] [int] NULL,
	[CasualtyTypeID] [int] NULL,
	[SourceID] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[CasualtyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CasualtySeverity]    Script Date: 1/8/2022 3:27:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CasualtySeverity](
	[CasualtySeverityID] [int] IDENTITY(1,1) NOT NULL,
	[CasualtySeverityCode] [int] NULL,
	[CasualtySeverityLabel] [nvarchar](255) NULL,
	[SourceID] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[CasualtySeverityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CasualtyType]    Script Date: 1/8/2022 3:27:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CasualtyType](
	[CasualtyTypeID] [int] IDENTITY(1,1) NOT NULL,
	[CasualtyTypeCode] [int] NULL,
	[CasualtyTypeLabel] [nvarchar](255) NULL,
	[SourceID] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[CasualtyTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Date]    Script Date: 1/8/2022 3:27:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Date](
	[DateID] [int] IDENTITY(1,1) NOT NULL,
	[Date] [date] NOT NULL,
	[Day] [int] NOT NULL,
	[Month] [int] NOT NULL,
	[Quarter] [int] NOT NULL,
	[Year] [int] NOT NULL,
	[SourceID] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[DateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GenderOfCasualty]    Script Date: 1/8/2022 3:27:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GenderOfCasualty](
	[GenderID] [int] IDENTITY(1,1) NOT NULL,
	[GenderCode] [int] NULL,
	[GenderLabel] [nvarchar](255) NULL,
	[SourceID] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[GenderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[JourneyPurpose]    Script Date: 1/8/2022 3:27:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JourneyPurpose](
	[JourneyPurposeID] [int] IDENTITY(1,1) NOT NULL,
	[JourneyPurposeCode] [int] NULL,
	[JourneyPurposeLabel] [nvarchar](255) NULL,
	[SourceID] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[JourneyPurposeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LocalAuthorityDistrict]    Script Date: 1/8/2022 3:27:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LocalAuthorityDistrict](
	[LocalAuthorityDistrictID] [int] IDENTITY(1,1) NOT NULL,
	[LocalAuthorityDistrictCode] [int] NULL,
	[LocalAuthorityDistrictLabel] [nvarchar](255) NULL,
	[SourceID] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[LocalAuthorityDistrictID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Location]    Script Date: 1/8/2022 3:27:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Location](
	[LocationID] [int] IDENTITY(1,1) NOT NULL,
	[postcode] [varchar](50) NULL,
	[city] [varchar](50) NULL,
	[county] [varchar](50) NULL,
	[country] [varchar](50) NULL,
	[region] [varchar](50) NULL,
	[SourceID] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[LocationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LSOA]    Script Date: 1/8/2022 3:27:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LSOA](
	[LSOAID] [int] IDENTITY(1,1) NOT NULL,
	[LocationID] [int] NULL,
	[lsoa11cd] [varchar](50) NULL,
	[SourceID] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[LSOAID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoadType]    Script Date: 1/8/2022 3:27:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoadType](
	[RoadTypeID] [int] IDENTITY(1,1) NOT NULL,
	[RoadTypeCode] [int] NULL,
	[RoadTypeLabel] [nvarchar](255) NULL,
	[SourceID] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[RoadTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vehicle]    Script Date: 1/8/2022 3:27:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vehicle](
	[VehicleID] [int] IDENTITY(1,1) NOT NULL,
	[AccidentID] [int] NULL,
	[VehicleReference] [int] NULL,
	[VehicleTypeID] [int] NULL,
	[JourneyPurposeID] [int] NULL,
	[SourceID] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[VehicleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VehicleType]    Script Date: 1/8/2022 3:27:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VehicleType](
	[VehicleTypeID] [int] IDENTITY(1,1) NOT NULL,
	[VehicleTypeCode] [int] NULL,
	[VehicleTypeLabel] [nvarchar](255) NULL,
	[SourceID] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[VehicleTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Accident]  WITH CHECK ADD  CONSTRAINT [fk_Accident_AccidentSeverity] FOREIGN KEY([AccidentSeverityID])
REFERENCES [dbo].[AccidentSeverity] ([AccidentSeverityID])
GO
ALTER TABLE [dbo].[Accident] CHECK CONSTRAINT [fk_Accident_AccidentSeverity]
GO
ALTER TABLE [dbo].[Accident]  WITH CHECK ADD  CONSTRAINT [fk_Accident_Area] FOREIGN KEY([AreaID])
REFERENCES [dbo].[Area] ([AreaID])
GO
ALTER TABLE [dbo].[Accident] CHECK CONSTRAINT [fk_Accident_Area]
GO
ALTER TABLE [dbo].[Accident]  WITH CHECK ADD  CONSTRAINT [fk_Accident_LocalAuthorityDistrict] FOREIGN KEY([LocalAuthorityDistrictID])
REFERENCES [dbo].[LocalAuthorityDistrict] ([LocalAuthorityDistrictID])
GO
ALTER TABLE [dbo].[Accident] CHECK CONSTRAINT [fk_Accident_LocalAuthorityDistrict]
GO
ALTER TABLE [dbo].[Accident]  WITH CHECK ADD  CONSTRAINT [fk_Accident_Location] FOREIGN KEY([LocationID])
REFERENCES [dbo].[Location] ([LocationID])
GO
ALTER TABLE [dbo].[Accident] CHECK CONSTRAINT [fk_Accident_Location]
GO
ALTER TABLE [dbo].[Accident]  WITH CHECK ADD  CONSTRAINT [fk_Accident_RoadType] FOREIGN KEY([RoadTypeID])
REFERENCES [dbo].[RoadType] ([RoadTypeID])
GO
ALTER TABLE [dbo].[Accident] CHECK CONSTRAINT [fk_Accident_RoadType]
GO
ALTER TABLE [dbo].[Casualty]  WITH CHECK ADD  CONSTRAINT [fk_Accident_AgeBand] FOREIGN KEY([AgeBandID])
REFERENCES [dbo].[AgeBand] ([AgeBandID])
GO
ALTER TABLE [dbo].[Casualty] CHECK CONSTRAINT [fk_Accident_AgeBand]
GO
ALTER TABLE [dbo].[Casualty]  WITH CHECK ADD  CONSTRAINT [FK_Accident_Casualty] FOREIGN KEY([AccidentID])
REFERENCES [dbo].[Accident] ([AccidentID])
GO
ALTER TABLE [dbo].[Casualty] CHECK CONSTRAINT [FK_Accident_Casualty]
GO
ALTER TABLE [dbo].[Casualty]  WITH CHECK ADD  CONSTRAINT [fk_Accident_CasualtySeverity] FOREIGN KEY([CasualtySeverityID])
REFERENCES [dbo].[CasualtySeverity] ([CasualtySeverityID])
GO
ALTER TABLE [dbo].[Casualty] CHECK CONSTRAINT [fk_Accident_CasualtySeverity]
GO
ALTER TABLE [dbo].[Casualty]  WITH CHECK ADD  CONSTRAINT [fk_Accident_CasualtyType] FOREIGN KEY([CasualtyTypeID])
REFERENCES [dbo].[CasualtyType] ([CasualtyTypeID])
GO
ALTER TABLE [dbo].[Casualty] CHECK CONSTRAINT [fk_Accident_CasualtyType]
GO
ALTER TABLE [dbo].[Casualty]  WITH CHECK ADD  CONSTRAINT [fk_Accident_GenderOfCasualty] FOREIGN KEY([GenderID])
REFERENCES [dbo].[GenderOfCasualty] ([GenderID])
GO
ALTER TABLE [dbo].[Casualty] CHECK CONSTRAINT [fk_Accident_GenderOfCasualty]
GO
ALTER TABLE [dbo].[Vehicle]  WITH CHECK ADD  CONSTRAINT [fk_Accident_JourneyPurpose] FOREIGN KEY([JourneyPurposeID])
REFERENCES [dbo].[JourneyPurpose] ([JourneyPurposeID])
GO
ALTER TABLE [dbo].[Vehicle] CHECK CONSTRAINT [fk_Accident_JourneyPurpose]
GO
ALTER TABLE [dbo].[Vehicle]  WITH CHECK ADD  CONSTRAINT [FK_Accident_Vehicle] FOREIGN KEY([AccidentID])
REFERENCES [dbo].[Accident] ([AccidentID])
GO
ALTER TABLE [dbo].[Vehicle] CHECK CONSTRAINT [FK_Accident_Vehicle]
GO
ALTER TABLE [dbo].[Vehicle]  WITH CHECK ADD  CONSTRAINT [fk_Accident_VehicleType] FOREIGN KEY([VehicleTypeID])
REFERENCES [dbo].[VehicleType] ([VehicleTypeID])
GO
ALTER TABLE [dbo].[Vehicle] CHECK CONSTRAINT [fk_Accident_VehicleType]
GO
USE [master]
GO
ALTER DATABASE [UK_Accidents_NDS] SET  READ_WRITE 
GO
