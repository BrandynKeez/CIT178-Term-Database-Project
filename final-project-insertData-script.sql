
USE finalProject;
INSERT INTO Category
VALUES ('RD','Resin Dice')
INSERT INTO Category
VALUES ('SD','Stone Dice')
INSERT INTO Category
VALUES ('Bag','Dice Bag')
INSERT INTO Category
VALUES ('Box','Dice Box')
INSERT INTO Category
VALUES ('Tray','Dice Tray')
INSERT INTO Category
VALUES ('Stick','Stickers');

USE finalProject;
INSERT INTO Zipcodes
VALUES ('17044','Lewistown','PA','USA')
INSERT INTO Zipcodes
VALUES ('84539','Sunnyside','UT','USA')
INSERT INTO Zipcodes
VALUES ('58451','Hurdsfield','ND','USA')
INSERT INTO Zipcodes
VALUES ('R3B0G8','Winnipeg','MB','Canada')
INSERT INTO Zipcodes
VALUES ('T0L1H0','Longview','AB','Canada')
INSERT INTO Zipcodes
VALUES ('87000','Limoges',null,'Europe');

INSERT INTO Shipper
VALUES (1,'Rock','Dog','RockDog@gmail.com','123-4567-890')
INSERT INTO Shipper
VALUES (2,'Stone','Snake','StoneSnake@gmail.com','234-567-8901')
INSERT INTO Shipper
VALUES (3,'Pale','Bones','PaleBones@gmail.com','345-678-9012')
INSERT INTO Shipper
VALUES (4,'Divine','Zombie','DivineZombie@gmail.com','456-789-0123')
INSERT INTO Shipper
VALUES (5,'Ice','Snail','IceSnail@gmail.com','567-890-1234')
INSERT INTO Shipper
VALUES (6,'Flame','Cricket','FlameCricket@gmail.com','678-901-2345');

INSERT INTO Products
VALUES ('DB1','Ice Breathe Dice','RD',45.00,65.00,2,54)
INSERT INTO Products
VALUES ('DB2','Fire Breathe Dice','RD',45.00,65.00,2,36)
INSERT INTO Products
VALUES ('DB3','Wind Breathe Dice','RD',45.00,65.00,1,45)
INSERT INTO Products
VALUES ('AM7','Amethyst Dice','SD',72.00,98.00,1,3)
INSERT INTO Products
VALUES ('LA7','Labradorite Dice','SD',50.00,82.00,2,4)
INSERT INTO Products
VALUES ('JA7','Jasper Dice','SD',55.00,85.00,0,1)
INSERT INTO Products
VALUES ('FB1','Classic Felt Pouch','Bag',4.00,8.00,2,81)
INSERT INTO Products
VALUES ('LB1','Bottomless Leather Sack','Bag',15.00,30.00,1,52)
INSERT INTO Products
VALUES ('WB1','Rune Engraved Box','Box',20.00,27.00,0,73)
INSERT INTO Products
VALUES ('SP1','Fantasy Pack','Stick',1.00,5.00,1,112);

INSERT INTO Customers
VALUES (1,'Marsha','Curry','Marshacurry@gmail.com','305 S Main St',null,'17044')
INSERT INTO Customers
VALUES (2,'Karla','Pitts','Karlapitts@gmail.com','680 Edgehill Dr',null,'84539')
INSERT INTO Customers
VALUES (3,'Darius','Murphy','Dariusmurphy@gmail.com','339 Waterfront dr',null,'R3B0G8')
INSERT INTO Customers
VALUES (4,'Jaxon','Cairns','Jaxoncairns@gmail.com','140 Morrison Rd',null,'T0L1H0')
INSERT INTO Customers
VALUES (5,'Laurie','Harris','Laurieharris@gmail.com','15 ND-200',null,'58451')
INSERT INTO Customers
VALUES (6,'Yolanda','Potts','Yolandapotts@gmail.com','5 Rue Georges Bizet',null,'87000');

INSERT INTO Orders
VALUES (1,4,1,65.00,'2021-10-7','2021-10-9',1)
INSERT INTO Orders
VALUES (2,1,3,228.00,'2021-10-7','2021-10-9',1)
INSERT INTO Orders
VALUES (3,3,2,70.00,'2021-10-8','2021-10-10',5)
INSERT INTO Orders
VALUES (4,4,2,38.00,'2021-10-10','2021-10-12',2)
INSERT INTO Orders
VALUES (5,2,1,73.00,'2021-10-10','2021-10-12',3)
INSERT INTO Orders
VALUES (6,6,2,164.00,'2021-10-10','2021-10-12',1);

INSERT INTO OrderDetails
VALUES (1,1,'DB1',1)
INSERT INTO OrderDetails
VALUES (2,1,'DB1',1)
INSERT INTO OrderDetails
VALUES (2,2,'DB3',1)
INSERT INTO OrderDetails
VALUES (2,3,'AM7',1)
INSERT INTO OrderDetails
VALUES (3,1,'DB2',1)
INSERT INTO OrderDetails
VALUES (3,2,'SP1',1)
INSERT INTO OrderDetails
VALUES (4,1,'FB1',1)
INSERT INTO OrderDetails
VALUES (4,2,'LB1',1)
INSERT INTO OrderDetails
VALUES (5,1,'DB2',1)
INSERT INTO OrderDetails
VALUES (5,2,'FB1',1)
INSERT INTO OrderDetails
VALUES (6,1,'LA7',2);