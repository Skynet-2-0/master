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

INSERT INTO User_Account (User_Name, Gender, Name, Password, Email, Usertype)
VALUES('test', 'M','TESTIE','test', 'testie@gmail.com', 'USER');

/*
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

insert into Module (Description, Teaching_Goal, Resources)
VALUES('bli kjent med koding', 'Kunne hente og legge til verdier', 'kap3');
*/

CREATE TABLE Module(
Module_id INT NOT NULL AUTO_INCREMENT,
Module_Name varchar (70) NOT NULL,
Delivery_Date varchar (70) NOT NULL,
Description varchar (500) NOT NULL,
LearningGoals varchar (500) NOT NULL,
Resources varchar (300),

CONSTRAINT Modul_pk primary key(Module_ID)
);

-- Insert Data --

INSERT INTO Module (Module_Name, Delivery_Date, Description, LearningGoals, Resources)
VALUES('Introduksjon til BlueJ', '2.februar - kl. 23.59', 'bli kjent med blueJ', 'Kunne BlueJ sine grunnleggende funksjoner', 'kap1');

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
Dato VARCHAR(10),
Hendelse VARCHAR(300),

CONSTRAINT Calendar_pk primary key(Calendar_ID)
);

insert into Calendar (Calendar_ID, Dato, Hendelse)
values(1, '20171101', 'Eksamen');

create table Forum(
Post_ID INT NOT NULL,
Title varchar(50),
User_Account_ID INT NOT NULL,

CONSTRAINT Post_pk primary key(Post_ID),
CONSTRAINT User_fk2 FOREIGN KEY (User_Account_ID) references User_Account (User_Account_ID)
);

create table Comment(
Comment_ID INT NOT NULL,
Title varchar(50),
User_Account_ID INT NOT NULL,

CONSTRAINT Comment_pk primary key(Comment_ID),
CONSTRAINT User_Account_fk3 FOREIGN KEY (User_Account_ID) references User_Account (User_Account_ID)
);

create table ATTACHMENT(
attachment_ID BIGINT not null,
FILE_NAME   VARCHAR(50) not null,
FILE_DATA   LONGBLOB not null,
DESCRIPTION VARCHAR(255),

CONSTRAINT File_pk primary key(attachment_ID)
);

create table Delivery(
ATTACHMENT_ID BIGINT NOT NULL,
user_account_id int not null,
module_id int not null,

CONSTRAINT File_fk1 FOREIGN KEY (ATTACHMENT_ID) references ATTACHMENT(ATTACHMENT_ID),
CONSTRAINT user_account_fk7 FOREIGN KEY (user_account_id) references user_account(user_account_id),
CONSTRAINT module_fk7 FOREIGN KEY (module_id) references module(module_id),
CONSTRAINT Delivery_pk primary key(ATTACHMENT_ID, user_account_id, module_id)
);

create table Log(
Log_ID INT auto_increment,
Title varchar(50),
Content varchar (1000),
Date date,
User_Account_ID INT NOT NULL,

CONSTRAINT Log_pk primary key(Log_ID),
CONSTRAINT User_fk5 FOREIGN KEY (User_Account_ID) references User_Account (User_Account_ID)
);
/*
select user_account.name, feedback.user_account_id, feedback.module_id, feedback.status, feedback.score,
feedback.comment_open, feedback.comment_hidden, delivery.attachment_id
from user_account
inner join feedback
on user_account.user_account_id = feedback.user_account_id
inner join delivery
on feedback.module_id = delivery.module_id
where delivery.module_id=1;
