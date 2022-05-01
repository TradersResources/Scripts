

/*
Database schema to use 
*/

USE TradersResources


IF OBJECT_ID('dbo.TradeSystem', 'U') IS NOT NULL 
  DROP TABLE dbo.TradeSystem 

CREATE TABLE TradeSystem (
    TradeSystemId int IDENTITY(1,1) PRIMARY KEY,
    Code varchar(50) NOT NULL,
	Purpose varchar(50) NOT NULL,
	TDescription varchar(250)
);

INSERT INTO TradeSystem
(Code, Purpose, TDescription)
VALUES 
('GW','Swing Trading and Wealth Building','Gary Williams Method'),
('EG', 'Swing Trading', 'Easy Guru Trade Method')
;
 


/*


Create Account Table, and related Tables
Accounts, AccountsType, AccountDetails, AccountStatus
AccountActionCodes, AccountTypeRef
*/

IF OBJECT_ID('dbo.Account', 'U') IS NOT NULL 
  DROP TABLE dbo.Account 

CREATE TABLE Account (
    AccountId int IDENTITY(1,1) PRIMARY KEY,
	UserId varchar(50) NOT NULL,
	AccountName varchar(50) NOT NULL,
	AccountTypeId varchar(50) NOT NULL,
	SecurityTypeId varchar(50) NOT NULL,
	TradeTypeCode varchar(50) Not Null DEFAULT 'Sdy',
	OpenDate DateTime NOT NULL,
	AccountBalanace INT NULL,
	AccountActive bit,
	AccountDescription varchar(250) NULL
);

/*
Insert Data into the Account  Table

*/


INSERT INTO Account
(UserId, AccountName, AccountTypeId, SecurityTypeId, TradeTypeCode, OpenDate, AccountBalanace, AccountActive, AccountDescription)
VALUES 
('Dlowry','Desiy Dupree Earnings Options', 'Ern', 'Opt', 'Sdy', '02-27-2018', 0, 1, 'TestLoad'),
('Dlowry','Desiy Dupree Earnings Stock', 'Ern', 'Stk', 'Inc', '02-27-2018', 0, 1, 'TestLoad'),
('Dlowry','Paul Drake Earnings Aggressive', 'Ern', 'Opt', 'Agr', '02-27-2018', 0, 1, 'TestLoad'),
('Dlowry','Perry Mason', 'Ern', 'Opt', 'Agr', '02-27-2018', 0, 1, 'Aggressive ')
;



IF OBJECT_ID('dbo.AccountDetails', 'U') IS NOT NULL 
  DROP TABLE dbo.AccountDetails 


CREATE TABLE AccountDetails (
    AccountDetailsId int IDENTITY(1,1) PRIMARY KEY,
	UserId varchar(50) NOT NULL,
	AccountId varchar(50) NOT NULL,
	ActionCode varchar(20) NOT NULL,
	ActionResult varchar(25) NOT NULL,
	ActionAmount int,
	ActionDate DateTIME,
	ActionNotes varchar(250),
	ActionDescription varchar(250)
);

IF OBJECT_ID('dbo.AccountPlan', 'U') IS NOT NULL 
  DROP TABLE dbo.AccountPlan 


CREATE TABLE AccountPlan (
    AccountPlanId int IDENTITY(1,1) PRIMARY KEY,	
	UserId varchar(50) NOT NULL,
	AccountId varchar(50) NOT NULL,
	PlanYear varchar(10) NOT NULL,
	PlanDuration varchar(50) NOT NULL,
	ActualTradeNumber int,
	PracticeTradeNumber int,
	AvgTradeAmnt int,
	SuccessRateNum int,
	SuccessRatePct decimal(5,4), 
	FailureRateNum int,
	FailureRatePct decimal(5,4), 
	OtherRateNum int,
	OtherRatePct decimal(5,4), 
	AntiAmountGain int
);

IF OBJECT_ID('dbo.AccountActionCodes', 'U') IS NOT NULL 
  DROP TABLE dbo.AccountActionCodes 

CREATE TABLE AccountActionCodes (
    AccounActionCodesId int IDENTITY(1,1) PRIMARY KEY,
    ReferenceTypeId varchar(50) NOT NULL,
	Code varchar(50) NOT NULL,
	CodeDescription varchar(250)
);


INSERT INTO AccountActionCodes
(ReferenceTypeId, Code,CodeDescription)
VALUES 
('Aac', 'Opn','Account Open'),
('Aac', 'Dep','Account Deposit'),
('Aac', 'Trn','Transfer Funds inot Account'),
('Aac', 'Wtd','Withdrawal Funds from Account'),
('Aac', 'Tdg','Trade Gains'),
('Aac', 'Tdl','Trade Losses'),
('Aac', 'Clt','Close out Account')
;

