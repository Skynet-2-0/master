DROP DATABASE test;
CREATE DATABASE test;

USE test;

CREATE TABLE customers (

cs_fname VARCHAR(30),
cs_lname VARCHAR(30) NOT NULL,
cs_adress VARCHAR(50),
cs_email VARCHAR(50) NOT NULL,

cs_id INT NOT NULL AUTO_INCREMENT,
CONSTRAINT customer_pk PRIMARY KEY (cs_id)
);

INSERT INTO customers (cs_id, cs_fname, cs_lname, cs_adress, cs_email)
                      
VALUES
(1, 'Bob', 'Ross', 'Rørosgata 12', 'bobross@gmail.com'),
(2, 'Hannah', 'Hipster', 'Bergensveien 23', 'hahi@hotmail.com'),
(3, 'Josef', 'Alfa', 'FEILgata 90', 'josefmann@outlook.com');

UPDATE `test`.`customers` SET `cs_adress`='Finnmarksgata 90' WHERE `cs_id`='3';
DELETE FROM customers WHERE cs_id = 1 LIMIT 1;

INSERT INTO `test`.`customers` (`cs_id`, `cs_fname`, `cs_lname`, 
`cs_adress`, `cs_email`) VALUES ('1', 'Jonas', 'Omdal', 
'Jonasveien 15', 'jonastestmail@outlook.com');

INSERT INTO `test`.`customers` (`cs_id`, `cs_fname`, `cs_lname`, 
`cs_adress`, `cs_email`) VALUES ('4', 'Brage', 'Fosso', 
'Bragegata 55', 'bragetestmail@gmail.com'); 

ALTER TABLE customers MODIFY COLUMN cs_lname VARCHAR(50) NOT NULL FIRST; 
SELECT * FROM customers ORDER BY LEFT(cs_lname, 3);

CREATE TABLE orders (

o_id INT NOT NULL,
o_name VARCHAR(100),
o_price INT,
cs_id INT NOT NULL,

CONSTRAINT order_pk PRIMARY KEY(o_id),
CONSTRAINT customer_fk FOREIGN KEY (cs_id) REFERENCES customers (cs_id)
);

INSERT INTO orders(
o_id, o_name, o_price, cs_id)

VALUES
(1, 'x1', 9999, 1),
(2, 'MAC PC', 5634, 1),
(3, 'x2', 7999, 2),
(4, 'Samsung Galaxy S8', 9999, 2),
(5, 'x3', 231, 3),
(6, 'MSI GTX 1080 Ti', 799, 3),
(7, 'x4', 6323, 4),
(8, 'Corsair Tastatur', 299, 4);

SELECT customers.cs_id, customers.cs_lname, orders.o_id, orders.o_name
FROM customers
INNER JOIN orders
ON customers.cs_id = orders.cs_id