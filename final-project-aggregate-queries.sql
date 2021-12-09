/*
USE finalProject;
SELECT Orders.customerID AS CustID,Customers.fName AS 'Customer Name', OrderDetails.orderID, SUM(QTY) AS 'Total Items on Order'
FROM OrderDetails
JOIN Orders ON OrderDetails.orderID = Orders.orderID
JOIN Customers ON Orders.customerID = Customers.customerID
GROUP BY Orders.customerID, Customers.fName, OrderDetails.orderID;

USE finalProject;
SELECT MAX(((price - cost)/price)*100) AS 'Highest Profit Percentage', MIN(((price - cost)/price)*100) 'Lowest Profit Percentage'
FROM Products;

USE finalProject;
SELECT Customers.fName, SUM(total) AS 'TotalDue'
FROM Orders
JOIN Customers on Orders.customerID = Customers.customerID
GROUP BY Customers.fName;

USE finalProject;
SELECT Zipcodes.country AS Country, COUNT(customerID) AS 'Number of Customers'
FROM Customers
JOIN Zipcodes ON Customers.zipcode = Zipcodes.zipcode
GROUP BY Zipcodes.country;


USE finalProject;
SELECT MIN(total) AS MinTotal,AVG(total) AS AvgTotal, MAX(total) AS MaxTotal
FROM Orders;
*/