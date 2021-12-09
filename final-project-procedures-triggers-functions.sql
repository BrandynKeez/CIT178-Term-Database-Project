/* Final Project Procedures 

USE finalProject;
GO

CREATE PROC spFullCustInfo
AS
SELECT Customers.customerID AS CustomerID, fName, lName, email, address, Zipcodes.city AS City, Zipcodes.state AS State, Customers.zipcode AS Zipcode, Zipcodes.country AS Country, COUNT(Orders.orderID) AS NumOrders
FROM Customers
JOIN Zipcodes on Customers.zipcode = Zipcodes.zipcode
JOIN Orders on Customers.customerID = Orders.customerID
GROUP BY Customers.customerID,  fName, lName, email, address, Zipcodes.city, Zipcodes.state, Customers.zipcode, Zipcodes.country;

USE finalProject;
GO
CREATE PROC spFullCustInfoIdSelect
	@ID int = null
AS
SELECT Customers.customerID AS CustomerID, fName, lName, email, address, Zipcodes.city AS City, Zipcodes.state AS State, Customers.zipcode AS Zipcode, Zipcodes.country AS Country, COUNT(Orders.orderID) AS NumOrders
FROM Customers
JOIN Zipcodes on Customers.zipcode = Zipcodes.zipcode
JOIN Orders on Customers.customerID = Orders.customerID
WHERE Customers.customerID = @ID
GROUP BY Customers.customerID,  fName, lName, email, address, Zipcodes.city, Zipcodes.state, Customers.zipcode, Zipcodes.country;
GO

EXEC spFullCustInfoIdSelect 2;

USE finalProject;
GO
CREATE PROC spCustSumSpent
	@ID int = null,
	@CustName varchar(25) OUTPUT,
	@SumOrders money OUTPUT
AS
IF @ID IS NULL
	SELECT customerID FROM Orders ORDER BY customerID DESC;

SELECT @CustName = Customers.fName, @SumOrders = SUM(Orders.total)
FROM Orders
JOIN Customers ON Orders.customerID = Customers.customerID
WHERE Orders.customerID = @ID
GROUP BY Customers.fName;
GO

DECLARE @CustName varchar(25);
DECLARE @SumOrders money;
EXEC spCustSumSpent 3,@CustName OUTPUT,@SumOrders OUTPUT
SELECT @CustName AS fName, @SumOrders AS TotalSpent;


USE finalProject;
GO
CREATE PROC spCustSumSpentAndOrderQty
	@ID int = null,
	@CustName varchar(25) OUTPUT,
	@SumOrders money OUTPUT
AS
IF @ID IS NULL
	SELECT customerID FROM Orders ORDER BY customerID DESC;

DECLARE @OrderCount int;
SELECT @CustName = Customers.fName, @SumOrders = SUM(Orders.total), @OrderCount = COUNT(Orders.orderID)
FROM Orders
JOIN Customers ON Orders.customerID = Customers.customerID
WHERE Orders.customerID = @ID
GROUP BY Customers.fName
RETURN @OrderCount;
GO

DECLARE @CustName varchar(25);
DECLARE @SumOrders money;
DECLARE @OrderCount int;
EXEC @OrderCount = spCustSumSpentAndOrderQty 4, @CustName OUTPUT, @SumOrders OUTPUT
SELECT @CustName AS fName, @SumOrders AS TotalSpent, @OrderCount AS NumOrders;


Final Project User Defined Functions

CREATE FUNCTION fnFindProductID
	(@ProdName varchar(25) = '%')
	RETURNS varchar(4)
BEGIN
	RETURN (SELECT productID FROM Products WHERE prodName LIKE @ProdName);
END;
GO
SELECT productID, prodName, cost, price
FROM Products
WHERE productID = dbo.fnFindProductID('Ice Breath%');


USE finalProject;
GO
CREATE FUNCTION fnOrderDetails
	(@OrderID int)
	RETURNS TABLE
RETURN
	(SELECT * FROM OrderDetails WHERE @OrderID = orderID);

GO
SELECT * FROM dbo.fnOrderDetails(2);


Final Project Triggers

SELECT * INTO CustomersArchive FROM Customers WHERE 1=0;
ALTER TABLE CustomersArchive
ADD Activity varchar(40);
GO

CREATE TRIGGER CustomerMod_INSERT ON Customers
	AFTER INSERT
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @customerID int
	DECLARE @fName varchar(25)
	DECLARE @lName varchar(25)
	DECLARE @email varchar(60)
	DECLARE @address varchar(36)
	DECLARE @address2 varchar(36)
	DECLARE @zipcode varchar(10)

SELECT @customerID = INSERTED.customerID, @fName = INSERTED.fName, @lName = INSERTED.lName, @email = INSERTED.email, @address = INSERTED.address, @address2 = INSERTED.address2, @zipcode = INSERTED.zipcode
FROM INSERTED

INSERT INTO CustomersArchive VALUES (@customerID,@fName,@lName,@email,@address,@address2,@zipcode,'Inserted')
END
GO

INSERT INTO Customers
VALUES (7,'Juice','Box','JuiceBox@gmail.com','200 Doodle Ln.',null,'17044');

SELECT * FROM CustomersArchive;
GO

USE finalProject;
GO
CREATE TRIGGER CustomerMod_DELETE ON Customers
	AFTER DELETE
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @customerID int
	DECLARE @fName varchar(25)
	DECLARE @lName varchar(25)
	DECLARE @email varchar(60)
	DECLARE @address varchar(36)
	DECLARE @address2 varchar(36)
	DECLARE @zipcode varchar(10)

SELECT @customerID = DELETED.customerID, @fName = DELETED.fName, @lName = DELETED.lName, @email = DELETED.email, @address = DELETED.address, @address2 = DELETED.address2, @zipcode = DELETED.zipcode
FROM DELETED

INSERT INTO CustomersArchive VALUES (@customerID,@fName,@lName,@email,@address,@address2,@zipcode,'Deleted')
END
GO

DELETE FROM Customers WHERE CustomerID = 7;
SELECT * FROM CustomersArchive;

USE finalProject;
GO
CREATE TRIGGER CustomerMod_UPDATE ON Customers
	AFTER UPDATE
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @customerID int
	DECLARE @fName varchar(25)
	DECLARE @lName varchar(25)
	DECLARE @email varchar(60)
	DECLARE @address varchar(36)
	DECLARE @address2 varchar(36)
	DECLARE @zipcode varchar(10)

SELECT @customerID = INSERTED.customerID, @fName = INSERTED.fName, @lName = INSERTED.lName, @email = INSERTED.email, @address = INSERTED.address, @address2 = INSERTED.address2, @zipcode = INSERTED.zipcode
FROM INSERTED

INSERT INTO CustomersArchive VALUES (@customerID,@fName,@lName,@email,@address,@address2,@zipcode,'Updated')
END
GO

INSERT INTO Customers
VALUES (7,'Juice','Box','JuiceBox@gmail.com','200 Doodle Ln.',null,'17044');
GO
UPDATE Customers
SET lName = 'Bottle'
WHERE customerID = 7;

SELECT * FROM CustomersArchive;
*/