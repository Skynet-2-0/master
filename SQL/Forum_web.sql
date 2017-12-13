
use simplewebapp;
DROP TABLE IF EXISTS webboard;
DROP TABLE IF EXISTS reply;


CREATE TABLE webboard(
QuestionID int(5)  unsigned zerofill NOT NULL auto_increment,
CreateDate datetime NOT NULL,
Question varchar(255) NOT NULL,
Details text NOT NULL,
Name varchar(50) NOT NULL,
View int(5) NOT NULL,
Reply int(5) NOT NULL,

CONSTRAINT  webboard_pk primary key (QuestionID)
);

-- Insert Data --

INSERT INTO webboard (QuestionID, CreateDate, Question,  Details, Name, View, Reply)
VALUES(1, ' ', 'How to use jsp and mysql database', '0', 'mette','0', '0');



CREATE TABLE reply (
ReplyID int(5) unsigned zerofill NOT NULL auto_increment,
QuestionID int(5) unsigned zerofill NOT NULL,
CreateDate datetime NOT NULL,
Details text NOT NULL,
Name varchar(50) NOT NULL,

CONSTRAINT  reply_pk primary key (replyID)

);

-- Insert Data --

INSERT INTO reply (ReplyID, QuestionID,  CreateDate, Details, Name)
VALUES(1, 'How to use jsp and mysql database', '','', 'mette');





SELECT * 
FROM webboard
;

SELECT *
FROM reply
;






  
  