/*
IF OBJECT_ID('dbo.AccountStatus', 'U') IS NOT NULL 
  DROP TABLE dbo.AccountStatus

  */

IF OBJECT_ID('dbo.AccountTypesCodes', 'U') IS NOT NULL 
  DROP TABLE dbo.AccountTypesCodes 

CREATE TABLE AccountTypesCodes (
    AccountTypesId int IDENTITY(1,1) PRIMARY KEY,
	ReferenceTypeId varchar(50) NOT NULL,
	Code varchar(50) NOT NULL,
	ShortDescription varchar(50) NOT NULL,
	LongDescription varchar(250),
	Objectives varchar(250),
	Notes nvarchar(250)
);


INSERT INTO AccountTypesCodes
(ReferenceTypeId, Code, ShortDescription)
VALUES 
('Act','Ern', 'Earnings'),
('Act','Bsk', 'Basket'),
('Act','STK', 'Buy Stock trades'),
('Act','Opt', 'Buy Options Trades'),
('Act','WNO', 'Widows and Orphans'),
('Act','GRW', 'Gary Williams Trades and Techniques'),
('Act','EZG', 'Easy Guru Trades Techniques'),
('Act','FMT', 'Fat Man Trading Techniques'),
('Act','NYP', 'New Years s Pop Trades')
;


/* users section

User related tables 
Users, Userlogin, UserLogin
 
*/

IF OBJECT_ID('dbo.Users', 'U') IS NOT NULL 
  DROP TABLE dbo.Users


CREATE TABLE Users (
    UsersNumberId int IDENTITY(1,1) PRIMARY KEY,
	UserId varchar(50) NOT NULL,
	FirstName varchar(50) NOT NULL,
	LastName varchar(50) NOT NULL,
	CompanytName varchar(50) NOT NULL,
	ContacttName varchar(50) NOT NULL,
	ContactTitle varchar(100),
	UserAddress nvarchar(255) NOT NULL,
	City nvarchar(255) NOT NULL,
	UserState varchar(25) NOT NULL,
	PostalCode nvarchar(50) NOT NULL,
	Country nvarchar(50) NOT NULL ,
	PhoneOne nvarchar(50) ,
	PhoneTwo nvarchar(50) ,
	PhoneThree nvarchar(50) ,
	Fax nvarchar(50) ,
	Email nvarchar(255) ,
	MiscOne nvarchar(50),
	MiscTwo nvarchar(50),
	MisThree nvarchar(50),
	MisFour nvarchar(50),
	MiscFive nvarchar(50), 
	UserStatus bit Not Null 

);

INSERT INTO Users
(UserId, FirstName, LastName, CompanytName, ContacttName, ContactTitle, City, UserAddress, UserState, PostalCode, Country, UserStatus )
VALUES 
('Dlowry','David', 'Lowry', 'NineTen Group', 'David Lowry', 'El Patron', '112 Hyco Blvd #198', 'Myrtle Beach ', 'SC', '28111',  'US', 1 )
;


IF OBJECT_ID('dbo.UserDetails', 'U') IS NOT NULL 
  DROP TABLE dbo.UserDetails


CREATE TABLE UserDetails (
    UserId varchar(50) PRIMARY KEY,
    UserLoginId varchar(50) NOT NULL,
	UserPAssword varchar(50) ,
	Email varchar(50) ,
	Notes varchar(250) 	
);

/*
Refrence Related Tables
IndustryCodes, SeasonsReference, ReferenceCodes, MenuOptions, 

Monthl References:
MonthlyDetail, 

Industry Codes, Reference Codes, Month Reference, Menu Options, Seasons Reference Table
Monthly Status  MonthlyMarket Calendar, 
*/
/*
IF OBJECT_ID('dbo.MenuOptions', 'U') IS NOT NULL 
  DROP TABLE dbo.MenuOptions 


CREATE TABLE MenuOptions (
    MenuOptionsId int IDENTITY(1,1) PRIMARY KEY,
    ReferenceTypeId varchar(50) NOT NULL,
	MenuName varchar(50) NOT NULL,
	MenuCode varchar(50) NOT NULL,
	MenutDescription varchar(250) 	
);


INSERT INTO MenuOptions
(ReferenceTypeId,MenuName, MenuCode, MenutDescription)

VALUES
('008','Mnu', 'Home', 'Link to the Home Page'),
('008','Mnu', 'Accounts', 'Link to the Accounts Page'),
('008','Mnu', 'Traders', 'Link to the Traders Page'),
('008','Mnu', 'Stocks', 'Link to the Stocks Page'),
('008','Mnu', 'Login', 'Link to the Login Page')
;
*/
IF OBJECT_ID('dbo.ReferenceCodes', 'U') IS NOT NULL 
  DROP TABLE dbo.ReferenceCodes 

