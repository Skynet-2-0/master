DROP DATABASE IF EXISTS test15;
CREATE DATABASE test15;

USE test15;

CREATE TABLE Kalender (
Kalender_ID INT NOT NULL,
Innleveringsfrist INT NOT NULL,
Varsel VARCHAR(30) NOT NULL,

CONSTRAINT Kalender_pk PRIMARY KEY (Kalender_ID)
);

INSERT INTO Kalender (Kalender_ID, Innleveringsfrist, Varsel)

VALUES
 (535, 2110, 'innleveringsfrist modul 6'),
 (536, 1011, 'innlevering modul 7');
 
-- SELECT * FROM Kalender;

-- ------------------------------------------------------

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

-- SELECT * FROM Filvedlegg;
-- ---------------------------------------------------------------------------------
CREATE TABLE Forum (
Innlegg_ID INT NOT NULL,
Skrevet_av VARCHAR (50) NOT NULL,
Innlegg VARCHAR(50) NOT NULL,
Kalender_ID INT NOT NULL,

CONSTRAINT Forum_pk PRIMARY KEY (Innlegg_ID),
CONSTRAINT Kalender_fk FOREIGN KEY (Kalender_ID)  REFERENCES Kalender (Kalender_ID)
  
);

INSERT INTO Forum (Innlegg_ID, Skrevet_av, Innlegg, Kalender_ID)

VALUES
( 27,'Jonas Omdal','Trenger hjelp med modul 5',  535 ),
( 96,'Brage Fosso', 'Skjønner ikke for loop, kan noen hjelpe?' ,  536);


-- SELECT * FROM Forum; 

-- -----------------------------------------------------------

CREATE TABLE Lærer (
Lærer_ID INT,
Tittel VARCHAR(40) NOT NULL,
Hjelpelærer VARCHAR(40) NOT NULL,
Fil_ID INT NOT NULL,
Innlegg_ID INT NOT NULL,

CONSTRAINT Lærer_pk PRIMARY KEY (Lærer_ID),
CONSTRAINT Filvedlegg_fk FOREIGN KEY (Fil_ID) REFERENCES Filvedlegg (Fil_ID),
CONSTRAINT Forum_fk FOREIGN KEY (Innlegg_ID) REFERENCES Forum (Innlegg_ID)
 );

INSERT INTO Lærer (Lærer_ID, Tittel, Hjelpelærer, Fil_ID, Innlegg_ID)

VALUES
(394, 'Devinder', 'Martin', 432, 27),
(395, 'Hans Olav', 'Christian',  132, 96);

-- SELECT * FROM Lærer;
 -- ---------------------------------------------------------------------------------------------------------------
 
 CREATE TABLE Student (
Student_ID INT,
Logg VARCHAR(50) NOT NULL ,
Innlevering VARCHAR (30) NOT NULL,
Innlevering_ID INT,

CONSTRAINT Student_pk PRIMARY KEY (Student_ID)
);

INSERT INTO Student (Student_ID, Logg, Innlevering)

VALUES
(4, 'Innlegg 5', 'modul 5'),
(5, 'Innlegg 4', 'modul 4');


-- SELECT * FROM Student;
-- -----------------------------------------------------------------
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

-- SELECT * FROM Modul; 

-- ---------------------------------------------------------

CREATE TABLE Innlevering (
Innlevering_ID INT NOT NULL,
Levert_av VARCHAR(50) NOT NULL,
Filvedlegg VARCHAR(40) NOT NULL,
Dato INT,
Fil_ID INT,
Student_ID INT,
Modul_ID INT NOT NULL,

CONSTRAINT Innlevering_pk PRIMARY KEY (Innlevering_ID),
CONSTRAINT Filvedlegg2_fk FOREIGN KEY (Fil_ID) references Filvedlegg (Fil_ID),
CONSTRAINT Student_fk FOREIGN KEY (Student_ID) references Student (Student_ID),
CONSTRAINT Modul_fk FOREIGN KEY (Modul_ID) references Modul (Modul_ID)
 );

INSERT INTO Innlevering (Innlevering_ID, Levert_av, Filvedlegg, Dato, Fil_ID, Student_ID, Modul_ID)

VALUES
 (322, 'Jonas Omdal', 'PDF', 1210, 132, 4, 1),
 (578, 'Brage Fosso', 'PDF', 1410, 432, 5, 1);
 
-- SELECT * FROM Innlevering;  
-- ----------------------------------------------------------------------------------------------------------------

CREATE TABLE Bruker (
Bruker_ID INT NOT NULL,
Fornavn VARCHAR(30) NOT NULL,
Etternavn VARCHAR(30) NOT NULL,
Epost VARCHAR(50) NOT NULL,
Brukerinnstillinger VARCHAR(30) NOT NULL,
Student_ID INT,
Lærer_ID INT,

CONSTRAINT Bruker_pk PRIMARY KEY (Bruker_ID),
CONSTRAINT studenten_fk FOREIGN KEY (Student_ID) references Student (Student_ID),
CONSTRAINT læreren_fk FOREIGN KEY (Lærer_ID) references Lærer (Lærer_ID)
);

INSERT INTO Bruker (Bruker_ID, Fornavn, Etternavn, Epost, Brukerinnstillinger, Student_ID, Lærer_ID)

VALUES  
(1, 'Bob', 'Ross', 'bobross@gmail.com', 'på', NULL, 394),
(2,'Hannah', 'Hipster','hahi@hotmail.com', 'av', NULL, 395),
-- (3, 'Josef', 'Alfa', 'josefmann@outlook.com', 'på',  NULL, 3),
(4, 'Jonas', 'Omdal','Jonastestmail@outlook.com', 'av', 4, NULL),
(5, 'Brage', 'Fosso', 'bragetestmail@gmail.com', 'på', 5, NULL);

