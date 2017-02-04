-- Paige Brinks
-- CS 342
-- Lab 1
-- 02/03/2017

-- dual is a default table that contains only one column, "DUMMY," with only one record, "X."
-- I found these values by running:
select * from dual;
describe dual;
-- DUMMY is stored in a varchar(1), so when select * from dual; is run. It only shows D as the column name.

-- This can be useful for learning SQL, as a easy beginner table to play around with. 
-- This table can also be useful for selecting a pseudo column, for example:
select 1 from dual;

select 1+1 from dual;

select sysdate from dual;

select user from dual;
