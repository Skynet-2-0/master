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
(432, 'PDF', 'Modul3'),
(150, 'PDF', 'Modul2'),
(151, 'PFD', 'Modul3'),
(158, 'Jar', 'Modul4');


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
CREATE TABLE Ressurs (
Ressurs_ID INT NOT NULL,
Navn VARCHAR(20),

CONSTRAINT ressurs_pk PRIMARY KEY (ressurs_id)
);

INSERT INTO Ressurs (Ressurs_ID, Navn)
VALUES
(1, 'Læreboka kap1'),
(2, 'www.Hackerschool.com'),
(3, 'Læreboka kap2'),
(4, 'www.HowToGeek.com'),
(5, 'Læreboka kap3'),
(6, 'www.youtube.com/java'),
(7, 'Læreboka kap4'),
(8, 'www.hackertyper.com'),
(9, 'Læreboka kap5'),
(10, 'www.codeacedmy.com');
-- --------------------------------------------------
CREATE TABLE tasks (
Task_ID INT NOT NULL, 
Antall_oppgavespørsmål INT NOT NULL,

CONSTRAINT Tests_pk PRIMARY KEY (Task_ID)
);

INSERT INTO tasks (Task_ID, Antall_oppgavespørsmål)

VALUES 
(1, 10),
(2, 11),
(3, 15), 
(4, 5),
(5, 7);

-- ------------------------------------------------------------------

CREATE TABLE Modul (
Modul_ID INT NOT NULL,
Beskrivelse VARCHAR(40) NOT NULL,
Læringsmål VARCHAR(50) NOT NULL,
Task_ID INT NOT NULL,

CONSTRAINT Modul_pk PRIMARY KEY (Modul_ID),
CONSTRAINT task_fk FOREIGN KEY (Task_ID) references tasks (Task_ID)
);

INSERT INTO Modul (Modul_ID, Beskrivelse, Læringsmål, Task_ID)

VALUES
(1, 'Bluej', 'Bruke Bluej og programmere', 1),
(2, 'Kode', 'Programere i Java', 1),
(3, 'Hacke Skynet konkurrenter', 'Bli en hacker', 2),
(4, 'Hacke uten å bli tatt', 'Hvordan man holder seg unna fengsel', 3),
(5, 'grunnleggende koding', 'Koding basics', 4),
(6, 'viderekommen koding', 'Koding med loops', 4),
(7, 'teste klasser', 'bugs og testerprogrammere', 5),
(8, 'planlegge prosjekter', 'planlegging', 5);

CREATE TABLE ReMo (
Modul_ID INT NOT NULL,
Ressurs_ID INT NOT NULL,


CONSTRAINT modul_fk6 FOREIGN KEY (Modul_ID) references Modul (Modul_ID),
CONSTRAINT ressurs_fk FOREIGN KEY (Ressurs_ID) references Ressurs (Ressurs_ID),
CONSTRAINT remo_pk PRIMARY KEY (Modul_ID, Ressurs_ID)
);

INSERT INTO ReMo (Modul_ID, Ressurs_ID)

VALUES 
(1,1),
(1,2),
(1,3),
(2,4),
(2,3),
(2,7),
(3,3),
(3,5),
(4,1),
(5,3),
(5,6),
(6,9),
(7,1),
(7,6),
(8,8),
(8,10);



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
Antall_kommentarer VARCHAR(30),

CONSTRAINT Innlevering_pk PRIMARY KEY (Innlevering_ID),
CONSTRAINT Filvedlegg2_fk FOREIGN KEY (Fil_ID) references Filvedlegg (Fil_ID),
CONSTRAINT Student_fk FOREIGN KEY (Student_ID) references Student (Student_ID),
CONSTRAINT Modul_fk FOREIGN KEY (Modul_ID) references Modul (Modul_ID)
 );

INSERT INTO Innlevering (Innlevering_ID, Levert_av, Filvedlegg, Dato, Fil_ID, Student_ID, Modul_ID, Antall_kommentarer)

