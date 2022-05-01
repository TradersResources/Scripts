

/*
Master Schema 
Database schema to use 
*/
/* Delete Database Backup and Restore History from MSDB System Database */

/* Insert into the Stocks Tables the stocks being tracked  in SQL Server  */


USE [TradersResourcesW]
GO

INSERT INTO [dbo].[Category] 
			([Code]
           ,[Name]
           ,[Details])
     VALUES ('STK', 'STOCKS', 'Stocks Code'), ('BSK','GROUP', 'Stocks grouping');  
           
GO

INSERT INTO [dbo].[Stocks]
           ([Symbol]
           ,[Name]
           ,[Category]
           ,[AccountId]
           ,[Details])
     VALUES
           ('FB','Facebook','BSK', ' ', 'Basket part of the FAANNGS' ), 
		   ('AAPL','Apple ','BSK', '',  'Basket part of the FAANNGS'),
		   ('AMZN','Amazon','BSK', ' ', 'Basket part of the FAANNGS' ), 
		   ('NVDA','Nivdia','BSK', '',  'Basket part of the FAANNGS'),
		   ('NFLX','Netflix','BSK', ' ', 'Basket part of the FAANNGS' ), 
		   ('GOOGL','Google','BSK', '',  'Basket part of the FAANNGS'),
		   ('SHOP','Shopify','BSK', '',  'Basket part of the FAANNGS'),
		   ('TSLA','Tesla','BSK', ' ', 'Basket part of the Friends' ), 
		   ('TTD','Trade Station','BSK', ' ', 'Basket part of the Friends' ), 
		   ('ROKU','ROKU','BSK', ' ', 'Basket part of the Friends' ), 
		   ('FSLY','Fastly ','BSK', '',  'Basket part of the Friends'),
		   ('BYND','Beyond Meat','BSK', ' ', 'Basket part of the Friends' ), 
		   ('ETSY','ETSY','BSK', '',  'Basket part of the Friends'),
		   ('W','Wayfair','BSK', ' ', 'Basket part of the Friends' ), 
		   ('RUN','Sunrun','BSK', ' ', 'Basket part of the Fiends' ), 
		   ('NIO','NIO','BSK', ' ', 'Basket part of the Fiends' ), 
		   ('PLUG','PLUG','BSK', ' ', 'Basket part of the Fiends' ), 
		   ('SEDG','SEDG','BSK', ' ', 'Basket part of the Fiends' ), 
		   ('FDX','FedEx','BSK', ' ', 'Basket part of the Horizon' ), 
		   ('ULTA','Ultra Beauty','BSK', ' ', 'Basket part of the Horizon' ), 
		   ('GS','Goldman Sachs','BSK', ' ', 'Basket part of the Horizon' ), 
		   ('COF','Capital One','BSK', ' ', 'Basket part of the Horizon' ), 
		   ('COP','Conoco Petro','BSK', ' ', 'Basket part of the Horizon' ), 
		   ('XOM','Exxon','BSK', ' ', 'Basket part of the Horizon' ), 
		   ('RCL','Royal Carribean','BSK', ' ', 'Basket part of the Horizon' ), 
		   ('LUV','Southwest Airlines','BSK', ' ', 'Basket part of the Horizon' ), 
		   ('HD','Home Depot','BSK', ' ', 'Basket part of the Horizon' ), 
		   ('BA','Boeing','BSK', ' ', 'Basket part of the Horizon' ), 
		   ('CMG','Chiplote Grill','BSK', ' ', 'Basket part of the Horizon' ) 

		   ;
GO


INSERT INTO [dbo].[Users]
           ([FirstName]
           ,[LasttName]
           ,[UserLogin]
           ,[UserPassword]
           ,[Details])
     VALUES
           ('David','Lowry','DLowry', 'Password', 'David Lowry Login');
GO


INSERT INTO [dbo].[ChartTypes]
           ([ChartsName]
           ,[ChartsInterval]
           ,[Details])
     VALUES
           ('Weekly','Weekly','Weekly Charts Interval'),
		   ('Daily','Daily','Daily Charts Interval'),
		   ('233 Minute','233 Minute','233 Minute Charts Interval can trade'),
		   ('55 Minute','55 Minute','55 Minute Charts Interval can trade'),
		   ('21 Minute','21 Minute','21 Minute Charts Interval smaller least')
		    ;
GO

INSERT INTO [dbo].[Brokers]
           ([BrokersName]
           ,[SecurityType]
           ,[BrokersDescription]
           ,[BrokersPurpose]
           ,[AccountsId]
           ,[Details])

  VALUES
           ('Ally','Options','Basket', 'Generate Gains in Chunks',' ', ' '),
		   ('USAA','Stocks','Widows and Orphans', 'Generate Monthly income',' ', ' '),
		   ('Schwab','Options','Basket', 'Generate Gains Medium Duration',' ', ' '),
		   ('TD Ameritrade','Options','Earnings', 'Generate Gains Earnings',' ', ' ')

		    ;
GO

INSERT INTO [dbo].[Accounts]
           ([AccountName]
           ,[AccountDescription]
           ,[AccountPurpose]
           ,[AnnualGainTarget]
           ,[BrokerId]
           ,[Details])

VALUES
           ('Basket','Trade Frequent','Make money in Chunks Frequently', '1000',' ', ' '),
		   ('Basket','Trade Fewer Trades Longer duration','Make money in Chunks on a schedule', '1000',' ', ' '),
		   ('Earnings','Trade Earnings','Trade during Earnings cycle make money in hunks apply gains to next trade', '10000',' ', ' '),
		   ('Widows and Orphans','Few Trades Longer Term','Make money in big Stocks movements after declines', '100',' ', ' ')		   
		    ;
GO

