--CREATING DATABASE
USE master
GO

IF DB_ID('computerCaseShop') IS NOT NULL
ALTER DATABASE computerCaseShop SET SINGLE_USER WITH ROLLBACK IMMEDIATE;

GO

--DROP DATABASE
IF DB_ID('computerCaseShop') IS NOT NULL DROP DATABASE computerCaseShop;

-- If database could not be created due to open connections, abort
IF @@ERROR = 3702
RAISERROR('Database cannot be dropped because there are still open connections.', 127, 127) WITH NOWAIT, LOG;

-- Create database
CREATE DATABASE computerCaseShop;
GO

USE computerCaseShop
GO


USE computerCaseShop;

create table Logs(
		CONSTRAINT Pkey_logs PRIMARY KEY(logid),
		logid integer NOT NULL IDENTITY,
		date nvarchar(50) NOT NULL,
		tablename nvarchar(50) NOT NULL,
		operationdetails nvarchar(200) NOT NULL
);

CREATE TABLE Workers
(
  workerid        INT          NOT NULL IDENTITY,
  firstname       NVARCHAR(20) NOT NULL,
  lastname        NVARCHAR(20) NOT NULL,
  birthdate       DATETIME     NOT NULL,
  hiredate        DATETIME     NOT NULL,
  address         NVARCHAR(60) NOT NULL,
  city            NVARCHAR(15) NOT NULL,
  country         NVARCHAR(15) NOT NULL,
  phone           NVARCHAR(24) NOT NULL,
  CONSTRAINT PK_Employees PRIMARY KEY(workerid),
);

CREATE TABLE Clients
(
  clientid     INT          NOT NULL IDENTITY,
  firstname  NVARCHAR(40) NOT NULL,
  lastname  NVARCHAR(30) NOT NULL,
  address      NVARCHAR(60) NOT NULL,
  city         NVARCHAR(30) NOT NULL,
  country      NVARCHAR(20) NOT NULL,
  phone        NVARCHAR(24) NOT NULL,
  email          NVARCHAR(40) NULL,
  CONSTRAINT PK_Customers PRIMARY KEY(clientid)
);


CREATE TABLE Shippers
(
  shipperid   INT          NOT NULL IDENTITY,
  name        NVARCHAR(40) NOT NULL,
  phone       NVARCHAR(24) NOT NULL,
  CONSTRAINT PK_Shippers PRIMARY KEY(shipperid)
);

CREATE TABLE Categories
(
  categoryid   INT           NOT NULL IDENTITY,
  categoryname NVARCHAR(15)  NOT NULL,
  CONSTRAINT PK_Categories PRIMARY KEY(categoryid)
);

CREATE TABLE Manufacturers
(
  manufacturerid   INT          NOT NULL IDENTITY,
  companyname  NVARCHAR(40) NOT NULL,
  address      NVARCHAR(60) NOT NULL,
  city         NVARCHAR(15) NOT NULL,
  country      NVARCHAR(30) NOT NULL,
  phone        NVARCHAR(24) NOT NULL,
  CONSTRAINT PK_Suppliers PRIMARY KEY(manufacturerid)
);

CREATE TABLE Products
(
  caseid    INT          NOT NULL IDENTITY,
  casename  NVARCHAR(90) NOT NULL,
  manufacturerid   INT          NOT NULL,
  categoryid   INT          NOT NULL,
  unitprice    MONEY        NOT NULL

  CONSTRAINT PK_Products PRIMARY KEY(caseid),
 
  CONSTRAINT FK_Products_Categories FOREIGN KEY(categoryid)
    REFERENCES Categories(categoryid),
 
  CONSTRAINT FK_Products_Manufacturers FOREIGN KEY(manufacturerid)
    REFERENCES Manufacturers(manufacturerid),
);

CREATE TABLE Sales
(
  saleid        INT          NOT NULL IDENTITY,
  clientid         INT          NULL,
  caseid         INT          NULL,
  workerid          INT          NOT NULL,
  shipperid      INT          NOT NULL,
  saledate      DATETIME     NOT NULL,

  CONSTRAINT PK_Sales PRIMARY KEY(saleid),

  CONSTRAINT FK_Sales_Clients FOREIGN KEY(clientid)
    REFERENCES Clients(clientid),

  CONSTRAINT FK_Sales_Products FOREIGN KEY(caseid)
    REFERENCES Products(caseid),

  CONSTRAINT FK_Sales_Workers FOREIGN KEY(workerid)
    REFERENCES Workers(workerid),

  CONSTRAINT FK_Sales_Shippers FOREIGN KEY(shipperid)
    REFERENCES Shippers(shipperid)
);

--END OF CREATING DATABASE STRUCTURE

--ADDING DATA

-- Workers table
SET IDENTITY_INSERT Workers OFF;
SET IDENTITY_INSERT Workers ON;

INSERT INTO Workers(workerid, firstname, lastname, birthdate, hiredate, address, city, country, phone)
  VALUES(1, 'Grzegorz', 'Wojtiuk', '19981008 00:00:00.000', '20180926 00:00:00.000', 'Fio³kowa 68', 'Bia³a Podlaska', 'Poland', '996 997 998');
INSERT INTO Workers(workerid,firstname, lastname, birthdate, hiredate, address, city, country, phone)
  VALUES(2, 'Artur', 'Kondraciuk', '19990427 00:00:00.000', '20181021 00:00:00.000', 'Narutowicza 68', 'Lublin', 'Poland', '768 665 213');
INSERT INTO Workers(workerid, firstname, lastname, birthdate, hiredate, address, city, country, phone)
  VALUES(3, 'Henryk', 'Soko³owski', '19890610 00:00:00.000', '20181112 00:00:00.000', 'Krótka 117', 'Warszawa', 'Poland', '788 812 205');
INSERT INTO Workers(workerid, firstname, lastname, birthdate, hiredate, address, city, country, phone)
  VALUES(4, 'Klara', 'Kowalczyk', '19990514 00:00:00.000', '20190202 00:00:00.000', 'Che³miñska 41', 'Poznañ', 'Poland', '662 882 822');
INSERT INTO Workers(workerid, firstname, lastname, birthdate, hiredate, address, city, country, phone)
  VALUES(5, 'Kinga', 'Kamiñska', '19870409 00:00:00.000', '20190520 00:00:00.000', 'Al. Piastów 28', 'Szczecin', 'Poland', '607 097 994');

SET IDENTITY_INSERT Workers OFF;


--clients table
SET IDENTITY_INSERT Clients OFF;
SET IDENTITY_INSERT Clients ON;

  INSERT INTO Clients(clientid, firstname, lastname, address, city, country, phone, email)
  VALUES(1, 'Grzegorz', 'Brzêczyszczykiewicz', 'Rumiankowa 18', 'Szczebrzeszyn', 'Poland', '669 712 456', 'g.brzeczyszczykiewicz@gmail.com');
  INSERT INTO Clients(clientid, firstname, lastname, address, city, country, phone, email)
  VALUES(2, 'Julia', 'Wróblewska', 'Wita Stwosza 112', 'Starachowice', 'Poland', '548 355 123', 'j.wroblewska@gmail.com');
  INSERT INTO Clients(clientid, firstname, lastname, address, city, country, phone, email)
  VALUES(3, 'Aleksander', 'Wiœniewski', 'Dzia³kowa 9', 'Stargard Szczeciñski', 'Poland', '668 123 457', 'a.wisniewski@gmail.com');
  INSERT INTO Clients(clientid, firstname, lastname, address, city, country, phone, email)
  VALUES(4, 'Weronika', 'Przybylska', 'Wroc³awska 64', 'Be³chatów', 'Poland', '784 522 654', 'w.przybylska@gmail.com');
  INSERT INTO Clients(clientid, firstname, lastname, address, city, country, phone, email)
  VALUES(5, 'Tomasz', 'Kowalski', 'Morcinka 10', 'Franciszków', 'Poland', '654 822 387', 'tomasz.k@gmail.com');
  INSERT INTO Clients(clientid, firstname, lastname, address, city, country, phone, email)
  VALUES(6, 'Maria', 'Wróbel', 'Osiedlowa 22', 'Nysa', 'Poland', '584 354 865', 'maria.maria@gmail.com');
  INSERT INTO Clients(clientid, firstname, lastname, address, city, country, phone, email)
  VALUES(7, 'Iga', 'Maciejewska', 'Sikorskiego 18', 'Skalbmierz', 'Poland', '548 265 444', 'i.maciej@gmail.com');
  INSERT INTO Clients(clientid, firstname, lastname, address, city, country, phone, email)
  VALUES(8, 'Aleksander', 'Górski', 'Grabowa 99', 'Œwidnik', 'Poland', '779 584 633', 'akgorski@gmail.com');
  INSERT INTO Clients(clientid, firstname, lastname, address, city, country, phone, email)
  VALUES(9, 'Stanis³aw', 'Szewczyk', 'Krucza 54', 'Koszalin', 'Poland', '555 458 699', 'szewcu@gmail.com');
  INSERT INTO Clients(clientid, firstname, lastname, address, city, country, phone, email)
  VALUES(10, 'Karol', 'Gajewski', 'Jarzêbinowa 5', 'Gliwice', 'Poland', '736 622 589', 'karol.g@gmail.com');

SET IDENTITY_INSERT Clients OFF;

--shippers table
SET IDENTITY_INSERT Shippers OFF;
SET IDENTITY_INSERT Shippers ON;

  INSERT INTO Shippers(shipperid, name, phone)
  VALUES(1, 'DHL', '789 456 123');
  INSERT INTO Shippers(shipperid, name, phone)
  VALUES(2, 'DPD', '555 464 515');
  INSERT INTO Shippers(shipperid, name, phone)
  VALUES(3, 'InPost', '444 555 666');
  INSERT INTO Shippers(shipperid, name, phone)
  VALUES(4, 'FedEx', '516 416 716');

SET IDENTITY_INSERT Shippers OFF;


--categories table

SET IDENTITY_INSERT Categories OFF;
SET IDENTITY_INSERT Categories ON;

  INSERT INTO Categories(categoryid, categoryname)
  VALUES(1, 'Micro Tower');
  INSERT INTO Categories(categoryid, categoryname)
  VALUES(2, 'Mini Tower');
  INSERT INTO Categories(categoryid, categoryname)
  VALUES(3, 'Midi Tower');
  INSERT INTO Categories(categoryid, categoryname)
  VALUES(4, 'Cube Tower');
  INSERT INTO Categories(categoryid, categoryname)
  VALUES(5, 'Full Tower');

SET IDENTITY_INSERT Categories OFF;


--manufacturers table

SET IDENTITY_INSERT Manufacturers OFF;
SET IDENTITY_INSERT Manufacturers ON;

  INSERT INTO Manufacturers(manufacturerid, companyname, address, city, country, phone)
  VALUES(1, 'Thermaltake', 'Oststraße 1c', 'Norderstedt', 'Niemcy', '403 085 860');
  INSERT INTO Manufacturers(manufacturerid, companyname, address, city, country, phone)
  VALUES(2, 'Cooler Master', '4820 Schaefer Ave', 'Chino', 'Stany Zjednoczone', '909 673 988');
  INSERT INTO Manufacturers(manufacturerid, companyname, address, city, country, phone)
  VALUES(3, 'Fractal Design', 'Datavägen 37', 'Askim', 'Szwecja', '235 489 687');
  INSERT INTO Manufacturers(manufacturerid, companyname, address, city, country, phone)
  VALUES(4, 'Aerocool', 'Pacific Street 11c', 'Union City', 'Stany Zjednoczone', '510 661 994');
  INSERT INTO Manufacturers(manufacturerid, companyname, address, city, country, phone)
  VALUES(5, 'Chieftec', 'Váci út 95', 'Budapest', 'Wêgry', '128 881 000');
  INSERT INTO Manufacturers(manufacturerid, companyname, address, city, country, phone)
  VALUES(6, 'LC-Power', 'Formerweg 8', 'Willich', 'Niemcy', '180 599 758');

