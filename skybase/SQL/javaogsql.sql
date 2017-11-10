create database simplewebapp;

use simplewebapp;

create table USER_ACCOUNT(

USER_NAME varchar(30) not null,
GENDER varchar(1) not null,
PASSWORD VARCHAR(30) not null,
primary key(USER_NAME)
);

create table STUDENTS(

ID INT not null,
NAME VARCHAR(128) not null,
EMAIL VARCHAR(100) not null,
primary key(ID)
);

-- Insert Data --

insert into user_account (USER_NAME, GENDER, PASSWORD)
values('tom', 'M', 'tom001');

insert into user_account (USER_NAME, GENDER, PASSWORD)
values('mette', 'F', 'mette001');

insert into students (ID, NAME, EMAIL)
values(1, 'mette marit', 'metteprinsesse@gmail.com');

insert into students (ID, NAME, EMAIL)
values(2, 'tom cruise', 'tombadass@hotmail.com');
