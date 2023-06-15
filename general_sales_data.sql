--Created customer table

CREATE TABLE customer
	(
	UserId int identity(1000,1) primary key,
	UserName varchar(50),
	FirstName varchar(50),
	LastName varchar(50),
	Email varchar(100),
	ContactNumber numeric,
	HomeAddress varchar(150)
	)
GO
	
--created seller table
	
CREATE TABLE seller
	(
	UserId int identity(2000,1) primary key,
	UserName varchar(50),
	FirstName varchar(50),
	LastName varchar(50),
	Email varchar(100),
	ContactNumber int,
	HomeAddress varchar(150)
	)
GO
	
--created store table
	
CREATE TABLE store
	(
	StoreId int primary key,
	StoreName varchar(50),
	StoreLocation varchar(50),
	StoreType varchar(50)
	)
GO
	
--created product table and referenced seller id to user id of seller table 
--and storeid to store id of store table
	
CREATE TABLE product
	(
    ProductId int primary key,
    ProductName varchar(50),
    ProductType varchar(100),
    ProductPrice int,
	StoreId int,
    SellerId int,
    FOREIGN KEY (SellerId) REFERENCES seller(UserId),
	FOREIGN KEY (StoreId) REFERENCES store(StoreId)
	)
GO

--created orders table and referenced customer id to userid of customer table
--referenced salesmanid to seller userid
--referenced product id to productid of product table
--referenced storeid to storeid of store table

CREATE TABLE orders
	(
	OrderId int identity(100,1) primary key,
	CustomerId int,
	SalesmanId int,
	ProductId int,
	StoreId int,
	OrderQuantity int,
	OrderDate date,
	TotalPrice int
	FOREIGN KEY (CustomerId) REFERENCES customer(UserId),
	FOREIGN KEY (SalesmanID) REFERENCES seller(UserId),
	FOREIGN KEY (ProductId) REFERENCES product(ProductId),
	FOREIGN KEY (StoreId) REFERENCES store(StoreId)
	)
GO
