-- Paige Brinks
-- cs 342
-- guide 07
-- 3/12/2017

-- As in the last unit, work through the following materials writing one sample query for each mechanism using the modified version of the movies database (see code/07sql/guide07.sql).

-- 1. Views (Section 7.3, for Monday)
-- a.	Write a simple view specification. For details on Oracle views, see Managing Views.
-- A view is a logical representation of another table or combination of tables
CREATE VIEW Movie_Detail
AS SELECT m.name, m.year, d.firstName || ' ' || d.lastName AS Director, mg.genre
FROM Movie m, MovieDirector md, MovieGenre mg, Director d, MovieDirector md
WHERE m.id = mg.movieID
AND m.id = md.movieID
AND md.directorID = d.id;

-- b.	Define the following terms (in the comments of your SQL command file).

--		i.	Base Tables
		--	The tables from which a view is based adn derives its data from.
-- 		ii.	Join Views
		--	A view that specifies more than one base table or view in the FROM clause.
-- 		iii. Updateable Join Views
		--	A join view where UPDATE, INSERT, and DELETE operations are allowed.
--		iv.	Key-Preserved Tables
		--	A table is key-preserved if every key of the table can also be a key of the result of the join. So, every key-preserved table has its keys preserved through a join.
--		v.	Views that are implemented via query modification vs materialization. (For details on Oracle materialization, see Materialized View Concepts and Architecture, focusing on the “What is a Materialized View?” and “Why Use Materialized Views” sections.)
		-- Query modification is the modification by a search of a previous query.
		-- A materialized view is a replica or target master from a single point in time. The master can be either a master table at a master site or a master materialized view at a materialized view site.
		-- materialized views are used for: easing network loads, creating a mass deployment environment, enabling data subsetting, enabling disconnected computing



-- 2. Formal languages for the relational model (Chapter 8, for Wednesday)

-- a.	Relational Algebra (read Sections 8.1–8.3 & 8.5) — Write a simple query on the movies database using SELECT (σcondition), PROJECT (πfieldlist), RENAME (ρnewName) and JOIN (⋈condition) (see example queries 1 & 2 in Section 8.5).

-- b.	Tuple Relational Calculus (read Sections 8.6.1–8.6.3 & 8.6.8) — Write a simple query on the movies database using the tuple relational calculus queries (see example queries 0 & 1 in Section 8.6.4).

-- c.	Define the following terms):

--		i.	Existential and universal quantifiers (see Section 8.6.3).

-- 		ii.	safe expressions (see Section 8.6.8).

-- Write your solutions either in ASCII (e.g., SELECT_condition), Unicode (e.g., σcondition) or using hand-writing.

