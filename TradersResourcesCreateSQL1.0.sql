

/*
Database schema to use 
*/
DROP DATABASE IF EXISTS TradersResources;

-- Schema Music
-- -----------------------------------------------------
CREATE DATABASE IF NOT EXISTS `TradersResources` DEFAULT CHARACTER SET utf8 ;
USE `TradersResources` ;


-- -----------------------------------------------------
-- Table `TradersResources`.`Stocks`
-- -----------------------------------------------------


CREATE TABLE Stocks (
    StockId INT AUTO_INCREMENT,
    Symbol VARCHAR(50) NOT NULL,
    StockName VARCHAR(250) NOT NULL,
	Category VARCHAR(50) NOT NULL,
    AccountId int,
	Details varchar(250) NOT NULL,
    PRIMARY KEY(StockId)
);



CREATE TABLE Accounts (
    AccountsId INT AUTO_INCREMENT,
    AccountName VARCHAR(50) NOT NULL,
	AccountDescription VARCHAR(50) ,
	AccountPurpose VARCHAR(250) ,
	AnnualGainTarget VARCHAR(50),
	BrokerId INT,
	Details VARCHAR(250),
	PRIMARY KEY(AccountsId)

	/*FOREIGN KEY REFERENCES Brokers(BrokerId)	*/
);

CREATE TABLE Brokers (
    BrokersId INT AUTO_INCREMENT,
    BrokersName varchar(50) NOT NULL,
	SecurityType varchar(50) NOT NULL,
	BrokersDescription varchar(50) ,
	BrokersPurpose varchar(250) ,	
	AccountsId int ,	
	Details varchar(250), 
	PRIMARY KEY(BrokersId)
);


CREATE TABLE Users (
    UsersId INT AUTO_INCREMENT,
	FirstName varchar(250) NOT NULL,
	LasttName varchar(250) NOT NULL,
	UserLogin varchar(10) NOT NULL,
	UserPassword varchar(10) NOT NULL,
	Details varchar(250),
	PRIMARY KEY(UsersId)
);



CREATE TABLE ChartTypes (
    ChartTypesId INT AUTO_INCREMENT,    
	ChartsName varchar(250) NOT NULL,
	ChartsInterval varchar(250) NOT NULL,
	Details varchar(250),
	PRIMARY KEY(ChartTypesId)	
);



CREATE TABLE DailyCharts (
    DailyChartsId INT AUTO_INCREMENT,
	EntryDate DATETIME NULL,
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
	Details varchar(250) ,
    PRIMARY KEY(DailyChartsId)	
);



CREATE TABLE DailyMovers (
    DailyMoversId INT AUTO_INCREMENT,    
	EntryDate DATETIME NULL,
	Symbols varchar(250) NOT NULL,
	Direction varchar(10) NOT NULL,
	Details varchar(250),
    PRIMARY KEY(DailyMoversId) 
);


CREATE TABLE Category (
    CategoryId INT AUTO_INCREMENT,    
	Code varchar(10) NOT NULL,
	Name varchar(10) NOT NULL,
	Details varchar(250),
    PRIMARY KEY(CategoryId)
);




 