-- Lab 3
--
-- CS 342, 
-- 02/17/2017
-- Paige Brinks
--
-- See cpdb-partial.pdf for ERD


drop table Request;
drop table PersonTeam;
drop table Team;
drop table Person;
drop table HouseHold;
drop table Homegroup;

-- create tables
create table HouseHold(
	ID integer PRIMARY KEY,
	street varchar(30),
	city varchar(30),
	state varchar(2),
	zipcode char(5),
	phoneNumber char(12)
	);
	
create table Homegroup (
	ID integer PRIMARY KEY,
	name varchar(30),
	meetingPlace varchar(30),
	meetingTime varchar(5),
	meetingDay varchar(10) CHECK (meetingDay IN ('Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday')),
	description varchar(100)
	);

create table Team (
	ID integer PRIMARY KEY,
	name varchar(30),
	meetingPlace varchar(30),
	meetingTime varchar(5),
	meetingDay varchar(10) CHECK (meetingDay IN ('Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday')),
	mandate varchar(50)
	);
	
create table Person (
	ID integer PRIMARY KEY,
	title varchar(4),
	firstName varchar(15),
	lastName varchar(15),
	membershipStatus char(1) CHECK (membershipStatus IN ('m', 'a', 'c')),
	householdID integer,
	mentorID integer,
	homegroupID integer,
	role varchar(20) CHECK (role IN ('parent', 'child', 'single', 'student')),
	FOREIGN KEY (houseHoldID) REFERENCES HouseHold(ID) ON DELETE SET NULL,
	FOREIGN KEY (mentorID) REFERENCES Person(ID) ON DELETE SET NULL,
	FOREIGN KEY (homegroupID) REFERENCES Homegroup(ID) ON DELETE SET NULL
	);

create table PersonTeam (
	personID integer,
	teamID integer,
	role varchar(30),
	PRIMARY KEY (personID, teamID),
	FOREIGN KEY (personID) REFERENCES Person(ID) ON DELETE SET NULL,
	FOREIGN KEY (teamID) REFERENCES Team(ID) ON DELETE SET NULL
	);

create table Request (
	requestor integer,
	responder integer,
	submitDate date,
	text varchar(100),
	accessCode char,
	response varchar(100),
	PRIMARY KEY (requestor, responder, submitDate),
	FOREIGN KEY (requestor) REFERENCES HouseHold(ID) ON DELETE SET NULL,
	FOREIGN KEY (responder) REFERENCES Person(ID) ON DELETE SET NULL
	);

-- fill tables with sample data
INSERT INTO Homegroup VALUES (0, 'Womens Bible Study', 'Chapel', '15:00', 'Monday', 'Women get together to read the book of Ruth');
INSERT INTO Homegroup VALUES (1, 'Youth Group', 'Youth Room', '19:00', 'Wednesday', 'Middle and high school students get together and have fun!');
INSERT INTO Homegroup VALUES (2, 'Mens Bible Study', 'Chapel', '15:00', 'Monday', 'Men get together to read the book of Job');
	
INSERT INTO Team VALUES (0, 'Praise Team', 'Sanctuary', '7:00', 'Sunday', 'Plan praise songs for service.');
INSERT INTO Team VALUES (1, 'Deacons', 'Office 121', '13:00', 'Sunday', 'Collection');


INSERT INTO Household VALUES (0,'2347 Oxford Dr. SE','Grand Rapids','MI','49506','616-243-5680');
INSERT INTO Household VALUES (1,'123 Burton','Grand Rapids','MI','49546','616-123-4567');
INSERT INTO Household VALUES (2,'456 Woodcliffe','Grand Rapids','MI','49546','616-548-1548');


INSERT INTO Person VALUES (0,'mr.','Keith','VanderLinden','m', 0, NULL, 2, 'parent');
INSERT INTO Person VALUES (1,'ms.','Brenda','VanderLinden','m', 0, NULL, 0, 'parent');
INSERT INTO Person VALUES (2,'ms.','Paige','Brinks','m', 2, 1, NULL, 'student');
INSERT INTO Person VALUES (3,'ms.','Lydia','Cupery','m', 2, 2, 1, 'single');
INSERT INTO Person VALUES (4,'ms.','Beka','Agava','m', 1, 3, 1, 'student');

INSERT INTO PersonTeam VALUES (0, 1, 'secretary');
INSERT INTO PersonTeam VALUES (1, 0, 'member');
INSERT INTO PersonTeam VALUES (2, 0, 'treasurer');
INSERT INTO PersonTeam VALUES (3, 0, 'member');

INSERT INTO Request VALUES (0, 3, '01-FEB-2017', 'My dog is sick.', 'a', 'I will pray for your dog');
INSERT INTO Request VALUES (1, 1, '15-FEB-2017', 'Im sick', 'b', NULL);


