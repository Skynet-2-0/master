drop database test;
create database test;


use test;


CREATE TABLE Bruker (
Bruker_ID int,
Fornavn varchar(30),
Etternavn varchar(30),
Epost varchar(50),
Brukerinnstillinger varchar(30),
primary key (Bruker_ID)
foreign key (Student_ID)
foreign key (Lærer_ID)
);

insert into Bruker (Bruker_ID, Fornavn, Etternavn, Epost)
values  
(1, 'Bob', 'Ross', 'bobross@gmail.com'),
(2,'Hannah', 'Hipster','hahi@hotmail.com'),
(3, 'Josef', 'Alfa', 'josefmann@outlook.com'),
(4, 'Jonas', 'Omdal','Jonastestmail@outlook.com'),
(5, 'Brage', 'Fosso', 'bragetestmail@gmail.com');


CREATE TABLE Student (
  Student_ID int,
  Logg varchar(50) not null,
  Innleveringer varchar (30),
  primary key (Student_ID)
);

insert into Student (Student_ID, Logg, Innleveringer)
values
(4, 'innlegg 5', 'modul 5'),
(5, 'innlegg 4', 'modul 4');

CREATE TABLE Tilbakemelding(
Tilbakemelding_ID int,
Godkjent varchar(20),
Intern_kommentar varchar(60),
Kommentar varchar (50),
primary key (Tilbakemelding_ID)
foreign key (Modul_ID)
foreign key (Lærer_ID)
foreign key (Student_ID)
);

insert into Tilbakemelding (Godkjent, Intern_kommentar, Kommentar)
values 
('godkjent', 'må jobbe mer med for loop', 'mye bra');


CREATE TABLE Varsel (
Varsel_ID int(11) PRIMARY KEY auto_increment,
Varsel_for varchar(40),
til int(10),
melding varchar(255),
primary key (Varsel_ID)
);

insert into Varsel (varsel_id, varsel_for, til, melding) 
values 
(527, 'modul', 1, 'Modulen er innlevert'); 

CREATE TABLE Kalender (
Kalender_ID int,
  Innleveringsfrist date,
  Varsel varchar(30),
  primary key (Kalender_ID)
);

insert into Kalender (Innleveringsfrist, Varsel)
values
 ('21-10', 'innleveringsfrist modul 6');

CREATE TABLE Forum (
Innlegg_ID int,
  Skrevet_av varchar (50),
  Innlegg varchar(50),
  primary key (Innlegg_ID)
  foreign key (Bruker_ID)
);

insert into Forum (Skrevet_av, Innlegg)
values
( 'Jonas', 'Omdal','Trenger hjelp med modul 5'),
( 'Brage', 'Fosso', 'Skjønner ikke for loop, kan noen hjelpe?');


CREATE TABLE Filvedlegg (
  Fil_ID int,
  Filtype varchar(30),
  Navn varchar(20),
  primary key (Fil_ID)
);

CREATE TABLE Lærer (
  Lærer_ID int,
  Tittel varchar(40),
  Hjelpelærer varchar(40),
  primary key (Lærer_ID)
);

CREATE TABLE Innlevering (
Innlevering_ID int,
  Levert_av varchar(50),
  Modul int,
  Filvedlegg varchar(40),
  Dato date,
  Tilbakemelding varchar(40),
  primary key (Innlevering_ID)
  foreign key (Fil_ID)
  foreign key (Student_ID)
  foreign key (Modul_ID)
);


CREATE TABLE Brukerinnstillinger (
Innstillinger_ID int,
Varsler varchar(40),
  Bruker varchar(40),
  primary key (Innstillinger_ID)
  foreign key (Bruker_ID)
);

CREATE TABLE Modul (
Modul_ID int,
  Beskrivelse varchar(40),
  Læringsmål varchar(50) not null,
  Ressurser varchar(50) not null
);

CREATE TABLE Logg (
Logg_ID int,
  Innhold varchar(50),
  Uke_nummer int,
  primary key (Logg_ID)
);