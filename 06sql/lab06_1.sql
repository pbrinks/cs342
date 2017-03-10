-- Paige Brinks
-- cs 342
-- lab 6 part 1
-- 03/10/2017

-- Exercise 6.1
-- a.
select t.name, t.mandate, pt.personID from (Team t
LEFT OUTER JOIN PersonTeam pt
ON t.name = pt.teamName
and pt.role = 'chair');

