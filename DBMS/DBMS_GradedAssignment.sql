CREATE DATABASE glca_project;
use glca_project;

CREATE TABLE Supplier(
 SUPP_ID INT PRIMARY KEY,
 SUPP_NAME varchar(50) NOT NULL,
 SUPP_CITY varchar(50) NOT NULL,
 SUPP_PHONE varchar(50) NOT NULL
 );
 
 CREATE TABLE Customer(
  CUS_ID INT PRIMARY KEY,
  CUS_NAME VARCHAR(20) NOT NULL,
  CUS_PHONE VARCHAR(10) NOT NULL,
  CUS_CITY VARCHAR(30) NOT NULL,
  CUS_GENDER CHAR
  );

  CREATE TABLE Category(
  CAT_ID INT PRIMARY KEY,
  CAT_NAME VARCHAR(20) NOT NULL
  );

 
  CREATE TABLE Product(
  PRO_ID INT PRIMARY KEY,
  PRO_NAME VARCHAR(20) NOT NULL DEFAULT "Dummy",
  PRO_DESC VARCHAR(60),
  CAT_ID INT,
  FOREIGN KEY(CAT_ID) REFERENCES Category(CAT_ID)
  );

CREATE TABLE Supplier_pricing(
PRICING_ID INT PRIMARY KEY,
PRO_ID INT,
FOREIGN KEY(PRO_ID) REFERENCES Product(PRO_ID),
SUPP_ID INT,
FOREIGN KEY(SUPP_ID) REFERENCES Supplier(SUPP_ID),
SUPP_PRICE INT DEFAULT 0
);

DESC SUPPLIER_PRICING;

CREATE TABLE  Orders(
ORD_ID INT PRIMARY KEY,
ORD_AMOUNT INT NOT NULL,
ORD_DATE DATE NOT NULL,
CUS_ID INT,
FOREIGN KEY(CUS_ID) REFERENCES Customer(CUS_ID),
PRICING_ID INT,
FOREIGN KEY(PRICING_ID) REFERENCES Supplier_pricing(PRICING_ID)
);

DESC Orders;
CREATE TABLE Rating(
RAT_ID INT PRIMARY KEY,
ORD_ID INT ,
FOREIGN KEY(ORD_ID) REFERENCES Orders(ORD_ID),
RAT_RATSTARS INT NOT NULL
);

INSERT INTO Supplier(SUPP_ID,SUPP_NAME,SUPP_CITY,SUPP_PHONE) VALUES
    (1 ,'Rajesh RetailS' ,'Delhi', 1234567890),
    (2, 'Appario Ltd.','Mumbai',2589631470),
    (3,'Knome products','Banglore',9785462315),
    (4,'Bansal Retails','Kochi',8975463285),
    (5,'Mittal Ltd.','Lucknow',7898456532);
    
    SELECT * FROM SUPPLIER;
    
    INSERT INTO Customer(CUS_ID,CUS_NAME,CUS_PHONE,CUS_CITY,CUS_GENDER) VALUES
  (1,'AAKASH','9999999999','DELHI','M'),
  (2,'AMAN','9785463215','NOIDA','M'),
  (3,'NEHA','9999999999','MUMBAI','F'),
  (4,'MEGHA','9994562399','KOLKATA','F'),
  (5,'PULKIT','7895999999','LUCKNOW','M');
  
  SELECT * FROM CUSTOMER;
  
   INSERT INTO Category(CAT_ID,CAT_NAME) VALUES
  (1,'BOOKS'),
  (2,'GAMES'),
  (3,'GROCERIES'),
  (4,'ELECTRONICS'),
  (5,'CLOTHES');
  
  SELECT * FROM CATEGORY;
  
   
  INSERT INTO Product(PRO_ID,PRO_NAME,PRO_DESC,CAT_ID) VALUES
  (1,'GTA V','Windows 7 and above with i5 processor and 8GB RAM',2),
  (2,'TSHIRT','SIZE-L with Black, Blue and White variations',5),
  (3,'ROG LAPTOP','Windows 10 with 15inch screen, i7 processor, 1TB SSD',4),
  (4,'OATS','Highly Nutritious from Nestle',3),
  (5,'HARRY POTTER','Best Collection of all time by J.K Rowling',1),
  (6,'MILK','1L Toned MIlk',3),
  (7,'Boat Earphones','1.5Meter long Dolby Atmos',4),
  (8,'Jeans','Stretchable Denim Jeans with various sizes and color',5),
  (9,'Project IGI','compatible with windows 7 and above',2),
  (10,'Hoodie','Black GUCCI for 13 yrs and above',5),
  (11,'Rich Dad Poor Dad','Written by RObert Kiyosaki',1),
  (12,'Train Your Brain','By Shireen Stephen',1 );
  
  SELECT * FROM PRODUCT;
  
   INSERT INTO Supplier_pricing(PRICING_ID,PRO_ID,SUPP_ID,SUPP_PRICE) VALUES
   (1,1,2,1500),
   (2,3,5,30000),
   (4,2,3,2500),
   (5,4,1,1000),
   (6,12,2,780),
   (7,12,4,789),
   (8,3,1,31000),
   (9,1,5,1450),
   (10,4,2,999),
   (11,7,3,549),
   (12,7,4,529),
   (13,6,2,105),
   (14,6,1,99),
   (15,2,5,2999),
   (16,5,2,2999);
   
   INSERT INTO Supplier_pricing VALUES(3,5,1,3000);
   SELECT * FROM Supplier_pricing;
   
    INSERT INTO Orders(ORD_ID,ORD_AMOUNT,ORD_DATE,CUS_ID,PRICING_ID) VALUES
 (101,1500,'2021-10-06',2,1),
 (102,1000,'2021-10-12',3,5),
 (103,30000,'2021-09-16',5,2),
 (104,1500,'2021-10-05',1,1),
 (105,3000,'2021-08-16',4,3),
 (106,1450,'2021-08-18',1,9),
 (107,789,'2021-09-01',3,7),
 (108,780,'2021-09-07',5,6),
 (109,3000,'2021-01-10',5,3),
 (110,2500,'2021-09-10',2,4),
 (111,1000,'2021-09-15',4,5),
 (112,789,'2021-09-16',4,7),
 (113,31000,'2021-09-16',1,8),
 (114,1000,'2021-09-16',3,5),
 (115,3000,'2021-09-16',5,3),
 (116,99,'2021-09-17',2,14 );
 
 SELECT * FROM Orders;
 
 
  INSERT INTO Rating(RAT_ID,ORD_ID,RAT_RATSTARS) VALUES
 (1,101,4),
 (2,102,3),
 (3,103,1),
 (4,104,2),
 (5,105,4),
 (6,106,3),
 (7,107,4),
 (8,108,4),
 (9,109,3),
 (10,110,5),
 (11,111,3),
 (12,112,4),
 (13,113,2),
 (14,114,1),
 (15,115,1),
 (16,116,0);
 
 SELECT * FROM RATING;
 
  -- 3.Displaying the total number of customers based on gender who have placed individual orders of worth at least RS.3000--
 SELECT Customer.CUS_GENDER, COUNT(DISTINCT Orders.CUS_ID) AS Total_customers
