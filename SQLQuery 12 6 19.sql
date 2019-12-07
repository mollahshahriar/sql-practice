DROP TABLE IF EXISTS Examples.Widget;

CREATE TABLE Examples.Widget(

WidgetId int PRIMARY KEY,

RowLastModifiedTime DATETIME2(0) NOT NULL

)



INSERT INTO Examples.Widget VALUES(2);

select * from Examples.Widget



ALTER TABLE Examples.Widget

ADD CONSTRAINT DFLTWIDGET_RowLastModifiedTime

DEFAULT (SYSDATETIME()) FOR ROR RowLastModifiedTime;



INSERT INTO Examples.Widget (WidgetId) VALUES (3);



SELECT * FROM Examples.Widget;