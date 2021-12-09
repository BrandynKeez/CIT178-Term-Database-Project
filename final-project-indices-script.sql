USE finalProject;
GO

CREATE INDEX idx_zipcode ON Customers(zipcode)
GO
CREATE INDEX idx_productID ON OrderDetails(productID)
GO
CREATE INDEX idx_customerID ON Orders(customerID)
GO
CREATE INDEX idx_shipperID ON Orders(shipperID)
GO
CREATE INDEX idx_category ON Products(category)
GO