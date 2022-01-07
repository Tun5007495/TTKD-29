USE [master]
GO
/****** Object:  Database [UK_Accidents_DDS]    Script Date: 1/8/2022 3:29:22 AM ******/
CREATE DATABASE [UK_Accidents_DDS]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'UK_Accidents_DDS', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\UK_Accidents_DDS.mdf' , SIZE = 139264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'UK_Accidents_DDS_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\UK_Accidents_DDS_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [UK_Accidents_DDS] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [UK_Accidents_DDS].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [UK_Accidents_DDS] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [UK_Accidents_DDS] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [UK_Accidents_DDS] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [UK_Accidents_DDS] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [UK_Accidents_DDS] SET ARITHABORT OFF 
GO
ALTER DATABASE [UK_Accidents_DDS] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [UK_Accidents_DDS] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [UK_Accidents_DDS] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [UK_Accidents_DDS] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [UK_Accidents_DDS] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [UK_Accidents_DDS] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [UK_Accidents_DDS] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [UK_Accidents_DDS] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [UK_Accidents_DDS] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [UK_Accidents_DDS] SET  ENABLE_BROKER 
GO
ALTER DATABASE [UK_Accidents_DDS] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [UK_Accidents_DDS] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [UK_Accidents_DDS] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [UK_Accidents_DDS] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [UK_Accidents_DDS] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [UK_Accidents_DDS] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [UK_Accidents_DDS] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [UK_Accidents_DDS] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [UK_Accidents_DDS] SET  MULTI_USER 
GO
ALTER DATABASE [UK_Accidents_DDS] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [UK_Accidents_DDS] SET DB_CHAINING OFF 
GO
ALTER DATABASE [UK_Accidents_DDS] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [UK_Accidents_DDS] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [UK_Accidents_DDS] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [UK_Accidents_DDS] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'UK_Accidents_DDS', N'ON'
GO
ALTER DATABASE [UK_Accidents_DDS] SET QUERY_STORE = OFF
GO
USE [UK_Accidents_DDS]
GO
/****** Object:  Table [dbo].[DimAccidentSeverity]    Script Date: 1/8/2022 3:29:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimAccidentSeverity](
	[AccidentSeverityID] [int] NOT NULL,
	[AccidentSeverityCode] [int] NULL,
	[AccidentSeverityLabel] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[AccidentSeverityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimAgeBand]    Script Date: 1/8/2022 3:29:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimAgeBand](
	[AgeBandID] [int] NOT NULL,
	[AgeBandCode] [int] NULL,
	[AgeBandLabel] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[AgeBandID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimArea]    Script Date: 1/8/2022 3:29:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimArea](
	[AreaID] [int] NOT NULL,
	[AreaCode] [int] NULL,
	[AreaLabel] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[AreaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimCasualtySeverity]    Script Date: 1/8/2022 3:29:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimCasualtySeverity](
	[CasualtySeverityID] [int] NOT NULL,
	[CasualtySeverityCode] [int] NULL,
	[CasualtySeverityLabel] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[CasualtySeverityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimCasualtyType]    Script Date: 1/8/2022 3:29:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimCasualtyType](
	[CasualtyTypeID] [int] NOT NULL,
	[CasualtyTypeCode] [int] NULL,
	[CasualtyTypeLabel] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[CasualtyTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimDate]    Script Date: 1/8/2022 3:29:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimDate](
	[DateID] [int] NOT NULL,
	[FullDate] [date] NOT NULL,
	[Day] [int] NOT NULL,
	[Month] [int] NOT NULL,
	[Quarter] [int] NOT NULL,
	[Year] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[DateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimGender]    Script Date: 1/8/2022 3:29:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimGender](
	[GenderID] [int] NOT NULL,
	[GenderCode] [int] NULL,
	[GenderLabel] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[GenderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimJourneyPurpose]    Script Date: 1/8/2022 3:29:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimJourneyPurpose](
	[JourneyPurposeID] [int] NOT NULL,
	[JourneyPurposeCode] [int] NULL,
	[JourneyPurposeLabel] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[JourneyPurposeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimLocalAuthorityDistrict]    Script Date: 1/8/2022 3:29:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimLocalAuthorityDistrict](
	[LocalAuthorityDistrictID] [int] NOT NULL,
	[LocalAuthorityDistrictCode] [int] NULL,
	[LocalAuthorityDistrictLabel] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[LocalAuthorityDistrictID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimLocation]    Script Date: 1/8/2022 3:29:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimLocation](
	[LocationID] [int] NOT NULL,
	[Postcode] [varchar](50) NULL,
	[City] [varchar](50) NULL,
	[County] [varchar](50) NULL,
	[Region] [varchar](50) NULL,
	[Country] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[LocationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimRoadType]    Script Date: 1/8/2022 3:29:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimRoadType](
	[RoadTypeID] [int] NOT NULL,
	[RoadTypeCode] [int] NULL,
	[RoadTypeLabel] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[RoadTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimVehicleType]    Script Date: 1/8/2022 3:29:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimVehicleType](
	[VehicleTypeID] [int] NOT NULL,
	[VehicleTypeCode] [int] NULL,
	[VehicleTypeLabel] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[VehicleTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FactAccident]    Script Date: 1/8/2022 3:29:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FactAccident](
	[AccidentID] [int] NOT NULL,
	[AccidentIndex] [varchar](50) NULL,
	[AccidentSeverityID] [int] NULL,
	[NumberOfVehicles] [int] NULL,
	[NumberOfCasualties] [int] NULL,
	[LocalAuthorityDistrictID] [int] NULL,
	[Time] [time](7) NULL,
	[DateID] [int] NULL,
	[RoadTypeID] [int] NULL,
	[SpeedLimit] [int] NULL,
	[AreaID] [int] NULL,
	[LocationID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[AccidentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FactCasualty]    Script Date: 1/8/2022 3:29:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FactCasualty](
	[CasualtyID] [int] NOT NULL,
	[CasualtyReference] [int] NULL,
	[AccidentID] [int] NULL,
	[LADID] [int] NULL,
	[CasualtySeverityID] [int] NULL,
	[CasualtyTypeID] [int] NULL,
	[GenderID] [int] NULL,
	[AgeBandID] [int] NULL,
	[Age] [int] NULL,
	[DateID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[CasualtyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FactVehicle]    Script Date: 1/8/2022 3:29:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FactVehicle](
	[VehicleID] [int] NOT NULL,
	[AccidentID] [int] NULL,
	[VehicleReference] [int] NULL,
	[JourneyPurposeID] [int] NULL,
	[VehicleTypeID] [int] NULL,
	[DateID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[VehicleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[FactAccident]  WITH CHECK ADD  CONSTRAINT [FK_Accident_AccidentSeverity] FOREIGN KEY([AccidentSeverityID])
REFERENCES [dbo].[DimAccidentSeverity] ([AccidentSeverityID])
GO
ALTER TABLE [dbo].[FactAccident] CHECK CONSTRAINT [FK_Accident_AccidentSeverity]
GO
ALTER TABLE [dbo].[FactAccident]  WITH CHECK ADD  CONSTRAINT [FK_Accident_Date] FOREIGN KEY([DateID])
REFERENCES [dbo].[DimDate] ([DateID])
GO
ALTER TABLE [dbo].[FactAccident] CHECK CONSTRAINT [FK_Accident_Date]
GO
ALTER TABLE [dbo].[FactAccident]  WITH CHECK ADD  CONSTRAINT [FK_Accident_LocalAuthorityDistrict] FOREIGN KEY([LocalAuthorityDistrictID])
REFERENCES [dbo].[DimLocalAuthorityDistrict] ([LocalAuthorityDistrictID])
GO
ALTER TABLE [dbo].[FactAccident] CHECK CONSTRAINT [FK_Accident_LocalAuthorityDistrict]
GO
ALTER TABLE [dbo].[FactAccident]  WITH CHECK ADD  CONSTRAINT [FK_Accident_Location] FOREIGN KEY([LocationID])
REFERENCES [dbo].[DimLocation] ([LocationID])
GO
ALTER TABLE [dbo].[FactAccident] CHECK CONSTRAINT [FK_Accident_Location]
GO
ALTER TABLE [dbo].[FactAccident]  WITH CHECK ADD  CONSTRAINT [FK_Accident_RoadType] FOREIGN KEY([RoadTypeID])
REFERENCES [dbo].[DimRoadType] ([RoadTypeID])
GO
ALTER TABLE [dbo].[FactAccident] CHECK CONSTRAINT [FK_Accident_RoadType]
GO
ALTER TABLE [dbo].[FactAccident]  WITH CHECK ADD  CONSTRAINT [FK_Accident_UrbanOrRuralArea] FOREIGN KEY([AreaID])
REFERENCES [dbo].[DimArea] ([AreaID])
GO
ALTER TABLE [dbo].[FactAccident] CHECK CONSTRAINT [FK_Accident_UrbanOrRuralArea]
GO
ALTER TABLE [dbo].[FactCasualty]  WITH CHECK ADD  CONSTRAINT [FK_Casualty_Accident] FOREIGN KEY([AccidentID])
REFERENCES [dbo].[FactAccident] ([AccidentID])
GO
ALTER TABLE [dbo].[FactCasualty] CHECK CONSTRAINT [FK_Casualty_Accident]
GO
ALTER TABLE [dbo].[FactCasualty]  WITH CHECK ADD  CONSTRAINT [FK_Casualty_AgeBand] FOREIGN KEY([AgeBandID])
REFERENCES [dbo].[DimAgeBand] ([AgeBandID])
GO
ALTER TABLE [dbo].[FactCasualty] CHECK CONSTRAINT [FK_Casualty_AgeBand]
GO
ALTER TABLE [dbo].[FactCasualty]  WITH CHECK ADD  CONSTRAINT [FK_Casualty_CasualtySeverity] FOREIGN KEY([CasualtySeverityID])
REFERENCES [dbo].[DimCasualtySeverity] ([CasualtySeverityID])
GO
ALTER TABLE [dbo].[FactCasualty] CHECK CONSTRAINT [FK_Casualty_CasualtySeverity]
GO
ALTER TABLE [dbo].[FactCasualty]  WITH CHECK ADD  CONSTRAINT [FK_Casualty_CasualtyType] FOREIGN KEY([CasualtyTypeID])
REFERENCES [dbo].[DimCasualtyType] ([CasualtyTypeID])
GO
ALTER TABLE [dbo].[FactCasualty] CHECK CONSTRAINT [FK_Casualty_CasualtyType]
GO
ALTER TABLE [dbo].[FactCasualty]  WITH CHECK ADD  CONSTRAINT [FK_Casualty_Date] FOREIGN KEY([DateID])
REFERENCES [dbo].[DimDate] ([DateID])
GO
ALTER TABLE [dbo].[FactCasualty] CHECK CONSTRAINT [FK_Casualty_Date]
GO
ALTER TABLE [dbo].[FactCasualty]  WITH CHECK ADD  CONSTRAINT [FK_Casualty_Gender] FOREIGN KEY([GenderID])
REFERENCES [dbo].[DimGender] ([GenderID])
GO
ALTER TABLE [dbo].[FactCasualty] CHECK CONSTRAINT [FK_Casualty_Gender]
GO
ALTER TABLE [dbo].[FactCasualty]  WITH CHECK ADD  CONSTRAINT [FK_Casualty_LocalAuthorityDistrict] FOREIGN KEY([LADID])
REFERENCES [dbo].[DimLocalAuthorityDistrict] ([LocalAuthorityDistrictID])
GO
ALTER TABLE [dbo].[FactCasualty] CHECK CONSTRAINT [FK_Casualty_LocalAuthorityDistrict]
GO
ALTER TABLE [dbo].[FactVehicle]  WITH CHECK ADD  CONSTRAINT [FK_Vehicle_Accident] FOREIGN KEY([AccidentID])
REFERENCES [dbo].[FactAccident] ([AccidentID])
GO
ALTER TABLE [dbo].[FactVehicle] CHECK CONSTRAINT [FK_Vehicle_Accident]
GO
ALTER TABLE [dbo].[FactVehicle]  WITH CHECK ADD  CONSTRAINT [FK_Vehicle_Date] FOREIGN KEY([DateID])
REFERENCES [dbo].[DimDate] ([DateID])
GO
ALTER TABLE [dbo].[FactVehicle] CHECK CONSTRAINT [FK_Vehicle_Date]
GO
ALTER TABLE [dbo].[FactVehicle]  WITH CHECK ADD  CONSTRAINT [FK_Vehicle_JourneyPurpose] FOREIGN KEY([JourneyPurposeID])
REFERENCES [dbo].[DimJourneyPurpose] ([JourneyPurposeID])
GO
ALTER TABLE [dbo].[FactVehicle] CHECK CONSTRAINT [FK_Vehicle_JourneyPurpose]
GO
ALTER TABLE [dbo].[FactVehicle]  WITH CHECK ADD  CONSTRAINT [FK_Vehicle_VehicleType] FOREIGN KEY([VehicleTypeID])
REFERENCES [dbo].[DimVehicleType] ([VehicleTypeID])
GO
ALTER TABLE [dbo].[FactVehicle] CHECK CONSTRAINT [FK_Vehicle_VehicleType]
GO
USE [master]
GO
ALTER DATABASE [UK_Accidents_DDS] SET  READ_WRITE 
GO
