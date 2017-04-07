-- Paige Brinks
-- cs 342
-- lab 09
-- 4/07/2017




SET AUTOTRACE ON; 
SET SERVEROUTPUT ON;
SET TIMING ON;


-- a.
select count(1) from Movie;

DECLARE
	op integer;
BEGIN
	FOR i IN 1..1000 LOOP
		select count(1)
		into op
		from Movie;
	END LOOP;
END;
/

select count(*) from Movie;

DECLARE
	op integer;
BEGIN
	FOR i IN 1..1000 LOOP
		select count(*)
		into op
		from Movie;
	END LOOP;
END;
/

select count(1) from Movie;

DECLARE
	op integer;
BEGIN
	FOR i IN 1..1000 LOOP
		select sum(1)
		into op
		from Movie;
	END LOOP;
END;
/

-- ouput: 
-- PL/SQL procedure successfully completed.
-- Elapsed: 00:00:05.46

-- PL/SQL procedure successfully completed.
-- Elapsed: 00:00:05.42

-- PL/SQL procedure successfully completed.
-- Elapsed: 00:00:12.89

-- concludes that count(1) and count(*) are equally efficient, however, using sum takes significantly longer. Even though they have the same execution plan, sum takes significantly longer. This must be because of implementation differences between the two funnctions (even though they have the same execution plans).
-- execution plan is: 
-----------------------------------------------------------------------------
-- | Id  | Operation             | Name        | Rows  | Cost (%CPU)| Time     |
---------------------------------------------------------------------------
-- |   0 | SELECT STATEMENT      |             |     1 |   222   (1)| 00:00:03 |
-- |   1 |  SORT AGGREGATE       |             |     1 |            |          |
-- |   2 |   INDEX FAST FULL SCAN| SYS_C007027 |   388K|   222   (1)| 00:00:03 |
-----------------------------------------------------------------------------


-- b.
SET AUTOTRACE TRACEONLY;

select a.firstName || ' ' || a.lastName as actor_name, 
	m.name as movie_name	
 from Movie m, Role r, Actor a
where r.movieID = m.id
and r.actorID = a.id;

select a.firstName || ' ' || a.lastName as actor_name, 
	m.name as movie_name	
 from Actor a, Movie m, Role r
where r.movieID = m.id
and r.actorID = a.id;

-- all of these have the same execution plan, no matter what order I list the tables in the from class. The times were also 7.9 secords both times. The execution plan always runs a TABLE ACCESS FULL for Movie, then Actor, then Role
--------------------------------------------------------------------------------------
-- | Id  | Operation           | Name  | Rows  | Bytes |TempSpc| Cost (%CPU)| Time |
--------------------------------------------------------------------------------------
-- |   0 | SELECT STATEMENT    |       |  3414K|   182M|       | 17007   (1)| 00:03:25 |
-- |*  1 |  HASH JOIN          |       |  3414K|   182M|    13M| 17007   (1)| 00:03:25 |
-- |   2 |   TABLE ACCESS FULL | MOVIE |   388K|  9479K|       |   497   (1)| 00:00:06 |
-- |*  3 |   HASH JOIN         |       |  3414K|   100M|    25M|  8869   (1)| 00:01:47 |
-- |   4 |    TABLE ACCESS FULL| ACTOR |   817K|    16M|       |   845   (1)| 00:00:11 |
-- |   5 |    TABLE ACCESS FULL| ROLE  |  3432K|    32M|       |  3155   (1)| 00:00:38 |
--------------------------------------------------------------------------------------

-- c.
-- test without arithmetic expressions

-- DECLARE
	-- op varchar(200);
-- BEGIN
	-- FOR i IN 1..1000 LOOP
		-- select count(1)
		-- into op
		-- from Movie;
	-- END LOOP;
-- END;
-- /


select m.id from Movie m
JOIN Role r ON r.movieID = m.ID;

-- test with arithmetic expressions
select m.id from Movie m
JOIN Role r ON r.movieID+2 = m.ID+2;

-- adding the arithmetic operation made it about a second slower (5.54 secs vs 4.5  secs). The execution plan also changed. Running the query without the arithmetic expression used the SELECT STATEMENT operation and then TABLE ACCESS FULL. Adding in the arithmetic expression changed the plan to use SELECT STATEMENT, HASH JOIN, INDEX FAST FULL SCAN, and then TABLE ACCESS FULL.

-- d.

select count(*) from movie m;
-- Elapsed 00:00:00.01
DECLARE
	op integer;
BEGIN
	FOR i IN 1..100 LOOP
		select count(*)
		into op
		from Movie m;
	END LOOP;
END;
/
-- Elapsed: 00:00:00.54
-- 54/100 = .0054 ms per execution
-- sped up an avg of about .005 ms per execution
-- used SORT AGGREGATE, INDEX FAST FULL SCAN


-- e.
CREATE INDEX IndexRank ON Movie(rank);

	select m.rank 
	from Movie m, Role r
	where rank > 5
	and m.id = r.movieID;

DROP INDEX IndexRank;

	select m.rank
	from Movie m, Role r
	where rank > 5
	and m.id = r.movieID;

-- using the index made this run only slightly faster (1.56 secs vs. 1.58 secs). Running a much larger query would probably make a much larger difference, than this and would therefore useful. Both had the same execution plans as well
----------------------------------------------------------------------------
-- | Id  | Operation          | Name  | Rows  | Bytes | Cost (%CPU)| Time     |
--------------------------------------------------------------------------
-- |   0 | SELECT STATEMENT   |       |   419K|  4912K|  3663   (1)| 00:00:44 |
-- |*  1 |  HASH JOIN         |       |   419K|  4912K|  3663   (1)| 00:00:44 |
-- |*  2 |   TABLE ACCESS FULL| MOVIE | 37023 |   253K|   498   (1)| 00:00:06 |
-- |   3 |   TABLE ACCESS FULL| ROLE  |  3432K|    16M|  3155   (1)| 00:00:38 |
--------------------------------------------------------------------------