CREATE TABLE ReferenceCodes (
    ReferenceId int IDENTITY(1,1) PRIMARY KEY,
    ReferenceTypeId varchar(50) NOT NULL,
	ReferenceType varchar(50) NOT NULL,
	ShortDescription varchar(50), 
	LongDescription varchar(250)
);
/*
Insert Data into the ReferenceCodes Table


INSERT INTO ReferenceCodes
(ReferenceTypeId, ReferenceType, ShortDescription, LongDescription)
VALUES
('001','Mon', 'Month Calendar Reference Guide', 'Month Calendar'),
('002','Chr', 'Charts Trends Guide', 'Trend Decision Action Charts Guide'),
('003','Trz', 'Trade Zones Guide', 'Trade Zones Guide'),
('004','Sea', 'Seasons Zones Guide', 'Seasons Earnings and Warnings Guide'),
('005','Ern', 'Earnings Season ', 'Seasons Earnings '),
('005','Wrn', 'Warnings Season ', 'Warnings Earnings '),
('007','Ind', 'Industry Codes ', 'Industry Specific Codes specify stocks trading in groups'),
('008','Mnu', 'Menu Options ', 'Menu Options '),
('009','Act', 'Account Types', 'Different Account Types with different functions'),
('010','Aac', 'Account Action Codes', 'Different Account actions which can be taken within an account')

;
*/
IF OBJECT_ID('dbo.SeasonsReference', 'U') IS NOT NULL 
  DROP TABLE dbo.SeasonsReference 

CREATE TABLE SeasonsReference (
    SeasonsReferneceId int IDENTITY(1,1) PRIMARY KEY,
	ReferenceTypeId varchar(50) NOT NULL,
    SeasonsDescription varchar(50) NOT NULL,
	SeasonsTypeCode varchar(50),
	StartDatee varchar(50) NOT NULL,
	EndDate varchar(50) NOT NULL,
	Notes varchar(250)
	
);

INSERT INTO SeasonsReference
(SeasonsDescription, ReferenceTypeId, SeasonsTypeCode,  StartDatee, EndDate, Notes)

VALUES 
('Earnings', '005', 'Ern',  '01-04', '02-15', 'January Winter Earnings Period hard and fast until middle end of January then takes a break picks up again'),
('Warnings', '006', 'Wrn',  '02-14', '04-04', 'Winter warnings season upside bias so drops should be fast and limited in depth but if they are then consider it a warnings for a possible pull back later in the year'),
('Earnings', '005', 'Ern',  '04-04', '05-15', 'Spring Earnings Season very choppy take profits fast use Daily as trend chart'),
('Warnings', '006', 'Wrn',  '05-15', '07-04', 'Spring Warnings leads into July Fourth Pop, Starts with May sell off and money moving out bottoms in middl eof june'),
('Earnings', '005', 'Ern',  '07-04', '08-15', 'Summer earnings choppy take profits fast should be huge quick moves excellent chance to make larg esums fast must be engaged all the time 233 charts trend'),
('Warnings', '006', 'Wrn',  '08-15', '10-04', 'Summer time warnings huge sell off comes fast and lasts, only interrupted by Labor Day pop which coincides with money moving back into stocks, then sell offs to settle accounts'),
('Earnings', '005', 'Ern',  '10-04', '11-15', 'Fall earnings take profits quickly at first and always be careful of market crash, after 27 of cotober should fly the market into november can use dialy and weekly charts for trends'),
('Warnings', '006', 'Wrn',  '11-15', '01-04', 'Fall warnings season expect pullback on charts low point should be black friday, pay attention to retail sales during november and retail earnings can be good or bad but will be plays either direction')
;


IF OBJECT_ID('dbo.IndustryCodes', 'U') IS NOT NULL 
  DROP TABLE dbo.IndustryCodes 

CREATE TABLE IndustryCodes (
    IndustryCodesId int IDENTITY(1,1) PRIMARY KEY,
    ReferenceTypeId varchar(50) NOT NULL,
	Code varchar(50) NOT NULL,
	CodeDescription varchar(250)
);


INSERT INTO IndustryCodes
(ReferenceTypeId, Code,CodeDescription)
VALUES 
('Ind', 'SHP','Shipping and Logistics'),
('Ind', 'SFT','Software and Applications'),
('Ind', 'BEV','Beverages Soft Drinks'),
('Ind', 'CON','Farm and Construction'),
('Ind', 'MED','Media Diversified'),
('Ind', 'RET','Speciality Retail'),
('Ind', 'SMC','Semi Conductors'),
('Ind', 'AED','Aerospace and Defense')
;

/*
Time based Tables
Monthly Reference Tables
Years Ending in

*/

IF OBJECT_ID('dbo.MonthlYOverview', 'U') IS NOT NULL 
  DROP TABLE dbo.MonthlYOverview 

