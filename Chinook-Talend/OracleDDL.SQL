/*
Created: 2/22/2018
Modified: 2/22/2018
Model: Oracle 11g Release 2
Database: Oracle 11g Release 2
*/


-- Create tables section -------------------------------------------------

-- Table FactSales

CREATE TABLE "FactSales"(
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
/

-- Create indexes for table FactSales

CREATE INDEX "IX_Relationship20" ON "FactSales" ("DateSK")
/

CREATE INDEX "IX_Relationship21" ON "FactSales" ("CustomerSK")
/

CREATE INDEX "IX_Relationship24" ON "FactSales" ("TrackIDSK")
/

-- Add keys for table FactSales

ALTER TABLE "FactSales" ADD CONSTRAINT "Key8" PRIMARY KEY ("InvoiceID")
/

-- Table DimSongs

CREATE TABLE "DimSongs"(
  "TrackIDSK" Integer NOT NULL,
  "TrackName" Varchar2(300 ),
  "TrackID" Integer,
  "PlayListSK" Integer,
  "ComposerIDSK" Integer,
  "ArtistSK" Integer,
  "AlbumName" Varchar2(150 ),
  "GenreName" Varchar2(100 ),
  "MediaTypeName" Varchar2(100 ),
  "DI_Job_ID" Integer,
  "DI_Create_Date" Date,
  "DI_Modified_Date" Date
)
/

-- Create indexes for table DimSongs

CREATE INDEX "IX_Relationship23" ON "DimSongs" ("PlayListSK")
/

CREATE INDEX "IX_Relationship26" ON "DimSongs" ("ComposerIDSK")
/

CREATE INDEX "IX_Relationship27" ON "DimSongs" ("ArtistSK")
/

-- Add keys for table DimSongs

ALTER TABLE "DimSongs" ADD CONSTRAINT "Key6" PRIMARY KEY ("TrackIDSK")
/

-- Table DimPlaylist

CREATE TABLE "DimPlaylist"(
  "PlayListSK" Integer NOT NULL,
  "PlayListName" Varchar2(100 ),
  "PlaylistID" Integer
)
/

-- Add keys for table DimPlaylist

ALTER TABLE "DimPlaylist" ADD CONSTRAINT "Key4" PRIMARY KEY ("PlayListSK")
/

-- Table DimGeography

CREATE TABLE "DimGeography"(
  "GeographySK" Integer NOT NULL,
  "GeographyID" Integer,
  "City" Varchar2(30 ),
  "State" Varchar2(30 ),
  "Country" Varchar2(30 ),
  "PostalCode" Varchar2(30 ),
  "DI_Job_ID" Integer,
  "DI_Create_Date" Date,
  "DI_Modified_Date" Date
)
/

-- Add keys for table DimGeography

ALTER TABLE "DimGeography" ADD CONSTRAINT "Key2" PRIMARY KEY ("GeographySK")
/

-- Table DimDate

CREATE TABLE "DimDate"(
  "DateSK" Integer NOT NULL,
  "DayNumberOfWeek" Integer,
  "DayNumberOfMonth" Integer,
  "MonthNumberOfYear" Integer,
  "Year" Integer,
  "DI_Job_ID" Integer,
  "DI_Create_Date" Date,
  "DI_Modified_Date" Date
)
/

-- Add keys for table DimDate

ALTER TABLE "DimDate" ADD CONSTRAINT "Key1" PRIMARY KEY ("DateSK")
/

-- Table DimCustomer

CREATE TABLE "DimCustomer"(
  "CustomerSK" Integer NOT NULL,
  "CustomerID" Integer,
  "FirstName" Varchar2(50 ),
  "SecondName" Varchar2(50 ),
  "Company" Varchar2(50 ),
  "Phone" Varchar2(30 ),
  "Fax" Varchar2(30 ),
  "Email" Varchar2(50 ),
  "Street Address" Varchar2(100 ),
  "GeographySK" Integer,
  "DI_Job_ID" Integer,
  "DI_Create_Date" Date,
  "DI_Modified_Date" Date
)
/

-- Create indexes for table DimCustomer

CREATE INDEX "IX_Relationship22" ON "DimCustomer" ("GeographySK")
/

-- Add keys for table DimCustomer

ALTER TABLE "DimCustomer" ADD CONSTRAINT "Key3" PRIMARY KEY ("CustomerSK")
/

-- Table DimComposer

CREATE TABLE "DimComposer"(
  "ComposerIDSK" Integer NOT NULL,
  "ComposerName" Varchar2(50 ),
  "DI_Job_ID" Integer,
  "DI_Create_Date" Date,
  "DI_Modified_Date" Date
)
/

-- Add keys for table DimComposer

ALTER TABLE "DimComposer" ADD CONSTRAINT "Key5" PRIMARY KEY ("ComposerIDSK")
/

-- Table DimArtist

CREATE TABLE "DimArtist"(
  "ArtistSK" Integer NOT NULL,
  "ArtistID" Integer,
  "ArtistName" Varchar2(50 ),
  "DI_Job_ID" Integer,
  "Attribute2" Char(1 ),
  "DI_Create_Date" Date,
  "DI_Modified_Date" Date
)
/

-- Add keys for table DimArtist

ALTER TABLE "DimArtist" ADD CONSTRAINT "Key7" PRIMARY KEY ("ArtistSK")
/


-- Create foreign keys (relationships) section ------------------------------------------------- 

ALTER TABLE "FactSales" ADD CONSTRAINT "Relationship24" FOREIGN KEY ("TrackIDSK") REFERENCES "DimSongs" ("TrackIDSK")
/


ALTER TABLE "FactSales" ADD CONSTRAINT "Relationship21" FOREIGN KEY ("CustomerSK") REFERENCES "DimCustomer" ("CustomerSK")
/


ALTER TABLE "FactSales" ADD CONSTRAINT "Relationship20" FOREIGN KEY ("DateSK") REFERENCES "DimDate" ("DateSK")
/


ALTER TABLE "DimSongs" ADD CONSTRAINT "Relationship27" FOREIGN KEY ("ArtistSK") REFERENCES "DimArtist" ("ArtistSK")
/


ALTER TABLE "DimSongs" ADD CONSTRAINT "Relationship26" FOREIGN KEY ("ComposerIDSK") REFERENCES "DimComposer" ("ComposerIDSK")
/


ALTER TABLE "DimSongs" ADD CONSTRAINT "Relationship23" FOREIGN KEY ("PlayListSK") REFERENCES "DimPlaylist" ("PlayListSK")
/


ALTER TABLE "DimCustomer" ADD CONSTRAINT "Relationship22" FOREIGN KEY ("GeographySK") REFERENCES "DimGeography" ("GeographySK")
/





