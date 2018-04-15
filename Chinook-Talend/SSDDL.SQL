/*
Created: 2/19/2018
Modified: 2/19/2018
Model: RE Microsoft SQL Server 2014
Database: MS SQL Server 2014
*/


-- Create tables section -------------------------------------------------

-- Table DimGeography

CREATE TABLE [DimGeography]
(
 [GeographySK] Int NOT NULL,
 [GeographyID] Int NULL,
 [City] Varchar(30) NULL,
 [State] Varchar(30) NULL,
 [Country] Varchar(30) NULL,
 [PostalCode] Varchar(30) NULL,
 [DI_Job_ID] Int NULL,
 [DI_Create_Date] Date NULL,
 [DI_Modified_Date] Date NULL
)
go

-- Add keys for table DimGeography

ALTER TABLE [DimGeography] ADD CONSTRAINT [Key2] PRIMARY KEY ([GeographySK])
go

-- Table DimCustomer

CREATE TABLE [DimCustomer]
(
 [CustomerSK] Int NOT NULL,
 [CustomerID] Int NULL,
 [FirstName] Varchar(50) NULL,
 [SecondName] Varchar(50) NULL,
 [Company] Varchar(50) NULL,
 [Phone] Varchar(30) NULL,
 [Fax] Varchar(30) NULL,
 [Email] Varchar(50) NULL,
 [Street Address] Varchar(100) NULL,
 [GeographySK] Int NULL,
 [DI_Job_ID] Int NULL,
 [DI_Create_Date] Date NULL,
 [DI_Modified_Date] Date NULL
)
go

-- Create indexes for table DimCustomer

CREATE INDEX [IX_Relationship22] ON [DimCustomer] ([GeographySK])
go

-- Add keys for table DimCustomer

ALTER TABLE [DimCustomer] ADD CONSTRAINT [Key3] PRIMARY KEY ([CustomerSK])
go

-- Table DimDate

CREATE TABLE [DimDate]
(
 [DateSK] Int NOT NULL,
 [DayNumberOfWeek] Int NULL,
 [DayNumberOfMonth] Int NULL,
 [MonthNumberOfYear] Int NULL,
 [Year] Int NULL,
 [DI_Job_ID] Int NULL,
 [DI_Create_Date] Date NULL,
 [DI_Modified_Date] Date NULL
)
go

-- Add keys for table DimDate

ALTER TABLE [DimDate] ADD CONSTRAINT [Key1] PRIMARY KEY ([DateSK])
go

-- Table FactSales

CREATE TABLE [FactSales]
(
 [InvoiceID] Int NOT NULL,
 [UnitPrice] Int NULL,
 [Quantity] Int NULL,
 [Total] Int NULL,
 [DateSK] Int NULL,
 [CustomerSK] Int NULL,
 [TrackIDSK] Int NULL,
 [DI_Job_ID] Int NULL,
 [DI_Create_Date] Date NULL,
 [DI_Modified_Date] Date NULL
)
go

-- Create indexes for table FactSales

CREATE INDEX [IX_Relationship20] ON [FactSales] ([DateSK])
go

CREATE INDEX [IX_Relationship21] ON [FactSales] ([CustomerSK])
go

CREATE INDEX [IX_Relationship24] ON [FactSales] ([TrackIDSK])
go

-- Add keys for table FactSales

ALTER TABLE [FactSales] ADD CONSTRAINT [Key8] PRIMARY KEY ([InvoiceID])
go

-- Table DimArtist

CREATE TABLE [DimArtist]
(
 [ArtistSK] Int NOT NULL,
 [ArtistID] Int NULL,
 [ArtistName] Varchar(50) NULL,
 [DI_Job_ID] Int NULL,
 [Attribute2] Char(1) NULL,
 [DI_Create_Date] Date NULL,
 [DI_Modified_Date] Date NULL
)
go

-- Add keys for table DimArtist

ALTER TABLE [DimArtist] ADD CONSTRAINT [Key7] PRIMARY KEY ([ArtistSK])
go

-- Table DimSongs

