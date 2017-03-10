-- Paige Brinks
-- cs 342
-- lab 6 part 2
-- 03/10/2017

-- exercise 6.2

-- a.
select TRUNC(avg(months_between(sysdate, Person.birthdate) / 12)) AS age from Person;
-- as a default the whole thing is one group; it is taking everyone in the table and computing their average. We could use group by to split it up and find the average of different groups. For example, group by gender.

-- b.
select hh.ID, count(*) as family_size from HouseHold hh, Person p
where p.householdID = hh.ID
group by hh.id
having count(*) >= 2;

-- c.
select hh.ID, count(*) as family_size, hh.phoneNumber from HouseHold hh, Person p
where p.householdID = hh.ID
group by hh.id, hh.phoneNumber
having count(*) >= 2;
