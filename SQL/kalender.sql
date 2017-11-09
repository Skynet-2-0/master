DROP DATABASE IF EXISTS simpleapp;
CREATE DATABASE simpleapp;
use simpleapp;

create table Kalender(
Kalender_ID INT UNSIGNED NOT NULL,
Dato INT,
Hendelse VARCHAR (100),

CONSTRAINT Kalender_pk primary key(kalender_ID)
);

insert into Kalender (Kalender_ID, Dato, Hendelse)
values(1, 'tom', 201117, 'Eksamen');

SELECT *
FROM Kalender
;