CREATE TABLE MonthlYOverview (
    MonthReferenceId int IDENTITY(1,1) PRIMARY KEY,
    ReferenceTypeId varchar(50) NOT NULL,
	MonthCode varchar(50) NOT NULL,
	MonthDescription varchar(50) NOT NULL,
	MonthType varchar(50) NOT NULL,
	MonthNotes varchar(250) NOT NULL
);

INSERT INTO MonthlYOverview
(ReferenceTypeId, MonthCode, MonthDescription, MonthType, MonthNotes)

VALUES
('001','Jan', 'January', 'BULL', 'Good Month Strong Aggressive trades'),
('001','Feb', 'Febuary', 'BULL', 'After some early profit taking expect Strong push high Strong Aggressive trades'),
('001','Mar', 'March', 'BEAR', ''),
('001','Apr', 'April', 'BULL', ''),
('001','May', 'May', 'BULL', ''),
('001','Jun', 'June', 'BEAR', 'Look for heavy selling beginning in the month start of summer very choopy season, expect bottom around 16 - 20 look for call entry points then'),
('001','Jul', 'July', 'BULL', 'Generally a good month take profits quickly good earnings time starts july 4 but fast trades, trade quick and often'),
('001','Aug', 'August', 'BEAR', 'Beginning of month very good end of earnings but ends fast and with vicious pull back end of the month look for call entries 26 - 30 for Labor Day Pop'),
('001','Sep', 'September', 'BEAR', 'Month starts with bang Labor Day pop then pulls back throughout the month until the end '),
('001','Oct', 'October', 'BULL', 'Scray month expect to start well enough take profits quickly market bottoms  occur here'),
('001','Nov', 'November', 'BULL', 'Generally a good month expect it to fly starting early in the month and last for two weeks until Middle expect heavy selling retail good look for buying opps'),
('001','Dec', 'December', 'Nue', 'Start with a small pop , if retail is good play earnings if not expect sell off to last until the end of the month')

;



IF OBJECT_ID('dbo.MonthlYMarketCalendar', 'U') IS NOT NULL 
  DROP TABLE dbo.MonthlYMarketCalendar 

CREATE TABLE MonthlYMarketCalendar (
    MonthReferenceId int IDENTITY(1,1) PRIMARY KEY,
    ReferenceTypeId varchar(50) NOT NULL,
	MonthCode varchar(50) NOT NULL,
	MonthDescription varchar(50) NOT NULL,
	EarlyMonthGuide varchar(250), 
	EarlyMonthPeriod varchar(250), 
	MiddleMonthGuide varchar(250), 
	MiddleMonthPeriod varchar(250), 	
	EndMonthGuide varchar(250) ,
	EndMonthPeriod varchar(250)	
);

INSERT INTO MonthlYMarketCalendar
(ReferenceTypeId, MonthCode, MonthDescription, EarlyMonthGuide, EarlyMonthPeriod, MiddleMonthGuide, MiddleMonthPeriod,
EndMonthGuide, EndMonthPeriod
)

VALUES('001','Jan', 'January', 'Pop', '01-15','Drop', '15-25', 'Pop', '25-31'),
('001','Feb', 'Febuary', 'Pop', '01-12', 'Drop','12-20', 'Pop', '20-28'),
('001','Mar', 'March', 'Pop', '01-14', 'Drop','14-26', 'Pop', '26-31'),
('001','Apr', 'April', 'Pop', '01-15', 'Drop','15-24', 'Pop', '24-30'),
('001','May', 'May', 'Pop', '01-15', 'Pop','15-25', 'Drop', '25-31'),
('001','Jun', 'June', 'Drop', '01-16', 'Nue','16-20', 'Pop', '20-30'),
('001','Jul', 'July', 'Pop', '01-16', 'Drop','16-20', 'Pop', '20-31'),
('001','Aug', 'August', 'Pop', '01-10', 'Drop','16-20', 'Drop', '20-31'),
('001','Sep', 'September', 'Pop', '01-10', 'Drop','16-25', 'Pop', '25-31'),
('001','Oct', 'October', 'Pop', '01-8', 'Drop','8-27', 'Pop', '27-31'),
('001','Nov', 'November', 'Pop', '01-18', 'Drop','18-27', 'Drop', '27-31'),
('001','Dec', 'December', 'Drop', '01-8', 'Pop','8-15', 'Drop', '20-31')
;


IF OBJECT_ID('dbo.ActualMonthMarketCalendar', 'U') IS NOT NULL 
  DROP TABLE dbo.ActualMonthMarketCalendar 

