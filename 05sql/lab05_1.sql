-- Paige Brinks
-- cs 342
-- lab 05 part 1
-- 03/02/2017

-- 5.1
-- a.
select * from Household, HomeGroup;
-- this query returns 24 rows because it there are 8 records in the Household table and 3 records in the Homegroup table. The query is returning the cross product of both these tables. 8*3 = 24

-- b.
select * from Person
where birthdate IS NOT NULL
order by to_char(birthdate, 'DDD');