CREATE TABLE [DimSongs]
(
 [TrackIDSK] Int NOT NULL,
 [TrackName] Varchar(300) NULL,
 [TrackID] Int NULL,
 [PlayListSK] Int NULL,
 [ComposerIDSK] Int NULL,
 [ArtistSK] Int NULL,
 [AlbumName] Varbinary(100) NULL,
 [GenreName] Varchar(100) NULL,
 [MediaTypeName] Varchar(100) NULL,
 [DI_Job_ID] Int NULL,
 [DI_Create_Date] Date NULL,
 [DI_Modified_Date] Date NULL
)
go

-- Create indexes for table DimSongs

CREATE INDEX [IX_Relationship23] ON [DimSongs] ([PlayListSK])
go

CREATE INDEX [IX_Relationship26] ON [DimSongs] ([ComposerIDSK])
go

CREATE INDEX [IX_Relationship27] ON [DimSongs] ([ArtistSK])
go

-- Add keys for table DimSongs

ALTER TABLE [DimSongs] ADD CONSTRAINT [Key6] PRIMARY KEY ([TrackIDSK])
go

-- Table DimPlaylist

CREATE TABLE [DimPlaylist]
(
 [PlayListSK] Int NOT NULL,
 [PlayListName] Varchar(100) NULL,
 [PlaylistID] Int NULL
)
go

-- Add keys for table DimPlaylist

ALTER TABLE [DimPlaylist] ADD CONSTRAINT [Key4] PRIMARY KEY ([PlayListSK])
go

-- Table DimComposer

CREATE TABLE [DimComposer]
(
 [ComposerIDSK] Int NOT NULL,
 [ComposerName] Varchar(50) NULL,
 [DI_Job_ID] Int NULL,
 [DI_Create_Date] Date NULL,
 [DI_Modified_Date] Date NULL
)
go

-- Add keys for table DimComposer

ALTER TABLE [DimComposer] ADD CONSTRAINT [Key5] PRIMARY KEY ([ComposerIDSK])
go

-- Create foreign keys (relationships) section ------------------------------------------------- 


ALTER TABLE [FactSales] ADD CONSTRAINT [Relationship20] FOREIGN KEY ([DateSK]) REFERENCES [DimDate] ([DateSK]) ON UPDATE NO ACTION ON DELETE NO ACTION
go


ALTER TABLE [FactSales] ADD CONSTRAINT [Relationship21] FOREIGN KEY ([CustomerSK]) REFERENCES [DimCustomer] ([CustomerSK]) ON UPDATE NO ACTION ON DELETE NO ACTION
go


ALTER TABLE [DimSongs] ADD CONSTRAINT [Relationship23] FOREIGN KEY ([PlayListSK]) REFERENCES [DimPlaylist] ([PlayListSK]) ON UPDATE NO ACTION ON DELETE NO ACTION
go


ALTER TABLE [DimCustomer] ADD CONSTRAINT [Relationship22] FOREIGN KEY ([GeographySK]) REFERENCES [DimGeography] ([GeographySK]) ON UPDATE NO ACTION ON DELETE NO ACTION
go


ALTER TABLE [FactSales] ADD CONSTRAINT [Relationship24] FOREIGN KEY ([TrackIDSK]) REFERENCES [DimSongs] ([TrackIDSK]) ON UPDATE NO ACTION ON DELETE NO ACTION
go


ALTER TABLE [DimSongs] ADD CONSTRAINT [Relationship26] FOREIGN KEY ([ComposerIDSK]) REFERENCES [DimComposer] ([ComposerIDSK]) ON UPDATE NO ACTION ON DELETE NO ACTION
go


ALTER TABLE [DimSongs] ADD CONSTRAINT [Relationship27] FOREIGN KEY ([ArtistSK]) REFERENCES [DimArtist] ([ArtistSK]) ON UPDATE NO ACTION ON DELETE NO ACTION
go


-- Create roles section -------------------------------------------------

CREATE ROLE [db_accessadmin]
go
CREATE ROLE [db_backupoperator]
go
CREATE ROLE [db_datareader]
go
CREATE ROLE [db_datawriter]
go
CREATE ROLE [db_ddladmin]
go
CREATE ROLE [db_denydatareader]
go
CREATE ROLE [db_denydatawriter]
go
CREATE ROLE [db_owner]
go
CREATE ROLE [db_securityadmin]
go
CREATE ROLE [public]
go

-- Grant permissions section -------------------------------------------------

ALTER ROLE [db_owner] ADD MEMBER [dbo]
go