CREATE TABLE ActualMonthMarketCalendar (
    YearDesc varchar(50) NOT NULL,
    MonthDesc varchar(50) NOT NULL,	
	EarlyDir varchar(50), 
	EarlyPerdStartDate varchar(50), 
	EarlyPerdEndDate varchar(50), 
	MidDir varchar(50), 	
	MidPerdStartDate varchar(50) ,
	MidPerdEndDate varchar(50),
	EndDir varchar(50) ,
	EndPerdStartDate varchar(50) ,
	EndPerdEndDate	varchar(50) 
);

/*
INSERT INTO MonthlYMarketCalendar
(ReferenceTypeId, MonthCode, MonthDescription, EarlyMonthGuide, EarlyMonthPeriod, MiddleMonthGuide, MiddleMonthPeriod,
EndMonthGuide, EndMonthPeriod
)

VALUES('001','Jan', 'January', 'Pop', '01-15','Drop', '15-25', 'Pop', '25-31'),
('001','Feb', 'Febuary', 'Pop', '01-12', 'Drop','12-20', 'Pop', '20-28'),
('001','Mar', 'March', 'Pop', '01-14', 'Drop','14-26', 'Pop', '26-31'),
('001','Apr', 'April', 'Pop', '01-15', 'Drop','15-24', 'Pop', '24-30'),
('001','May', 'May', 'Pop', '01-15', 'Pop','15-25', 'Drop', '25-31'),
('001','Jun', 'June', 'Drop', '01-16', 'Nue','16-20', 'Pop', '20-30'),
('001','Jul', 'July', 'Pop', '01-16', 'Drop','16-20', 'Pop', '20-31'),
('001','Aug', 'August', 'Pop', '01-10', 'Drop','16-20', 'Drop', '20-31'),
('001','Sep', 'September', 'Pop', '01-10', 'Drop','16-25', 'Pop', '25-31'),
('001','Oct', 'October', 'Pop', '01-8', 'Drop','8-27', 'Pop', '27-31'),
('001','Nov', 'November', 'Pop', '01-18', 'Drop','18-27', 'Drop', '27-31'),
('001','Dec', 'December', 'Drop', '01-8', 'Pop','8-15', 'Drop', '20-31')
;

*/


IF OBJECT_ID('dbo.MonthlyDetail', 'U') IS NOT NULL 
  DROP TABLE dbo.MonthlyDetail
  
CREATE TABLE MonthlyDetail (
  MonthStatusId int IDENTITY(1,1) PRIMARY KEY,
  ReferenceTypeId varchar(50) NOT NULL,
  MonthCode varchar(50) NOT NULL,
  MonthDescription varchar(50) NOT NULL,
  MonthOverview varchar (50) NOT NULL, 
  EarlyAntiDirection varchar(50) NOT NULL,
  MiddleAntiDirection varchar(50) NOT NULL,
  LateyAntiDirection varchar(50) NOT NULL,
  Notes varchar(250) NOT NULL
  );


INSERT INTO MonthlyDetail
(ReferenceTypeId, MonthCode, MonthDescription, MonthOverview, EarlyAntiDirection, MiddleAntiDirection, LateyAntiDirection, Notes)


VALUES
('001','Jan', 'January', 'BULL', 'Pop', 'Small Drop', 'Pop', 'Good Month Strong Aggressive trades expect some pullback in the middle'),
('001','Feb', 'Febuary', 'BULL', 'Pullback', 'Small Pop', 'Pullback', 'Expect some selling at the start of the month r early part then some buying upside towards the middle end of the month expect heavy selling'),
('001','Mar', 'March', 'BEAR', 'Pullback', 'Small Pop', 'Pullback', 'Look for a small pop after the sell off in FEB very early in the month. Generallt a tough tired stock market. Look for call entry points between 15th and end of the month'),
('001','Apr', 'April', 'BULL', 'Pop', 'Small Drop', 'Pullback', 'Generally a good month 1-10 rising market, 10-20 sell off falling market towards the end of the month look for call entry points on May earnings'),
('001','May', 'May', 'NUETRAL', 'Pop', 'Small Pop', 'Pullback', 'First of the month 1-15 rising market after 15 expect nuetral to heavy selling especially heading to the end of the month, 15th look for Puts and Short Sells'),
('001','Jun', 'June', 'BEAR', 'Pullback', 'Pullback', 'Snall Pop', 'Look for call buying opportunities between 7-22. Summer months can be choppy or just dead, prepare foir both, low volume. Watch call entry points last 2-3 days of the month, especially July earnings season'),
('001','Jul', 'July', 'BULL', 'Pop', 'Small Pop', 'Pullback', 'Can be good but look for profit taking mid month> Another summer month generally choppy time in the market. Use profit taking in mid month to look for call eentry points on charts for stocks with an AUgust Earnings '),
('001','Aug', 'August', 'BEAR', 'Pullback', 'Small Pop', 'Pullback', 'Earnings ends quickly. Usually a choppy market with negative bias. Look for heavy profit taking last 10 days of the month. Watch the charts for buying entry points during the last few days of the month for Post Labor Day Bounce'),
('001','Sep', 'September', 'BEAR', 'Pullback', 'Small Pop', 'Pullback', 'Sometime during the first ten days look for a uupward pop in the market followed by a hard sudden sell off. Usually stinks after the 10th of the month. Look for buying opportunities last few days of the month for Stocks with October Earnings'),
('001','Oct', 'October', 'BULL', 'Pullback', 'Small Pop', 'Pullback', 'Scray time most market crashes happen here, huge downward pressure on the markets. Play with caution take profits quickly. Look for entry points last 3-4 days of the month. The last few days or week great place to purchase vault stocks watch daily and weekly charts Christmas Cross'),
('001','Nov', 'November', 'BULL', 'Pop', 'Small Pop', 'Pullback', 'If no October crash expect markets to fly first 2-3 weeks, Then look for heavy profit taking from mid month to the end, Turkey Day to the end Black Friday'),
('001','Dec', 'December','BEEAR', 'Nuetral', 'Small Pop', 'Pullback', 'Expect heavy profit taking continuing from November until 5-8. Look for buying calls 5-8. Can be good month known as Santa Claus effect. Market is choppy major buying calls from 15-22. Market suffers hangover from 22 until end of the month. Last 2-3 days buy stocks for New Years Day Pop')