VALUES
 (322, 'Jonas Omdal', 'PDF', 1210, 132, 4, 1, 'n'),
 (578, 'Brage Fosso', 'PDF', 1410, 432, 5, 1, 'e'),
 (420, 'Brage Fosso', 'PDF', 2010, 150, 5, 2, 'v'),
 (666, 'Jonas Omdal', 'PDF', 2310, 151, 4, 2, 'e'),
 (111, 'Brage Fosso', 'Jar', 2510, 158, 5, 3, 'r'),
 (112, 'Jonas Omdal', 'Jar', 2510, 158, 4, 3, 'g'),
 (113, 'Jonas Omdal', 'Jar', 2510, 158, 4, 4, 'o'),
 (114, 'Brage Fosso', '.SQL', 2510, 158, 5, 4, 'n'),
 (115, 'Brage Fosso', '.SQL', 2510, 158, 5, 5, 'n'),
 (116, 'Jonas Omdal', '.SQL', 2510, 158, 4, 5, 'a'),
 (117, 'Brage Fosso', 'Jar', 2510, 158, 5, 6, 'g'),
 (118, 'Brage Fosso', '.SQL', 2510, 158, 5, 7, 'i'),
 (119, 'Jonas Omdal', '.SQL', 2510, 158, 4, 7, 'v'),
 (120, 'Jonas Omdal', 'Jar', 2510, 158, 4, 7, 'e'),
 (121, 'Jonas Omdal', 'Jar', 2510, 158, 4, 8, 'e'),
 (122, 'Jonas Omdal', 'Jar', 2510, 158, 4, 8, 'y'),
 (123, 'Jonas Omdal', 'Jar', 2510, 158, 4, 8, 'o'),
 (124, 'Jonas Omdal', 'test', 2510, 158, 4, 8, 'u'),
 (125, 'Jonas Omdal', 'Jar', 2510, 158, 4, 8, 'u'),
 (126, 'Jonas Omdal', 'Jar', 2510, 158, 4, 8, 'p');
 
-- SELECT * FROM Innlevering;  
-- ----------------------------------------------------------------------------------------------------------------

CREATE TABLE tests (
Test_ID INT NOT NULL, 
Antall_Spørsmål INT NOT NULL,

CONSTRAINT Tests_pk PRIMARY KEY (Test_ID)
);

INSERT INTO tests (Test_ID, Antall_Spørsmål)

VALUES 
(1, 10),
(2, 11),
(3, 15), 
(4, 5),
(5, 7);

-- SELECT * FROM tests; --


CREATE TABLE testresults (
Result_ID INT NOT NULL,
Karakter VARCHAR(1),
Fullført_Av VARCHAR(50),
Test_ID INT NOT NULL,
Student_ID INT NOT NULL,
 

CONSTRAINT Testresults_pk PRIMARY KEY (Result_ID),
CONSTRAINT Tests_fk FOREIGN KEY (Test_ID) references Tests (Test_ID),
CONSTRAINT Student6_fk FOREIGN KEY (Student_ID) references Student (Student_ID)
);

INSERT INTO testresults (Result_ID, Karakter, Fullført_Av, Test_ID, Student_ID)

VALUES 

(1, 'B', 'Jonas Omdal', 1, 4),
(2, 'A', 'Brage Fosso', 1, 5),
(3, 'B', 'Jonas Omdal', 2, 4),
(4, 'A', 'Brage Fosso', 2, 5);

-- SELECT * FROM testresults; --



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

-- Deliverable 4 --

-- 1)--

CREATE VIEW userModulesInfo AS 
SELECT Innlevering.Modul_ID, Innlevering.Levert_av
FROM Innlevering, Modul
WHERE Innlevering.Modul_ID = Modul.Modul_ID;

SELECT COUNT(Modul_ID), Levert_av
FROM userModulesInfo
GROUP BY Levert_av
ORDER BY COUNT(Modul_ID) DESC;

-- 2) --


SELECT Modul.Modul_ID AS moduleID_WithNoHandIns
FROM Modul
WHERE NOT EXISTS (Select 1 FROM innlevering WHERE Modul.Modul_ID=Innlevering.Modul_ID);

-- 3) --

SELECT Testresults.Test_ID, Testresults.Karakter, Student.Student_ID, Tests.Antall_Spørsmål
FROM Testresults, Student, Tests
WHERE Testresults.Test_ID = Tests.Test_ID
AND Student.Student_ID = Testresults.Student_ID;

-- 4) --

SELECT *
FROM Bruker
WHERE LOCATE ('@gmail.com',Epost);

-- 5) --

SELECT COUNT(innlevering.antall_kommentarer), modul.Modul_ID
FROM modul, innlevering
WHERE modul.Modul_ID = innlevering.modul_id 
GROUP BY Modul_ID
ORDER BY COUNT(innlevering.antall_kommentarer) DESC;

-- 6) --


SELECT COUNT(innlevering.antall_kommentarer), modul.Modul_ID
FROM modul, innlevering
WHERE modul.Modul_ID = innlevering.modul_id
GROUP BY Modul_ID DESC
HAVING COUNT(innlevering.antall_kommentarer) >=3;



--  7)
SELECT *
FROM modul, tasks
WHERE LOCATE ('program', modul.Læringsmål)
AND modul.Task_ID = Tasks.Task_ID;


-- 8) --

create view hjelp as
select count(innlevering.modul_id)
from innlevering
where innlevering.student_id=5;

select * from hjelp;
-- Her ser vi at student med id 5 bruker 7 ressurser

select count(remo.modul_id) as count from remo
GROUP BY remo.modul_id
UNION ALL
SELECT count(remo.modul_id)
from remo;
-- Her ser vi at summen av modulressurser er 16

-- 16/7 = x
SELECT count(remo.Modul_ID)/7
from remo




















