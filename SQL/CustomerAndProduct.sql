DROP DATABASE IF EXISTS test;
CREATE DATABASE test;

USE test;
 -- PART 1 --------------------------------------------------------------------------
CREATE TABLE customers (
cs_fname VARCHAR(30) NOT NULL,
cs_lname VARCHAR(30) NOT NULL,
cs_adress VARCHAR(50)NOT NULL,
cs_email VARCHAR(50) NOT NULL,
cs_id INT NOT NULL,

CONSTRAINT customer_pk PRIMARY KEY (cs_id),
UNIQUE KEY customer_u (cs_id)
);

INSERT INTO customers (cs_fname, cs_lname, cs_adress, cs_email, cs_id)
                      
VALUES
('Bob', 'Ross', 'Rørosgata 12', 'bobross@gmail.com', 1),
('Hannah', 'Hipster', 'Bergensveien 23', 'hahi@hotmail.com', 2),
('Josef', 'Alfa', 'FEILgata 90', 'josefmann@outlook.com', 3);

UPDATE `test`.`customers` SET `cs_adress`='Finnmarksgata 90' WHERE `cs_id`='3';
DELETE FROM customers WHERE cs_id = 1 LIMIT 1;

INSERT INTO `test`.`customers` (`cs_id`, `cs_fname`, `cs_lname`, `cs_adress`, `cs_email`) 
VALUES ('1', 'Jonas', 'Omdal', 'Jonasveien 15', 'jonastestmail@outlook.com');

INSERT INTO `test`.`customers` (`cs_id`, `cs_fname`, `cs_lname`, `cs_adress`, `cs_email`)
VALUES ('4', 'Brage', 'Fosso', 'Bragegata 55', 'bragetestmail@gmail.com'); 

-- SELECT LEFT(cs_lname, 3) FROM customers;   ---- will select only the 3 first charcters from last name
DESCRIBE customers;

ALTER TABLE customers MODIFY COLUMN cs_lname VARCHAR(50) NOT NULL FIRST;
SELECT * FROM customers ORDER BY LEFT (cs_lname, 3);
-- END PART 1 --------------------------------------------------------------------------

-- PART 2 AND 3 ------------------------------------------------------------------------
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

-- SELECT LEFT(p_name , 10) FROM products;  -------- this will print out 10 first characters of name

-- SET SQL_SAFE_UPDATES=0;
-- UPDATE products SET p_name = CONCAT(p_name,' STAR');  ------- this will set the word STAR at the end of the product name

SELECT * FROM products;

CREATE TABLE orders (
o_billingadress varchar(100) NOT NULL,
o_date date NOT NULL,
o_deliverydate date NOT NULL,
o_orderstatus varchar(10) NOT NULL,
cs_id int NOT NULL,
p_id int NOT NULL,
o_id INT NOT NULL,

CONSTRAINT customers_fk FOREIGN KEY (cs_id) REFERENCES customers (cs_id),
CONSTRAINT products_fk FOREIGN KEY (p_id) REFERENCES products (p_id),
CONSTRAINT orders_pk PRIMARY KEY(p_id, cs_id)
);

INSERT INTO orders(
 cs_id, p_id, o_billingadress, o_date, o_deliverydate, o_orderstatus, o_id)

VALUES
(4, 1,'Bragegata 55', 180917, 250917, 'confirmed', 4),
(4, 2,'Bragegata 55', 180917, 250917, 'confirmed', 3),
(2, 3,'Bergensveien 23', 150917, 220917, 'shipped', 2),
(2, 4,'Bergensveien 23', 150917, 220917, 'shipped', 1),
(3, 5,'Finnmarksgata 90', 100917, 170917, 'delivered', 8),
(3, 6,'Finnmarksgata 90',  100917, 170917, 'delivered', 7),
(1, 7,'Jonasveien 15', 100815, 150815, 'delivered', 6),
(1, 8,'Jonasveien 15', 100815, 150815, 'delivered', 5);

DELETE FROM orders WHERE cs_id = 1;

SELECT orders.o_billingadress, orders.o_date, orders.o_deliverydate, orders.o_orderstatus,
customers.cs_id, products.p_id, products.p_name, orders.o_id
FROM (( orders
INNER JOIN customers ON customers.cs_id=orders.cs_id)
INNER JOIN products ON products.p_id=orders.p_id);

