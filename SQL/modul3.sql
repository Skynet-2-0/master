drop database test;
create database test;


USE test;


CREATE TABLE Bruker (
Bruker_ID INT NOT NULL,
Fornavn VARCHAR(30) NOT NULL,
Etternavn VARCHAR(30) NOT NULL,
Epost VARCHAR(50) NOT NULL,
Brukerinnstillinger VARCHAR(30) NOT NULL,

CONSTRAINT Bruker_pk PRIMARY KEY (Bruker_ID),
-- CONSTRAINT Student_fk FOREIGN KEY  (Student_ID) references  Student (Student_ID),
-- CONSTRAINT Lærer_fk FOREIGN KEY  (Lærer_ID) references  Lærer (Lærer_ID)
);

INSERT INTO  Bruker (Bruker_ID, Fornavn, Etternavn, Epost, Brukerinnstillinger)

VALUES  
(1, 'Bob', 'Ross', 'bobross@gmail.com', 'på'),
(2,'Hannah', 'Hipster','hahi@hotmail.com', 'av'),
(3, 'Josef', 'Alfa', 'josefmann@outlook.com', 'på'),
(4, 'Jonas', 'Omdal','Jonastestmail@outlook.com', 'av'),
(5, 'Brage', 'Fosso', 'bragetestmail@gmail.com', 'på');

SELECT * FROM Bruker;


CREATE TABLE Student (
  Student_ID INT NOT NULL,
  Logg VARCHAR(50) NOT NULL ,
  Innleveringer VARCHAR (30) NOT NULL,
  
  
  CONSTRAINT Student_pk PRIMARY KEY (Student_ID),
  CONSTRAINT Innlevering_fk FOREIGN KEY  (Innlevering_ID) references  Innlevering(Innlevering_ID)
);

INSERT INTO Student (Student_ID, Logg, Innlevering)


VALUES
(1, 'Innlegg 5', 'modul 5'),
(2, 'Innlegg 4', 'modul 4');


SELECT * FROM Student;



CREATE TABLE Tilbakemelding (
Tilbakemelding_ID INT,
Godkjent VARCHAR(20) NOT NULL,
Intern_kommentar VARCHAR(60) NOT NULL,
Kommentar VARCHAR(50) NOT NULL,

-- CONSTRAINT Bruker_fk FOREIGN KEY (Bruker_ID) REFERENCES Bruker (Bruker_ID),
-- CONSTRAINT Student_fk FOREIGN KEY (Student_ID) REFERENCES Student (Student_ID),
CONSTRAINT Tilbakemelding_pk PRIMARY KEY (Tilbakemelding_ID),
CONSTRAINT Modul_fk FOREIGN KEY  (Modul_ID) references  Modul (Modul_ID),
CONSTRAINT Student_fk FOREIGN KEY  (Student_ID) references Student(Student_ID)
);

INSERT INTO Tilbakemelding (Tilbakemelding_ID, Godkjent, Intern_kommentar, Kommentar)

VALUES
(367, 'godkjent', 'må jobbe mer med for loop', 'mye bra');

SELECT * FROM Tilbakemelding;
 SELECT Bruker.Bruker_fornavn, Bruker.Bruker_etternavn, Tilbakemelding.Tilbakemelding_ID
FROM Bruker, Tilbakemelding
WHERE Bruker.Bruker_ID = Student.Student_ID
AND Tilbakemelding.Tilbakemelding_ID = Varsel.Varsel_ID;




CREATE TABLE varsel (
varsel_id INT PRIMARY KEY  auto_increment,
varsel_for VARCHAR(40) NOT NULL,
til INT(10) NOT NULL,
melding VARCHAR(255) NOT NULL,

CONSTRAINT Tilbakemelding_fk FOREIGN KEY (Bruker_ID) REFERENCES Bruker (Bruker_ID),
CONSTRAINT varsel_pk PRIMARY KEY (varsel_id)
);


INSERT INTO Varsel (
varsel_id, varsel_for, til, melding) 

VALUES
(527, 'modul', 1, 'Modulen er innlevert'); 


SELECT * FROM Varsel;


CREATE TABLE Kalender (
Kalender_ID INT NOT NULL,
Innleveringsfrist DATE NOT NULL,
Varsel VARCHAR(30) NOT NULL,

CONSTRAINT Kalender_pk PRIMARY KEY (Kalender_ID)
);

INSERT INTO Kalender (Kalender_ID, Innleveringsfrist, Varsel)

VALUES
 (535, '21-10', 'innleveringsfrist modul 6');
 
 SELECT * FROM Kalender;

