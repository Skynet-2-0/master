drop database museum;
create database museum;

use museum;

create table works(
w_id int not null auto_increment,
w_title varchar(100),
w_type varchar(100),
w_sizeWeight int,
w_sizeWidth int,
w_sizeHeight int,

constraint work_pk primary key (w_id)
);

insert into works (w_id, w_title, w_type, w_sizeWeight, w_sizeWidth, w_sizeHeight)

values
(1, 'x', 'y', 1, 1, 1),
(2, 'x', 'y', 1, 1, 1),
(3, 'x', 'y', 1, 1, 1);

select * from works;

create table artist(
a_id int not null,
a_name varchar(100),
a_DoB float,
a_DoD float default null,
w_id int not null auto_increment,

constraint work_id foreign key (w_id) references works (w_id)
);

insert into artist (a_id, a_name, a_DoB, a_DoD, w_id)

values
(1, 'x', 1.69, null, 1),
(1, 'y', 1.69, null, 2),
(3, 'z', 1.69, 1.17, 3);

select * from artist;

create table travel(
t_id int not null,
t_city varchar(30),
t_startD float,
t_endD float,
w_id int not null auto_increment,

constraint travel_pk primary key (t_id),
constraint work_fk foreign key (w_id) references works (w_id)
);

insert into travel (t_id, t_city, t_startD, t_endD, w_id)

values
(1, 'x', 1.16, 1.17, 2),
(2, 'y', 1.16, 1.17, 1),
(3, 'z', 1.16, 1.17, 3);

select * from travel;

create table gallery(
g_id int not null,
g_name varchar(30),
g_city varchar(30),

constraint gallery_pk primary key (g_id)
);

insert into gallery (g_id, g_name, g_city)

values
(1, 'x', 'x'),
(2, 'y', 'y'),
(3, 'z', 'z');

select * from gallery;

create table loaned(
l_loaned float,
l_returned float,
g_id int not null,

constraint gallery_fk foreign key (g_id) references gallery (g_id)
);

insert into loaned (l_loaned, l_returned, g_id)

values
(5.16, 2.17, 2),
(2.17, 5.17, 2);

select * from loaned;