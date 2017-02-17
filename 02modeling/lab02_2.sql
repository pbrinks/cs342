-- Paige Brinks
-- cs 342
-- Lab 02
-- 02/10/2017

-- Exercise 2.2
-- a.

DROP TABLE Casting;
DROP TABLE Movie;
DROP TABLE StatusType;
DROP TABLE Performer;


CREATE TABLE Movie (
	id integer,
	title varchar(70) NOT NULL, 
	year decimal(4), 
	score float,
	vote_count int,
	PRIMARY KEY (id),
	CHECK (year > 1900),
	CHECK (score IS NULL OR vote_count > 1000)
);


-- success
INSERT INTO Movie VALUES (1,'Star Wars',1977,NULL,500); 
-- error
-- INSERT INTO Movie VALUES (1,'Star Wars',1977,8.9, 500);	
-- success
INSERT INTO Movie VALUES (2,'Blade Runner',1982,8.6, 1001);	
-- error
-- INSERT INTO Movie VALUES (1,'Star Wars',1977,NULL,2045);	


-- the constraint is:
-- CHECK (score IS NULL OR vote_count > 1000)

-- b. this would be useful when you want to rollback the constraint later, as opposed to needing to edit the schema and recreate the entire table. This would also be useful if you only want the constraint to be true in certain cases

-- Exercise 2.3
CREATE TABLE Performer (
	id integer,
	name varchar(35),
	PRIMARY KEY (id)
	);
	
CREATE TABLE StatusType (
	id integer,
	name varchar(20),
	PRIMARY KEY (id)
	);
	
CREATE TABLE Casting (
	movieId integer,
	performerId integer,
	status integer,
	FOREIGN KEY (movieId) REFERENCES Movie(Id) ON DELETE CASCADE,
	FOREIGN KEY (performerId) REFERENCES Performer(Id) ON DELETE SET NULL,
	FOREIGN KEY (status) REFERENCES StatusType(Id) ON DELETE SET NULL
	);


INSERT INTO Performer VALUES (1,'Harrison Ford');
INSERT INTO Performer VALUES (2,'Rutger Hauer');
INSERT INTO Performer VALUES (3,'The Mighty Chewbacca');
INSERT INTO Performer VALUES (4,'Rachael');

INSERT INTO StatusType VALUES (1, 'star');
INSERT INTO StatusType VALUES (2, 'costar');
INSERT INTO StatusType VALUES (3, 'extra');

INSERT INTO Casting VALUES (1,1,1);
INSERT INTO Casting VALUES (1,3,3);
INSERT INTO Casting VALUES (2,1,1);
INSERT INTO Casting VALUES (2,2,2);
INSERT INTO Casting VALUES (2,4,2);

-- instead of have the CHECK constraint in the Casting table I created a new table named StatusType that acts as a foreign key to the status field in Casting. This is beneficial because now if I would ever want to remove or add a status I can simple add that to the StatysType table instead of having to modify the Casting definition (meaning I would have to recreate the entire table).




