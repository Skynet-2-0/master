DROP DATABASE IF EXISTS test;
CREATE DATABASE test;

USE test;

CREATE TABLE customerDetails (
cd_email VARCHAR(50) NOT NULL,
cd_fname VARCHAR(30) NOT NULL,
cd_lname VARCHAR(30) NOT NULL,
cd_adress VARCHAR(50)NOT NULL,


CONSTRAINT customerdetails_pk PRIMARY KEY (cd_email)
);

INSERT INTO customerDetails (cd_email, cd_fname, cd_lname, cd_adress)
                      
VALUES
('bobross@gmail.com', 'Bob', 'Ross', 'Rørosgata 12'),
('hahi@hotmail.com', 'Hannah', 'Hipster', 'Bergensveien 23'),
('josefmann@outlook.com', 'Josef', 'Alfa', 'Finnmarksgata 90'),
('Jonastestmail@outlook.com', 'Jonas', 'Omdal', 'Jonasveien 15'),
('bragetestmail@gmail.com', 'Brage', 'Fosso', 'Bragegata55');

-- SELECT * FROM customerDetails;
-- --------------------------------------------------------------------------------------------------
-- --------------------------------------------------------------------------------------------------
CREATE TABLE corporation(
c_id INT NOT NULL,
c_name VARCHAR(100) NOT NULL,

CONSTRAINT corporation_pk PRIMARY KEY (c_id)
);

INSERT INTO corporation (c_id, c_name)

VALUES
(1, 'Skynet'),
(2, 'Hackergang');

-- SELECT * FROM corporation;
-- --------------------------------------------------------------------------------------------------
-- --------------------------------------------------------------------------------------------------
CREATE TABLE customer (
cs_id INT NOT NULL,
cd_email VARCHAR(50) NOT NULL,
c_id INT NOT NULL,

CONSTRAINT customerdeatails_fk FOREIGN KEY (cd_email) REFERENCES customerDetails (cd_email), 
CONSTRAINT corporation_fk FOREIGN KEY (c_id) REFERENCES corporation (c_id),
CONSTRAINT customer_pk PRIMARY KEY (cs_id)
);

INSERT INTO customer (cs_id, cd_email, c_id)

VALUES
(1, 'jonastestmail@outlook.com', 1),
(2, 'bobross@gmail.com', 2),
(3, 'josefmann@outlook.com', 2),
(4, 'bragetestmail@gmail.com', 2),
(5, 'hahi@hotmail.com', 1);

-- SELECT * FROM customer;
-- --------------------------------------------------------------------------------------------------
-- --------------------------------------------------------------------------------------------------
CREATE TABLE orders (
o_billingadress varchar(100) NOT NULL,
o_date date NOT NULL,
o_deliverydate date NOT NULL,
o_orderstatus varchar(10) NOT NULL,
cs_id INT NOT NULL,
o_id INT NOT NULL,

CONSTRAINT customers_fk FOREIGN KEY (cs_id) REFERENCES customer (cs_id),
CONSTRAINT orders_pk PRIMARY KEY(o_id)
);


INSERT INTO orders(
 cs_id, o_billingadress, o_date, o_deliverydate, o_orderstatus, o_id)

VALUES
(2, 'Rørosgata 12', 150917, 200917, 'confirmed', 10),
(2, 'Rørosgata 12', 150917, 200917, 'confirmed', 9),
(4, 'Bragegata 55', 180917, 250917, 'confirmed', 4),
(4,'Bragegata 55', 180917, 250917, 'confirmed', 3),
(5,'Bergensveien 23', 150917, 220917, 'shipped', 2),
(5,'Bergensveien 23', 150917, 220917, 'shipped', 1),
(3,'Finnmarksgata 90', 100917, 170917, 'delivered', 8),
(3,'Finnmarksgata 90',  100917, 170917, 'delivered', 7),
(1,'Jonasveien 15', 100815, 150815, 'delivered', 6),
(1,'Jonasveien 15', 100815, 150815, 'delivered', 5);

-- SELECT * FROM orders;
-- --------------------------------------------------------------------------------------------------
-- --------------------------------------------------------------------------------------------------
CREATE TABLE creditcarddetails(
ccd_number INT NOT NULL,
ccd_holdersname VARCHAR(50) NULL,
ccd_expirydate DATE NOT NULL,

CONSTRAINT creditcarddetails_pk PRIMARY KEY (ccd_number)
);

INSERT INTO creditcarddetails (ccd_number, ccd_holdersname, ccd_expirydate)

VALUES
(1, 'Bob Ross', 010622),
(2, 'Hannah Hipster', 020118),
(3, 'Josef Alfa', 050721),
(4, 'Jonas Omdal', 030419),
(5, 'Brage Fosso', 040320);

-- SELECT * FROM creditcarddetails;
-- --------------------------------------------------------------------------------------------------
-- --------------------------------------------------------------------------------------------------
CREATE TABLE invoice (
i_id INT NOT NULL,
i_method VARCHAR(50),
i_issued date NOT NULL, 
i_paid date NOT NULL, 
ccd_number INT NOT NULL,

CONSTRAINT invoice_pk PRIMARY KEY (i_id),
CONSTRAINT creditcarddetails_fk FOREIGN KEY (ccd_number) REFERENCES creditcarddetails (ccd_number)
);

