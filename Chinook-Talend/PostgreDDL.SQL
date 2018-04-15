/*
Created: 2/22/2018
Modified: 2/22/2018
Model: PostgreSQL 9.5
Database: PostgreSQL 9.5
*/


-- Create tables section -------------------------------------------------

-- Table dbo.FactSales

CREATE TABLE "dbo"."FactSales"(
 "InvoiceID" Integer NOT NULL,
 "UnitPrice" Integer,
 "Quantity" Integer,
 "Total" Integer,
 "DateSK" Integer,
 "CustomerSK" Integer,
 "TrackIDSK" Integer,
 "DI_Job_ID" Integer,
 "DI_Create_Date" Date,
 "DI_Modified_Date" Date
)
;

-- Create indexes for table dbo.FactSales

CREATE INDEX "IX_Relationship20" ON "dbo"."FactSales" ("DateSK")
;

CREATE INDEX "IX_Relationship21" ON "dbo"."FactSales" ("CustomerSK")
;

CREATE INDEX "IX_Relationship24" ON "dbo"."FactSales" ("TrackIDSK")
;

-- Add keys for table dbo.FactSales

ALTER TABLE "dbo"."FactSales" ADD CONSTRAINT "Key8" PRIMARY KEY ("InvoiceID")
;

-- Table dbo.DimSongs

CREATE TABLE "dbo"."DimSongs"(
 "TrackIDSK" Integer NOT NULL,
 "TrackName" Character varying(300),
 "TrackID" Integer,
 "PlayListSK" Integer,
 "ComposerIDSK" Integer,
 "ArtistSK" Integer,
 "AlbumName" Character varying(150),
 "GenreName" Character varying(100),
 "MediaTypeName" Character varying(100),
 "DI_Job_ID" Integer,
 "DI_Create_Date" Date,
 "DI_Modified_Date" Date
)
;

-- Create indexes for table dbo.DimSongs

CREATE INDEX "IX_Relationship23" ON "dbo"."DimSongs" ("PlayListSK")
;

CREATE INDEX "IX_Relationship26" ON "dbo"."DimSongs" ("ComposerIDSK")
;

CREATE INDEX "IX_Relationship27" ON "dbo"."DimSongs" ("ArtistSK")
;

-- Add keys for table dbo.DimSongs

ALTER TABLE "dbo"."DimSongs" ADD CONSTRAINT "Key6" PRIMARY KEY ("TrackIDSK")
;

-- Table dbo.DimPlaylist

CREATE TABLE "dbo"."DimPlaylist"(
 "PlayListSK" Integer NOT NULL,
 "PlayListName" Character varying(100),
 "PlaylistID" Integer
)
;

-- Add keys for table dbo.DimPlaylist

ALTER TABLE "dbo"."DimPlaylist" ADD CONSTRAINT "Key4" PRIMARY KEY ("PlayListSK")
;

-- Table dbo.DimGeography

CREATE TABLE "dbo"."DimGeography"(
 "GeographySK" Integer NOT NULL,
 "GeographyID" Integer,
 "City" Character varying(30),
 "State" Character varying(30),
 "Country" Character varying(30),
 "PostalCode" Character varying(30),
 "DI_Job_ID" Integer,
 "DI_Create_Date" Date,
 "DI_Modified_Date" Date
)
;

-- Add keys for table dbo.DimGeography

ALTER TABLE "dbo"."DimGeography" ADD CONSTRAINT "Key2" PRIMARY KEY ("GeographySK")
;

-- Table dbo.DimDate

CREATE TABLE "dbo"."DimDate"(
 "DateSK" Integer NOT NULL,
 "DayNumberOfWeek" Integer,
 "DayNumberOfMonth" Integer,
 "MonthNumberOfYear" Integer,
 "Year" Integer,
 "DI_Job_ID" Integer,
 "DI_Create_Date" Date,
 "DI_Modified_Date" Date
)
;

-- Add keys for table dbo.DimDate

ALTER TABLE "dbo"."DimDate" ADD CONSTRAINT "Key1" PRIMARY KEY ("DateSK")
;

