USE finalProject;
GO

ALTER TABLE Products
ADD CONSTRAINT FK_Category FOREIGN KEY(category) REFERENCES Category(categoryID)
ON UPDATE CASCADE
GO

ALTER TABLE OrderDetails
ADD CONSTRAINT FK_OrderID FOREIGN KEY(orderID) REFERENCES Orders(orderID)
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE OrderDetails
ADD CONSTRAINT FK_ProductID FOREIGN KEY(productID) REFERENCES Products(productID)
ON UPDATE CASCADE
GO

ALTER TABLE Orders
ADD CONSTRAINT FK_CustomerID FOREIGN KEY(customerID) REFERENCES Customers(customerID)
ON UPDATE CASCADE
GO

ALTER TABLE Orders
ADD CONSTRAINT FK_ShipperID FOREIGN KEY(shipperID) REFERENCES Shipper(shipperID)
ON UPDATE CASCADE
GO

ALTER TABLE Customers
ADD CONSTRAINT FK_Zipcode FOREIGN KEY(zipcode) REFERENCES Zipcodes(zipcode)
ON UPDATE CASCADE
GO