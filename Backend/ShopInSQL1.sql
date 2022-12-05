--DATABASE CREATE

CREATE DATABASE ShopInDB;

--TABLE CREATE

CREATE TABLE Users
(
	[UserId] INT CONSTRAINT pk_UserId PRIMARY KEY IDENTITY(100,1) NOT NULL,
	[UserName] VARCHAR(50) NOT NULL,
	[UserEmail] VARCHAR(50) CONSTRAINT pk_Email UNIQUE,
	[UserContact] VARCHAR(50) NOT NULL ,
	[UserAddress] VARCHAR(200) NOT NULL,
	[UserPassword] VARCHAR(50) NOT NULL
)

CREATE TABLE Category
(
	[CategoryId] INT CONSTRAINT pk_CategoryId PRIMARY KEY IDENTITY,
    [CategoryName] VARCHAR(50) CONSTRAINT uq_CategoryName UNIQUE NOT NULL
)

CREATE TABLE Products
(
	[ProductId] CHAR(4) CONSTRAINT pk_ProductId PRIMARY KEY CONSTRAINT chk_ProductId CHECK(ProductId LIKE 'P%'),
	[ProductName] VARCHAR(50) CONSTRAINT uq_ProductName UNIQUE NOT NULL,
	[CategoryId] INT CONSTRAINT fk_CategoryId REFERENCES Category(CategoryId),
	[Price] NUMERIC(8) CONSTRAINT chk_Price CHECK(Price>0) NOT NULL,
	[QuantityAvailable] INT CONSTRAINT chk_QuantityAvailable CHECK (QuantityAvailable>=0) NOT NULL,
	[ImgUrl] VARCHAR(200) NOT NULL,
	[VideoUrl] VARCHAR(200) NOT NULL,
	[Rating] NUMERIC(3) NOT NULL
)

CREATE TABLE Payments
(
	[PaymentId] NUMERIC(16) CONSTRAINT pk_PaymentId PRIMARY KEY IDENTITY,
	[UserId] INT CONSTRAINT fk_UserId REFERENCES Users(UserId),
    [CardNumber] NUMERIC(16),
    [NameOnCard] VARCHAR(40) NOT NULL,
    [CardType] CHAR(6) NOT NULL CONSTRAINT chk_CardType CHECK (CardType IN ('A','M','V')),
    [CVVNumber] NUMERIC(3) NOT NULL,
    [ExpiryDate] DATE NOT NULL CONSTRAINT chk_ExpiryDate CHECK(ExpiryDate>=GETDATE()),
    [AmountPaid] INT CONSTRAINT chk_Amount CHECK([AmountPaid]>0)
)

CREATE TABLE Orders
(
	[OrderId] NUMERIC(16) CONSTRAINT pk_OrderId PRIMARY KEY IDENTITY,
	[UserId] INT CONSTRAINT fk_Userid1 REFERENCES Users(UserId),
	[NoOfItems] INT NOT NULL,
	[ProductId] CHAR(4) CONSTRAINT fk_ProductId REFERENCES Products(ProductId)
)


--INSERT VALUES IN USERS TABLE

INSERT INTO Users(UserName,UserEmail,UserContact,UserAddress,UserPassword) 
VALUES('trisha','trisha@gmail.com','6291259627','Howrah','trisha01')
INSERT INTO Users(UserName,UserEmail,UserContact,UserAddress,UserPassword) 
VALUES('aniket','aniket@gmail.com','6291259627','Howrah','aniket01')
INSERT INTO Users(UserName,UserEmail,UserContact,UserAddress,UserPassword) 
VALUES('Saimanti','saimanti@gmail.com','6291259627','Kolkata','saimanti01')
INSERT INTO Users(UserName,UserEmail,UserContact,UserAddress,UserPassword) 
VALUES('Deep','deep@gmail.com','6291259627','Kolaghat','deep01')
INSERT INTO Users(UserName,UserEmail,UserContact,UserAddress,UserPassword) 
VALUES('Jeet','jeet@gmail.com','6291259627','Nadia','jeet01')
INSERT INTO Users(UserName,UserEmail,UserContact,UserAddress,UserPassword) 
VALUES('Maya','maya@gmail.com','6291259627','Darjeeling','maya01')

