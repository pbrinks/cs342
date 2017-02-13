-- Paige Brinks
-- cs 342
-- Lab 02
-- 02/10/2017

-- a.

DROP TABLE Movie;

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

INSERT INTO Movie VALUES (1,'Star Wars',1977,NULL,500); -- success
INSERT INTO Movie VALUES (1,'Star Wars',1977,8.9, 500);	-- error
INSERT INTO Movie VALUES (2,'Blade Runner',1982,8.6, 1001);	-- success
INSERT INTO Movie VALUES (1,'Star Wars',1977,NULL,2045);	-- error


-- the constraint is:
-- CHECK (score IS NULL OR vote_count > 1000)

-- b. this would be useful when you want to rollback the constraint later, as opposed to needing to edit the schema and recreate the entire table. This would also be useful if you only want the constraint to be true in certain cases