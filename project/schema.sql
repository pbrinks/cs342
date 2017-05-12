-- StudyAbroad tables
create table SemesterCode(
	semester char(1) PRIMARY KEY
);

create table GradeLevel (
	grade varchar(9) PRIMARY KEY
	);

create table Department (
	code varchar(4) PRIMARY KEY,
	fullName varchar(50)
	);

create table Professor (
	id integer PRIMARY KEY,
	firstName varchar(20),
	lastName varchar(20),
	dept varchar(4),
	FOREIGN KEY (dept) REFERENCES Department(code) ON DELETE SET NULL
	);
		
create table Program (
	id integer PRIMARY KEY,
	dept varchar(4),
	courseNumber integer,
	professorID integer,
	semester char(1) CHECK ( semester IN ('F', 'S', 'I')),
	country varchar(50),
	city varchar(50),
	cost float,
	description varchar(200),
	capacity integer,
	FOREIGN KEY (dept) REFERENCES Department(code) ON DELETE SET NULL,
	FOREIGN KEY (professorID) REFERENCES Professor(id) ON DELETE SET NULL
	);
		
create table Participant (
	id integer PRIMARY KEY,
	firstName varchar(20),
	lastName varchar(20),
	birthDate date,
	major varchar(4),
	grade varchar(9), 
	FOREIGN KEY (major) REFERENCES Department(code) ON DELETE SET NULL,
	FOREIGN KEY (grade) REFERENCES GradeLevel(grade) ON DELETE SET NULL
	);
	
create table Review (
	participantID integer,
	programID integer,
	text varchar(200),
	rating integer CHECK (rating <= 5),
	PRIMARY KEY (participantID, programID),
	FOREIGN KEY (participantID) REFERENCES Participant(id) ON DELETE CASCADE,
	FOREIGN KEY (programID) REFERENCES Program(id) ON DELETE CASCADE
	);
	
create table Trip (
	id integer PRIMARY KEY,
	programID integer,
	location varchar(50),
	timeLength varchar(50),
	totalCost float,
	description varchar(200),
	FOREIGN KEY (programID) REFERENCES Program(id) ON DELETE CASCADE
	);
	
create table Attraction (
	id integer PRIMARY KEY,
	name varchar(50),
	city varchar(20),
	timeLength varchar(50),
	cost float
	);
	
create table TripAttraction (	
	tripID integer,
	attractionID integer,
	visit_date date,
	PRIMARY KEY (tripID, attractionID, visit_date),
	FOREIGN KEY (tripID) REFERENCES Trip(id) ON DELETE CASCADE,
	FOREIGN KEY (attractionID) REFERENCES Attraction(id) ON DELETE CASCADE
	);

-- sequences	
CREATE SEQUENCE professorSequence START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE programSequence START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE participantSequence START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE tripSequence START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE attractionSequence START WITH 1 INCREMENT BY 1;
