CREATE PROCEDURE `create_feedback` (IN status VARCHAR(30), comment_open VARCHAR(300), 
comment_closed VARCHAR(300), score int, module int, user_account_id int)
BEGIN

insert into feedback (status, comment_open, comment_closed, score, module_id, user_account_id) values (status, comment_open, comment_closed, score, module_id, user_account_id);

select user_account_id from user_Account a where a.name=name; 

END
