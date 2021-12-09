/* Final Project Views 
USE finalProject;
GO
CREATE VIEW Product_W_Cat
AS
SELECT productID, prodname, Category.catName, cost, price, onOrder, invQty
FROM Products
JOIN Category ON Products.category = Category.categoryID;
GO
SELECT * FROM Product_W_Cat;

CREATE VIEW VI_US_Customers ([Name], [Address], Zipcode, [State])
AS
SELECT fName + ' ' + lName AS [Name], [address], Customers.zipcode, Zipcodes.[state]
FROM Customers
JOIN Zipcodes ON Customers.zipcode = Zipcodes.zipcode
WHERE Zipcodes.country = 'USA';
GO

CREATE VIEW VI_Foreign_Customers ([Name], [Address], Zipcode, [State], Country)
AS
SELECT fName + ' ' + lName AS [Name], [address], Customers.zipcode, Zipcodes.[state], Zipcodes.country
FROM Customers
JOIN Zipcodes ON Customers.zipcode = Zipcodes.zipcode
WHERE Zipcodes.country <> 'USA';
GO
SELECT * FROM VI_Foreign_Customers;

CREATE VIEW Customer_Purch_Total (CustomerID, TotalItems, TotalSpent)
AS
SELECT Orders.customerID, SUM(itemQTY), SUM(total)
FROM Orders
GROUP BY Orders.customerID;
GO
SELECT * FROM Customer_Purch_Total;

USE finalProject
UPDATE Product_W_Cat
SET invQTY = 80
WHERE productID = 'SP1';
*/