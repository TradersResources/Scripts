/*
IF EXISTS 
   (
     SELECT name FROM master.dbo.sysdatabases 
    WHERE name =  N'TradersResourcesW'
    )
BEGIN
    SELECT 'Database Name already Exist' AS Message

	EXEC msdb.dbo.sp_delete_database_backuphistory @database_name = N'TradersResourcesW'

USE [master]

END
*/
USE MASTER;
GO


USE TradersResourcesW;
GO

/*
CREATE TABLE database_name.schema_name.table_name
(
col1 datatype [NULL | NOT NULL],
col2 datatype [NULL | NOT NULL],
...
)

USE master;
GO

ALTER DATABASE TradersResourcesW;
GO

*/


/* 

This is the area for the trade analysis 

*/

/* TRADE SET UP TABLE */

IF OBJECT_ID('dbo.TradeSetUp', 'U') IS NOT NULL 
  DROP TABLE dbo.TradeSetUp 

CREATE TABLE TradeSetUp (
    TradeSetUpId int IDENTITY(1,1) PRIMARY KEY,
    Symbol varchar(50) NOT NULL,	
	Direction varchar(50) NOT NULL,
	DateOOBounds DATE,
	PriceOOBounds MONEY, 
	DateRevCandle DATE,
	PriceRevCandle MONEY, 
	DateCC DATE,
	PriceCC MONEY, 
	DateFP DATE,
	PriceFP MONEY, 
	DateConfirmHRFP DATE,
	PriceConfirmHRFP MONEY, 
	EntrySignal varchar(50),
	MoveTarget MONEY,
	MoveDuration int,
	TrendChart varchar(50), 
	TradeChart varchar(50), 
	EntryChart varchar(50),
	EventDetails varchar(250), 
	Details varchar(250)
);



/* TRADE DETAILS TABLE */

IF OBJECT_ID('dbo.TradeDetails', 'U') IS NOT NULL 
  DROP TABLE dbo.TradeDetails 

CREATE TABLE TradeDetails (
    TradeDetailsId int IDENTITY(1,1) PRIMARY KEY,
    Symbol varchar(50) NOT NULL,	
	SetupId int,
	TradeType varchar(50),
	TradeCategory varchar(50),
	TradeAccount varchar(50),
	EntryPrice MONEY,
	EntryDate DATE,
	ExitPrice MONEY,
	ExitDate DATE,
	OptionType varchar(50),
	ExpMonth varchar(50),
	StrikePrice MONEY,
	NumContracts int,
	Details varchar(250)
);



