USE [UK_Accidents]
GO

/****** Object:  Table [dbo].[Accidents_Stage]    Script Date: 12/18/2021 1:53:16 PM ******/

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
CREATE TABLE [dbo].[Casualties_Stage](
	[Accident_Index] [varchar](50) NULL,
	[Casualty_Reference] [int] NULL,
	[Sex_of_Casualty] [int] NULL,
	[Age_of_Casualty] [int] NULL,
	[Age_Band_of_Casualty] [int] NULL,
	[Casualty_Severity] [int] NULL,
	[Casualty_Type] [int] NULL,
) ON [PRIMARY]
GO
CREATE TABLE [dbo].[Vehicles_Stage](
	[Accident_Index] [varchar](50) NULL,
	[Vehicle_Reference] [int] NULL,
	[Vehicle_Type] [int] NULL,
	[Journey_Purpose_of_Driver] [int] NULL,
) ON [PRIMARY]
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
CREATE TABLE [dbo].[LSOA_Stage](
	[pcds] [varchar](50) NOT NULL,
	[pcdssplit] [varchar](10) NULL,
	[lsoa11cd] [varchar](50) NULL,
	[lsoa1split] [varchar](50) NULL,
	[lsoa11nm] [varchar](50) NULL
) ON [PRIMARY]
GO

