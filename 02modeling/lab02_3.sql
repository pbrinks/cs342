-- Paige Brinks
-- cs 342
-- Lab/Homework 02
-- 02/15/2017
DROP SEQUENCE MovieSequence;

CREATE SEQUENCE MovieSequence
START WITH 3
INCREMENT BY 1;

INSERT INTO Movie VALUES (MovieSequence.nextVal, 'Harry Potter', 2001, 8.7);
INSERT INTO Movie VALUES (MovieSequence.nextVal, 'The Hunger Games', 2009, 9.1);
INSERT INTO Movie VALUES (MovieSequence.nextVal, 'Big Hero 6', 2015, 8.5);

-- a. Would you need an additional sequence for the performer relation primary key values? Why or why not?
-- INSERT INTO Performer VALUES (MovieSequence.nextVal,'Emma Stone');
-- Although the prior line technically works, yes you would want a new sequence for the performer relation primary key values, because the sequence increments by one each time and it doesn't matter what table you use that on. So if I enter in three new movies and then a performer and then another movie my Movie primary keys would go 3, 4, 5, 7, and the Performer primary key would be 6. Therefore, using the same sequence on multiple tables would create gaps in the primary keys of both tables and could potentially try and create a record with a key that already exists for one tables, if the sequence was set up for a specific table and used for another one. 

-- b. Do you see any problems with using sequences in a DDL command file to construct the full movies database?
-- Yes, there could be a couple. If you use a sequence and then rollback your INSERT, the sequence does not rollback, leaving potential gaps in your primary keys. It coukd also be a problem if a record in inserted somewhere without using the sequence, then the sequence would try and create a record with that primary key and it would throw an error.