;



IF OBJECT_ID('dbo.YearsEndingIn', 'U') IS NOT NULL 
  DROP TABLE dbo.YearsEndingIn
  
  CREATE TABLE YearsEndingIn (
    
    YearsEndingNumber varchar(50) NOT NULL PRIMARY KEY,
	YearsEndingDirection varchar(50) , 
	YearsEndingDescription varchar(500) NOT NULL,
	
);
INSERT INTO YearsEndingIn
(YearsEndingNumber, YearsEndingDirection, YearsEndingDescription)
VALUES 
 ('0', 'BIG BULL', 'Roaring bull market, may continue to hit highs, it is likely to develop a hard resistance that will begin to kill the bull market move usually in the fall around October.'),
 ('1', 'BEAR', 'Typically a bear or bearish market begins, market will begin to slide off from the highs of the previous year and decline harder as the number of people experiencing larger losses, after a small rally in the late spring stalls the market slides as more people “head for the hills” and start sitting on the sidelines… a pronounced late summer (Aug/Sept) slide should be expected.'),
 ('2', 'BEAR', 'Bear market, the market generally hits lows in the years ending in 2 (generally late in the year), the market is generally flat to down with very small upside moves and larger downside moves. Expect a sharper downside slide during the summer trading zone. The market frequently hits its low in October or retests its summer low… the fall low is typically the death of the bear market.'),
 ('3', 'LITTLE BEAR', 'Baby bull market, the lows of the previous year will frequently be tested (hit again) early in the year (generally by March / April), the rest of the year is ROBUST to the upside.'), 
 ('4', 'BABY BEAR OR BULL', 'A sluggish bull market (as the market digests (like you after Thanksgiving lunch) the gains seen in the last half of the previous year), generally a good year but not as robust as the year ending in 3… a very good Oct – Jan move should be expected'),
 ('5', 'BULL', 'Bull market, typically a good year that is exceptionally strong to the upside on the whole, especially in the fall / winter zone. The early part of the year can have some significant moves in both directions but the summer slide is seldom seen (certainly not to the degree seen in other years) and may just be slightly down or up with more of a sideways move expected.'),
 ('6', 'BULL', 'Bull market, typically trading mostly sideways to up as it digests the gains of the previous year. Good moves in both directions the first half of the year is normal. A good upward movement in the fall / winter trading zone is expected.'),
 ('7', 'BULL', 'Bull market that becomes very choppy with larger swings in both directions… expect a hard sell off (often considered a CRASH or at least a severe correction) typically in October. The depth of the “Crash” or decline is generally a great buy point for positions for the vault and may likely be the low point of the next few years.'),
 ('8', 'BULL', 'Bull market that simply continues the rise that began following the drop of last year with strong moves up followed by brief sideways digestion before further gains to the upside continue… a sharp summer decline is likely that scares a lot of people out of the market… following a Sept or Oct low an extremely strong fall trading zone is typical.'),
 ('9', 'BIG BULL', 'Roaring bull market that generally hits its high this year or next with stocks seeing HUGE (crazy unfounded moves)… large moves now beginning to be seen in BOTH DIRECTIONS.')


/*
Create Stocks Table, and related Tables
Stocks, StocksAccount, StockEarnings, StocksAssigned 
*/

IF OBJECT_ID('dbo.Stocks', 'U') IS NOT NULL 
  DROP TABLE dbo.Stocks 

