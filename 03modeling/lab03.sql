-- Starter code for lab 3.
--
-- CS 342, Spring, 2017
-- kvlinden

drop table PersonHousehold;
drop table Person;
drop table HouseHold;

create table HouseHold(
	ID integer PRIMARY KEY,
	street varchar(30),
	city varchar(30),
	state varchar(2),
	zipcode char(5),
	phoneNumber char(12)
	);

create table Person (
	ID integer PRIMARY KEY,
	title varchar(4),
	firstName varchar(15),
	lastName varchar(15),
	membershipStatus char(1) CHECK (membershipStatus IN ('m', 'a', 'c')),
	mentorID integer
	);
	
create table PersonHousehold (
	personID integer,
	houseHoldID integer,
	role varchar(20),
	PRIMARY KEY (personID, houseHoldID),
	FOREIGN KEY (personID) REFERENCES Person(id) ON DELETE CASCADE,
	FOREIGN KEY (householdID) REFERENCES HouseHold(id) ON DELETE CASCADE
	);




INSERT INTO Household VALUES (0,'2347 Oxford Dr. SE','Grand Rapids','MI','49506','616-243-5680');
INSERT INTO Household VALUES (1,'123 Burton','Grand Rapids','MI','49546','616-123-4567');
INSERT INTO Household VALUES (2,'456 Woodcliffe','Grand Rapids','MI','49546','616-548-1548');


INSERT INTO Person VALUES (0,'mr.','Keith','VanderLinden','m', 4);
INSERT INTO Person VALUES (1,'ms.','Brenda','VanderLinden','m', 4);
INSERT INTO Person VALUES (2,'ms.','Paige','Brinks','a', 4);
INSERT INTO Person VALUES (3,'ms.','Lydia','Cupery','c', 3);
INSERT INTO Person VALUES (4,'ms.','Beka','Agava','c', 2);

