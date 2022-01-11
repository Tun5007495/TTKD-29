Create database UK_Accidents_DDS
Create table DimArea(
	AreaID int  not null,
	AreaCode int,
	AreaLabel nvarchar(255),
	PRIMARY KEY (AreaID)
)

Create table DimLocalAuthorityDistrict(
	LocalAuthorityDistrictID int not null,
	LocalAuthorityDistrictCode int,
	LocalAuthorityDistrictLabel nvarchar(255),
	PRIMARY KEY (LocalAuthorityDistrictID)
)

Create table DimAgeBand(
	AgeBandID int  not null,
	AgeBandCode int,
	AgeBandLabel nvarchar(255),
	PRIMARY KEY (AgeBandID)
)

Create table DimCasualtyType(
	CasualtyTypeID int  not null,
	CasualtyTypeCode int,
	CasualtyTypeLabel nvarchar(255),
	PRIMARY KEY (CasualtyTypeID)
)
Create table DimCasualtySeverity(
	CasualtySeverityID int not null,
	CasualtySeverityCode int,
	CasualtySeverityLabel nvarchar(255),
	PRIMARY KEY (CasualtySeverityID)
)
Create table DimRoadType(
	RoadTypeID int  not null,
	RoadTypeCode int,
	RoadTypeLabel nvarchar(255),
	PRIMARY KEY (RoadTypeID)
)
Create table DimGender(
	GenderID int  not null,
	GenderCode int,
	GenderLabel nvarchar(255),
	PRIMARY KEY (GenderID)
)

Create table DimJourneyPurpose(
	JourneyPurposeID int  not null,
	JourneyPurposeCode int,
	JourneyPurposeLabel nvarchar(255),
	PRIMARY KEY (JourneyPurposeID)
)
CREATE TABLE [DimLocation](
	[LocationID] [int]  not null PRIMARY KEY,
	[Postcode] [varchar](50) NULL,
	[City] [varchar](50) NULL,
	[County] [varchar](50) NULL,
	[Region] [varchar](50) NULL,
	[Country] [varchar](50) NULL
) ON [PRIMARY]
GO

CREATE TABLE [DimDate](
	[DateID]  [int]  not null PRIMARY KEY,
	[FullDate] [date] NOT NULL,
	[Day] [int] NOT NULL,
	[Month] [int] NOT NULL,
	[Quarter] [int] NOT NULL,
	[Year] [int] NOT NULL
) ON [PRIMARY]

Create table DimAccidentSeverity(
	AccidentSeverityID int  not null PRIMARY KEY,
	AccidentSeverityCode int,
	AccidentSeverityLabel nvarchar(255),
)
Go

CREATE TABLE [FactAccident](
	[AccidentID] [int] not null PRIMARY KEY,
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
	[LocationID] [int] NULL
) ON [PRIMARY]
GO

Create table FactCasualty(
	CasualtyID int,
	CasualtyReference int,
	AccidentID int,
	CasualtySeverityID int,
	CasualtyTypeID int,
	GenderID int,
	AgeBandID int,
	Age int,
	DateID int,
	PRIMARY KEY (CasualtyID)
)
go

Create table DimVehicleType(
	VehicleTypeID int,
	VehicleTypeCode int,
	VehicleTypeLabel nvarchar(255),
	PRIMARY KEY (VehicleTypeID)
)

Create table FactVehicle(
	VehicleID int,
	AccidentID int,
	VehicleReference int,
	JourneyPurposeID int,
	VehicleTypeID int,
	DateID int,
	PRIMARY KEY (VehicleID)
)

GO
--Casualty
ALTER TABLE FactCasualty
ADD CONSTRAINT FK_Casualty_CasualtyType
  FOREIGN KEY (CasualtyTypeID)
  REFERENCES DimCasualtyType (CasualtyTypeID);
GO
ALTER TABLE FactCasualty
ADD CONSTRAINT FK_Casualty_AgeBand
  FOREIGN KEY (AgeBandID)
  REFERENCES DimAgeBand (AgeBandID);
GO
ALTER TABLE FactCasualty
ADD CONSTRAINT FK_Casualty_Gender
  FOREIGN KEY (GenderID)
  REFERENCES DimGender (GenderID);
GO
  ALTER TABLE FactCasualty
ADD CONSTRAINT FK_Casualty_LocalAuthorityDistrict
  FOREIGN KEY (LADID)
  REFERENCES DimLocalAuthorityDistrict (LocalAuthorityDistrictID);
GO
ALTER TABLE FactCasualty
ADD CONSTRAINT FK_Casualty_CasualtySeverity
  FOREIGN KEY (CasualtySeverityID)
  REFERENCES DimCasualtySeverity (CasualtySeverityID);
GO
  ALTER TABLE FactCasualty
ADD CONSTRAINT FK_Casualty_Date
  FOREIGN KEY (DateID)
  REFERENCES DimDate (DateID);
GO
      ALTER TABLE FactCasualty
ADD CONSTRAINT FK_Casualty_Accident
  FOREIGN KEY (AccidentID)
  REFERENCES FactAccident (AccidentID);
  --Vehicle
GO
ALTER TABLE FactVehicle
ADD CONSTRAINT FK_Vehicle_JourneyPurpose
  FOREIGN KEY (JourneyPurposeID)
  REFERENCES DimJourneyPurpose (JourneyPurposeID);
GO
ALTER TABLE FactVehicle
ADD CONSTRAINT FK_Vehicle_Date
  FOREIGN KEY (DateID)
  REFERENCES DimDate (DateID);
GO
  ALTER TABLE FactVehicle
ADD CONSTRAINT FK_Vehicle_VehicleType
  FOREIGN KEY (VehicleTypeID)
  REFERENCES DimVehicleType (VehicleTypeID);
GO
    ALTER TABLE FactVehicle
ADD CONSTRAINT FK_Vehicle_Accident
  FOREIGN KEY (AccidentID)
  REFERENCES FactAccident (AccidentID);

--Accident
GO
ALTER TABLE FactAccident
ADD CONSTRAINT FK_Accident_RoadType
  FOREIGN KEY (RoadTypeID)
  REFERENCES DimRoadType (RoadTypeID);
GO
ALTER TABLE FactAccident
ADD CONSTRAINT FK_Accident_UrbanOrRuralArea
  FOREIGN KEY (AreaID)
  REFERENCES DimArea (AreaID);
GO
ALTER TABLE FactAccident
ADD CONSTRAINT FK_Accident_Location
  FOREIGN KEY (LocationID)
  REFERENCES DimLocation (LocationID);
GO
ALTER TABLE FactAccident
ADD CONSTRAINT FK_Accident_Date
  FOREIGN KEY (DateID)
  REFERENCES DimDate (DateID);
GO
ALTER TABLE FactAccident
ADD CONSTRAINT FK_Accident_AccidentSeverity
  FOREIGN KEY (AccidentSeverityID)
  REFERENCES DimAccidentSeverity (AccidentSeverityID);
GO
    ALTER TABLE FactAccident
ADD CONSTRAINT FK_Accident_LocalAuthorityDistrict
  FOREIGN KEY (LocalAuthorityDistrictID)
  REFERENCES DimLocalAuthorityDistrict (LocalAuthorityDistrictID);