CREATE TABLE Stocks (
    StocksId int IDENTITY(1,1) PRIMARY KEY,
    Symbol varchar(50) NOT NULL,
	StockName varchar(250), 
	IndustryCode varchar(50),
	MajorPLayer bit

);

INSERT INTO Stocks
(Symbol, StockName, IndustryCode, MajorPlayer)
VALUES 
('FDX','Federal Express','SHP', 1),
('RHT','Red Hat','SFT', 1),
('ADBE','Adobe','SFT', 1),
('FIZZ','Fizz Beverages','BEV', 0),
('CAT','Catepillar','CON', 1),
('NVDA','Nividia','SMC', 1),
('AMZN','Amazon','RET', 1),
('NGO','Northrup Grumman','AED', 1)
;


IF OBJECT_ID('dbo.StocksAssigned', 'U') IS NOT NULL 
  DROP TABLE dbo.StocksAssigned 

CREATE TABLE StocksAssigned (
    StocksAssignedId int IDENTITY(1,1) PRIMARY KEY,
    StockId varchar(50) NOT NULL,
	AccountId varchar(250)	

);

INSERT INTO StocksAssigned
(StockId, AccountId)
VALUES 
('1','2')
;
IF OBJECT_ID('dbo.StocksEarnings', 'U') IS NOT NULL 
  DROP TABLE dbo.StocksEarnings 

CREATE TABLE StocksEarnings (
    StocksEarningsId int IDENTITY(1,1) PRIMARY KEY,
    EarningsQuarter varchar(50) NOT NULL,
	StockId varchar(50) NOT NULL,
	Symbol varchar(50) NOT NULL,
	EarningsDate DATETIME, 
	ReleaseTime varchar(50) DEFAULT 'After',
	AccountId varchar(50) NOT NULL,
	MiscOne varchar(50), 
	MiscTwo varchar(50), 
	MiscThree varchar(50), 
	MiscFour varchar(250), 
	MiscFive varchar(250)
	
);
/*
INSERT INTO StocksEarnings
(EarningsQuarter, StockId, Symbol, EarningsDate,  ReleaseTime, AccountId)
VALUES 
('SPR16', '9', 'AA', CAST('2018-04-18' AS datetime), 'After', '1')
;
*/
/*

Historical perspective for each stock to be used as a guideline

*/


IF OBJECT_ID('dbo.EarningsResearch', 'U') IS NOT NULL 
  DROP TABLE dbo.EarningsResearch
  
   


/*
Charts Sections


*/

IF OBJECT_ID('dbo.ChartsReference', 'U') IS NOT NULL 
  DROP TABLE dbo.ChartsReference 

CREATE TABLE ChartsReference (
    ChartsReferenceId int IDENTITY(1,1) PRIMARY KEY,
    ReferenceTypeId varchar(50) NOT NULL,
	TradeZoneId varchar(50) NOT NULL,
	TrendChart varchar(50) NOT NULL,
	DecisionChart varchar(50) NOT NULL,
	ActionChart varchar(50) NOT NULL
);
/*

INSERT INTO ChartsReference
(ReferenceTypeId,TradeZoneID, TrendChart, DecisionChart, ActionChart)
VALUES 
 ('002','001', 'Weekly', 'Daily', '21'),
 ('002','002', 'Daily', '55', '8'),
 ('002','002', 'Daily', '233', '21'),
 ('002','003', '233', '34', '8'),
 ('002','003', '55', '21', '1') 
 ;
  
  */
/*
Trades Sections
Trades, TradeDetails, TradeEvents, TradeGroup, TradePlan, TradeReference, TradeZone, TradeExecutionPlan
*/

IF OBJECT_ID('dbo.TradeExecutionPlan', 'U') IS NOT NULL 
  DROP TABLE dbo.TradeExecutionPlan

CREATE TABLE TradeExecutionPlan (
    TradeExecutionPlanId int IDENTITY(1,1) PRIMARY KEY,
    TradeId varchar(50) NOT NULL,
	TrendChart varchar(50) NOT NULL,
	DecisionChart varchar(50) NOT NULL,
	ActionChart varchar(50) NOT NULL,
	TradingZoneCode varchar(20) NOT NULL,
	TradeReason varchar(250) NOT NULL,	
	LossExit SMALLINT NOT NULL,
	LossExitPCT DECIMAL(5,0) NOT NULL,
	TradeZoneDescription varchar(250) NOT NULL,
	TradeZoneStartDate varchar(50) NOT NULL,
	TradeZoneEndDate varchar(50) NOT NULL,
	TradeZoneOverview varchar(250),
	TradeZoneEarly varchar(250),
	TradeZoneLate varchar(250)
);