SET IDENTITY_INSERT Manufacturers OFF;

--manufacturers table

SET IDENTITY_INSERT Products OFF;
SET IDENTITY_INSERT Products ON;
--micro tower
  INSERT INTO Products(caseid, casename, manufacturerid, categoryid, unitprice)
  VALUES(1, 'MasterBox Q300L','2','1','198.99');
  INSERT INTO Products(caseid, casename, manufacturerid, categoryid, unitprice)
  VALUES(2, 'Cove V21','1','1','319');
  INSERT INTO Products(caseid, casename, manufacturerid, categoryid, unitprice)
  VALUES(3, 'Define Mini C TG','3','1','377.99');
  INSERT INTO Products(caseid, casename, manufacturerid, categoryid, unitprice)
  VALUES(4, 'MasterBox Lite 3.1','2','1','189.90');
  --mini tower
  INSERT INTO Products(caseid, casename, manufacturerid, categoryid, unitprice)
  VALUES(5, 'N200','2','2','212.26');
  INSERT INTO Products(caseid, casename, manufacturerid, categoryid, unitprice)
  VALUES(6, 'Elite 130','2','2','221.38');
  INSERT INTO Products(caseid, casename, manufacturerid, categoryid, unitprice)
  VALUES(7, 'Core V1','1','2','219');
  INSERT INTO Products(caseid, casename, manufacturerid, categoryid, unitprice)
  VALUES(8, 'QS-182','4','2','160.96');
  INSERT INTO Products(caseid, casename, manufacturerid, categoryid, unitprice)
  VALUES(9, 'Meshify Mini C TG','3','2','393.82');
  --midi tower
  INSERT INTO Products(caseid, casename, manufacturerid, categoryid, unitprice)
  VALUES(10, 'Define R5','3','3','602.31');
  INSERT INTO Products(caseid, casename, manufacturerid, categoryid, unitprice)
  VALUES(11, 'Define S','3','3','352.20');
  INSERT INTO Products(caseid, casename, manufacturerid, categoryid, unitprice)
  VALUES(12, 'Cylon','4','3','166.65');
  INSERT INTO Products(caseid, casename, manufacturerid, categoryid, unitprice)
  VALUES(13, 'Pro-925B','6','3','162.82');
  INSERT INTO Products(caseid, casename, manufacturerid, categoryid, unitprice)
  VALUES(14, 'UK-02B-OP','5','3','141.24')
  INSERT INTO Products(caseid, casename, manufacturerid, categoryid, unitprice)
  VALUES(15, 'Gaming 984B Dragonslayer','6','3','202.10');
  --cube tower
  INSERT INTO Products(caseid, casename, manufacturerid, categoryid, unitprice)
  VALUES(16, 'Elite 110','2','4','189.90');
  INSERT INTO Products(caseid, casename, manufacturerid, categoryid, unitprice)
  VALUES(17, 'CI-01B-OP','5','4','229');
  INSERT INTO Products(caseid, casename, manufacturerid, categoryid, unitprice)
  VALUES(18, 'Node 304','3','4','389');
  INSERT INTO Products(caseid, casename, manufacturerid, categoryid, unitprice)
  VALUES(19, 'Level 20 XT','1','4','919');
  --full tower
  INSERT INTO Products(caseid, casename, manufacturerid, categoryid, unitprice)
  VALUES(20, 'Level 20 TG','1','5','4595.42');
  INSERT INTO Products(caseid, casename, manufacturerid, categoryid, unitprice)
  VALUES(21, 'Cosmos C700M','2','5','1447.59');
  INSERT INTO Products(caseid, casename, manufacturerid, categoryid, unitprice)
  VALUES(22, 'Define XL R2','3','5','629');
  INSERT INTO Products(caseid, casename, manufacturerid, categoryid, unitprice)
  VALUES(23, 'PGS Shard Glass V2 RGB','4','5','291.02');

SET IDENTITY_INSERT Products OFF;

--manufacturers table

SET IDENTITY_INSERT Sales OFF;
SET IDENTITY_INSERT Sales ON;

  INSERT INTO Sales(saleid, clientid, caseid, workerid, shipperid, saledate)
  VALUES(1, 3,22,2,4, '20190826 00:00:00.000');
    INSERT INTO Sales(saleid, clientid, caseid, workerid, shipperid, saledate)
  VALUES(2, 3,13,1,3, '20160719 00:00:00.000');
    INSERT INTO Sales(saleid, clientid, caseid, workerid, shipperid, saledate)
  VALUES(3, 2,14,3,3, '20171025 00:00:00.000');
    INSERT INTO Sales(saleid, clientid, caseid, workerid, shipperid, saledate)
  VALUES(4, 2,12,1,3, '20161210 00:00:00.000');
    INSERT INTO Sales(saleid, clientid, caseid, workerid, shipperid, saledate)
  VALUES(5, 6,20,4,2, '20150515 00:00:00.000');
    INSERT INTO Sales(saleid, clientid, caseid, workerid, shipperid, saledate)
  VALUES(6, 1,3,1,1, '20170604 00:00:00.000');
    INSERT INTO Sales(saleid, clientid, caseid, workerid, shipperid, saledate)
  VALUES(7, 10,20,5,1, '20180520 00:00:00.000');
    INSERT INTO Sales(saleid, clientid, caseid, workerid, shipperid, saledate)
  VALUES(8, 7,19,3,2, '20150808 00:00:00.000');
    INSERT INTO Sales(saleid, clientid, caseid, workerid, shipperid, saledate)
  VALUES(9, 1,17,5,4, '20181221 00:00:00.000');
    INSERT INTO Sales(saleid, clientid, caseid, workerid, shipperid, saledate)
  VALUES(10, 7,22,5,1, '20150423 00:00:00.000');
    INSERT INTO Sales(saleid, clientid, caseid, workerid, shipperid, saledate)
  VALUES(11, 8,23,5,1, '20190729 00:00:00.000');
    INSERT INTO Sales(saleid, clientid, caseid, workerid, shipperid, saledate)
  VALUES(12, 10,3,4,1, '20161019 00:00:00.000');
    INSERT INTO Sales(saleid, clientid, caseid, workerid, shipperid, saledate)
  VALUES(13, 10,18,4,2, '20170909 00:00:00.000');
    INSERT INTO Sales(saleid, clientid, caseid, workerid, shipperid, saledate)
  VALUES(14, 4,11,5,1, '20190617 00:00:00.000');
    INSERT INTO Sales(saleid, clientid, caseid, workerid, shipperid, saledate)
  VALUES(15, 4,10,1,2, '20190219 00:00:00.000');
    INSERT INTO Sales(saleid, clientid, caseid, workerid, shipperid, saledate)
  VALUES(16, 3,16,4,3, '20181022 00:00:00.000');
    INSERT INTO Sales(saleid, clientid, caseid, workerid, shipperid, saledate)
  VALUES(17, 3,23,2,1, '20170202 00:00:00.000');
    INSERT INTO Sales(saleid, clientid, caseid, workerid, shipperid, saledate)
  VALUES(18, 6,3,4,4, '20160114 00:00:00.000');
    INSERT INTO Sales(saleid, clientid, caseid, workerid, shipperid, saledate)
  VALUES(19, 7,4,2,2, '20190410 00:00:00.000');
    INSERT INTO Sales(saleid, clientid, caseid, workerid, shipperid, saledate)
  VALUES(20, 3,12,3,1, '20190820 00:00:00.000');
    INSERT INTO Sales(saleid, clientid, caseid, workerid, shipperid, saledate)
  VALUES(21, 8,13,1,2, '20151118 00:00:00.000');
    INSERT INTO Sales(saleid, clientid, caseid, workerid, shipperid, saledate)
  VALUES(22, 4,14,1,4, '20180620 00:00:00.000');
    INSERT INTO Sales(saleid, clientid, caseid, workerid, shipperid, saledate)
  VALUES(23, 3,12,4,1, '20150506 00:00:00.000');
    INSERT INTO Sales(saleid, clientid, caseid, workerid, shipperid, saledate)
  VALUES(24, 5,23,5,3, '20170206 00:00:00.000');
    INSERT INTO Sales(saleid, clientid, caseid, workerid, shipperid, saledate)
  VALUES(25, 8,1,4,2, '20200111 00:00:00.000');
    INSERT INTO Sales(saleid, clientid, caseid, workerid, shipperid, saledate)
  VALUES(26, 1,1,1,2, '20200601 00:00:00.000');
    INSERT INTO Sales(saleid, clientid, caseid, workerid, shipperid, saledate)
  VALUES(27, 1,9,4,1, '20201112 00:00:00.000');
    INSERT INTO Sales(saleid, clientid, caseid, workerid, shipperid, saledate)
  VALUES(28, 5,13,1,3, '20200901 00:00:00.000');
    INSERT INTO Sales(saleid, clientid, caseid, workerid, shipperid, saledate)
  VALUES(29, 1,1,1,1, '20200220 00:00:00.000');
    INSERT INTO Sales(saleid, clientid, caseid, workerid, shipperid, saledate)
  VALUES(30, 1,1,1,1, '20200807 00:00:00.000');