-- Table dbo.DimCustomer

CREATE TABLE "dbo"."DimCustomer"(
 "CustomerSK" Integer NOT NULL,
 "CustomerID" Integer,
 "FirstName" Character varying(50),
 "SecondName" Character varying(50),
 "Company" Character varying(50),
 "Phone" Character varying(30),
 "Fax" Character varying(30),
 "Email" Character varying(50),
 "Street Address" Character varying(100),
 "GeographySK" Integer,
 "DI_Job_ID" Integer,
 "DI_Create_Date" Date,
 "DI_Modified_Date" Date
)
;

-- Create indexes for table dbo.DimCustomer

CREATE INDEX "IX_Relationship22" ON "dbo"."DimCustomer" ("GeographySK")
;

-- Add keys for table dbo.DimCustomer

ALTER TABLE "dbo"."DimCustomer" ADD CONSTRAINT "Key3" PRIMARY KEY ("CustomerSK")
;

-- Table dbo.DimComposer

CREATE TABLE "dbo"."DimComposer"(
 "ComposerIDSK" Integer NOT NULL,
 "ComposerName" Character varying(50),
 "DI_Job_ID" Integer,
 "DI_Create_Date" Date,
 "DI_Modified_Date" Date
)
;

-- Add keys for table dbo.DimComposer

ALTER TABLE "dbo"."DimComposer" ADD CONSTRAINT "Key5" PRIMARY KEY ("ComposerIDSK")
;

-- Table dbo.DimArtist

CREATE TABLE "dbo"."DimArtist"(
 "ArtistSK" Integer NOT NULL,
 "ArtistID" Integer,
 "ArtistName" Character varying(50),
 "DI_Job_ID" Integer,
 "Attribute2" Character(1),
 "DI_Create_Date" Date,
 "DI_Modified_Date" Date
)
;

-- Add keys for table dbo.DimArtist

ALTER TABLE "dbo"."DimArtist" ADD CONSTRAINT "Key7" PRIMARY KEY ("ArtistSK")
;
-- Create foreign keys (relationships) section ------------------------------------------------- 

ALTER TABLE "dbo"."FactSales" ADD CONSTRAINT "Relationship24" FOREIGN KEY ("TrackIDSK") REFERENCES "dbo"."DimSongs" ("TrackIDSK") ON DELETE NO ACTION ON UPDATE NO ACTION
;

ALTER TABLE "dbo"."FactSales" ADD CONSTRAINT "Relationship21" FOREIGN KEY ("CustomerSK") REFERENCES "dbo"."DimCustomer" ("CustomerSK") ON DELETE NO ACTION ON UPDATE NO ACTION
;

ALTER TABLE "dbo"."FactSales" ADD CONSTRAINT "Relationship20" FOREIGN KEY ("DateSK") REFERENCES "dbo"."DimDate" ("DateSK") ON DELETE NO ACTION ON UPDATE NO ACTION
;

ALTER TABLE "dbo"."DimSongs" ADD CONSTRAINT "Relationship27" FOREIGN KEY ("ArtistSK") REFERENCES "dbo"."DimArtist" ("ArtistSK") ON DELETE NO ACTION ON UPDATE NO ACTION
;

ALTER TABLE "dbo"."DimSongs" ADD CONSTRAINT "Relationship26" FOREIGN KEY ("ComposerIDSK") REFERENCES "dbo"."DimComposer" ("ComposerIDSK") ON DELETE NO ACTION ON UPDATE NO ACTION
;

ALTER TABLE "dbo"."DimSongs" ADD CONSTRAINT "Relationship23" FOREIGN KEY ("PlayListSK") REFERENCES "dbo"."DimPlaylist" ("PlayListSK") ON DELETE NO ACTION ON UPDATE NO ACTION
;

ALTER TABLE "dbo"."DimCustomer" ADD CONSTRAINT "Relationship22" FOREIGN KEY ("GeographySK") REFERENCES "dbo"."DimGeography" ("GeographySK") ON DELETE NO ACTION ON UPDATE NO ACTION
;




