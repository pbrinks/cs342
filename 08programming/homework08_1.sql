-- Paige Brinks
-- cs 342
-- homework 8 part 1
-- 4/06/2017


drop trigger shadowLog;
drop sequence shadowSequence;
drop table RankLog;

-- added id to gaurentee unique key
create table RankLog (
	id integer PRIMARY KEY,
	user_id varchar(30),
	date_of_change date,
	original_val number(10,2),
	modified_val number(10,2)
);

create sequence shadowSequence 
	start with 1 
	increment by 1;

-- log all updates to rank
CREATE TRIGGER shadowLog AFTER UPDATE ON Movie FOR each row
BEGIN
	insert into RankLog values (shadowSequence.nextval, user, sysdate, :old.rank, :new.rank);
END;
/

-- update ranks in Movie
update Movie
set rank = 8.3
where id = 256630;

update Movie 
set rank = 2.2
where name = 'Shrek';

update Movie 
set rank = 5.0
where id in (238071, 238072, 238073, 238074, 238075);

select * from RankLog;