SET IDENTITY_INSERT Sales OFF;






  select * from Workers
  select * from Clients 
  select * from Shippers
  select * from Categories
  select * from Manufacturers  
  select * from Products
  select * from sales
  select * from Logs
  
  -------------------------------------------------------------- TABELA WORKERS ------------------------------------------------------------------------------------

  ------------------------------ UPDATE -----------------------------


	IF OBJECT_ID ('updateWorkersTrigger', 'TR') IS NOT NULL  
	DROP TRIGGER updateWorkersTrigger;

	GO 
	CREATE TRIGGER updateWorkersTrigger
	ON Workers
	INSTEAD OF UPDATE
	AS
	SET NOCOUNT, XACT_ABORT ON;
		declare @cErrMsg NVARCHAR(2048);
		BEGIN TRY
			if not exists(select * from Workers w, inserted i where i.workerid = w.workerid)
				BEGIN SET @cErrMsg='UPDATE: Taki pracownik nie istnieje' RAISERROR (@cErrMsg, 16, 1) WITH NOWAIT, SETERROR END
			else
			BEGIN
				BEGIN TRANSACTION
					UPDATE dbo.Workers
					SET
					firstname = (select firstname from inserted),
					lastname = (select lastname from inserted),
					birthdate = (select birthdate from inserted),
					hiredate = (select hiredate from inserted),
					address = (select address from inserted),
					city = (select city from inserted),
					country = (select country from inserted),
					phone = (select phone from inserted)
					where workerid = (select workerid from deleted)
					INSERT INTO Logs SELECT GETDATE(), 'Workers', 'UPDATE: Zaktualizowano';	
			
			COMMIT TRANSACTION;
			END
 
		END TRY
		BEGIN CATCH 
		IF @@TRANCOUNT > 0
		BEGIN
			ROLLBACK TRANSACTION
		END;
		DECLARE @cErrMsg2 NVARCHAR(2048)
		SET @cErrMsg2= ERROR_MESSAGE()
		RAISERROR (@cErrMsg2, 16, 1) WITH NOWAIT, SETERROR
		END CATCH;
	GO


	IF EXISTS (SELECT * FROM sys.procedures WHERE name= 'updateWorker' AND type='P') DROP PROCEDURE [dbo].updateWorker

	GO
	CREATE PROCEDURE dbo.updateWorker (@workerid int = null, @firstname nvarchar(40) = null, @lastname nvarchar(40) = null, @birthdate datetime = null, @hiredate datetime = null, @adress nvarchar(40) = null, @city nvarchar(40) = null, @country nvarchar(40) = null, @phone nvarchar(40) = null)
	as
	 DECLARE @cErrMsg nvarchar(100)
		 if(@workerid is null OR @firstname is null OR @lastname is null OR @birthdate is null OR @hiredate is null OR @adress is null OR @city is null OR @country is null OR @phone is null)
			BEGIN
				set @cErrMsg = 'UPDATE: Wszystkie dane musz¹ byæ uzupe³nione.'
				INSERT INTO Logs SELECT GETDATE(), 'Workers', @cErrMsg;		
				raiserror(@cErrMsg, 16, 1) WITH NOWAIT, SETERROR
			END
		else
		begin
			UPDATE Workers set workerid = @workerid, firstname = @firstname, lastname = @lastname, birthdate = @birthdate, hiredate = @hiredate, address = @adress, city = @city, country = @country, phone = @phone where workerid = @workerid;
		end
	GO

	--exec dbo.updateWorker 1,'dzia³achiba', 'Wojtiuk', '19981008 00:00:00.000', '20180926 00:00:00.000', 'Fio³kowa 68', 'Bia³a Podlaska', 'Poland'


	 -------------------------------- DELETE ---------------------------------------------------------------------------------
	 IF OBJECT_ID ('deleteWorkersTrigger', 'TR') IS NOT NULL  
	DROP TRIGGER deleteWorkersTrigger;
	GO
	Create TRIGGER deleteWorkersTrigger
	ON Workers
	INSTEAD OF DELETE
	AS
	SET NOCOUNT, XACT_ABORT ON;
		declare @cErrMsg NVARCHAR(2048);
		BEGIN TRY
			if not exists(select * from Workers w, deleted d where d.workerid = w.workerid)
				BEGIN SET @cErrMsg='DELETE: Taki pracownik nie istnieje' RAISERROR (@cErrMsg, 16, 1) WITH NOWAIT, SETERROR END
			else
			BEGIN
			BEGIN TRANSACTION;
				delete from Workers where workerid = (select workerid from deleted);
				insert into Logs select GETDATE(),'Workers','DELETE: Usuniêto pracownika';
			COMMIT TRANSACTION;
			END
 
		END TRY
		BEGIN CATCH 
		IF @@TRANCOUNT > 0
		BEGIN
			ROLLBACK TRANSACTION
		END;
		DECLARE @cErrMsg2 NVARCHAR(2048)
		SET @cErrMsg2= ERROR_MESSAGE()
		RAISERROR (@cErrMsg2, 16, 1) WITH NOWAIT, SETERROR
		END CATCH;
	GO


	IF EXISTS (SELECT * FROM sys.procedures WHERE name= 'deleteWorker' AND type='P') DROP PROCEDURE [dbo].deleteWorker
	GO
	CREATE PROCEDURE dbo.deleteWorker (@workerid int = null)
	as
	 DECLARE @cErrMsg nvarchar(100)
		 if(@workerid is null)
			BEGIN
				set @cErrMsg = 'DELETE: Nie usuniêto, Wpisz ID pracownika'
				INSERT INTO Logs SELECT GETDATE(), 'Workers', @cErrMsg;		
				raiserror(@cErrMsg, 16, 1) WITH NOWAIT, SETERROR
			END
			if exists(select * from Sales where workerid = @workerid)
				begin
				set @cErrMsg = 'DELETE: Ten pracownik widnieje w tabeli Sales, najpierw usuñ historiê sprzeda¿y.'
					INSERT INTO Logs SELECT GETDATE(), 'Workers', @cErrMsg;		
					raiserror(@cErrMsg, 16, 1) WITH NOWAIT, SETERROR
				end
		else
		begin
			delete from Workers where workerid = @workerid;
		end
	GO

--exec dbo.deleteWorker 15




	-------------------------------- INSERT ---------------------------------------------------------------------------------
	 IF OBJECT_ID ('insertWorkersTrigger', 'TR') IS NOT NULL  
	DROP TRIGGER insertWorkersTrigger;
	GO
	Create TRIGGER insertWorkersTrigger
	ON Workers
	INSTEAD OF INSERT
	AS
		declare @cErrMsg NVARCHAR(2048);
		BEGIN TRY
		
			BEGIN TRANSACTION;
				insert into Workers select firstname,lastname,birthdate,hiredate,address,city,country,phone from inserted;
				insert into Logs select GETDATE(),'Workers','INSERT: Pracownik dodany.';
			COMMIT TRANSACTION;

 
		END TRY
		BEGIN CATCH 
		IF @@TRANCOUNT > 0
		BEGIN
			ROLLBACK TRANSACTION
		END;
		DECLARE @cErrMsg2 NVARCHAR(2048)
		SET @cErrMsg2= ERROR_MESSAGE()
		RAISERROR (@cErrMsg2, 16, 1) WITH NOWAIT, SETERROR
		END CATCH;
	GO

	--Procedura sprawdza czy podany numer telefonu jest prawid³owy oraz czy pracownik z takim nuemerem istnieje.

	IF EXISTS (SELECT * FROM sys.procedures WHERE name= 'insertWorker' AND type='P') DROP PROCEDURE [dbo].insertWorker
	GO
	CREATE PROCEDURE dbo.insertWorker ( @firstname nvarchar(40) = null, @lastname nvarchar(40) = null, @birthdate datetime = null, @hiredate datetime = null, @adress nvarchar(40) = null, @city nvarchar(40) = null, @country nvarchar(40) = null, @phone nvarchar(40) = null)
	as
	 DECLARE @cErrMsg nvarchar(100)
		if exists(select * from Workers w where phone = @phone)
				BEGIN SET @cErrMsg='INSERT: Pracownik z takim numerem telefonu istnieje, sprawdŸ dane' 
				insert into Logs select GETDATE(),'Workers',@cErrMsg;
				RAISERROR (@cErrMsg, 16, 1) WITH NOWAIT, SETERROR END
		else if(@firstname is null OR @lastname is null OR @birthdate is null OR @hiredate is null OR @adress is null OR @city is null OR @country is null OR @phone is null)
			BEGIN
				set @cErrMsg = 'Insert: Wszystkie dane musz¹ byæ uzupe³nione.'
				INSERT INTO Logs SELECT GETDATE(), 'Workers', @cErrMsg;		
				raiserror(@cErrMsg, 16, 1) WITH NOWAIT, SETERROR
			END
		else if (@phone not LIKE '[0-9][0-9][0-9] [0-9][0-9][0-9] [0-9][0-9][0-9]')  
				BEGIN SET @cErrMsg='INSERT: Nieprawid³owy numer telefonu' 
				insert into Logs select GETDATE(),'Workers',@cErrMsg;
				RAISERROR (@cErrMsg, 16, 1) WITH NOWAIT, SETERROR END
		else
		begin
			INSERT INTO Workers values(@firstname, @lastname, @birthdate, @hiredate, @adress, @city, @country, @phone)
		end
	GO

--exec insertWorker 'Grzegorz', 'Wojtiuk', '19981008 00:00:00.000', '20180926 00:00:00.000', 'Fio³kowa 68', 'Bia³a Podlaska', 'Poland'

-------------------------------------------------------------- CLIENTS ------------------------------------------------------------------------------------------

 ------------------------------ UPDATE -----------------------------

IF OBJECT_ID ('updateClientsTrigger', 'TR') IS NOT NULL  
	DROP TRIGGER updateClientsTrigger;

	GO 
	CREATE TRIGGER updateClientsTrigger
	ON Clients
	INSTEAD OF UPDATE
	AS
	SET NOCOUNT, XACT_ABORT ON;
		declare @cErrMsg NVARCHAR(2048);
		BEGIN TRY
			if not exists(select * from Clients c, inserted i where c.clientid = i.clientid)
				BEGIN SET @cErrMsg='UPDATE: Taki klient nie istnieje' RAISERROR (@cErrMsg, 16, 1) WITH NOWAIT, SETERROR END
			else
			BEGIN
				BEGIN TRANSACTION
					UPDATE dbo.Clients
					SET
					firstname = (select firstname from inserted),
					lastname = (select lastname from inserted),
					address = (select address from inserted),
					city = (select city from inserted),
					country = (select country from inserted),
					phone = (select phone from inserted),
					email = (select email from inserted)
					where clientid = (select clientid from deleted)
					INSERT INTO Logs SELECT GETDATE(), 'Clients', 'UPDATE: Zaktualizowano';	
					Print 'Zaktualizowano'
			
			COMMIT TRANSACTION;
			END
 
		END TRY
		BEGIN CATCH 
		IF @@TRANCOUNT > 0
		BEGIN
			ROLLBACK TRANSACTION
		END;
		DECLARE @cErrMsg2 NVARCHAR(2048)
		SET @cErrMsg2= ERROR_MESSAGE()
		RAISERROR (@cErrMsg2, 16, 1) WITH NOWAIT, SETERROR
		END CATCH;
	GO



	IF EXISTS (SELECT * FROM sys.procedures WHERE name= 'updateClient' AND type='P') DROP PROCEDURE [dbo].updateClient

	GO
	CREATE PROCEDURE dbo.updateClient (@clientid int = null, @firstname nvarchar(40) = null, @lastname nvarchar(40) = null, @address nvarchar(40) = null, @city nvarchar(40) = null, @country nvarchar(40) = null, @phone nvarchar(40) = null, @email nvarchar(40) = null)
	as
	 DECLARE @cErrMsg nvarchar(100)
		 if(@clientid is null OR @firstname is null OR @lastname is null OR  @address is null OR @city is null OR @country is null OR @phone is null OR @email is null)
			BEGIN
				set @cErrMsg = 'UPDATE: Wszystkie dane musz¹ byæ uzupe³nione.'
				INSERT INTO Logs SELECT GETDATE(), 'Clients', @cErrMsg;		
				raiserror(@cErrMsg, 16, 1) WITH NOWAIT, SETERROR
			END
		else
		begin
			UPDATE Clients set clientid = @clientid, firstname = @firstname, lastname = @lastname, address = @address, city = @city, country = @country, phone = @phone, email = @email where clientid = @clientid;
		end
	GO

	--exec updateClient 1, 'Marcin', 'Brzêczyszczykiewicz', 'Rumiankowa 18', 'Szczebrzeszyn', 'Poland', '669 712 454', 'g.brzeczyszczykiewicz@gmail.com'

	--select * from logs
	--select * from Clients
	
	
-------------------------------- DELETE --------------------------------------------------------------------

