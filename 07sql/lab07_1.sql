-- Paige Brinks
-- cs 342
-- lab 7 part 1
-- 3/17/2017

create or replace view birthday_czar as
	select firstName || ' ' || lastName as name, 
		TRUNC(MONTHS_BETWEEN(SYSDATE, birthdate)/12) as age,
		birthdate
	from Person;
	
-- a. 
select * from birthday_czar 
where birthdate >= '01-JAN-1961'
and birthdate <= '31-DEC-1975';

-- b.
update Person
set birthdate = '05-MAR-1971'
where ID = 4;

-- The results of the view changed to include the updated person. This is because we created a non-materialized view, which goes through the view and grabs the information back from the original table.

-- c. 
-- insert into birthday_czar values ('Paige Brinks', 22, '07-NOV-1994');
-- This does not work because my view is not key-preserved. In order to make this possible, I would need to select the ID from person as well.
-- I also cannot insert into name unless I seperate firstName and lastName into seperate columns in my view, and I cannot insert into age because I am calculating the age from birthdate. 

-- d.
drop view birthday_czar;
-- This does not affect the base table at all. The view is just pulling values from the table, not affecting anything in the table.