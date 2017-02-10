-- Paige Brinks
-- cs 342
-- Lab 02
-- 02/10/2017


-- a. 
-- i. insert a repeated primary key value 
-- INSERT INTO Movie VALUES (1, 'Harry Potter', 2001, 7.9);
-- This gives the following error: 
-- ORA-00001: unique constraint (PLB7.SYS_C007015) violated
-- This is because you cannot repeat a primary key in order to maintain entity credibility

-- ii. a NULL primary key value
-- INSERT INTO Movie VALUES (NULL, 'Harry Potter', 2001, 7.9);
-- this gives the following error:
-- ORA-01400: cannot insert NULL into ("PLB7"."MOVIE"."ID")
-- this is because NULL cannot be an identifier because NULL essentially means unknown

-- iii. a violation of a CHECK constraint
-- INSERT INTO Movie VALUES (3, 'Harry Potter', 1890, 7.9);
-- this gives the following error: 
-- ORA-02290: check constraint (PLB7.SYS_C007042) violated
-- this is because CHECK makes sure that that field only contains certain values,
-- since I put the year as less than 1900 it through an error

-- iv. a violation of an SQL datatype constraint
-- INSERT INTO Movie VALUES ('abc', 'Harry Potter', 2001, 7.9);
-- this gives the following error:
-- ORA-01722: invalid number
-- this is because I attempted to put a string into an integer field

-- v. a negative score value
-- INSERT INTO Movie VALUES (3, 'Harry Potter', 2001, -7.9);
-- this worked fine because the score is only typed to be a float and 
-- the definition does not say that it needs to be positive

-- b.
-- i. a new record with a NULL value for a foreign key value
-- INSERT INTO Casting VALUES (NULL, 2, 'extra');
-- This did not throw an error because it is not a primary key for this table

-- ii. a foreign key value in a referencing (aka child) table that doesn’t match any key value in the referenced (aka parent) table
-- INSERT INTO Casting VALUES (10, 2, 'extra');
-- This gives the following error:
-- ORA-02291: integrity constraint (PLB7.SYS_C007095) violated - parent key not found
-- This is because we cannot reference a value that does not existing

-- iii. a key value in a referenced table with no related records in the referencing table
-- INSERT INTO Performer VALUES (5,'Will Smith');
-- This does not throw an error because a record does not have to be referenced by bu a child table, but it can be

-- c.
-- i. Delete a referenced record that is referenced by a referencing record.
-- DELETE FROM Movie
-- where id = 1;

-- select * from Casting;

-- This deletes not only the Movie with id 1 in the Movie table, but also every record that references that column in the Casting (child) table

-- ii. Delete a referencing record that references a referenced record.
-- DELETE FROM Casting
-- where MovieId = 1;

-- select * from Movie;
-- This works fine and does not change anything in Movie, only Casting, because a Movie is not required to be referenced in Movie, but Casting requires a Movie to exist to reference it

-- iii. Modify the ID of a movie record that is referenced by a casting record.
-- UPDATE Movie 
-- SET id = 22
-- WHERE year = 1977;
-- this gives the following error:
-- ORA-02292: integrity constraint (PLB7.SYS_C007137) violated - child record found
-- this is because it would destroy the referential integrity

-- Oracle should not support UPDATE CASCADE because it can be dangerous to edit several tables at once without the programmer necessarily knowing how much and what they are editing



