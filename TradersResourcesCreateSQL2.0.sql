
/*
Master Schema 
Database schema to use 
*/
/* Delete Database Backup and Restore History from MSDB System Database */

USE [master]

IF EXISTS 
   (
     SELECT name FROM master.dbo.sysdatabases 
     WHERE name =  N'TTRCDevOne'
    )
   	SELECT 'Database Name already Exist' AS Message

BEGIN
	EXEC msdb.dbo.sp_delete_database_backuphistory @database_name = N'TTRCDevOne'	
	SELECT 'Database will be dropped' AS Message
	DROP DATABASE [TTRCDevOne];
	SELECT 'Database dropped' AS Message
END

USE [master]
/*GO */

CREATE DATABASE [TTRCDevOne];
  
GO  


USE [TTRCDevOne]
GO 


/****** Object:  Database [TradersResourcesW]    Script Date: 6/7/2021 10:02:39 PM ******/
/*IF OBJECT_ID('TradersResourcesW', 'U') IS NOT NULL 
DROP DATABASE [TradersResourcesW]
GO
*/


/* THIS IS AN ESSENTIAL TABLES WILL BE SEEDED */

/* Schema for the Stocks */

DROP SCHEMA IF EXISTS Stocks
BEGIN
  EXEC('CREATE SCHEMA Stocks AUTHORIZATION [dbo]')  
 END

IF (SCHEMA_ID('Stocks') IS NULL) 
BEGIN
    EXEC ('CREATE SCHEMA [Stocks] AUTHORIZATION [dbo]')
END


IF OBJECT_ID('dbo.Stocks', 'U') IS NOT NULL 
  DROP TABLE stocks.Stocks 

CREATE TABLE Stocks.Stocks (
    StocksId int IDENTITY(1,1) PRIMARY KEY,
    Symbol varchar(50) NOT NULL,
	Name varchar(50) NOT NULL,
	Category varchar(50),
	AccountId varchar(50),
	Details varchar(250)
);


/* Schema for the Users */

DROP SCHEMA IF EXISTS Users
BEGIN
  EXEC('CREATE SCHEMA Users AUTHORIZATION [dbo]')  
 END

IF (SCHEMA_ID('Users') IS NULL) 
BEGIN
    EXEC ('CREATE SCHEMA [Users] AUTHORIZATION [dbo]')
END

IF OBJECT_ID('dbo.Accounts', 'U') IS NOT NULL 
  DROP TABLE dbo.Accounts 

CREATE TABLE Users.Accounts (
    AccountsId int IDENTITY(1,1) PRIMARY KEY,
    AccountName varchar(50) NOT NULL,
	AccountDescription varchar(50) ,
	AccountPurpose varchar(250) ,
	AnnualGainTarget varchar(50),
	BrokerId int,
	Details varchar(250) 

	/*FOREIGN KEY REFERENCES Brokers(BrokerId)	*/
);

IF OBJECT_ID('dbo.Brokers', 'U') IS NOT NULL 
  DROP TABLE dbo.Brokers 

CREATE TABLE Users.Brokers (
    BrokersId int IDENTITY(1,1) PRIMARY KEY,
    BrokersName varchar(50) NOT NULL,
	SecurityType varchar(50) NOT NULL,
	BrokersDescription varchar(50) ,
	BrokersPurpose varchar(250) ,	
	AccountsId int ,	
	Details varchar(250) 
);


IF OBJECT_ID('dbo.Users', 'U') IS NOT NULL 
  DROP TABLE dbo.Users 

CREATE TABLE Users.Users (
    UsersId int IDENTITY(1,1) PRIMARY KEY,    
	FirstName varchar(250) NOT NULL,
	LasttName varchar(250) NOT NULL,
	UserLogin varchar(10) NOT NULL,
	UserPassword varchar(10) NOT NULL,
	Details varchar(250) 	
);


/* Schema for the Charts */

DROP SCHEMA IF EXISTS Charts
BEGIN
  EXEC('CREATE SCHEMA Charts AUTHORIZATION [dbo]')  
 END

IF (SCHEMA_ID('Charts') IS NULL) 
BEGIN
    EXEC ('CREATE SCHEMA [Charts] AUTHORIZATION [dbo]')
END


IF OBJECT_ID('dbo.Types', 'U') IS NOT NULL 
  DROP TABLE dbo.ChartTypes

CREATE TABLE Charts.Types (
    ChartTypesId int IDENTITY(1,1) PRIMARY KEY,    
	ChartsName varchar(250) NOT NULL,
	ChartsInterval varchar(250) NOT NULL,
	Details varchar(250) 	
);


/* Schema for the Daily Tasks 'Daily' */

DROP SCHEMA IF EXISTS Daily
BEGIN
  EXEC('CREATE SCHEMA Daily AUTHORIZATION [dbo]')  
 END

IF (SCHEMA_ID('Daily') IS NULL) 
BEGIN
    EXEC ('CREATE SCHEMA [Daily] AUTHORIZATION [dbo]')
END


IF OBJECT_ID('dbo.DailyCharts', 'U') IS NOT NULL 
  DROP TABLE dbo.DailyCharts

CREATE TABLE Daily.Charts (
    DailyChartsId int IDENTITY(1,1) PRIMARY KEY,
	EntryDate [datetime] NULL,
	Symbol varchar(50) NOT NULL,   	
	WeeklyDirection varchar(50) NOT NULL,
	WeeklyTarget varchar(50) NOT NULL,
	WeeklyNotes varchar(250) NOT NULL,	
	DailyDirection varchar(50) NOT NULL,
	DailyTarget varchar(50) NOT NULL,		
	DailyNotes varchar(250) NOT NULL,		
	FiveFiveDirection varchar(50) NOT NULL,
	FiveFiveTarget varchar(50) NOT NULL,	
	FiveFiveNotes varchar(250) NOT NULL,		
	Details varchar(250) 	
);


IF OBJECT_ID('dbo.DailyNotes', 'U') IS NOT NULL 
  DROP TABLE dbo.Notes

CREATE TABLE Daily.Notes (
    DailyNotesId int IDENTITY(1,1) PRIMARY KEY,    
	EntryDate [datetime] NULL,	
	Details varchar(250) NOT NULL
);


IF OBJECT_ID('dbo.DailyMovers', 'U') IS NOT NULL 
  DROP TABLE dbo.DailyMovers 

CREATE TABLE Daily.Movers (
    DailyMoversId int IDENTITY(1,1) PRIMARY KEY,    
	EntryDate [datetime] NULL,
	Symbols varchar(250) NOT NULL,
	DOWDirection varchar(10) NOT NULL,
	DOWAmouunt varchar(10) NULL,
	NASDAQDirection varchar(10) NOT NULL,
	NASDAQAmouunt varchar(10) NULL,
	Details varchar(250) 
);


/* Schema for the Daily Tasks 'System' */

DROP SCHEMA IF EXISTS System
BEGIN
  EXEC('CREATE SCHEMA System AUTHORIZATION [dbo]')  
 END

IF (SCHEMA_ID('System') IS NULL) 
BEGIN
    EXEC ('CREATE SCHEMA [System] AUTHORIZATION [dbo]')
END



IF OBJECT_ID('dbo.Category', 'U') IS NOT NULL 
  DROP TABLE dbo.Category 

CREATE TABLE System.Category (
    CategoryId int IDENTITY(1,1) PRIMARY KEY,    
	Code varchar(10) NOT NULL,
	Name varchar(10) NOT NULL,
	Details varchar(250) 
);




 