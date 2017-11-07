DROP DATABASE IF EXISTS simpleapp;
CREATE DATABASE simpleapp;
use simpleapp;

create table USER_ACCOUNT(
ID INT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE KEY,
USER_NAME varchar(30) not null UNIQUE KEY,
NAME VARCHAR(50) NOT NULL,
PASSWORD VARCHAR(30) not null,
EMAIL VARCHAR(30) NOT NULL,
GENDER varchar(1) not null,
ROLE VARCHAR(10),

primary key(EMAIL)
);

ALTER TABLE USER_ACCOUNT AUTO_INCREMENT=1;
-- Insert Data --

insert into user_account (ID, USER_NAME, PASSWORD, NAME, GENDER, EMAIL, ROLE)
values(ID, 'tom', 'tom001', 'Tom Cruise', 'M', 'tombadass@hotmail.com', 'Admin');

insert into user_account (ID, USER_NAME, PASSWORD, NAME, GENDER, EMAIL, ROLE)
values(ID, 'mette', 'mette001', 'Mette Marit', 'F', 'metteprinsesse@hotmail.com', 'User');

