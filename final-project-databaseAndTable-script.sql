CREATE DATABASE finalProject;
GO


USE finalProject;
CREATE TABLE Zipcodes(
zipcode varchar(10) NOT NULL,
city varchar(25) NOT NULL,
state varchar(2) NULL,
country varchar(50) NOT NULL,
PRIMARY KEY(zipcode)
);
GO

CREATE TABLE Customers(
customerID int NOT NULL,
fName varchar(25) NOT NULL,
lName varchar(25) NOT NULL,
email varchar(60) NOT NULL,
address varchar(36) NOT NULL,
address2 varchar(36) NULL,
zipcode varchar(10) NOT NULL,
PRIMARY KEY(customerID)
);
GO

CREATE TABLE Shipper(
shipperID int NOT NULL,
fName varchar(25) NOT NULL,
lName varchar(25) NOT NULL,
email varchar(60) not null,
phone varchar(16) not null,
PRIMARY KEY(shipperID)
);
GO

CREATE TABLE Orders(
orderID int NOT NULL,
customerID int NOT NULL,
itemQTY tinyint NOT NULL,
total money NOT NULL CHECK(total>=0),
orderDate smalldatetime NOT NULL,
shipDate date NULL,
shipperID int NULL,
PRIMARY KEY(orderID)
);
GO

CREATE TABLE OrderDetails(
orderID int NOT NULL,
lineItem int NOT NULL,
productID varchar(4) NOT NULL,
QTY tinyint NOT NULL,
PRIMARY KEY(orderID,lineItem)
);
GO

CREATE TABLE Category(
categoryID varchar(5) NOT NULL,
catName varchar(15) NOT NULL,
PRIMARY KEY(categoryID)
);
GO

CREATE TABLE Products(
productID varchar(4) NOT NULL,
prodName varchar(25) NOT NULL,
category varchar(5) NOT NULL,
cost money NULL,
price money NOT NULL,
onOrder smallint NOT NULL,
invQty int NOT NULL DEFAULT 0,
PRIMARY KEY(productID)
);
GO
