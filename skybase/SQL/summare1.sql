drop database summary;
create database summary;

use summary;

create table products (


p_id int not null,
p_description varchar (100),
p_finish varchar (100),
unit_price int not null,

constraint product_id_pk primary key (p_id)
);

insert into products (p_id, p_description, p_finish, unit_price)

values
(1, 'Matt finish', '20/10/17', 1000),
(2, 'Blank finish', '21/09/17', 999);

create table customers (

c_id int not null,
c_name varchar (50),
c_adress varchar (50),

constraint customer_id_pk primary key (c_id)
);

insert into customers (c_id, c_name, c_adress)

values

(1, 'Hans Gruber', 'Hanseaterveien 52'),
(2, 'Sterling Archer', 'Dreamland 10');


create table orders (

o_id int not null, 
o_date varchar (10),
c_id int not null,

constraint order_id_pk primary key (o_id),
constraint customer_id_fk foreign key (c_id) references customers (c_id)
);

insert into orders (o_id, o_date, c_id)

values

(1, '10/05/2000', 1),
(2, '11/06/2001', 2);

create table orderline (

ol_quantity int not null,
p_id int not null, 
o_id int not null,

constraint order_quantity_pk primary key (ol_quantity),
constraint product_id_fk foreign key (p_id) references products (p_id), 
constraint order_id_fk foreign key (o_id) references orders (o_id)
);

insert into orderline (ol_quantity, p_id, o_id)

values 
(10, 2, 1), 
(20, 1, 2);

select orderline.ol_quantity, products.p_id, orders.o_id
from  (( orderline
inner join products on products.p_id=orderline.p_id)
inner join orders on orders.o_id=orderline.o_id)
 