INSERT INTO invoice (i_id, i_method, i_issued, i_paid, ccd_number)

VALUES
(1, 'Internet Bank', 150917, 200917, 2),
(2, 'Internet Bank',150917, 200917, 2),
(3, 'Credit Card', 180917, 220917, 5), 
(4, 'Credit Card', 180917, 220917, 5),
(5, 'PayPal', 100815, 150815, 4),
(6, 'PayPal', 100815, 150815, 4), 
(7, 'Internet Bank', 100917, 160917, 3),
(8, 'Internet Bank', 100917, 160917, 3),
(9, 'BitCoin', 250316, 300316, 1),
(10, 'BitCoin', 250316, 300316, 1); 

-- SELECT * FROM invoice;
-- --------------------------------------------------------------------------------------------------
-- --------------------------------------------------------------------------------------------------
CREATE TABLE products(
p_name VARCHAR(100) NOT NULL,
p_price INT NOT NULL, 
p_quantityinstock INT NOT NULL,
p_id INT NOT NULL,

CONSTRAINT product_pk PRIMARY KEY(p_id),
UNIQUE KEY p_id_u (p_id)
);

INSERT INTO products (p_name, p_price, p_quantityinstock, p_id)

VALUES
('x1', 9999, 100, 1),
('MAC', 5634, 200, 2),
('x2', 7999, 300, 3),
('Samsung Galaxy S8', 9999, 150, 4),
('x3', 231, 500, 5),
('MSI GTX 1080 Ti', 799, 50, 6),
('x4', 6323, 50, 7),
('Corsair Tastatur', 299, 100, 8);


-- SELECT * FROM products;
-- --------------------------------------------------------------------------------------------------
-- --------------------------------------------------------------------------------------------------
CREATE TABLE orderline (
o_id INT NOT NULL,
p_id INT NOT NULL, 
i_id INT NOT NULL,
ol_quantity INT NOT NULL,
paid INT NOT NULL,

CONSTRAINT order_fk FOREIGN KEY (o_id) REFERENCES orders (o_id),
CONSTRAINT product_fk FOREIGN KEY (p_id) REFERENCES products (p_id),
CONSTRAINT orderline_pk PRIMARY KEY (o_id,p_id),
CONSTRAINT invoice_fk FOREIGN KEY (i_id) REFERENCES invoice (i_id)
);

INSERT INTO orderline (o_id, p_id, i_id, paid, ol_quantity)

VALUES

(1, 2, 1, 2999,5),
(2, 3, 2, 3499,10),
(3, 4, 3, 2199,6),
(4, 5, 4, 25001,12),
(5, 6, 5, 2345,7),
(6, 7, 6, 1324,14),
(7, 8, 7, 9999,8),
(8, 1, 8, 5399,16),
(9, 3, 9, 5000,10),
(10, 1, 10, 8500,18);

-- SELECT * FROM orderline;

-- A) name, total quantity order, product name, for each customer and each product

SELECT customerDetails.cd_fname, customerDetails.cd_lname, products.p_name, orderline.ol_quantity, customer.cs_id
FROM customerDetails, products, orderline, customer, orders
WHERE customerDetails.cd_email = customer.cd_email
AND products.p_id = orderline.p_id
AND orders.o_id = orderline.o_id
AND customer.cs_id = orders.cs_id;

-- B) product name, quantity ordered, total paid by 3 best items

SELECT products.p_name, orderline.ol_quantity, orderline.paid * orderline.ol_quantity
FROM products, orderline
WHERE products.p_id = orderline.p_id
ORDER BY (orderline.paid * orderline.ol_quantity) DESC LIMIT 3;

-- C) view that shows customer, order and total amount for each order

CREATE VIEW customerOrderTotal AS
SELECT customer.cs_id, orders.o_id, orderline.paid * orderline.ol_quantity
FROM customer, orders, orderline
WHERE customer.cs_id = orders.cs_id 
AND orders.o_id = orderline.o_id;

SELECT * FROM customerOrderTotal;

-- D) Print the first 10 characters of product name and quantity-before-reorder (quantityin-stock reorder-level) for products with the text “EN” in the first 10 characters of their product names

SET SQL_SAFE_UPDATES=0;
UPDATE products SET p_name = CONCAT('EN ', p_name);

SELECT products.p_name, orderline.ol_quantity
FROM products, orderline
WHERE products.p_id = orderline.p_id AND products.p_id = orderline.p_id;

-- E) Print customer name, order number and total sum for each order

SELECT customerDetails.cd_fname, customerDetails.cd_lname, orders.o_id, orderline.ol_quantity, orderline.paid * orderline.ol_quantity
FROM customerDetails, orders, orderline, customer
WHERE customerDetails.cd_email = customer.cd_email
AND orders.o_id = orderline.o_id
AND customer.cs_id = orders.cs_id;


