drop database test;
create database test;

use test;

create table customers (
cs_no integer,
cs_fname varchar(30),
cs_lname varchar(50) not null,
cs_status varchar(10) default 'Active',
store_no integer,
cs_adress varchar(50),
cs_email varchar(50) not null,

constraint customers_pk primary key (cs_no)
);

insert into customers (cs_no, cs_fname, cs_lname, cs_adress,  
                      cs_status, store_no, cs_email)
                      
values
(1, 'Bob', 'Ross', 'Rørosgata 12','Active', 2, 'bobross@gmail.com'),
(2, 'Hannah', 'Hipster', 'Bergensveien 23','Inactive', 1, 'hahi@hotmail.com'),
(3, 'Josef', 'Alfa', 'FEILgata 90','Active', 1, 'josefmann@outlook.com');

UPDATE `test`.`customers` SET `cs_adress`='Finnmarksgata 90' WHERE `cs_no`='3';
DELETE FROM customers WHERE cs_no = 1 LIMIT 1;

INSERT INTO `test`.`customers` (`cs_no`, `cs_fname`, `cs_lname`, 
`cs_status`, `store_no`, `cs_adress`, `cs_email`) VALUES ('1', 'Jonas', 'Omdal', 
'Active', '2', 'Jonasveien 15', 'jonastestmail@outlook.com');

INSERT INTO `test`.`customers` (`cs_no`, `cs_fname`, `cs_lname`, 
`cs_status`, `store_no`, `cs_adress`, `cs_email`) VALUES ('4', 'Brage', 'Fosso', 
'Active', '1', 'Bragegata 55', 'bragetestmail@gmail.com'); 

ALTER TABLE customers MODIFY COLUMN cs_lname VARCHAR(50) NOT NULL FIRST; 

select * from customers order by LEFT(cs_lname, 3);