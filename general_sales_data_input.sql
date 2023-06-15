--create store procedure to add customer to customer table
CREATE PROCEDURE add_new_customer
	@firstname varchar(50),
	@lastname varchar(50),
	@email varchar(100),
	@contactnumber varchar(20),
	@homeaddress varchar(150)
AS
BEGIN
	DECLARE @userid int
	DECLARE @username varchar(50)

	INSERT INTO customer(FirstName,LastName,Email,ContactNumber,HomeAddress)
	VALUES (@firstname,@lastname,@email,@contactnumber,@homeaddress)

	SET @userid = SCOPE_IDENTITY()
	SET @username = CONCAT(@userid,LEFT(@firstname,2),LEFT(@lastname,2))

	UPDATE customer
	SET UserName = @username
	WHERE UserId = @userid
END;
GO

--create procedure to add



CREATE PROCEDURE add_order
	@customerid int,
	@salesmanid int,
	@productid int,
	@storeid int,
	@orderquantity int,
	@orderdate date,
	@totalprice bigint
AS
BEGIN
	IF EXISTS(SELECT 1 FROM customer WHERE UserId = @customerid)
	BEGIN
		IF EXISTS(SELECT 1 FROM seller WHERE UserId = @salesmanid)
		BEGIN
			IF EXISTS(SELECT 1 FROM product WHERE ProductId = @productid )
			BEGIN 
				IF EXISTS(SELECT 1 FROM store WHERE StoreId = @storeid)
				BEGIN
					INSERT INTO orders(CustomerId,SalesmanId,ProductId,StoreId,OrderQuantity,OrderDate,TotalPrice)
					VALUES (@customerid,@salesmanid,@productid,@storeid,@orderquantity,@orderdate,@totalprice)
					PRINT 'Order added successfully'
				END
			END
		END
		PRINT 'Order added successfully'
	END
	ELSE
	BEGIN
		PRINT 'Invalid data! Try again.'
	END
END;
GO

--create procedure to add product

CREATE PROCEDURE add_product
	@productid int,
	@productname varchar(50),
	@producttype varchar(50),
	@productprice bigint,
	@storeid int,
	@sellerid int

AS
BEGIN
	IF EXISTS (SELECT 1 FROM store WHERE StoreId = @storeid)
	BEGIN
		IF EXISTS (SELECT 1 FROM seller WHERE UserId = @sellerid)
		BEGIN
			INSERT INTO product (ProductId,ProductName,ProductType,ProductPrice,StoreId,SellerId)
			VALUES (@productid,@productname,@producttype,@productprice,@storeid,@sellerid)
		END
	END
END
GO

--create procedure for adding data to seller:
CREATE PROCEDURE add_seller
	@firstname varchar(50),
	@lastname varchar(50),
	@email varchar(100),
	@contactnumber varchar(20),
	@homeaddress varchar(150)
AS
BEGIN
	DECLARE @username varchar(50)
	DECLARE @userid int
	INSERT INTO seller(FirstName,LastName,Email,ContactNumber,HomeAddress)
	VALUES (@firstname,@lastname,@email,@contactnumber,@homeaddress)
	SET @userid = SCOPE_IDENTITY()
	UPDATE seller
	SET UserName = CONCAT(@userid,LEFT(@firstname,2),LEFT(@lastname,2))
	WHERE UserId = @userid
END
GO

--CREATE PROCEDURE TO ADD STORE
CREATE PROCEDURE add_store
	@storeid int,
	@storename varchar(50),
	@storelocation varchar(50),
	@storetype varchar(50)
AS
BEGIN
	INSERT INTO store (StoreId,StoreName,StoreLocation,StoreType)
	VALUES (@storeid,@storename,@storelocation,@storetype)
END
GO

---XX---