IF OBJECT_ID ('deleteClientsTrigger', 'TR') IS NOT NULL  
	DROP TRIGGER deleteClientsTrigger;
	GO
	Create TRIGGER deleteClientsTrigger
	ON Clients
	INSTEAD OF DELETE
	AS
		declare @cErrMsg NVARCHAR(2048);
		BEGIN TRY
			if not exists(select * from Clients c, deleted i where c.clientid = i.clientid)
				BEGIN SET @cErrMsg='DELETE: Taki klient nie istnieje' RAISERROR (@cErrMsg, 16, 1) WITH NOWAIT, SETERROR END
			else
			BEGIN
			BEGIN TRANSACTION;
				delete from Clients where clientid = (select clientid from deleted);
				insert into Logs select GETDATE(),'Workers','DELETE: Usuniêto klienta';
			COMMIT TRANSACTION;
			END
 
		END TRY
		BEGIN CATCH 
		IF @@TRANCOUNT > 0
		BEGIN
			ROLLBACK TRANSACTION
		END;
		DECLARE @cErrMsg2 NVARCHAR(2048)
		SET @cErrMsg2= ERROR_MESSAGE()
		RAISERROR (@cErrMsg2, 16, 1) WITH NOWAIT, SETERROR
		END CATCH;
	GO


		IF EXISTS (SELECT * FROM sys.procedures WHERE name= 'deleteClient' AND type='P') DROP PROCEDURE [dbo].deleteClient
	GO
	CREATE PROCEDURE dbo.deleteClient (@clientid int = null)
	as
	 DECLARE @cErrMsg nvarchar(100)
		 if(@clientid is null)
			BEGIN
				set @cErrMsg = 'DELETE: Nie usuniêto, Wpisz ID klienta'
				INSERT INTO Logs SELECT GETDATE(), 'Clients', @cErrMsg;		
				raiserror(@cErrMsg, 16, 1) WITH NOWAIT, SETERROR
			END
			if exists(select * from Sales where clientid = @clientid)
				begin
				set @cErrMsg = 'DELETE: Ten klient widnieje w tabeli Sales, najpierw usuñ historiê jego zakupów.'
					INSERT INTO Logs SELECT GETDATE(), 'Clients', @cErrMsg;		
					raiserror(@cErrMsg, 16, 1) WITH NOWAIT, SETERROR
				end
		else
		begin
			delete from Clients where clientid = @clientid;
		end
	GO

--exec dbo.deleteClient 13
--select * from Clients
-------------------------------- INSERT ---------------------------------------------------------------------------------
	 IF OBJECT_ID ('insertClientTrigger', 'TR') IS NOT NULL  
	DROP TRIGGER insertClientTrigger;
	GO
	Create TRIGGER insertClientTrigger
	ON Clients
	INSTEAD OF INSERT
	AS
		declare @cErrMsg NVARCHAR(2048);
		BEGIN TRY
		
			BEGIN TRANSACTION;
				insert into Clients select firstname,lastname,address,city,country,phone,email from inserted;
				insert into Logs select GETDATE(),'Clients','INSERT: Klient dodany.';
			COMMIT TRANSACTION;

 
		END TRY
		BEGIN CATCH 
		IF @@TRANCOUNT > 0
		BEGIN
			ROLLBACK TRANSACTION
		END;
		DECLARE @cErrMsg2 NVARCHAR(2048)
		SET @cErrMsg2= ERROR_MESSAGE()
		RAISERROR (@cErrMsg2, 16, 1) WITH NOWAIT, SETERROR
		END CATCH;
	GO


	IF EXISTS (SELECT * FROM sys.procedures WHERE name= 'insertClient' AND type='P') DROP PROCEDURE [dbo].insertClient
	GO
	CREATE PROCEDURE dbo.insertClient ( @firstname nvarchar(40) = null, @lastname nvarchar(40) = null, @address nvarchar(40) = null, @city nvarchar(40) = null, @country nvarchar(40) = null, @phone nvarchar(40) = null, @email nvarchar(40) = null)
	as
	 DECLARE @cErrMsg nvarchar(100)
		if exists(select * from Clients  where phone = @phone)
				BEGIN SET @cErrMsg='INSERT: Klient z takim numerem telefonu istnieje, sprawdŸ dane' 
				insert into Logs select GETDATE(),'Clients',@cErrMsg;
				RAISERROR (@cErrMsg, 16, 1) WITH NOWAIT, SETERROR END
		else if(@firstname is null OR @lastname is null OR  @address is null OR @city is null OR @country is null OR @phone is null OR @email is null)
			BEGIN
				set @cErrMsg = 'INSERT: Wszystkie dane musz¹ byæ uzupe³nione.'
				INSERT INTO Logs SELECT GETDATE(), 'Clients', @cErrMsg;		
				raiserror(@cErrMsg, 16, 1) WITH NOWAIT, SETERROR
			END
		else if exists(select * from Clients where email = @email)
				BEGIN SET @cErrMsg='INSERT: Pracownik z takim adresem email istnieje, sprawdŸ dane' 
				insert into Logs select GETDATE(),'Clients',@cErrMsg;
				RAISERROR (@cErrMsg, 16, 1) WITH NOWAIT, SETERROR END

		else if (@phone not LIKE '[0-9][0-9][0-9] [0-9][0-9][0-9] [0-9][0-9][0-9]')  
				BEGIN SET @cErrMsg='INSERT: Nieprawid³owy numer telefonu' 
				insert into Logs select GETDATE(),'Clients',@cErrMsg;
				RAISERROR (@cErrMsg, 16, 1) WITH NOWAIT, SETERROR END
		else
		begin
			INSERT INTO Clients values(@firstname, @lastname, @address, @city, @country, @phone, @email)
		end
	GO
	--exec insertClient 'Grzegorz', 'Brzêczyszczykiewicz', 'Rumiankowa 18', 'Szczebrzeszyn', 'Poland', '669 712 452', 'g2.brzeczyszczykiewicz@gmail.com'
	--select * from Clients



-------------------------------------------------------------- SHIPPERS -----------------------------------------------------------------------------------------

-------------------------------- INSERT ---------------------------------------------------------------------------------
	 IF OBJECT_ID ('insertShipperTrigger', 'TR') IS NOT NULL  
	DROP TRIGGER insertShipperTrigger;
	GO
	Create TRIGGER insertShipperTrigger
	ON Shippers
	INSTEAD OF INSERT
	AS
		declare @cErrMsg NVARCHAR(2048);
		BEGIN TRY
		
			BEGIN TRANSACTION;
				insert into Shippers select name, phone from inserted;
				insert into Logs select GETDATE(),'Shippers','INSERT: PrzewoŸnik dodany.';
			COMMIT TRANSACTION;

 
		END TRY
		BEGIN CATCH 
		IF @@TRANCOUNT > 0
		BEGIN
			ROLLBACK TRANSACTION
		END;
		DECLARE @cErrMsg2 NVARCHAR(2048)
		SET @cErrMsg2= ERROR_MESSAGE()
		RAISERROR (@cErrMsg2, 16, 1) WITH NOWAIT, SETERROR
		END CATCH;
	GO


	IF EXISTS (SELECT * FROM sys.procedures WHERE name= 'insertShipper' AND type='P') DROP PROCEDURE [dbo].insertShipper
	GO
	CREATE PROCEDURE dbo.insertShipper ( @name nvarchar(40) = null, @phone nvarchar(40) = null)
	as
	 DECLARE @cErrMsg nvarchar(100)
		if exists(select * from Shippers where phone = @phone)
				BEGIN SET @cErrMsg='INSERT: PrzewoŸnik z takim numerem telefonu istnieje, sprawdŸ dane' 
				insert into Logs select GETDATE(),'Shippers',@cErrMsg;
				RAISERROR (@cErrMsg, 16, 1) WITH NOWAIT, SETERROR END
		else if exists(select * from Shippers where name = @name)
				BEGIN SET @cErrMsg='INSERT: Taki przewoŸnik ju¿ istnieje, sprawdŸ dane' 
				insert into Logs select GETDATE(),'Shippers',@cErrMsg;
				RAISERROR (@cErrMsg, 16, 1) WITH NOWAIT, SETERROR END
	    else if(@name is null OR @phone is null)
			BEGIN
				set @cErrMsg = 'INSERT: Wszystkie dane musz¹ byæ uzupe³nione.'
				INSERT INTO Logs SELECT GETDATE(), 'Shippers', @cErrMsg;		
				raiserror(@cErrMsg, 16, 1) WITH NOWAIT, SETERROR
			END

		else if (@phone not LIKE '[0-9][0-9][0-9] [0-9][0-9][0-9] [0-9][0-9][0-9]')  
				BEGIN SET @cErrMsg='INSERT: Nieprawid³owy numer telefonu' 
				insert into Logs select GETDATE(),'Shippers',@cErrMsg;
				RAISERROR (@cErrMsg, 16, 1) WITH NOWAIT, SETERROR END
		else
		begin
			INSERT INTO Shippers values(@name, @phone)
		end
	GO

 --exec insertShipper 'DPD', '505 100 522'
 --select * from Shippers

  -------------------------------- DELETE ---------------------------------------------------------------------------------
	 IF OBJECT_ID ('deleteShippersTrigger', 'TR') IS NOT NULL  
	DROP TRIGGER deleteShippersTrigger;
	GO
	Create TRIGGER deleteShippersTrigger
	ON Shippers
	INSTEAD OF DELETE
	AS
	SET NOCOUNT, XACT_ABORT ON;
		declare @cErrMsg NVARCHAR(2048);
		BEGIN TRY
			if not exists(select * from Shippers s, deleted d where s.shipperid = d.shipperid)
				BEGIN SET @cErrMsg='DELETE: Taki przewoŸnik nie istnieje' RAISERROR (@cErrMsg, 16, 1) WITH NOWAIT, SETERROR END
			else
			BEGIN
			BEGIN TRANSACTION;
				delete from Shippers where shipperid = (select shipperid from deleted);
				insert into Logs select GETDATE(),'Shippers','DELETE: Usuniêto pracownika';
			COMMIT TRANSACTION;
			END
 
		END TRY
		BEGIN CATCH 
		IF @@TRANCOUNT > 0
		BEGIN
			ROLLBACK TRANSACTION
		END;
		DECLARE @cErrMsg2 NVARCHAR(2048)
		SET @cErrMsg2= ERROR_MESSAGE()
		RAISERROR (@cErrMsg2, 16, 1) WITH NOWAIT, SETERROR
		END CATCH;
	GO


	IF EXISTS (SELECT * FROM sys.procedures WHERE name= 'deleteShipper' AND type='P') DROP PROCEDURE [dbo].deleteShipper
	GO
	CREATE PROCEDURE dbo.deleteShipper (@shipperid int = null)
	as
	 DECLARE @cErrMsg nvarchar(100)
		 if(@shipperid is null)
			BEGIN
				set @cErrMsg = 'DELETE: Nie usuniêto, Wpisz ID przewoŸnika'
				INSERT INTO Logs SELECT GETDATE(), 'Shippers', @cErrMsg;		
				raiserror(@cErrMsg, 16, 1) WITH NOWAIT, SETERROR
			END
			if exists(select * from Sales where shipperid = @shipperid)
				begin
				set @cErrMsg = 'DELETE: Ten przewoŸnik widnieje w tabeli Sales, najpierw usuñ jego historiê'
					INSERT INTO Logs SELECT GETDATE(), 'Shippers', @cErrMsg;		
					raiserror(@cErrMsg, 16, 1) WITH NOWAIT, SETERROR
				end
		else
		begin
			delete from Shippers where shipperid = @shipperid;
		end
	GO


	--select * from Shippers
	--exec deleteShipper 7

	------------------------------ UPDATE -----------------------------
	
	IF OBJECT_ID ('updateShippersTrigger', 'TR') IS NOT NULL  
	DROP TRIGGER updateShippersTrigger;

	GO 
	CREATE TRIGGER updateShippersTrigger
	ON Shippers
	INSTEAD OF UPDATE
	AS
		declare @cErrMsg NVARCHAR(2048);
		BEGIN TRY
			if not exists(select * from Shippers s, inserted i where s.shipperid = i.shipperid)
				BEGIN SET @cErrMsg='UPDATE: Taki przewoŸnik nie istnieje' RAISERROR (@cErrMsg, 16, 1) WITH NOWAIT, SETERROR END
			else
			BEGIN
				BEGIN TRANSACTION
					UPDATE dbo.Shippers
					SET
					name = (select name from inserted),
					phone = (select phone from inserted)
					where shipperid = (select shipperid from deleted)
					INSERT INTO Logs SELECT GETDATE(), 'Shippers', 'UPDATE: Zaktualizowano';	
			
			COMMIT TRANSACTION;
			END
 
		END TRY
		BEGIN CATCH 
		IF @@TRANCOUNT > 0
		BEGIN
			ROLLBACK TRANSACTION
		END;
		DECLARE @cErrMsg2 NVARCHAR(2048)
		SET @cErrMsg2= ERROR_MESSAGE()
		RAISERROR (@cErrMsg2, 16, 1) WITH NOWAIT, SETERROR
		END CATCH;
	GO


	IF EXISTS (SELECT * FROM sys.procedures WHERE name= 'updateShipper' AND type='P') DROP PROCEDURE [dbo].updateShipper

	GO
	CREATE PROCEDURE dbo.updateShipper (@shipperid int = null, @name nvarchar(40) = null, @phone nvarchar(40) = null)
	as
	 DECLARE @cErrMsg nvarchar(100)
		 if(@shipperid is null OR @name is null OR @phone is null)
			BEGIN
				set @cErrMsg = 'UPDATE: Wszystkie dane musz¹ byæ uzupe³nione.'
				INSERT INTO Logs SELECT GETDATE(), 'Shippers', @cErrMsg;		
				raiserror(@cErrMsg, 16, 1) WITH NOWAIT, SETERROR
			END
		else if (@phone not LIKE '[0-9][0-9][0-9] [0-9][0-9][0-9] [0-9][0-9][0-9]')  
				BEGIN SET @cErrMsg='INSERT: Nieprawid³owy numer telefonu' 
				insert into Logs select GETDATE(),'Shippers',@cErrMsg;
				RAISERROR (@cErrMsg, 16, 1) WITH NOWAIT, SETERROR END
		else
		begin
			UPDATE Shippers set shipperid = @shipperid, name = @name, phone = @phone where shipperid = @shipperid;
		end
	GO


	--exec updateShipper 1, 'nowy', '512 777 777'
	--select * from Shippers
