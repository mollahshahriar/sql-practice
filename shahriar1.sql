SELECT* 
FROM Sales.CustomerTransactions
WHERE PaymentMethodID = 4;

SELECT CustomerID, OrderID, OrderDate, ExpectedDeliveryDate
FROM Sales.Orders
WHERE CustomerPurchaseOrderNumber = '16374';

SELECT SalespersonpersonId, OrderDate
FROM Sales.Orders
ORDER BY SalespersonPersonId ASC, OrderDate DESC;

CREATE INDEX SalespersonPersonID_OrderDatre1 ON Sales.Orders(SalespersonPersonID ASC, OrderDate DESC);

SELECT OrderId, OrderDate, ExpectedDeliveryDate, People.FullName
FROM Sales.Orders JOIN Application.People ON People.PersonID = Orders.ContactPersonID
WHERE People.PreferredName = 'Aakriti';

CREATE NONCLUSTERED INDEX ContactPersonId_Include_OrderDate_ExpectedDeliveryDate ON Sales.Orders(ContactPersonId)
INCLUDE (OrderDate, ExpectedDeliveryDate)
ON USERDATA
GO