-- SELECT * FROM Bruker;

-- ----------------------------------------------------------

-- ----------------------------------------------------------------------------------------------------------

CREATE TABLE Varsel (
Varsel_ID INT  auto_increment,
Varsel_for VARCHAR(40) NOT NULL,
til INT(10) NOT NULL,
melding VARCHAR(255) NOT NULL,
Bruker_ID INT,

CONSTRAINT Tilbakemelding_fk FOREIGN KEY (Bruker_ID) REFERENCES Bruker (Bruker_ID),
CONSTRAINT Varsel_pk PRIMARY KEY (Varsel_ID)
);


INSERT INTO Varsel (Varsel_ID, Varsel_for, til, melding, Bruker_ID) 

VALUES
(527, 'modul', 1, 'Modulen er innlevert', 4),
(528, 'modul', 1, 'Modulen er innlevert', 5); 


-- SELECT * FROM Varsel; 
-- ---------------------------------------------------------------

-- -----------------------------------------------------------------------------------------------------------


CREATE TABLE Tilbakemelding (
Tilbakemelding_ID INT,
Godkjent VARCHAR(20) NOT NULL,
Intern_kommentar VARCHAR(60) NOT NULL,
Kommentar VARCHAR(50) NOT NULL,
Bruker_ID INT,
Student_ID INT,
Modul_ID INT NOT NULL,

CONSTRAINT Bruker2_fk FOREIGN KEY (Bruker_ID) REFERENCES Bruker (Bruker_ID),
CONSTRAINT Student2_fk FOREIGN KEY (Student_ID) REFERENCES Student (Student_ID),
CONSTRAINT Modul3_fk FOREIGN KEY  (Modul_ID) references  Modul (Modul_ID),
CONSTRAINT Tilbakemelding2_pk PRIMARY KEY (Tilbakemelding_ID)
);

INSERT INTO Tilbakemelding (Tilbakemelding_ID, Godkjent, Intern_kommentar, Kommentar,Bruker_ID, Student_ID, Modul_ID)

VALUES
(367, 'godkjent', 'må jobbe mer med for loop', 'mye bra', 4, 4, 1),
(368, 'Ikke godkjent' , 'må jobbe mer med hashmap ', ' ikke så bra', 5, 5, 1);

-- SELECT * FROM Tilbakemelding;

-- --------------------------------------------------------------------------

CREATE TABLE Brukerinnstillinger (
Innstillinger_ID int,
Varsler varchar(10),
Bruker_ID INT NOT NULL,
Innlevering_ID INT,

CONSTRAINT Brukerinnstillinger_pk PRIMARY KEY (Innstillinger_ID),
CONSTRAINT Bruker4_fk FOREIGN KEY (Bruker_ID) REFERENCES Bruker (Bruker_ID)
);

INSERT INTO Brukerinnstillinger (Innstillinger_ID, Varsler, Bruker_ID, Innlevering_ID)

VALUES 
(278, 'på', 4, 143);

-- SELECT * FROM Brukerinnstillinger; 

-- -----------------------------------------------------


CREATE TABLE Logg (
Logg_ID INT NOT NULL,
Innhold VARCHAR(70) NOT NULL,
Uke_nummer INT NOT NULL,
Modul_ID INT NOT NULL,
Student_ID INT,

CONSTRAINT Logg_pk PRIMARY KEY(Logg_ID),
CONSTRAINT Modul5_fk FOREIGN KEY (Modul_ID) REFERENCES Modul (Modul_ID),
CONSTRAINT Stud_fk FOREIGN KEY (Student_ID) REFERENCES Student (Student_ID)
);

INSERT INTO Logg (Logg_ID, Innhold, Uke_nummer, Modul_ID, Student_ID)

VALUES
(4849, 'Jeg har begynt å programmere i IS109, det gikk ganske bra', 44, 1, 4);

-- SELECT * FROM Logg;

-- Hvis man vil se alle tabellene individuelt så er det bare å fjerne kommenteringen til SELECT * FROM som er under hver tabell

SELECT Bruker.Fornavn, Bruker.Etternavn, Tilbakemelding.Tilbakemelding_ID, Tilbakemelding.Godkjent, Tilbakemelding.Intern_kommentar
FROM Bruker, Tilbakemelding, Student
WHERE Bruker.Student_ID = Tilbakemelding.Student_ID
AND Student.Student_ID = Tilbakemelding.Student_ID;

SELECT Lærer.Innlegg_ID, Lærer.lærer_ID, Forum.Innlegg, Kalender.Innleveringsfrist
FROM Lærer, Forum, Kalender
WHERE Forum.Innlegg_ID = Lærer.Innlegg_ID
AND Kalender.Kalender_ID = Forum.Kalender_ID;

SELECT Logg.Innhold, logg.Uke_nummer, Bruker.Fornavn, Bruker.Etternavn, Student.Student_ID
FROM Logg, Student, Bruker
WHERE Student.Student_ID = Logg.Student_ID
AND Bruker.Bruker_ID = Student.Student_ID;

SELECT Modul.Modul_ID, Modul.Beskrivelse, Innlevering.Student_ID, Innlevering.Filvedlegg, Varsel.Melding
FROM Innlevering, Modul, Student, Varsel, Bruker
WHERE Modul.Modul_ID = Innlevering.Modul_ID
AND Student.Student_ID = Innlevering.Student_ID
AND Varsel.Bruker_ID = Bruker.Student_ID
AND Student.Student_ID = Bruker.Student_ID;

