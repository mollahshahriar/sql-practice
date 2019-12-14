CREATE PROCEDURE Examples.HandlingErrors
AS
	DECLARE @NoOp int = 0;
	THROW 50000, 'Anerror has occurred!',1;
GO
EXEC Examples.HandlingErrors;
GO
CREATE PROCEDURE Examples.ContinueBatchError
AS
	DECLARE @NoOp int = 100;
	THROW 50000,'BATCH STOPPED!',1;
	SELECT @NoOp, SYSDATETIME();
GO

CREATE PROCEDURE Examples.StopBatchError
AS
	DECLARE @NoOp int = 100;
	RAISERROR ('Batch Stopped!', 16, 2);
	SELECT @NoOp, SYSDATETIME();
GO
EXEC Examples.StopBatchError;
EXEC Examples.ContinueBatchError;


CREATE TABLE Examples.Worker
(
	WorkerId INT not null identity(1,1) CONSTRAINT PKWorker PRIMARY KEY,
	WorkerName nvarchar (50) NOT NULL CONSTRAINT AKWorker UNIQUE
);
CREATE TABLE Examples.WorkerAssingment
(
	WorkerAssingmentId int IDENTITY (1,1) CONSTRAINT PKWorkerAssingment PRIMARY KEY,
	WOrkerId int NOT NULL
		CONSTRAINT CHKWorkerAssingment_CompanyName
			CHECK (CompanyName <> 'Contoso, Ltd.'),
		CONSTRAINT AKWorkerAssingment UNIQUE (WorkerId, CompanyName) 
);


CREATE PROCEDURE Examples.Worker_AddWithAssignment
	@WorkerName nvarchar(50),