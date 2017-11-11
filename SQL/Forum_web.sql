
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
PRIMARY KEY (QuestionID)
);

CREATE TABLE reply (
ReplyID int(5) unsigned zerofill NOT NULL auto_increment,
QuestionID int(5) unsigned zerofill NOT NULL,
CreateDate datetime NOT NULL,
Details text NOT NULL,
Name varchar(50) NOT NULL,
PRIMARY KEY (replyID)
);

select replyid from reply


  
  