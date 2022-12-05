--DATABASE CREATE

CREATE DATABASE ShopInDB;

--TABLE CREATE

CREATE TABLE Users
(
	[UserId] INT CONSTRAINT pk_UserId PRIMARY KEY IDENTITY(100,1) NOT NULL,
	[UserName] VARCHAR(50) NOT NULL,
	[UserEmail] VARCHAR(50) CONSTRAINT pk_Email UNIQUE,
	[UserContact] INT NOT NULL UNIQUE,
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
VALUES('trisha','trisha@gmail.com',123456789,'Howrah','trisha01')
INSERT INTO Users(UserName,UserEmail,UserContact,UserAddress,UserPassword) 
VALUES('aniket','aniket@gmail.com',987456321,'Howrah','aniket01')
INSERT INTO Users(UserName,UserEmail,UserContact,UserAddress,UserPassword) 
VALUES('Saimanti','saimanti@gmail.com',456972395,'Kolkata','saimanti01')
INSERT INTO Users(UserName,UserEmail,UserContact,UserAddress,UserPassword) 
VALUES('Deep','deep@gmail.com',876329645,'Kolaghat','deep01')
INSERT INTO Users(UserName,UserEmail,UserContact,UserAddress,UserPassword) 
VALUES('Jeet','jeet@gmail.com',657419783,'Nadia','jeet01')
INSERT INTO Users(UserName,UserEmail,UserContact,UserAddress,UserPassword) 
VALUES('Maya','maya@gmail.com',456237918,'Darjeeling','maya01')


SELECT * FROM Users

--INSERT VALUES IN CATEGORY TABLE

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
VALUES('P104','CarbonCloth',2,1500,25,'https://static.fibre2fashion.com/MemberResources/LeadResources/1/2018/4/Seller/18144566/Images/18144566_0_casual-shirt-for-men.jpg','https://static.fibre2fashion.com/MemberResources/LeadResources/1/2018/4/Seller/18144566/Images/18144566_0_casual-shirt-for-men.jpg',4.5)
INSERT INTO Products(ProductId,ProductName,CategoryId,Price,QuantityAvailable,ImgUrl,VideoUrl,Rating)
VALUES('P105','Girls Top Skirt',1,675,9,'https://rukminim1.flixcart.com/image/832/832/l1mh7rk0/kids-apparel-combo/c/e/p/4-5-years-kids-wear-5923-litte-ones-original-imagd5enz5wae7ah.jpeg?q=70','https://rukminim1.flixcart.com/image/832/832/l1mh7rk0/kids-apparel-combo/c/e/p/4-5-years-kids-wear-5923-litte-ones-original-imagd5enz5wae7ah.jpeg?q=70',3)
INSERT INTO Products(ProductId,ProductName,CategoryId,Price,QuantityAvailable,ImgUrl,VideoUrl,Rating)
VALUES('P106','Samsung A33',6,25000,15,'https://rukminim1.flixcart.com/image/416/416/l3xcr680/mobile/c/4/9/-original-imagexeyqhh6vwzk.jpeg?q=70','https://rukminim1.flixcart.com/image/416/416/l3xcr680/mobile/c/4/9/-original-imagexeyqhh6vwzk.jpeg?q=70',5)
INSERT INTO Products(ProductId,ProductName,CategoryId,Price,QuantityAvailable,ImgUrl,VideoUrl,Rating)
VALUES('P107','wedding Hair Clip',5,150,7,'https://m.media-amazon.com/images/I/71wvKHySN0L._SY355_.jpg','https://m.media-amazon.com/images/I/71wvKHySN0L._SY355_.jpg',3)
INSERT INTO Products(ProductId,ProductName,CategoryId,Price,QuantityAvailable,ImgUrl,VideoUrl,Rating)
VALUES('P108','Ready to Wear Saree',3,865,12,'https://5.imimg.com/data5/SELLER/Default/2021/10/MD/AA/DM/28280455/ready-to-wear-saree-1000x1000.jpg','https://5.imimg.com/data5/SELLER/Default/2021/10/MD/AA/DM/28280455/ready-to-wear-saree-1000x1000.jpg',5)
INSERT INTO Products(ProductId,ProductName,CategoryId,Price,QuantityAvailable,ImgUrl,VideoUrl,Rating)
VALUES('P109','Ladis FootWear',4,1000,9,'https://cdn2.sharechat.com/ladiesfootwear_320fe17e_1657882798958_sc_cmprsd_75.jpg','https://cdn2.sharechat.com/ladiesfootwear_320fe17e_1657882798958_sc_cmprsd_75.jpg',5)
INSERT INTO Products(ProductId,ProductName,CategoryId,Price,QuantityAvailable,ImgUrl,VideoUrl,Rating)
VALUES('P110','Cotton Kidwear',1,565,8,'https://5.imimg.com/data5/LU/UD/JX/ANDROID-84771765/product-jpeg-500x500.jpg','https://5.imimg.com/data5/LU/UD/JX/ANDROID-84771765/product-jpeg-500x500.jpg',4)
INSERT INTO Products(ProductId,ProductName,CategoryId,Price,QuantityAvailable,ImgUrl,VideoUrl,Rating)
VALUES('P111','Oxidised Jewellery',5,350,14,'https://cdn.shopify.com/s/files/1/2015/7815/products/rubans-silver-plated-oxidised-necklace-set-with-red-and-green-colour-stone-necklace-set-32653953499310_400x.jpg?v=1662964484','https://cdn.shopify.com/s/files/1/2015/7815/products/rubans-silver-plated-oxidised-necklace-set-with-red-and-green-colour-stone-necklace-set-32653953499310_400x.jpg?v=1662964484',5)
INSERT INTO Products(ProductId,ProductName,CategoryId,Price,QuantityAvailable,ImgUrl,VideoUrl,Rating)
VALUES('P112','Smart Watch',6,6500,12,'https://m.media-amazon.com/images/I/61vNo+aPWUL._SY450_.jpg','https://m.media-amazon.com/images/I/61vNo+aPWUL._SY450_.jpg',3)
	
	
	--delete from Products where ProductId = 'P106';

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