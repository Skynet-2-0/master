drop database test;
create database test;

use test;

create table customers (

cs_fname varchar(30),
cs_lname varchar(50) not null,
cs_adress varchar(50),
cs_email varchar(50) not null,

cs_id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY
);

insert into customers (cs_id, cs_fname, cs_lname, cs_adress, cs_email)
                      
values
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

select * from customers order by LEFT(cs_lname, 3);
