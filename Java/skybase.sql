DROP DATABASE IF EXISTS Skybase;
CREATE DATABASE Skybase;

use Skybase;

CREATE TABLE User_Account(
User_Account_ID INT UNSIGNED NOT NULL,
User_Name varchar(30) NOT NULL UNIQUE KEY,
Gender varchar(1) not null,
Name VARCHAR(50) NOT NULL,
Password VARCHAR(30) NOT NULL,
Email VARCHAR(50) NOT NULL,
Usertype VARCHAR(10),

CONSTRAINT User_Account_pk primary key(User_Account_ID)
);


-- Insert Data --

INSERT INTO User_Account (User_Account_ID, User_Name, Gender, Name, Password, Email, Usertype)
VALUES(1, 'tom', 'm','Tom Cruise','tom001', 'tombadass@hotmail.com', 'Admin');

INSERT INTO User_Account (User_Account_ID, User_Name, Gender, Name, Password, Email, Usertype)
VALUES(2, 'mette', 'f','Mette Marit','mette001', 'metteprinsesse@gmail.com', 'Admin');


CREATE TABLE Module(
Module_ID INT UNSIGNED NOT NULL,
Description varchar (500) NOT NULL,
Teaching_Goal varchar (300) NOT NULL,
Resources varchar (100),

CONSTRAINT Modul_pk primary key(Module_ID)
);

-- Insert Data --

INSERT INTO Module (Module_ID, Description, Teaching_Goal, Resources)
VALUES(1, 'bli kjent med blueJ', 'Kunne BlueJ sine grunnleggende funksjoner', 'kap1');

insert into Module (Module_ID, Description, Teaching_Goal, Resources)
VALUES(2, 'bli kjent med koding', 'Kunne hente og legge til verdier', 'kap2');


CREATE TABLE Feedback(
Feedback_ID INT UNSIGNED NOT NULL,
Status varchar(30) NOT NULL,
Comment_open varchar(300) NOT NULL,
Comment_hidden varchar(300) NOT NULL,
Score int,
Module_ID INT UNSIGNED NOT NULL,
User_Account_ID INT UNSIGNED NOT NULL,

CONSTRAINT Feedback_pk primary key(Feedback_ID),
CONSTRAINT User_Account_fk1 FOREIGN KEY (User_Account_ID) references User_Account (User_Account_ID),
CONSTRAINT Module_fk1 FOREIGN KEY (Module_ID) references Module (Module_ID)
);

create table Calendar(
Calendar_ID INT UNSIGNED NOT NULL,
Dato DATE,
Event VARCHAR(300),

CONSTRAINT Calendar_pk primary key(Calendar_ID)
);

create table Forum(
Post_ID INT UNSIGNED NOT NULL,
Title varchar(50),
User_Account_ID int unsigned NOT NULL,

CONSTRAINT Post_pk primary key(Post_ID),
CONSTRAINT User_fk2 FOREIGN KEY (User_Account_ID) references User_Account (User_Account_ID)
);

create table Comment(
Comment_ID INT UNSIGNED NOT NULL,
Title varchar(50),
User_Account_ID int unsigned NOT NULL,

CONSTRAINT Comment_pk primary key(Comment_ID),
CONSTRAINT User_Account_fk3 FOREIGN KEY (User_Account_ID) references User_Account (User_Account_ID)
);

create table File_Attachment(
File_ID INT UNSIGNED NOT NULL,
File_Name varchar(100),
Comment varchar (300),
User_Account_ID int unsigned NOT NULL,
Module_ID int unsigned NOT NULL,
Delivery_Date date,

CONSTRAINT File_pk primary key(File_ID),
CONSTRAINT User_fk4 FOREIGN KEY (User_Account_ID) references User_Account (User_Account_ID),
CONSTRAINT Module_fk2 FOREIGN KEY (Module_ID) references Module (Module_ID)
);

create table Delivery(
Delivery_ID INT UNSIGNED NOT NULL,
Date date,
File_ID INT UNSIGNED NOT NULL,

CONSTRAINT Delivery_pk primary key(Delivery_ID),
CONSTRAINT File_fk1 FOREIGN KEY (File_ID) references File_Attachment(File_ID)
);

create table Log(
Log_ID INT UNSIGNED NOT NULL,
Content varchar (1000),
Week int,
Date date,
User_Account_ID INT UNSIGNED NOT NULL,

CONSTRAINT Log_pk primary key(Log_ID),
CONSTRAINT User_fk5 FOREIGN KEY (User_Account_ID) references User_Account (User_Account_ID)
);


SELECT *
FROM User_Account
;

SELECT *
FROM Module
;

SELECT *
FROM Feedback
;

SELECT *
FROM Calendar
;

SELECT *
FROM Forum
;

SELECT *
FROM Comment
;

SELECT *
FROM File_Attachment
;

SELECT *
FROM Delivery
;

SELECT *
FROM Log
;