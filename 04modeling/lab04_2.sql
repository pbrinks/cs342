-- This command file loads an experimental person database.
-- The data conforms to the following assumptions:
--     * People can have 0 or many team assignments.
--     * People can have 0 or many visit dates.
--     * Teams and visits don't affect one another.
--
-- CS 342, Spring, 2017
-- kvlinden
--
-- Paige Brinks
-- lab04 part 2
--
-- 02/24/17

DROP TABLE PersonTeam;
DROP TABLE PersonVisit;

CREATE TABLE PersonTeam (
	personName varchar(10),
    teamName varchar(10)
	);

CREATE TABLE PersonVisit (
	personName varchar(10),
    personVisit date
	);

-- Load records for two team memberships and two visits for Shamkant.
INSERT INTO PersonTeam VALUES ('Shamkant', 'elders');
INSERT INTO PersonTeam VALUES ('Shamkant', 'executive');
INSERT INTO PersonVisit VALUES ('Shamkant', '22-FEB-2015');
INSERT INTO PersonVisit VALUES ('Shamkant', '1-MAR-2015');

-- Query a combined "view" of the data of the form View(name, team, visit).
SELECT pt.personName, pt.teamName, pv.personVisit
FROM PersonTeam pt, PersonVisit pv
WHERE pt.personName = pv.personName;

-- a.
-- These are both all key relations and therefore have no functional dependencies. This means both tables are technically in BCNF. 
-- personName ->> teamName
-- personName ->> personVisit
-- This is in 4NF because these are both trivial MVDs

-- b.
-- This view creates the nontrivial dependency:
-- personName ->> teamName | personVisit
-- This would not be in 4NF because personName is not a superkey
-- This is still in BCNF because there are still no functional dependencies

-- c.
-- The first schema is better because it is in 4NF. This schema has less repeated data, because it only requires each teamName and personVisit to be recorded once for each name. As opposed to if the two tables were combined, then we would need the following records:
-- Shamkkant, elders, '22-FEB-2015'
-- Shamkkant, executive, '22-FEB-2015'
-- Shamkkant, elders, '1-MAR-2015'
-- Shamkkant, executive, '1-MAR-2015'
-- This repeats a lot of information.