-------------------------------------------------------------- CATEGORIES ---------------------------------------------------------------------------------------

-------------------------------- INSERT ---------------------------------------------------------------------------------
	 IF OBJECT_ID ('insertCategoriesTrigger', 'TR') IS NOT NULL  
	DROP TRIGGER insertCategoriesTrigger;
	GO
	Create TRIGGER insertCategoriesTrigger
	ON Categories
	INSTEAD OF INSERT
	AS
		declare @cErrMsg NVARCHAR(2048);
		BEGIN TRY
		
			BEGIN TRANSACTION;
				insert into Categories select categoryname from inserted;
				insert into Logs select GETDATE(),'Categories','INSERT: Kategoria dodana.';
			COMMIT TRANSACTION;

 
		END TRY
		BEGIN CATCH 
		IF @@TRANCOUNT > 0
		BEGIN
			ROLLBACK TRANSACTION
		END;
		DECLARE @cErrMsg2 NVARCHAR(2048)
		SET @cErrMsg2= ERROR_MESSAGE()
		RAISERROR (@cErrMsg2, 16, 1) WITH NOWAIT, SETERROR
		END CATCH;
	GO

	--Procedura sprawdza czy podany numer telefonu jest prawid³owy oraz czy pracownik z takim nuemerem istnieje.

	IF EXISTS (SELECT * FROM sys.procedures WHERE name= 'insertCategory' AND type='P') DROP PROCEDURE [dbo].insertCategory
	GO
	CREATE PROCEDURE dbo.insertCategory (@categoryname nvarchar(40) = null)
	as
	 DECLARE @cErrMsg nvarchar(100)
		if exists(select * from Categories where categoryname = @categoryname)
				BEGIN SET @cErrMsg='INSERT: Taka kategoria istnieje, sprawdŸ dane' 
				insert into Logs select GETDATE(),'Categories',@cErrMsg;
				RAISERROR (@cErrMsg, 16, 1) WITH NOWAIT, SETERROR END
		
		 else if(@categoryname is null)
			BEGIN
				set @cErrMsg = 'INSERT: Wszystkie dane musz¹ byæ uzupe³nione.'
				INSERT INTO Logs SELECT GETDATE(), 'Categories', @cErrMsg;		
				raiserror(@cErrMsg, 16, 1) WITH NOWAIT, SETERROR
			END
		else
		begin
			INSERT INTO Categories values(@categoryname)
		end
	GO

 --exec insertCategory 'Full Tower'
 --select * from Categories
 -------------------------------- DELETE ---------------------------------------------------------------------------------
	 IF OBJECT_ID ('deleteCategoriesTrigger', 'TR') IS NOT NULL  
	DROP TRIGGER deleteCategoriesTrigger;
	GO
	Create TRIGGER deleteCategoriesTrigger
	ON Categories
	INSTEAD OF DELETE
	AS
		declare @cErrMsg NVARCHAR(2048);
		BEGIN TRY
			if not exists(select * from Categories c, deleted d where c.categoryid = d.categoryid)
				BEGIN SET @cErrMsg='DELETE: Taka kategoria nie istnieje' RAISERROR (@cErrMsg, 16, 1) WITH NOWAIT, SETERROR END
			else
			BEGIN
			BEGIN TRANSACTION;
				delete from Categories where categoryid = (select categoryid from deleted);
				insert into Logs select GETDATE(),'Categories','DELETE: Usuniêto kategorie';
			COMMIT TRANSACTION;
			END
 
		END TRY
		BEGIN CATCH 
		IF @@TRANCOUNT > 0
		BEGIN
			ROLLBACK TRANSACTION
		END;
		DECLARE @cErrMsg2 NVARCHAR(2048)
		SET @cErrMsg2= ERROR_MESSAGE()
		RAISERROR (@cErrMsg2, 16, 1) WITH NOWAIT, SETERROR
		END CATCH;
	GO


	IF EXISTS (SELECT * FROM sys.procedures WHERE name= 'deleteCategory' AND type='P') DROP PROCEDURE [dbo].deleteCategory
	GO
	CREATE PROCEDURE dbo.deleteCategory (@categoryid int = null)
	as
	 DECLARE @cErrMsg nvarchar(100)
		 if(@categoryid is null)
			BEGIN
				set @cErrMsg = 'DELETE: Nie usuniêto, Wpisz ID kategorii'
				INSERT INTO Logs SELECT GETDATE(), 'Categories', @cErrMsg;		
				raiserror(@cErrMsg, 16, 1) WITH NOWAIT, SETERROR
			END
			if exists(select * from Products where categoryid = @categoryid)
				begin
				set @cErrMsg = 'DELETE: Ta kategoria widnieje w tabeli Products, najpierw usuñ jej powi¹zania'
					INSERT INTO Logs SELECT GETDATE(), 'Categories', @cErrMsg;		
					raiserror(@cErrMsg, 16, 1) WITH NOWAIT, SETERROR
				end
		else
		begin
			delete from Categories where categoryid = @categoryid;
		end
	GO


	--select * from Categories
	--exec deleteCategory 7

	---------------------------- UPDATE -----------------------------
	
	IF OBJECT_ID ('updateCategoriesTrigger', 'TR') IS NOT NULL  
	DROP TRIGGER updateCategoriesTrigger;

	GO 
	CREATE TRIGGER updateCategoriesTrigger
	ON Categories
	INSTEAD OF UPDATE
	AS
		declare @cErrMsg NVARCHAR(2048);
		BEGIN TRY
			if not exists(select * from Categories c, inserted i where c.categoryid = i.categoryid)
				BEGIN SET @cErrMsg='UPDATE: Taka kategoria nie istnieje' RAISERROR (@cErrMsg, 16, 1) WITH NOWAIT, SETERROR END
			else
			BEGIN
				BEGIN TRANSACTION
					UPDATE dbo.Categories
					SET
					categoryname = (select categoryname from inserted)
					where categoryid = (select categoryid from deleted)
					INSERT INTO Logs SELECT GETDATE(), 'Categories', 'UPDATE: Zaktualizowano';	
			
			COMMIT TRANSACTION;
			END
 
		END TRY
		BEGIN CATCH 
		IF @@TRANCOUNT > 0
		BEGIN
			ROLLBACK TRANSACTION
		END;
		DECLARE @cErrMsg2 NVARCHAR(2048)
		SET @cErrMsg2= ERROR_MESSAGE()
		RAISERROR (@cErrMsg2, 16, 1) WITH NOWAIT, SETERROR
		END CATCH;
	GO


	IF EXISTS (SELECT * FROM sys.procedures WHERE name= 'updateCategory' AND type='P') DROP PROCEDURE [dbo].updateCategory

	GO
	CREATE PROCEDURE dbo.updateCategory (@categoryid int = null, @categoryname nvarchar(40) = null)
	as
	 DECLARE @cErrMsg nvarchar(100)
		 if(@categoryid is null OR @categoryname is null)
			BEGIN
				set @cErrMsg = 'UPDATE: Wszystkie dane musz¹ byæ uzupe³nione.'
				INSERT INTO Logs SELECT GETDATE(), 'Categories', @cErrMsg;		
				raiserror(@cErrMsg, 16, 1) WITH NOWAIT, SETERROR
			END
		begin
			UPDATE Categories set categoryid = @categoryid, categoryname = @categoryname where categoryid = @categoryid;
		end
	GO


	--exec updateCategory 5, 'Full Tower'
	--select * from Categories


