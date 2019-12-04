CREATE TABLE Examples.Gadget
(
	GadgetId	int NOT NULL CONSTRAINT PKGadget PRIMARY KEY,
	GadgetNumber char(8) NOT NULL CONSTRAINT AKGadget UNIQUE,
	GadgetType varchar(10) NOT NULL
);
GO

INSERT INTO Examples.Gadget(GadgetId, GadgetNumber, GadgetType)
VALUES  (1,'00000001','Electronic'),
		(2,'00000002','Manual'),
		(3,'00000003','Manual');
GO

CREATE VIEW Examples.ElectronicGadget
AS
	SELECT GadgetId, GadgetNumber, GadgetType,
			UPPER(GadgetType) AS UpperGadgetType
	FROM Examples.Gadget
	WHERE GadgetType = 'Electronic';
	--COMPARISONS
	--LIKE, IN,
	--<MEANS LESSER THAN
	--> GREATER THEN
	--<> OR ! =BOTH MEANS NOT EQUAL
GO

SELECT * FROM Example.Gadget;
SELECT * FROM Examples.ElectronicGadget;
GO

SELECT ElectronicGadget.GadgetNumber AS FromView,
Gadget.GadgetNumber AS FromTable,
	Gadget.GadgetType, ElectronicGadget.UpperGadgetType
FROM Examples.ElectronicGadget		
		FULL OUTER JOIN Examples.Gadget	
			ON ElectronicGadget.GadgetId = Gadget.GadgetId;

Go

INSERT INTO Examples.ElectronicGadget(GadgetId, GadgetNumber, GadgetType)
VALUES (4,'00000004','Electronic'),
		(5,'00000005','Manual');
GO
--UPDATE the row we could see to values that could not be seen
UPDATE Examples.ElectronicGadget
SET		GadgetType = 'Manual'
WHERE	GadgetNumber = '00000004';

GO

--update the row we could see to values that could  actually see

UPDATE Examples.ElectronicGadget
SET		GadgetType = 'Electronic'
WHERE	GadgetNumber = '00000005';

GO

ALTER VIEW Examples.ElectronicGadget
AS
	SELECT GadgetID, GadgetNumber, GadgetType, 
		   UPPER(GadgetType) AS UpperGadgetType
	FROM Examples.Gadget
	WHERE GadgetType = 'Electronic'
	WITH CHECK OPTION;

GO

INSERT INTO Examples.ElectronicGadget(GadgetId, GadgetNumber, GAdgetType)
VALUES (6,'00000006','Electronic');