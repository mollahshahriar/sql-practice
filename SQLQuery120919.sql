DROP TABLE IF EXISTS Examples.Gadget;
CREATE TABLE Examples.Gadget
(
	GadgetId int Identity(1,1) NOT NULL CONSTRAINT PKGadget PRIMARY KEY,
	GadgetCode varchar(10) NOT NULL
);
INSERT INTO Examples.Gadget (GadgetCode)
VALUES ('Gadget'), ('Gadget'), ('gadget');

SELECT * FROM Examples.Gadget;

GO
DELETE FROM Examples.Gadget WHERE GadgetId >=2;
ALTER TABLE Examples.Gadget
ADD CONSTRAINT AKGadget UNIQUE (GadgetCode); 

GO

CREATE TABLE Examples.GroceryItem
(
	ItemCost Smallmoney NULL,
	CONSTRAINT CHKGroceryItem_ItemCostRange
		CHECK (ItemCost > 0 AND ItemCost < 1000)
);

INSERT INTO Examples.GroceryItem 
VALUES (300.95);

CREATE TABLE Examples.Message
(
	MessageTag char(5) NOT NULL,
	Comment Nvarchar(max) NULL

);
GO

ALTER TABLE Examples.Message
	ADD CONSTRAINT CHKMesssage_MessageTagFormat
		CHeck (MessageTag LIKE '[A-Z]-[0-9][0-9][0-9]');

ALTER TABLE Examples.Message
	ADD CONSTRAINT CHKMesssage_NotEmpty
		Check (LEN(Comment)> 0);

INSERT INTO Examples.Message (MessageTag, Comment)
VALUES ('nope','');

INSERT INTO Examples.Message (MessageTag, Comment)
VALUES ('A-001','');

INSERT INTO Examples.Message (MessageTag, Comment)
VALUES ('A-001','This Is a Comment');