-------------------------------------------------------------- MANUFACTURERS ------------------------------------------------------------------------------------
-------------------------------- INSERT ---------------------------------------------------------------------------------
	 IF OBJECT_ID ('insertManufacturersTrigger', 'TR') IS NOT NULL  
	DROP TRIGGER insertManufacturersTrigger;
	GO
	Create TRIGGER insertManufacturersTrigger
	ON Manufacturers
	INSTEAD OF INSERT
	AS
		declare @cErrMsg NVARCHAR(2048);
		BEGIN TRY
		
			BEGIN TRANSACTION;
				insert into Manufacturers select companyname,address,city,country,phone from inserted;
				insert into Logs select GETDATE(),'Manufacturers','INSERT: Producent dodany.';
			COMMIT TRANSACTION;

 
		END TRY
		BEGIN CATCH 
		IF @@TRANCOUNT > 0
		BEGIN
			ROLLBACK TRANSACTION
		END;
		DECLARE @cErrMsg2 NVARCHAR(2048)
		SET @cErrMsg2= ERROR_MESSAGE()
		RAISERROR (@cErrMsg2, 16, 1) WITH NOWAIT, SETERROR
		END CATCH;
	GO


	IF EXISTS (SELECT * FROM sys.procedures WHERE name= 'insertManufacturer' AND type='P') DROP PROCEDURE [dbo].insertManufacturer
	GO
	CREATE PROCEDURE dbo.insertManufacturer (@companyname nvarchar(40) = null, @address nvarchar(40) = null, @city nvarchar(40) = null,@country nvarchar(40) = null, @phone nvarchar(40) = null)
	as
	 DECLARE @cErrMsg nvarchar(100)
		if exists(select * from Manufacturers where companyname = @companyname)
				BEGIN SET @cErrMsg='INSERT: Taki producent istnieje, sprawdŸ dane' 
				insert into Logs select GETDATE(),'Manufacturers',@cErrMsg;
				RAISERROR (@cErrMsg, 16, 1) WITH NOWAIT, SETERROR END
		else if exists(select * from Manufacturers where phone = @phone)
				BEGIN SET @cErrMsg='INSERT: Taki numer telefonu  juz istnieje, sprawdŸ dane' 
				insert into Logs select GETDATE(),'Manufacturers',@cErrMsg;
				RAISERROR (@cErrMsg, 16, 1) WITH NOWAIT, SETERROR END
		 else if(@companyname is null or @address is null or @city  is null or @country is null or @phone is null)
			BEGIN
				set @cErrMsg = 'INSERT: Wszystkie dane musz¹ byæ uzupe³nione.'
				INSERT INTO Logs SELECT GETDATE(), 'Manufacturers', @cErrMsg;		
				raiserror(@cErrMsg, 16, 1) WITH NOWAIT, SETERROR
			END
		else if (@phone not LIKE '[0-9][0-9][0-9] [0-9][0-9][0-9] [0-9][0-9][0-9]')  
				BEGIN SET @cErrMsg='INSERT: Nieprawid³owy numer telefonu' 
				insert into Logs select GETDATE(),'Manufacturers',@cErrMsg;
				RAISERROR (@cErrMsg, 16, 1) WITH NOWAIT, SETERROR END
		else
		begin
			INSERT INTO Manufacturers values(@companyname, @address, @city, @country, @phone)
		end
	GO

 --exec insertManufacturer 'Thermaltake2', 'Oststraße 1c', 'Norderstedt', 'Niemcy', '403 085 862'
 --select * from Manufacturers
 ------------------------------ DELETE ---------------------------------------------------------------------------------
	 IF OBJECT_ID ('deleteManufacturersTrigger', 'TR') IS NOT NULL  
	DROP TRIGGER deleteManufacturersTrigger;
	GO
	Create TRIGGER deleteManufacturersTrigger
	ON Manufacturers
	INSTEAD OF DELETE
	AS
		declare @cErrMsg NVARCHAR(2048);
		BEGIN TRY
			if not exists(select * from Manufacturers m, deleted d where m.manufacturerid = d.manufacturerid)
				BEGIN SET @cErrMsg='DELETE: Taki producent nie istnieje' RAISERROR (@cErrMsg, 16, 1) WITH NOWAIT, SETERROR END
			else
			BEGIN
			BEGIN TRANSACTION;
				delete from Manufacturers where manufacturerid = (select manufacturerid from deleted);
				insert into Logs select GETDATE(),'Manufacturers','DELETE: Usuniêto producenta';
			COMMIT TRANSACTION;
			END
 
		END TRY
		BEGIN CATCH 
		IF @@TRANCOUNT > 0
		BEGIN
			ROLLBACK TRANSACTION
		END;
		DECLARE @cErrMsg2 NVARCHAR(2048)
		SET @cErrMsg2= ERROR_MESSAGE()
		RAISERROR (@cErrMsg2, 16, 1) WITH NOWAIT, SETERROR
		END CATCH;
	GO


	IF EXISTS (SELECT * FROM sys.procedures WHERE name= 'deleteManufacturer' AND type='P') DROP PROCEDURE [dbo].deleteManufacturer
	GO
	CREATE PROCEDURE dbo.deleteManufacturer (@manufacturerid int = null)
	as
	 DECLARE @cErrMsg nvarchar(100)
		 if(@manufacturerid is null)
			BEGIN
				set @cErrMsg = 'DELETE: Nie usuniêto, Wpisz ID producenta'
				INSERT INTO Logs SELECT GETDATE(), 'Manufacturers', @cErrMsg;		
				raiserror(@cErrMsg, 16, 1) WITH NOWAIT, SETERROR
			END
			if exists(select * from Products where manufacturerid = @manufacturerid)
				begin
				set @cErrMsg = 'DELETE: Ten producent widnieje w tabeli Products, najpierw usuñ jego powi¹zania'
					INSERT INTO Logs SELECT GETDATE(), 'Manufacturers', @cErrMsg;		
					raiserror(@cErrMsg, 16, 1) WITH NOWAIT, SETERROR
				end
		else
		begin
			delete from Manufacturers where manufacturerid = @manufacturerid;
		end
	GO


	--select * from Manufacturers
	--exec deleteManufacturer 6

	-------------------------- UPDATE -----------------------------
	
	IF OBJECT_ID ('updateManufacturersTrigger', 'TR') IS NOT NULL  
	DROP TRIGGER updateManufacturersTrigger;

	GO 
	CREATE TRIGGER updateManufacturersTrigger
	ON Manufacturers
	INSTEAD OF UPDATE
	AS
		declare @cErrMsg NVARCHAR(2048);
		BEGIN TRY
			if not exists(select * from Manufacturers m, inserted i where m.manufacturerid = i.manufacturerid)
				BEGIN SET @cErrMsg='UPDATE: Taki producent nie istnieje' RAISERROR (@cErrMsg, 16, 1) WITH NOWAIT, SETERROR END
			else
			BEGIN
				BEGIN TRANSACTION
					UPDATE dbo.Manufacturers
					SET
					companyname = (select companyname from inserted),
					address = (select address from inserted),
					city = (select city from inserted),
					country = (select country from inserted),
					phone = (select phone from inserted)

					where manufacturerid = (select manufacturerid from deleted)
					INSERT INTO Logs SELECT GETDATE(), 'Manufacturers', 'UPDATE: Zaktualizowano';	
			
			COMMIT TRANSACTION;
			END
 
		END TRY
		BEGIN CATCH 
		IF @@TRANCOUNT > 0
		BEGIN
			ROLLBACK TRANSACTION
		END;
		DECLARE @cErrMsg2 NVARCHAR(2048)
		SET @cErrMsg2= ERROR_MESSAGE()
		RAISERROR (@cErrMsg2, 16, 1) WITH NOWAIT, SETERROR
		END CATCH;
	GO


	IF EXISTS (SELECT * FROM sys.procedures WHERE name= 'updateManufacturer' AND type='P') DROP PROCEDURE [dbo].updateManufacturer

	GO
	CREATE PROCEDURE dbo.updateManufacturer (@manufacturerid int = null, @companyname nvarchar(40) = null, @address nvarchar(40) = null, @city nvarchar(40) = null,@country nvarchar(40) = null, @phone nvarchar(40) = null)
	as
	 DECLARE @cErrMsg nvarchar(100)
		 if(@manufacturerid is null or @companyname is null or @address is null or @city is null or @country is null or @phone is null)
			BEGIN
				set @cErrMsg = 'UPDATE: Wszystkie dane musz¹ byæ uzupe³nione.'
				INSERT INTO Logs SELECT GETDATE(), 'Manufacturers', @cErrMsg;		
				raiserror(@cErrMsg, 16, 1) WITH NOWAIT, SETERROR
			END
		else if (@phone not LIKE '[0-9][0-9][0-9] [0-9][0-9][0-9] [0-9][0-9][0-9]')  
			BEGIN SET @cErrMsg='INSERT: Nieprawid³owy numer telefonu' 
			insert into Logs select GETDATE(),'Manufacturers',@cErrMsg;
			RAISERROR (@cErrMsg, 16, 1) WITH NOWAIT, SETERROR END
		else
		begin
			UPDATE Manufacturers set manufacturerid = @manufacturerid, companyname = @companyname, address = @address, city = @city, country = @country, phone = @phone where manufacturerid = @manufacturerid;
		end
	GO


	--exec updateManufacturer 11, 'Thermaltake2', 'Oststraße 1c', 'Norderstedt', 'Niemcy', '403 085 805'
	--select * from Manufacturers

