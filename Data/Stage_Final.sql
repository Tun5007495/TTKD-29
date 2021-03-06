USE [master]
GO
/****** Object:  Database [UK_Accidents]    Script Date: 1/8/2022 3:26:53 AM ******/
CREATE DATABASE [UK_Accidents]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'UK_Accidents', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\UK_Accidents.mdf' , SIZE = 335872KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'UK_Accidents_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\UK_Accidents_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [UK_Accidents] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [UK_Accidents].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [UK_Accidents] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [UK_Accidents] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [UK_Accidents] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [UK_Accidents] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [UK_Accidents] SET ARITHABORT OFF 
GO
ALTER DATABASE [UK_Accidents] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [UK_Accidents] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [UK_Accidents] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [UK_Accidents] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [UK_Accidents] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [UK_Accidents] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [UK_Accidents] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [UK_Accidents] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [UK_Accidents] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [UK_Accidents] SET  ENABLE_BROKER 
GO
ALTER DATABASE [UK_Accidents] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [UK_Accidents] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [UK_Accidents] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [UK_Accidents] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [UK_Accidents] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [UK_Accidents] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [UK_Accidents] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [UK_Accidents] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [UK_Accidents] SET  MULTI_USER 
GO
ALTER DATABASE [UK_Accidents] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [UK_Accidents] SET DB_CHAINING OFF 
GO
ALTER DATABASE [UK_Accidents] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [UK_Accidents] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [UK_Accidents] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [UK_Accidents] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'UK_Accidents', N'ON'
GO
ALTER DATABASE [UK_Accidents] SET QUERY_STORE = OFF
GO
USE [UK_Accidents]
GO
/****** Object:  Table [dbo].[Accidents_Stage]    Script Date: 1/8/2022 3:26:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accidents_Stage](
	[Accident_Index] [varchar](50) NULL,
	[Accident_Severity] [int] NULL,
	[Number_of_Vehicles] [int] NULL,
	[Number_of_Casualties] [int] NULL,
	[Date] [date] NULL,
	[Time] [time](7) NULL,
	[Local_Authority_(District)] [int] NULL,
	[Road_Type] [int] NULL,
	[Speed_limit] [int] NULL,
	[Urban_or_Rural_Area] [int] NULL,
	[LSOA_of_Accident_Location] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AccidentSeverity_Stage]    Script Date: 1/8/2022 3:26:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccidentSeverity_Stage](
	[code] [int] NULL,
	[label] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AgeBand_Stage]    Script Date: 1/8/2022 3:26:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AgeBand_Stage](
	[code] [int] NULL,
	[label] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AgeGroup_Stage]    Script Date: 1/8/2022 3:26:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AgeGroup_Stage](
	[AgeGroupCode] [int] NULL,
	[AgeGroupLabel] [varchar](50) NULL,
	[AgeFrom] [int] NULL,
	[AgeGroup] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Area_Stage]    Script Date: 1/8/2022 3:26:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Area_Stage](
	[code] [int] NULL,
	[label] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BuiltUpRoad_Stage]    Script Date: 1/8/2022 3:26:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BuiltUpRoad_Stage](
	[BuiltUpRoadCode] [int] NULL,
	[BuildUpRoadLabel] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Casualties_Stage]    Script Date: 1/8/2022 3:26:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Casualties_Stage](
	[Accident_Index] [varchar](50) NULL,
	[Casualty_Reference] [int] NULL,
	[Sex_of_Casualty] [int] NULL,
	[Age_of_Casualty] [int] NULL,
	[Age_Band_of_Casualty] [int] NULL,
	[Casualty_Severity] [int] NULL,
	[Casualty_Type] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CasualType_Stage]    Script Date: 1/8/2022 3:26:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CasualType_Stage](
	[code] [int] NULL,
	[label] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CasualtySeverity_Stage]    Script Date: 1/8/2022 3:26:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CasualtySeverity_Stage](
	[code] [int] NULL,
	[label] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GenderOfCasualty_Stage]    Script Date: 1/8/2022 3:26:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GenderOfCasualty_Stage](
	[code] [int] NULL,
	[label] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[JourneyPurpose_Stage]    Script Date: 1/8/2022 3:26:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JourneyPurpose_Stage](
	[code] [int] NULL,
	[label] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LocalAuthorityDistrict_Stage]    Script Date: 1/8/2022 3:26:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LocalAuthorityDistrict_Stage](
	[code] [int] NULL,
	[label] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LSOA_Stage]    Script Date: 1/8/2022 3:26:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LSOA_Stage](
	[pcds] [varchar](50) NOT NULL,
	[pcdssplit] [varchar](10) NULL,
	[lsoa11cd] [varchar](50) NULL,
	[lsoa1split] [varchar](50) NULL,
	[lsoa11nm] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Postcode_Stage]    Script Date: 1/8/2022 3:26:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Postcode_Stage](
	[postcode] [varchar](50) NULL,
	[city] [varchar](50) NULL,
	[county] [varchar](50) NULL,
	[country_code] [varchar](50) NULL,
	[country_name] [varchar](50) NULL,
	[region_code] [varchar](50) NULL,
	[region_name] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoadType_Stage]    Script Date: 1/8/2022 3:26:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoadType_Stage](
	[code] [int] NULL,
	[label] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vehicles_Stage]    Script Date: 1/8/2022 3:26:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vehicles_Stage](
	[Accident_Index] [varchar](50) NULL,
	[Vehicle_Reference] [int] NULL,
	[Vehicle_Type] [int] NULL,
	[Journey_Purpose_of_Driver] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VehicleType_Stage]    Script Date: 1/8/2022 3:26:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VehicleType_Stage](
	[code] [int] NULL,
	[label] [nvarchar](255) NULL
) ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [UK_Accidents] SET  READ_WRITE 
GO
