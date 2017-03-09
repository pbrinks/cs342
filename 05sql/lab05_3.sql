-- Paige Brinks
-- cs 342
-- Homework 05
-- 03/08/2017

-- a.
select p1.lastName || ', ' || p1.firstName || ' and ' || p2.firstName || ' - ' || hh.phoneNumber || ' - ' || hh.street AS phonebook_entry
from Person p1, Person p2, HouseHold hh
where p1.householdID = p2.householdID
and p1.householdID = hh.ID
and p1.householdRole = 'husband'
and p2.householdRole = 'wife';

-- b. 
select p1.lastName || ', ' || p1.firstName || ' and ' || p2.firstName || ' ' || p2.lastName || ' - ' || hh.phoneNumber || ' - ' || hh.street AS phonebook_entry
from Person p1, Person p2, HouseHold hh
where p1.householdID = p2.householdID
and p1.householdID = hh.ID
and p1.householdRole = 'husband'
and p2.householdRole = 'wife';

-- c.
select p1.lastName || ', ' || p1.firstName || ' and ' || p2.firstName || ' ' || p2.lastName || ' - ' || hh.phoneNumber || ' - ' || hh.street AS phonebook_entry
from Person p1, Person p2, HouseHold hh
where p1.householdID = p2.householdID
and p1.householdID = hh.ID
and p1.householdRole = 'husband'
and p2.householdRole = 'wife'
UNION
select p1.lastName || ', ' || p1.firstName || ' - ' || hh.phoneNumber || ' - ' || hh.street AS phonebook_entry
from person p1, HouseHold hh
where p1.householdRole = 'single' 
and p1.householdID = hh.ID;