INSERT INTO Users(UserName,UserEmail,UserContact,UserAddress,UserPassword) 
VALUES('Maya1','maya1@gmail.com','6291259627','Darjeeling','maya01')

SELECT * FROM Users

--Truncate Table Users
--Truncate Table Payments
--Drop Table Payments
--Drop Table Users
--Truncate Table Orders
--Drop Table Orders
--INSERT VALUES IN CATEGORY TABLE
--delete from Users where UserId=110

INSERT INTO Category(CategoryName) 
VALUES('KidWear')
INSERT INTO Category(CategoryName) 
VALUES('MenWear')
INSERT INTO Category(CategoryName) 
VALUES('WomenWear')
INSERT INTO Category(CategoryName) 
VALUES('FootWear')
INSERT INTO Category(CategoryName) 
VALUES('Accessories')
INSERT INTO Category(CategoryName) 
VALUES('Electronics')

SELECT * FROM Category

--INSERT VALUES IN PRODUCT TABLE

INSERT INTO Products(ProductId,ProductName,CategoryId,Price,QuantityAvailable,ImgUrl,VideoUrl,Rating)
VALUES('P101','Saree',3,500,10,'https://www.ethnicplus.in/media/catalog/product/cache/4b64c75550b309a25deb6b05458d8553/f/b/fb-l65_2_.jpeg','https://www.ethnicplus.in/media/catalog/product/cache/4b64c75550b309a25deb6b05458d8553/f/b/fb-l65_2_.jpe',5)
INSERT INTO Products(ProductId,ProductName,CategoryId,Price,QuantityAvailable,ImgUrl,VideoUrl,Rating)
VALUES('P102','Sneakers',4,450,6,'https://navbharattimes.indiatimes.com/thumb/msid-95476578,imgsize-79510,width-540,height-405,resizemode-75/best-sneakers-for-men-95476578.jpg','https://navbharattimes.indiatimes.com/thumb/msid-95476578,imgsize-79510,width-540,height-405,resizemode-75/best-sneakers-for-men-95476578.jpg',4)
INSERT INTO Products(ProductId,ProductName,CategoryId,Price,QuantityAvailable,ImgUrl,VideoUrl,Rating)
VALUES('P103','Shirts',2,750,13,'https://assets.myntassets.com/h_1440,q_100,w_1080/v1/assets/images/2414313/2022/4/18/c08becf1-36fc-4c1f-a3c9-92542d3ef8221650284958075HERENOWMenRedBlackCheckedPureCottonCasualShirt1.jpg','https://assets.myntassets.com/h_1440,q_100,w_1080/v1/assets/images/2414313/2022/4/18/c08becf1-36fc-4c1f-a3c9-92542d3ef8221650284958075HERENOWMenRedBlackCheckedPureCottonCasualShirt1.jpg',4.5)
INSERT INTO Products(ProductId,ProductName,CategoryId,Price,QuantityAvailable,ImgUrl,VideoUrl,Rating)
VALUES('P104','Tanip',2,750,13,'https://assets.myntassets.com/h_1440,q_100,w_1080/v1/assets/images/2414313/2022/4/18/c08becf1-36fc-4c1f-a3c9-92542d3ef8221650284958075HERENOWMenRedBlackCheckedPureCottonCasualShirt1.jpg','https://assets.myntassets.com/h_1440,q_100,w_1080/v1/assets/images/2414313/2022/4/18/c08becf1-36fc-4c1f-a3c9-92542d3ef8221650284958075HERENOWMenRedBlackCheckedPureCottonCasualShirt1.jpg',4.5)


SELECT * FROM Products

--INSERT VALUES IN PAYMENT TABLE

INSERT INTO Payments(CardNumber,NameOnCard,CardType,CVVNumber,ExpiryDate,AmountPaid)
VALUES (4529879732156748,'Trisha','A',677,'25/2/2023',500)

SELECT * FROM Payments

--INSERT VALUES IN ORDER TABLE

INSERT INTO Orders(UserId,NoOfItems,ProductId)
VALUES (101,2,'P101')
INSERT INTO Orders(UserId,NoOfItems,ProductId)
VALUES (104,1,'P102')

SELECT * FROM Orders