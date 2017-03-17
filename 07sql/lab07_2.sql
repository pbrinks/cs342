-- Paige Brinks
-- cs 342
-- lab 7 part 2
-- 3/17/2017



create MATERIALIZED view birthday_czar2 AS
	select firstName || ' ' || lastName as name,
		TRUNC(MONTHS_BETWEEN(SYSDATE, birthdate)/12) as age,
		birthdate
	from Person;

--a. 
select * from birthday_czar2 
where birthdate >= '01-JAN-1961'
and birthdate <= '31-DEC-1975';

-- b.
update Person
set birthdate = '21-OCT-1968'
where ID = 7;
-- the results of the materialized view are not updated to include this updated Person. This is because a materialized view is just a "snapshot" of the table when we created the view - materialized views make an actual copy of what the table looked like when we created the view and any queries we run on it will select from that copy. Therefore if we update the originial table, the materialized view will not be updated as well.

-- c.
-- insert into birthday_czar2 values ('Paige Brinks', 22, '07-NOV-1994');
-- throws error: data manipulation operation not legal on this view
-- cannot insert into the materialized view because unless you create your view using 'FOR UPDATE AS' instead of just 'AS' like we did, then the view is read-only. Inserting into this view would make it so that it is no longer a reliable copy of the original table.

insert into birthday_czar2 values ('asdfadf afsafda', 22, '07-NOV-1994');

-- d. 
drop MATERIALIZED view birthday_czar2;
-- this does not make any changes to the original table