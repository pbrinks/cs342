-- This command file loads an experimental person relation.
-- The data conforms to the following assumptions:
--     * Person IDs and team names are unique for people and teams respectively.
--     * People can have at most one mentor.
--     * People can be on many teams, but only have one role per team.
--     * Teams meet at only one time.
--
-- CS 342
-- Spring, 2017
-- kvlinden
--
-- Paige Brinks
-- lab04 part 1
--
-- 02/24/17

drop table AltPerson;

CREATE TABLE AltPerson (
	personId integer,
	name varchar(10),
	status char(1),
	mentorId integer,
	mentorName varchar(10),
	mentorStatus char(1),
    teamName varchar(10),
    teamRole varchar(10),
    teamTime varchar(10)
	);

INSERT INTO AltPerson VALUES (0, 'Ramez', 'v', 1, 'Shamkant', 'm', 'elders', 'trainee', 'Monday');
INSERT INTO AltPerson VALUES (1, 'Shamkant', 'm', NULL, NULL, NULL, 'elders', 'chair', 'Monday');
INSERT INTO AltPerson VALUES (1, 'Shamkant', 'm', NULL, NULL, NULL, 'executive', 'protem', 'Wednesday');
INSERT INTO AltPerson VALUES (2, 'Jennifer', 'v', 3, 'Jeff', 'm', 'deacons', 'treasurer', 'Tuesday');
INSERT INTO AltPerson VALUES (3, 'Jeff', 'm', NULL, NULL, NULL, 'deacons', 'chair', 'Tuesday');


-- a. this table is not well designed because it is very unclear what an AltPerson actually is, also this schema results in several NULLs in tuples, and there is a lot of redundant information. For example Shamkant's ID, name and status are listed in three different records.
-- Functional dependencies:
-- personID -> name, status, mentorID
-- mentorID -> mentorName, mentorStatus
-- personID, teamName -> teamRole
-- teamName -> teamTime

-- candidate key = superkey you cannot subtract any keys from (minimal primary key)
-- This table is not in BCNF because the functional dependencies do not depend on the candidate key. The candidate key in this case would have to be personID, mentorID, and teamName together. This is shown by my functional dependencies listed above, and also the sample data above shows that (there are multiple records with a personID of 1, so that cannot be a primary key alone, there are multiple records with a mentorID of NULL, so that cannot be a primary key alone key, and there are multiple records with a teamName of elders, so that cannot be a primary key alone). However, none of these dependencies have those three fields together on the left hand side, meaning this table is not well constructed.

-- b. 
-- Person(personID, name, status, mentorID) -- personID is the primary key, mentorID is a foreign key referring back to Person
-- Team(teamID, teamName, teamTime)
-- PersonTeam(personID, teamID, teamRole)