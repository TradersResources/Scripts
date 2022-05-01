
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
END

USE [master]
/*GO */

DROP DATABASE [TTRCDevOne];
SELECT 'Database dropped' AS Message


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

IF OBJECT_ID('dbo.Stocks', 'U') IS NOT NULL 
  DROP TABLE stocks.Stocks 

CREATE TABLE Stocks (
    StocksId int IDENTITY(1,1) PRIMARY KEY,
    Symbol varchar(50) NOT NULL,
	Name varchar(50) NOT NULL,
	Category varchar(50),
	AccountId varchar(50),
	Details varchar(250)
);

IF OBJECT_ID('dbo.Accounts', 'U') IS NOT NULL 
  DROP TABLE dbo.Accounts 

CREATE TABLE Accounts (
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

CREATE TABLE Brokers (
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

CREATE TABLE Users (
    UsersId int IDENTITY(1,1) PRIMARY KEY,    
	FirstName varchar(250) NOT NULL,
	LasttName varchar(250) NOT NULL,
	UserLogin varchar(10) NOT NULL,
	UserPassword varchar(10) NOT NULL,
	Details varchar(250) 	
);

IF OBJECT_ID('dbo.ChartTypes', 'U') IS NOT NULL 
  DROP TABLE dbo.ChartTypes

CREATE TABLE ChartTypes (
    ChartTypesId int IDENTITY(1,1) PRIMARY KEY,    
	ChartsName varchar(250) NOT NULL,
	ChartsInterval varchar(250) NOT NULL,
	Details varchar(250) 	
);





IF OBJECT_ID('dbo.DailyCharts', 'U') IS NOT NULL 
  DROP TABLE dbo.DailyCharts

CREATE TABLE DailyCharts (
    DailyChartsId int IDENTITY(1,1) PRIMARY KEY,
	EntryDate [datetime] NULL,
	Symbol varchar(50) NOT NULL,   	
	WeekDirection varchar(50) NOT NULL,
	WeekTarget varchar(50) NOT NULL,
	WeekStatus varchar(50) NOT NULL,	
	WeekNotes varchar(250) NOT NULL,	
	DayDirection varchar(50) NOT NULL,
	DayTarget varchar(50) NOT NULL,	
	DayStatus varchar(50) NOT NULL,		
	DayNotes varchar(250) NOT NULL,	
	TwoThreeDirection varchar(50) NOT NULL,
	TwoThreeTarget varchar(50) NOT NULL,
	TwoThreeStatus varchar(50) NOT NULL,	
	TwoThreeNotes varchar(250) NOT NULL,	
	FiveDirection varchar(50) NOT NULL,
	FiveTarget varchar(50) NOT NULL,
	FiveStatus varchar(50) NOT NULL,	
	FiveNotes varchar(250) NOT NULL,	
	TwOneDirection varchar(50) NOT NULL,
	TwOneTarget varchar(50) NOT NULL,
	TwOneStatus varchar(50) NOT NULL,	
	TwOneNotes varchar(250) NOT NULL,
	Details varchar(250) 	
);


IF OBJECT_ID('dbo.Notes', 'U') IS NOT NULL 
  DROP TABLE dbo.Notes




IF OBJECT_ID('dbo.DailyMovers', 'U') IS NOT NULL 
  DROP TABLE dbo.DailyMovers 

CREATE TABLE DailyMovers (
    DailyMoversId int IDENTITY(1,1) PRIMARY KEY,    
	EntryDate [datetime] NULL,
	Symbols varchar(250) NOT NULL,
	Direction varchar(10) NOT NULL,
	Details varchar(250) 
);

IF OBJECT_ID('dbo.Category', 'U') IS NOT NULL 
  DROP TABLE dbo.Category 

CREATE TABLE Category (
    CategoryId int IDENTITY(1,1) PRIMARY KEY,    
	Code varchar(10) NOT NULL,
	Name varchar(10) NOT NULL,
	Details varchar(250) 
);




 