-------------------------------------------------------------- PRODUCTS ----------------------------------------------------------------------------------------
-------------------------------- INSERT ---------------------------------------------------------------------------------
	 IF OBJECT_ID ('insertProductsTrigger', 'TR') IS NOT NULL  
	DROP TRIGGER insertProductsTrigger;
	GO
	Create TRIGGER insertProductsTrigger
	ON Products
	INSTEAD OF INSERT
	AS
		declare @cErrMsg NVARCHAR(2048);
		BEGIN TRY
		
			BEGIN TRANSACTION;
				insert into Products select casename, manufacturerid, categoryid, unitprice from inserted;
				insert into Logs select GETDATE(),'Products','INSERT: Produkt dodany.';
			COMMIT TRANSACTION;

 
		END TRY
		BEGIN CATCH 
		IF @@TRANCOUNT > 0
		BEGIN
			ROLLBACK TRANSACTION
		END;
		DECLARE @cErrMsg2 NVARCHAR(2048)
		SET @cErrMsg2= ERROR_MESSAGE()
		RAISERROR (@cErrMsg2, 16, 1) WITH NOWAIT, SETERROR
		END CATCH;
	GO


	IF EXISTS (SELECT * FROM sys.procedures WHERE name= 'insertProduct' AND type='P') DROP PROCEDURE [dbo].insertProduct
	GO
	CREATE PROCEDURE dbo.insertProduct (@casename nvarchar(40) = null, @manufacturerid int = null, @categoryid int = null, @unitprice money = null)
	as
	 DECLARE @cErrMsg nvarchar(100)
		if exists(select * from Products where casename = @casename)
				BEGIN SET @cErrMsg='INSERT: Taka obudowa jest juz w bazie, sprawdŸ dane' 
				insert into Logs select GETDATE(),'Products',@cErrMsg;
				RAISERROR (@cErrMsg, 16, 1) WITH NOWAIT, SETERROR END

		else if not exists(select * from Manufacturers where manufacturerid = @manufacturerid)
				BEGIN SET @cErrMsg='INSERT: Taki producent nie istnieje' 
				insert into Logs select GETDATE(),'Products',@cErrMsg;
				RAISERROR (@cErrMsg, 16, 1) WITH NOWAIT, SETERROR END

		else if not exists(select * from Categories where categoryid = @categoryid)
				BEGIN SET @cErrMsg='INSERT: Taka kategoria nie istnieje' 
				insert into Logs select GETDATE(),'Products',@cErrMsg;
				RAISERROR (@cErrMsg, 16, 1) WITH NOWAIT, SETERROR END

	  else if(@casename is null or @manufacturerid is null or @categoryid is null or @unitprice is null)
			BEGIN
				set @cErrMsg = 'INSERT: Wszystkie dane musz¹ byæ uzupe³nione.'
				INSERT INTO Logs SELECT GETDATE(), 'Products', @cErrMsg;		
				raiserror(@cErrMsg, 16, 1) WITH NOWAIT, SETERROR
			END
	else
		begin
			INSERT INTO Products values(@casename, @manufacturerid, @categoryid, @unitprice)
		end
	GO

 --exec insertProduct 'MasterBox Q300L','2','1','198.99'
 --select * from Products
 ------------------------------ DELETE ---------------------------------------------------------------------------------
	 IF OBJECT_ID ('deleteProductsTrigger', 'TR') IS NOT NULL  
	DROP TRIGGER deleteProductsTrigger;
	GO
	Create TRIGGER deleteProductsTrigger
	ON Products
	INSTEAD OF DELETE
	AS
		declare @cErrMsg NVARCHAR(2048);
		BEGIN TRY
			if not exists(select * from Products p, deleted d where p.caseid = d.caseid)
				BEGIN SET @cErrMsg='DELETE: Taki produkt nie istnieje' RAISERROR (@cErrMsg, 16, 1) WITH NOWAIT, SETERROR END
			else
			BEGIN
			BEGIN TRANSACTION;
				delete from Products where caseid = (select caseid from deleted);
				insert into Logs select GETDATE(),'Products','DELETE: Usuniêto producenta';
			COMMIT TRANSACTION;
			END
 
		END TRY
		BEGIN CATCH 
		IF @@TRANCOUNT > 0
		BEGIN
			ROLLBACK TRANSACTION
		END;
		DECLARE @cErrMsg2 NVARCHAR(2048)
		SET @cErrMsg2= ERROR_MESSAGE()
		RAISERROR (@cErrMsg2, 16, 1) WITH NOWAIT, SETERROR
		END CATCH;
	GO


	IF EXISTS (SELECT * FROM sys.procedures WHERE name= 'deleteProduct' AND type='P') DROP PROCEDURE [dbo].deleteProduct
	GO
	CREATE PROCEDURE dbo.deleteProduct (@caseid int = null)
	as
	 DECLARE @cErrMsg nvarchar(100)
		 if(@caseid is null)
			BEGIN
				set @cErrMsg = 'DELETE: Nie usuniêto, Wpisz ID produktu'
				INSERT INTO Logs SELECT GETDATE(), 'Products', @cErrMsg;		
				raiserror(@cErrMsg, 16, 1) WITH NOWAIT, SETERROR
			END
			if exists(select * from Sales where caseid = @caseid)
				begin
				set @cErrMsg = 'DELETE: Ten produkt widnieje w tabeli Sales, najpierw usuñ jego powi¹zania'
					INSERT INTO Logs SELECT GETDATE(), 'Products', @cErrMsg;		
					raiserror(@cErrMsg, 16, 1) WITH NOWAIT, SETERROR
				end
		else
		begin
			delete from Products where caseid = @caseid;
		end
	GO


	--select * from Products
	--exec deleteProduct 24

	------------------------ UPDATE -----------------------------
	
	IF OBJECT_ID ('updateProductsTrigger', 'TR') IS NOT NULL  
	DROP TRIGGER updateProductsTrigger;

	GO 
	CREATE TRIGGER updateProductsTrigger
	ON Products
	INSTEAD OF UPDATE
	AS
		declare @cErrMsg NVARCHAR(2048);
		BEGIN TRY
			if not exists(select * from Products p, inserted i where p.caseid = i.caseid)
				BEGIN SET @cErrMsg='UPDATE: Taki produktt nie istnieje' RAISERROR (@cErrMsg, 16, 1) WITH NOWAIT, SETERROR END
			else
			BEGIN
				BEGIN TRANSACTION
					UPDATE dbo.Products
					SET
					casename = (select casename from inserted),
					manufacturerid = (select manufacturerid from inserted),
					categoryid = (select categoryid from inserted),
					unitprice = (select unitprice from inserted)

					where caseid = (select caseid from deleted)
					INSERT INTO Logs SELECT GETDATE(), 'Products', 'UPDATE: Zaktualizowano';	
			
			COMMIT TRANSACTION;
			END
 
		END TRY
		BEGIN CATCH 
		IF @@TRANCOUNT > 0
		BEGIN
			ROLLBACK TRANSACTION
		END;
		DECLARE @cErrMsg2 NVARCHAR(2048)
		SET @cErrMsg2= ERROR_MESSAGE()
		RAISERROR (@cErrMsg2, 16, 1) WITH NOWAIT, SETERROR
		END CATCH;
	GO


	IF EXISTS (SELECT * FROM sys.procedures WHERE name= 'updateProduct' AND type='P') DROP PROCEDURE [dbo].updateProduct

	GO
	CREATE PROCEDURE dbo.updateProduct (@caseid int = null, @casename nvarchar(40) = null,@manufacturerid int = null, @categoryid int = null, @unitprice money = null)
	as
	 DECLARE @cErrMsg nvarchar(100)
		 if(@caseid is null or @casename is null or @manufacturerid is null or @categoryid is null or @unitprice is null)
			BEGIN
				set @cErrMsg = 'UPDATE: Wszystkie dane musz¹ byæ uzupe³nione.'
				INSERT INTO Logs SELECT GETDATE(), 'Products', @cErrMsg;		
				raiserror(@cErrMsg, 16, 1) WITH NOWAIT, SETERROR
			END
		else if not exists(select * from Manufacturers where manufacturerid = @manufacturerid)
				BEGIN SET @cErrMsg='INSERT: Taki producent nie istnieje' 
				insert into Logs select GETDATE(),'Products',@cErrMsg;
				RAISERROR (@cErrMsg, 16, 1) WITH NOWAIT, SETERROR END

		else if not exists(select * from Categories where categoryid = @categoryid)
				BEGIN SET @cErrMsg='INSERT: Taka kategoria nie istnieje' 
				insert into Logs select GETDATE(),'Products',@cErrMsg;
				RAISERROR (@cErrMsg, 16, 1) WITH NOWAIT, SETERROR END
		else

		begin
			UPDATE Products set caseid = @caseid, casename = @casename, manufacturerid = @manufacturerid, categoryid = @categoryid, unitprice = @unitprice where caseid = @caseid;
		end
	GO


	--exec updateProduct 1, 'MasterBox Q300L','1','9','198.99'
	--select * from Products


-------------------------------------------------------------- SALES ------------------------------------------------------------------------------------------

------------------------------- Procedura select -----------------------------------------------------------------------
IF EXISTS (SELECT * FROM sys.procedures WHERE name= 'selectAll' AND type='P') DROP PROCEDURE [dbo].selectAll
	GO
	CREATE PROCEDURE dbo.selectAll
	as
			SELECT saleid, concat(c.firstname , ' ' , c.lastname) as Klient, p.casename as Obudowa,concat(w.firstname , ' ' , w.lastname) as Sprzedawca, s.name as Dostawca, saledate  FROM Sales
			join Clients c on c.clientid = Sales.clientid
			join Products p on p.caseid = Sales.caseid
			join Workers w on w.workerid = Sales.workerid
			join Shippers s on s.shipperid = Sales.shipperid
	GO



	--nazwa z id
IF EXISTS (SELECT * FROM sys.procedures WHERE name= 'clientIdToName' AND type='P') DROP PROCEDURE [dbo].clientIdToName
	GO
	CREATE PROCEDURE dbo.clientIdToName (@id int)
	as
	DECLARE @cErrMsg nvarchar(100)
		if exists(select clientid from Clients where clientid = @id)
		
		 select concat(firstname, ' ', lastname) from Clients where clientid = @id;
		else
			BEGIN SET @cErrMsg='INSERT: Taki klient nie istnieje' RAISERROR (@cErrMsg, 16, 1) WITH NOWAIT, SETERROR END

	GO

IF EXISTS (SELECT * FROM sys.procedures WHERE name= 'caseIdToName' AND type='P') DROP PROCEDURE [dbo].caseIdToName
	GO
	CREATE PROCEDURE dbo.caseIdToName (@id int)
	as
	DECLARE @cErrMsg nvarchar(100)
		if exists(select caseid from Products where caseid = @id)
		
		 select casename from Products where caseid = @id;
		else
			BEGIN SET @cErrMsg='INSERT: Taki produkt nie istnieje' RAISERROR (@cErrMsg, 16, 1) WITH NOWAIT, SETERROR END

	GO

	exec caseIdToName 5

IF EXISTS (SELECT * FROM sys.procedures WHERE name= 'workerIdToName' AND type='P') DROP PROCEDURE [dbo].workerIdToName
	GO
	CREATE PROCEDURE dbo.workerIdToName (@id int)
	as
	DECLARE @cErrMsg nvarchar(100)
		if exists(select workerid from Workers where workerid = @id)
		
		 select concat(firstname, ' ', lastname) from Workers where workerid = @id;
		else
			BEGIN SET @cErrMsg='INSERT: Taki pracownik nie istnieje' RAISERROR (@cErrMsg, 16, 1) WITH NOWAIT, SETERROR END

	GO

IF EXISTS (SELECT * FROM sys.procedures WHERE name= 'shipperIdToName' AND type='P') DROP PROCEDURE [dbo].shipperIdToName
	GO
	CREATE PROCEDURE dbo.shipperIdToName (@id int)
	as
	DECLARE @cErrMsg nvarchar(100)
		if exists(select shipperid from Shippers where shipperid = @id)
		
		 select name from Shippers where shipperid = @id;
		else
			BEGIN SET @cErrMsg='INSERT: Taki dostawca nie istnieje' RAISERROR (@cErrMsg, 16, 1) WITH NOWAIT, SETERROR END

	GO

	-- ID i Nazwa 
IF EXISTS (SELECT * FROM sys.procedures WHERE name= 'workerIdAndName' AND type='P') DROP PROCEDURE [dbo].workerIdAndName
	GO
	CREATE PROCEDURE dbo.workerIdAndName
	as
		 select CONCAT(firstname, ' ', lastname) as Sprzedawca, workerid as ID  from Workers;
	GO

IF EXISTS (SELECT * FROM sys.procedures WHERE name= 'clientIdAndName' AND type='P') DROP PROCEDURE [dbo].clientIdAndName
	GO
	CREATE PROCEDURE dbo.clientIdAndName
	as
		 select CONCAT(firstname, ' ', lastname) as Klient, clientid as ID  from Clients;
	GO

IF EXISTS (SELECT * FROM sys.procedures WHERE name= 'productIdAndName' AND type='P') DROP PROCEDURE [dbo].productIdAndName
	GO
	CREATE PROCEDURE dbo.productIdAndName
	as
		 select casename as Obudowa, caseid as ID  from Products;
	GO

IF EXISTS (SELECT * FROM sys.procedures WHERE name= 'shipperIdAndName' AND type='P') DROP PROCEDURE [dbo].shipperIdAndName
	GO
	CREATE PROCEDURE dbo.shipperIdAndName
	as
		 select name as Dostawca, shipperid as ID  from Shippers;
	GO
-- wszystkie id po id sprzedazy

		IF EXISTS (SELECT * FROM sys.procedures WHERE name= 'idList' AND type='P') DROP PROCEDURE [dbo].idList
	GO
	CREATE PROCEDURE dbo.idList (@id int)
	as
	DECLARE @cErrMsg nvarchar(100)
		if exists(select saleid from Sales where saleid = @id)
		
		 select clientid, caseid, workerid, shipperid from Sales where saleid = @id;
		else
			BEGIN SET @cErrMsg='INSERT: Taka transakcja nie istnieje' RAISERROR (@cErrMsg, 16, 1) WITH NOWAIT, SETERROR END

	GO		


