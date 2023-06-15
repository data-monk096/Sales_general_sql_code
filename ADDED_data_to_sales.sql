--Added three customer to customer table

EXEC add_new_customer 'Lendup','Lama','lenduplama@gmail.com','345678','West Sikkim,India'
EXEC add_new_customer 'Gyatcho','Goperma','gyatcho123@gmail.com','347678','Singtam,Sikkim,India'
EXEC add_new_customer 'Tashi','Dorjee','tashidorjee4@gmail.com','567823','Gangtok,Sikkim'

--added seller to seller table

EXEC add_seller 'Tulsi','Rana','tulsi1212@gmail.com','453234','Soreng,West Sikkim,India'
EXEC add_seller 'Bikash','Manger','bikmanger2@gmail.com','9080706','Namchi,South Sikkim,India'

--add store to store table

EXEC add_store 101,'Modern Mobile','Gangtok Mg Marg,East Sikkim,India','General'
EXEC add_store 202,'Kasba Mobile Store','Kasba new market,Kolkata,India','Mobile Store'

--add product to product table

EXEC add_product 234,'Iphone 13pro','Iphone',80000,101,2000
EXEC add_product 233,'Iphone 13','Iphone',65000,101,2000
EXEC add_product 213,'Samsunt Galaxy S21','Android Mobile',35000,202,2001

--add order to order table

EXEC add_order 1004,2000,234,101,3,'05-06-2021'
EXEC add_order 1004,2001,213,202,4,'06-09-2021'