IF OBJECT_ID('dbo.TradeZone', 'U') IS NOT NULL 
  DROP TABLE dbo.TradeZone 

CREATE TABLE TradeZone (
    TradeZoneId int IDENTITY(1,1) PRIMARY KEY,
    TradeZoneCode varchar(50) NOT NULL,	
	TradeZoneDescription varchar(250) NOT NULL,
	TradeZoneStartDate varchar(50) NOT NULL,
	TradeZoneEndDate varchar(50) NOT NULL,
	TradeZoneOverview varchar(250),
	TradeZoneEarly varchar(250),
	TradeZoneLate varchar(250)
);


INSERT INTO TradeZone
(TradeZoneCode, TradeZoneDescription, TradeZoneStartDate, TradeZoneEndDate )
VALUES 
 ('FWZ', 'Fall Winter Zone', '10/20', '01/20'),
 ('SPZ', 'Spring Transitional Zone', '01/20', '05/20'),
 ('STZ', 'Summertime Trading Zone', '05/20', '10/15');

 
 
IF OBJECT_ID('dbo.TradeEvents', 'U') IS NOT NULL 
  DROP TABLE dbo.TradeEvents 

CREATE TABLE TradeEvents (
    TradeEventId int IDENTITY(1,1) PRIMARY KEY,
    TradeEventCode varchar(50) NOT NULL,
	TradeEventDirection varchar(50) , 
	TradeEventDescription varchar(250) NOT NULL,
	TradeEventStartDate varchar(50) ,
	TradeEventEndDate varchar(50) ,
	TradeEventExpectation varchar(250),
	TradeEDescription varchar(250)	
);

INSERT INTO TradeEvents
(TradeEventCode, TradeEventDirection, TradeEventDescription)
VALUES 
 ('NYD', 'POP', 'New Years Day Pop'),
 ('LBD', 'POP', 'Labor Day Pop'),
 ('TKD', 'DRP', 'Black Friday Thanksgiving Pullback'),
 ('JFD', 'POP', 'July Fourth Pop'), 
 ('MDP', 'POP', 'Memorial Day Pop'),
 ('TDP', 'POP', 'Tax Day Rally Pop')
 ;

 

/*
Rules and guidelines sections 

AccountRules Trading Account Rules applies to trading accounhts
YearsEnding what to look for in each year from a historical perspective


*/


 
IF OBJECT_ID('dbo.AccountRules', 'U') IS NOT NULL 
  DROP TABLE dbo.AccountRules 


/*
CREATE TABLE AccountRules (
    
	AccountId varchar(50) NOT NUL PRIMARY KEYL
	AccountTypeId varchar(50) NOT NULL,
	SecurityTypeId varchar(50) NOT NULL,
	AccountObjectiove varchar(50) NOT NULL,
	AccountGoals varchar(50) NOT NULL

	Plans based on quarterly trades
	TradePlanSDuration
	'Quarterly, Monthly, Seasonal, Annual, weekly"
	Percent of Basket into the next trade
	"Any number"
	Purpose of the Account
	"Income, Bricks, Boulders, Rocks"
	Target Gain Amount per trade
	"Any number"
	Target number of trades per trade duraiton
	"Any number"



	Trades
	Duration
	Gains
	Losses
	TradeType


	AccountTypeId varchar(50) NOT NULL,

    TradeEventCode varchar(50) NOT NULL,
	TradeEventDirection varchar(50) , 
	TradeEventDescription varchar(250) NOT NULL,
	TradeEventStartDate varchar(50) ,
	TradeEventEndDate varchar(50) ,
	TradeEventExpectation varchar(250),
	TradeEDescription varchar(250)	
);


EATE TABLE Account (
    AccountId int IDENTITY(1,1) PRIMARY KEY,
	UserId varchar(50) NOT NULL,
	AccountName varchar(50) NOT NULL,
	AccountTypeId varchar(50) NOT NULL,
	SecurityTypeId varchar(50) NOT NULL,
	TradeTypeCode varchar(50) Not Null DEFAULT 'Sdy',
	OpenDate DateTime NOT NULL,
	AccountBalanace INT NULL,
	AccountActive bit,
	AccountDescription varchar(250) NULL
);


INSERT INTO TradeEvents
(TradeEventCode, TradeEventDirection, TradeEventDescription)
VALUES 
 ('NYD', 'POP', 'New Years Day Pop'),
 ('LBD', 'POP', 'Labor Day Pop'),
 ('TKD', 'DRP', 'Black Friday Thanksgiving Pullback'),
 ('JFD', 'POP', 'July Fourth Pop'), 
 ('MDP', 'POP', 'Memorial Day Pop'),
 ('TDP', 'POP', 'Tax Day Rally Pop')
 ;


 */



/*
Research 


YearsEnding what to look for in each year from a historical perspective


*/



 ;

 