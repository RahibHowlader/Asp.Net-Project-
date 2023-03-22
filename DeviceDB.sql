﻿CREATE TABLE Models
(
	ModelId INT IDENTITY  PRIMARY KEY,
	ModelName NVARCHAR(50) NOT NULL,
	Brand NVARCHAR (50) NOT NULL
)
GO
CREATE TABLE MobileDevices
(
	MobileDeviceId INT IDENTITY PRIMARY KEY,
	MobileDeviceName NVARCHAR(40) NOT NULL,
	Price MONEY NOT NULL,
	Quantity INT NOT NULL,
	RelaeseDate DATE NOT NULL,
	Picture NVARCHAR(50) NOT NULL,
	CountryOfOrigin NVARCHAR(40) NOT NULL,
	ModelId INT NOT NULL REFERENCES Models(ModelId) 
)
GO 

Create Table Customers
(
	CustomerId INT IDENTITY  PRIMARY KEY,
	CustomerName NVARCHAR(40) NOT NULL,
	Phone NVARCHAR(20) NOT NULL,
	[Address] NVARCHAR(150) NOT NULL
)
GO
CREATE TABLE Orders
(
    OrderId      INT IDENTITY  NOT NULL PRIMARY KEY,
    OrderDate    DATE NOT NULL,
    DeliveryDate DATE NOT NULL,
    CustomerId INT NOT NULL REFERENCES Customers(CustomerId) 
)
GO
CREATE TABLE OrderItems
(
    OrderId   INT NOT NULL REFERENCES Orders(OrderId),
    MobileDeviceId INT NOT NULL REFERENCES MobileDevices(MobileDeviceId),
    Quantity  INT NOT NULL
)
GO