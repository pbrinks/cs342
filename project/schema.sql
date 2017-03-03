
create table Department (
	code varchar(4) PRIMARY KEY,
	fullName varchar(50)
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
	description varchar(100),
	capacity integer,
	FOREIGN KEY (dept) REFERENCES Department(code) ON DELETE SET NULL,
	FOREIGN KEY (professorID) REFERENCES Professor(id) ON DELETE SET NULL
	);

create table Professor (
	id integer PRIMARY KEY,
	firstName varchar(20),
	lastName varchar(20),
	dept varchar(4),
	FOREIGN KEY (dept) REFERENCES Department(code) ON DELETE SET NULL
	);
	
create table Participant (
	id integer,
	firstName varchar(20),
	lastName varchar(20),
	birthDate date,
	major varchar(4),
	grade varchar(9) CHECK (grade in ('Freshman', 'Sophomore', 'Junior', 	'Senior', 'Other')),
	FOREIGN KEY (major) REFERENCES Department(code) ON DELETE SET NULL
	);
	
create table ProgramParticipant (
	programID integer,
	participantID integer,
	PRIMARY KEY (programID, participantID),
	FOREIGN KEY (programID) REFERENCES Program(id) ON DELETE CASCADE,
	FOREIGN KEY (participantID) REFERENCES Participant(id) ON DELETE CASCADE
	);
	
create table Review (
	id integer PRIMARY KEY,
	text varchar(200),
	rating integer CHECK (rating <= 5)
	);
	
create table Trip (
	id integer PRIMARY KEY,
	name varchar(50),
	location varchar(50),
	timeLength varchar(50),
	totalCost float,
	description varchar(100),
	);
	
create table Attraction (
	id integer PRIMARY KEY,
	city varchar(20),
	timeLength varchar(50),
	cost float
	);
	
create table TripAttraction (
	tripID integer,
	attractionID integer,
	PRIMARY KEY (tripID, attractionID),
	FOREIGN KEY (tripID) REFERENCES Trip(id) ON DELETE SET NULL,
	FOREIGN KEY (attractionID) REFERENCES Attraction(id) ON DELETE SET NULL
	);
	

	