FROM Orders
JOIN Customer ON Orders.CUS_ID = Customer.CUS_ID
WHERE Orders.ORD_AMOUNT >= 3000
GROUP BY Customer.CUS_GENDER;


-- 4.Display all the orders along with product name ordered by a customer having Customer_Id=2
SELECT Orders.ORD_ID, Product.PRO_NAME, Orders.ORD_AMOUNT, Orders.ORD_DATE
FROM Orders
JOIN Product ON Orders.PRICING_ID = Product.PRO_ID
JOIN Customer ON Orders.CUS_ID = Customer.CUS_ID
WHERE Customer.CUS_ID = 2;


-- 5.Display the Supplier details who can supply more than one product.
SELECT Supplier.*
FROM Supplier
JOIN (
    SELECT SUPP_ID
    FROM Supplier_pricing
    GROUP BY SUPP_ID
    HAVING COUNT(DISTINCT PRO_ID) > 1
) AS MultiProductSuppliers ON Supplier.SUPP_ID = MultiProductSuppliers.SUPP_ID;

-- 6.Create a view as lowest_expensive_product and display the least expensive product from each category and print the table
-- with category id, name, product name and price of the product.
CREATE VIEW lowest_expensive_product AS
SELECT Category.CAT_ID, Category.CAT_NAME, Product.PRO_NAME, MIN(Supplier_pricing.SUPP_PRICE) AS Lowest_Price
FROM Category
JOIN Product ON Category.CAT_ID = Product.CAT_ID
JOIN Supplier_pricing ON Product.PRO_ID = Supplier_pricing.PRO_ID
GROUP BY Category.CAT_ID, Category.CAT_NAME, Product.PRO_NAME;
SELECT * FROM lowest_expensive_product;


-- 7.Display the Id and Name of the Product ordered after “2021-10-05”.
SELECT Product.PRO_ID, Product.PRO_NAME
FROM Orders
JOIN Product ON Orders.PRICING_ID = Product.PRO_ID
WHERE Orders.ORD_DATE > '2021-10-05';


-- 8.Display customer name and gender whose names start or end with character 'A'.
SELECT CUS_NAME, CUS_GENDER
FROM Customer
WHERE CUS_NAME LIKE 'A%' OR CUS_NAME LIKE '%A';

-- 9.Create a stored procedure to display supplier id, name, Rating(Average rating of all the products sold by every customer) and
-- Type_of_Service. For Type_of_Service, If rating =5, print “Excellent Service”,If rating >4 print “Good Service”, If rating >2 print
-- “Average Service” else print “Poor Service”. Note that there should be one rating per supplier.

DELIMITER //

CREATE PROCEDURE DisplaySupplierRatings()
BEGIN
    SELECT Supplier.SUPP_ID, Supplier.SUPP_NAME,
           AVG(Rating.RAT_RATSTARS) AS Average_Rating,
           CASE
               WHEN AVG(Rating.RAT_RATSTARS) = 5 THEN 'Excellent Service'
               WHEN AVG(Rating.RAT_RATSTARS) > 4 THEN 'Good Service'
               WHEN AVG(Rating.RAT_RATSTARS) > 2 THEN 'Average Service'
               ELSE 'Poor Service'
           END AS Type_of_Service
    FROM Supplier
    JOIN Supplier_pricing ON Supplier.SUPP_ID = Supplier_pricing.SUPP_ID
    JOIN Orders ON Supplier_pricing.PRICING_ID = Orders.PRICING_ID
    JOIN Rating ON Orders.ORD_ID = Rating.ORD_ID
    GROUP BY Supplier.SUPP_ID, Supplier.SUPP_NAME;
END //

DELIMITER ;

CALL DisplaySupplierRatings();


























 
 
 
 
 
 
 
 
 
 

 
 
 
 
 
 
 
 
 

   
   
   
   
   
   
   
   
   
   

  
  
  
  
  
  
  
  
  
  

  
  

  

    

    
    
    
    

