CREATE TABLE Forum (
Innlegg_ID INT NOT NULL,
Skrevet_av VARCHAR (50) NOT NULL,
Innlegg VARCHAR(50) NOT NULL,

CONSTRAINT Forum_pk PRIMARY KEY (Innlegg_ID),
CONSTRAINT Kalender_fk FOREIGN KEY (Kalender_ID)  REFERENCES Kalender (Kalender_ID)
  
);

INSERT INTO Forum (Innlegg_ID, Skrevet_av, Innlegg)

VALUES
( 27,'Jonas Omdal','Trenger hjelp med modul 5'),
( 96,'Brage Fosso', 'Skjønner ikke for loop, kan noen hjelpe?');


 SELECT * FROM Forum;



CREATE TABLE Filvedlegg (
  Fil_ID INT NOT NULL,
  Filtype VARCHAR(30) NOT NULL,
  Navn VARCHAR(20) NOT NULL,
  
  CONSTRAINT Filvedlegg_pk PRIMARY KEY (Fil_ID),
  UNIQUE KEY Fil_ID_u (Fil_ID)
);

INSERT INTO Filvedlegg (Fil_ID, Filtype, Navn)

VALUES 
(132, 'JPEG', 'uia logo'),
(432, 'PDF', 'Modul3');

 SELECT * FROM Filvedlegg;

CREATE TABLE Lærer (
Lærer_ID INT NOT NULL,
Tittel VARCHAR(40) NOT NULL,
Hjelpelærer VARCHAR(40) NOT NULL,

CONSTRAINT Lærer_pk PRIMARY KEY (Lærer_ID), 
CONSTRAINT varsel_fk FOREIGN KEY (varsel_id) REFERENCES varsel (varsel_id),
CONSTRAINT Filvedlegg_fk FOREIGN KEY (Fil_ID) REFERENCES Filvedlegg (Fil_ID),
CONSTRAINT Forum_fk FOREIGN KEY (Innlegg_ID) REFERENCES Forum (Innlegg_ID)
 );

INSERT INTO Lærer (Lærer_ID, Tittel, Hjelpelærer)

VALUES
 (394, 'Devinder', 'Martin');

 SELECT * FROM Lærer;


CREATE TABLE Innlevering (
Innlevering_ID INT NOT NULL,
Levert_av VARCHAR(50) NOT NULL,
Modul INT NOT NULL,
Filvedlegg VARCHAR(40) NOT NULL,
Dato date NOT NULL,
Tilbakemelding VARCHAR(40) NOT NULL,

CONSTRAINT Innlevering_pk PRIMARY KEY  (Innlevering_ID),
CONSTRAINT Filvedlegg_fk FOREIGN KEY  (Fil_ID) references  Filvedlegg (Fil_ID),
CONSTRAINT Student_fk FOREIGN KEY  (Student_ID) references  Student (Student_ID)
CONSTRAINT Modul_fk FOREIGN KEY  (Modul_ID) references  Modul (Modul_ID)
  -- primary key (Innlevering_ID)
  -- foreign key (Fil_ID)
  -- foreign key (Student_ID)
 --  foreign key (Modul_ID)
 );


CREATE TABLE Brukerinnstillinger (
Innstillinger_ID int,
Varsler varchar(40),
Bruker varchar(40),

CONSTRAINT Brukerinnstillinger_pk PRIMARY KEY (Innstillinger_ID),
CONSTRAINT Bruker_fk FOREIGN KEY (Bruker_ID) REFERENCES Innlevering (Bruker_ID)
);

INSERT INTO Brukerinnstillinger ( Innstillnger_ID, Varsler, Bruker)

VALUES 
(278, 'på', 1);

-- SELECT * FROM Brukerinnstillinger; 

CREATE TABLE Modul (
Modul_ID INT NOT NULL,
Beskrivelse VARCHAR(40) NOT NULL,
Læringsmål VARCHAR(50) NOT NULL,
Ressurser VARCHAR(50) NOT NULL,

CONSTRAINT Modul_pk PRIMARY KEY (Modul_ID)
);

INSERT INTO Modul (Modul_ID, Beskrivelse, Læringsmål, Ressurser)

VALUES
(1, 'Bluej', 'Bruke Bluej', 'Læreboka kap1');

SELECT * FROM Modul; 

CREATE TABLE Logg (
 Logg_ID INT NOT NULL,
 Innhold VARCHAR(50) NOT NULL,
Uke_nummer INT NOT NULL,

CONSTRAINT Logg_pk PRIMARY KEY(Logg_ID),
CONSTRAINT Modul_fk FOREIGN KEY (Modul_ID) REFERENCES Modul (Modul_ID)
);

INSERT INTO Logg (Logg_ID, Innhold, Uke_nummer)

VALUES
(4849, 'Jeg har begynt å programmere i IS109, det gikk ganske bra', 44);

SELECT * FROM Logg;