DROP DATABASE IF EXISTS Skybase;
CREATE DATABASE Skybase;

use Skybase;

CREATE TABLE User_Account(
User_Account_ID INT NOT NULL AUTO_INCREMENT,
User_Name varchar(30) NOT NULL UNIQUE KEY,
Gender varchar(1) NOT NULL,
Name VARCHAR(50) NOT NULL,
Password VARCHAR(30) NOT NULL,
Email VARCHAR(50) NOT NULL,
Usertype VARCHAR(10),

CONSTRAINT User_Account_pk primary key(User_Account_ID)
);
ALTER TABLE User_Account AUTO_INCREMENT=1;

-- Insert Data --

INSERT INTO User_Account (User_Name, Gender, Name, Password, Email, Usertype)
VALUES('tom', 'M','TOM CRUISE','tom001', 'tombadass@hotmail.com', 'ADMIN');

INSERT INTO User_Account (User_Name, Gender, Name, Password, Email, Usertype)
VALUES('mette', 'F','METTE MARIT','mette001', 'metteprinsesse@gmail.com', 'ADMIN');


CREATE TABLE Module(
Module_ID INT NOT NULL AUTO_INCREMENT,
Description varchar (500) NOT NULL,
Teaching_Goal varchar (300) NOT NULL,
Resources varchar (100),



CONSTRAINT Modul_pk primary key(Module_ID)
);

-- Insert Data --

INSERT INTO Module (Description, Teaching_Goal, Resources)
VALUES('bli kjent med blueJ', 'Kunne BlueJ sine grunnleggende funksjoner', 'kap1');

insert into Module (Description, Teaching_Goal, Resources)
VALUES('bli kjent med koding', 'Kunne hente og legge til verdier', 'kap2');


CREATE TABLE Feedback(
Status varchar(30) NOT NULL,
Comment_open varchar(300) NOT NULL,
Comment_hidden varchar(300) NOT NULL,
Score int,
Module_ID INT NOT NULL,
User_Account_ID INT NOT NULL,

CONSTRAINT User_Account_fk1 FOREIGN KEY (User_Account_ID) references User_Account (User_Account_ID),
CONSTRAINT Module_fk1 FOREIGN KEY (Module_ID) references Module (Module_ID),
CONSTRAINT Feedback_pk PRIMARY KEY(User_Account_ID, Module_ID)

);

create table Calendar(
Calendar_ID INT UNSIGNED NOT NULL,
Dato DATE,
Event VARCHAR(300),

CONSTRAINT Calendar_pk primary key(Calendar_ID)
);

CREATE TABLE Forum(
Question_ID INT NOT NULL AUTO_INCREMENT,
User_Name VARCHAR(30) NOT NULL UNIQUE KEY,
Topic VARCHAR(10),
CreateDate datetime NOT NULL,
Question VARCHAR(255),
Details VARCHAR(50) ,
View INT(5),
Reply INT(5),


CONSTRAINT Forum_pk primary key(Question_ID)

);
ALTER TABLE Forum AUTO_INCREMENT=1;

-- Insert Data -- 

INSERT INTO Forum (User_Name, Topic, CreateDate, Question, Details, View, Reply)
VALUES(' tom', 'IS-100', '2017.11.13', 'What is a database', 'A database is an organized collection of data', '0 ',' 0');

INSERT INTO Forum (User_Name, Topic, CreateDate, Question, Details, View, Reply)
VALUES( 'mette', 'IS-109', '2017.11.13', 'What is parameter', 'A parameter  is any characteristic that can help in defining or classifying a particular system', '0 ', ' 0');



create table Comment(
Comment_ID INT NOT NULL,
Title varchar(50),
User_Account_ID INT NOT NULL,

CONSTRAINT Comment_pk primary key(Comment_ID),
CONSTRAINT User_Account_fk3 FOREIGN KEY (User_Account_ID) references User_Account (User_Account_ID)
);

create table File_Attachment(
File_ID INT NOT NULL,
File_Name varchar(100),
Comment varchar (300),
User_Account_ID INT NOT NULL,
Module_ID INT NOT NULL,
Delivery_Date date,

CONSTRAINT File_pk primary key(File_ID),
CONSTRAINT User_fk4 FOREIGN KEY (User_Account_ID) references User_Account (User_Account_ID),
CONSTRAINT Module_fk2 FOREIGN KEY (Module_ID) references Module (Module_ID)
);

create table Delivery(
Delivery_ID INT UNSIGNED NOT NULL,
Date date,
File_ID INT NOT NULL,

CONSTRAINT Delivery_pk primary key(Delivery_ID),
CONSTRAINT File_fk1 FOREIGN KEY (File_ID) references File_Attachment(File_ID)
);

create table Log(
Log_ID INT UNSIGNED NOT NULL,
Content varchar (1000),
Week int,
Date date,
User_Account_ID INT NOT NULL,

CONSTRAINT Log_pk primary key(Log_ID),
CONSTRAINT User_fk5 FOREIGN KEY (User_Account_ID) references User_Account (User_Account_ID)
);