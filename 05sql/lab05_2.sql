-- Paige Brinks
-- cs 342
-- lab 05 part 2
-- 03/02/2017

-- Exercise 5.2
-- a.
SELECT * FROM (SELECT * FROM Person WHERE birthdate IS NOT NULL 
	ORDER BY birthdate desc)
WHERE ROWNUM  = 1;
-- not correlated

-- b.
select id, firstName || ' ' || lastName from Person p1
where exists (select * from Person p2
	where p2.firstName = p1.firstName
	and p2.id <> p1.id);	
-- this query does not return multiple records of the same person as opposed to using a JOIN which would repeat answers because each person with the same name would pair up with each other person
-- correlated
	
-- c.
select p1.firstName || ' ' || p1.lastName from Person p1
where p1.homegroupID <> (select id from Homegroup
	where name = 'Byl')
INTERSECT
select p2.firstName || ' ' || p2.lastName from Person p2
where exists (select * from PersonTeam pt
	where p2.id = pt.personID 
	and pt.teamName = 'Music');
-- correlated