exec idList 6
--IF EXISTS (SELECT * FROM sys.procedures WHERE name= 'caseIdToName' AND type='P') DROP PROCEDURE [dbo].selectAll
--	GO
--	CREATE PROCEDURE dbo.selectAll
--	as
--	 DECLARE @cErrMsg nvarchar(100)
		 
--			SELECT saleid, concat(c.firstname , ' ' , c.lastname) as Klient, p.casename as Obudowa,concat(w.firstname , ' ' , w.lastname) as Sprzedawca, s.name as Dostawca, saledate  FROM Sales
--			join Clients c on c.clientid = Sales.clientid
--			join Products p on p.caseid = Sales.caseid
--			join Workers w on w.workerid = Sales.workerid
--			join Shippers s on s.shipperid = Sales.shipperid
--	GO

--	IF EXISTS (SELECT * FROM sys.procedures WHERE name= 'workerIdToName' AND type='P') DROP PROCEDURE [dbo].selectAll
--	GO
--	CREATE PROCEDURE dbo.selectAll
--	as
--	 DECLARE @cErrMsg nvarchar(100)
		 
--			SELECT saleid, concat(c.firstname , ' ' , c.lastname) as Klient, p.casename as Obudowa,concat(w.firstname , ' ' , w.lastname) as Sprzedawca, s.name as Dostawca, saledate  FROM Sales
--			join Clients c on c.clientid = Sales.clientid
--			join Products p on p.caseid = Sales.caseid
--			join Workers w on w.workerid = Sales.workerid
--			join Shippers s on s.shipperid = Sales.shipperid
--	GO

--	IF EXISTS (SELECT * FROM sys.procedures WHERE name= 'shipperIdToName' AND type='P') DROP PROCEDURE [dbo].selectAll
--	GO
--	CREATE PROCEDURE dbo.selectAll
--	as
--	 DECLARE @cErrMsg nvarchar(100)
		 
--	GO
-------------------------------- INSERT ---------------------------------------------------------------------------------
	IF OBJECT_ID ('insertSalesTrigger', 'TR') IS NOT NULL  
	DROP TRIGGER insertSalesTrigger;
	GO
	Create TRIGGER insertSalesTrigger
	ON Sales
	INSTEAD OF INSERT
	AS
		declare @cErrMsg NVARCHAR(2048);
		BEGIN TRY
		
			BEGIN TRANSACTION;
				insert into Sales select clientid, caseid, workerid, shipperid, saledate from inserted;
				insert into Logs select GETDATE(),'Sales','INSERT: Sprzeda¿ zanotowana.';
			COMMIT TRANSACTION;

 
		END TRY
		BEGIN CATCH 
		IF @@TRANCOUNT > 0
		BEGIN
			ROLLBACK TRANSACTION
		END;
		DECLARE @cErrMsg2 NVARCHAR(2048)
		SET @cErrMsg2= ERROR_MESSAGE()
		RAISERROR (@cErrMsg2, 16, 1) WITH NOWAIT, SETERROR
		END CATCH;
	GO


	IF EXISTS (SELECT * FROM sys.procedures WHERE name= 'insertSale' AND type='P') DROP PROCEDURE [dbo].insertSale
	GO
	CREATE PROCEDURE dbo.insertSale (@clientid int = null, @caseid int = null, @workerid int = null, @shipperid int = null, @saledate datetime = null)
	as
	 DECLARE @cErrMsg nvarchar(100)

        if not exists(select * from Clients where clientid = @clientid)
				BEGIN SET @cErrMsg='INSERT: Taki klient nie istnieje' 
				insert into Logs select GETDATE(),'Sales',@cErrMsg;
				RAISERROR (@cErrMsg, 16, 1) WITH NOWAIT, SETERROR END

		else if not exists(select * from Products where caseid = @caseid)
				BEGIN SET @cErrMsg='INSERT: Taki produkt nie istnieje' 
				insert into Logs select GETDATE(),'Sales',@cErrMsg;
				RAISERROR (@cErrMsg, 16, 1) WITH NOWAIT, SETERROR END

		else if not exists(select * from Workers where workerid = @workerid)
				BEGIN SET @cErrMsg='INSERT: Taki pracownik nie istnieje' 
				insert into Logs select GETDATE(),'Sales',@cErrMsg;
				RAISERROR (@cErrMsg, 16, 1) WITH NOWAIT, SETERROR END

		else if not exists(select * from Shippers where shipperid = @shipperid)
				BEGIN SET @cErrMsg='INSERT: Taki przewoŸnik nie istnieje' 
				insert into Logs select GETDATE(),'Sales',@cErrMsg;
				RAISERROR (@cErrMsg, 16, 1) WITH NOWAIT, SETERROR END

	 
	 else if(@clientid is null or @caseid is null or @workerid is null or @shipperid is null or @saledate is null)
			BEGIN
				set @cErrMsg = 'INSERT: Wszystkie dane musz¹ byæ uzupe³nione.'
				INSERT INTO Logs SELECT GETDATE(), 'Sales', @cErrMsg;		
				raiserror(@cErrMsg, 16, 1) WITH NOWAIT, SETERROR
			END
	else
		begin
			INSERT INTO Sales values(@clientid, @caseid, @workerid, @shipperid, @saledate)
		end
	GO


	select * from sales
 --exec insertSale 3,22,2,4
 --select * from Sales
 ------------------------------ DELETE ---------------------------------------------------------------------------------
	 IF OBJECT_ID ('deleteSalesTrigger', 'TR') IS NOT NULL  
	DROP TRIGGER deleteSalesTrigger;
	GO
	Create TRIGGER deleteSalesTrigger
	ON Sales
	INSTEAD OF DELETE
	AS
		declare @cErrMsg NVARCHAR(2048);
		BEGIN TRY
			if not exists(select * from Sales s, deleted d where s.saleid = d.saleid)
				BEGIN SET @cErrMsg='DELETE: Taka transakcja nie istnieje' RAISERROR (@cErrMsg, 16, 1) WITH NOWAIT, SETERROR END
			else
			BEGIN
			BEGIN TRANSACTION;
				delete from Sales where saleid = (select saleid from deleted);
				insert into Logs select GETDATE(),'Sales','DELETE: Usuniêto transakcje';
			COMMIT TRANSACTION;
			END
 
		END TRY
		BEGIN CATCH 
		IF @@TRANCOUNT > 0
		BEGIN
			ROLLBACK TRANSACTION
		END;
		DECLARE @cErrMsg2 NVARCHAR(2048)
		SET @cErrMsg2= ERROR_MESSAGE()
		RAISERROR (@cErrMsg2, 16, 1) WITH NOWAIT, SETERROR
		END CATCH;
	GO


	IF EXISTS (SELECT * FROM sys.procedures WHERE name= 'deleteSale' AND type='P') DROP PROCEDURE [dbo].deleteSale
	GO
	CREATE PROCEDURE dbo.deleteSale (@saleid int = null)
	as
	 DECLARE @cErrMsg nvarchar(100)
		 if(@saleid is null)
			BEGIN
				set @cErrMsg = 'DELETE: Nie usuniêto, Wpisz ID transakcji'
				INSERT INTO Logs SELECT GETDATE(), 'Sales', @cErrMsg;		
				raiserror(@cErrMsg, 16, 1) WITH NOWAIT, SETERROR
			END
			

		else
		begin
			delete from Sales where saleid = @saleid;
		end
	GO


	--select * from Sales
	--exec deleteSale 29

	-------------------------- UPDATE -----------------------------
	
	IF OBJECT_ID ('updateSalesTrigger', 'TR') IS NOT NULL  
	DROP TRIGGER updateSalesTrigger;

	GO 
	CREATE TRIGGER updateSalesTrigger
	ON Sales
	INSTEAD OF UPDATE
	AS
		declare @cErrMsg NVARCHAR(2048);
		BEGIN TRY
			if not exists(select * from Sales s, inserted i where s.saleid = i.saleid)
				BEGIN SET @cErrMsg='UPDATE: Taka transakcja nie istnieje' RAISERROR (@cErrMsg, 16, 1) WITH NOWAIT, SETERROR END
			else
			BEGIN
				BEGIN TRANSACTION
					UPDATE dbo.Sales
					SET
					clientid = (select clientid from inserted),
					caseid = (select caseid from inserted),
					workerid = (select workerid from inserted),
					shipperid = (select shipperid from inserted),
					saledate = (select saledate from inserted)


					where saleid = (select saleid from deleted)
					INSERT INTO Logs SELECT GETDATE(), 'Sales', 'UPDATE: Zaktualizowano';	
			
			COMMIT TRANSACTION;
			END
 
		END TRY
		BEGIN CATCH 
		IF @@TRANCOUNT > 0
		BEGIN
			ROLLBACK TRANSACTION
		END;
		DECLARE @cErrMsg2 NVARCHAR(2048)
		SET @cErrMsg2= ERROR_MESSAGE()
		RAISERROR (@cErrMsg2, 16, 1) WITH NOWAIT, SETERROR
		END CATCH;
	GO


	IF EXISTS (SELECT * FROM sys.procedures WHERE name= 'updateSale' AND type='P') DROP PROCEDURE [dbo].updateSale

	GO
	CREATE PROCEDURE dbo.updateSale (@saleid int = null, @clientid int = null, @caseid int = null, @workerid int = null, @shipperid int = null, @saledate datetime = null)
	as
	 DECLARE @cErrMsg nvarchar(100)
		 if(@saleid is null or @clientid is null or @caseid is null or @workerid is null or @shipperid is null or @saledate is null)
			BEGIN
				set @cErrMsg = 'UPDATE: Wszystkie dane musz¹ byæ uzupe³nione.'
				INSERT INTO Logs SELECT GETDATE(), 'Sales', @cErrMsg;		
				raiserror(@cErrMsg, 16, 1) WITH NOWAIT, SETERROR
			END
		else if not exists(select * from Clients where clientid = @clientid)
				BEGIN SET @cErrMsg='INSERT: Taki klient nie istnieje' 
				insert into Logs select GETDATE(),'Sales',@cErrMsg;
				RAISERROR (@cErrMsg, 16, 1) WITH NOWAIT, SETERROR END

		else if not exists(select * from Products where caseid = @caseid)
				BEGIN SET @cErrMsg='INSERT: Taki produkt nie istnieje' 
				insert into Logs select GETDATE(),'Sales',@cErrMsg;
				RAISERROR (@cErrMsg, 16, 1) WITH NOWAIT, SETERROR END

		else if not exists(select * from Workers where workerid = @workerid)
				BEGIN SET @cErrMsg='INSERT: Taki pracownik nie istnieje' 
				insert into Logs select GETDATE(),'Sales',@cErrMsg;
				RAISERROR (@cErrMsg, 16, 1) WITH NOWAIT, SETERROR END

		else if not exists(select * from Shippers where shipperid = @shipperid)
				BEGIN SET @cErrMsg='INSERT: Taki przewoŸnik nie istnieje' 
				insert into Logs select GETDATE(),'Sales',@cErrMsg;
				RAISERROR (@cErrMsg, 16, 1) WITH NOWAIT, SETERROR END
		else 
		begin
			UPDATE Sales set saleid = @saleid, clientid = @clientid, caseid = @caseid, workerid = @workerid, shipperid = @shipperid, saledate = @saledate where saleid = @saleid;
		end
	GO


	--exec updateSale 28,	1,	13,	1,	3,	'20200901 00:00:00.000';
	--select * from Sales