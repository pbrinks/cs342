-- Paige Brinks
-- cs 342
-- homework 9
-- 4/13/2017

SET AUTOTRACE TRACEONLY;
SET SERVEROUTPUT ON;
SET TIMING ON;

create index directorNameIndex on Director (firstName, lastName);
create index mdIndex on MovieDirector (directorID, movieId);

select m.id, m.name, m.year from Director d, Movie m, MovieDirector md
where d.firstName = 'Clint'
and d.lastName = 'Eastwood'
and d.id = md.directorID
and md.movieId = m.id;

-- before adding indexes:
----------------------------------------------------------------------------------------------
-- | Id  | Operation                    | Name          | Rows  | Bytes | Cost (%CPU)| Time     |
------------------------------------------------------------------------------------------
-- |   0 | SELECT STATEMENT             |               |     1 |    60 |   304   (2)| 00:00:04 |
-- |   1 |  NESTED LOOPS                |               |       |       |			 |          |
-- |   2 |   NESTED LOOPS               |               |     1 |    60 |   304   (2)| 00:00:04 |
-- |*  3 |    HASH JOIN                 |               |     1 |    31 |   302   (2)| 00:00:04 |
-- |*  4 |     TABLE ACCESS FULL        | DIRECTOR      |     1 |    21 |    86   (2)| 00:00:02 |
-- |   5 |     TABLE ACCESS FULL        | MOVIEDIRECTOR |   380K|  3717K|   215   (1)| 00:00:03 |
-- |*  6 |    INDEX UNIQUE SCAN         | SYS_C007043   |     1 |       |     1   (0)| 00:00:01 |
-- |   7 |   TABLE ACCESS BY INDEX ROWID| MOVIE         |     1 |    29 |     2   (0)| 00:00:01 |
----------------------------------------------------------------------------------------------

-- after adding indexes:
-------------------------------------------------------------------------------------------------
-- | Id  | Operation                      | Name           | Rows  | Bytes | Cost (%CPU)| Time     |
-------------------------------------------------------------------------------------------------
-- |   0 | SELECT STATEMENT               |                |     4 |   240 |    12(0)| 00:00:01 |
-- |   1 |  NESTED LOOPS                  |                |       |       ||          |
-- |   2 |   NESTED LOOPS                 |                |     4 |   240 |    12(0)| 00:00:01 |
-- |   3 |    NESTED LOOPS                |                |     4 |   124 |     4(0)| 00:00:01 |
-- |   4 |     TABLE ACCESS BY INDEX ROWID| DIRECTOR       |     1 |    21 |     2(0)| 00:00:01 |
-- |*  5 |      INDEX RANGE SCAN          | ACTORNAMEINDEX |     1 |       |     1(0)| 00:00:01 |
-- |*  6 |     INDEX RANGE SCAN           | MDINDEX        |     4 |    40 |     2(0)| 00:00:01 |
-- |*  7 |    INDEX UNIQUE SCAN           | SYS_C007043    |     1 |       |     1 (0)| 00:00:01 |
-- |   8 |   TABLE ACCESS BY INDEX ROWID  | MOVIE          |     1 |    29 |     2 (0)| 00:00:01 |
-------------------------------------------------------------------------------------------------

--  adding the actorNameIndex index removed a table access full and replaced it with an index range scan. Since table access full has to loop through all rows in the table, this is much faster. Adding the mdIndex switched a hash join to now be a nested loop, which ran faster (0.01 secs (nested loop) compared to 0.03 secs (hash join)). Another way to implement this was to create mdIndex on MovieDirector (movieId, directorID) ( instead of on MovieDirector (directorID, movieId) ), which kept the hash join. In some cases hash joins can be faster than nested loops, but in this case the timing was always shorter with the nested loop, so that is why I chose to implement it the way I did.

drop index directorNameIndex;
drop index mdIndex;



select d.firstName || ' ' || d.lastName as director, count(md.movieID)
from Director d, MovieDirector md
where d.id = md.directorID
group by d.firstName || ' ' || d.lastName
having count(md.movieID) > 200;

-- before optimization:
----------------------------------------------------------------------------------------------
-- | Id  | Operation            | Name          | Rows  | Bytes |TempSpc| Cost (%CPU)| Time     |
----------------------------------------------------------------------------------------------
-- |   0 | SELECT STATEMENT     |               | 19033 |   576K|       |  1833   ( 1)| 00:00:26 |
-- |*  1 |  FILTER              |               |       |       |       |			 |          |
-- |   2 |   HASH GROUP BY      |               | 19033 |   576K|    11M|  1833   ( 1)| 00:00:26 |
-- |*  3 |    HASH JOIN         |               |   380K|    11M|  2800K|   745   (1)| 00:00:11 |
-- |   4 |     TABLE ACCESS FULL| DIRECTOR      | 86880 |  1781K|       |    86   (2)| 00:00:02 |
-- |   5 |     TABLE ACCESS FULL| MOVIEDIRECTOR |   380K|  3717K|       |   215   (1)| 00:00:03 |
----------------------------------------------------------------------------------------------

-- i originally was selecting and grouping by count(m.id), however, when I switched to count(*), even though the operations performed where the same, the times it took to operate them were faster. Here is the new result:

select d.firstName || ' ' || d.lastName as director, count(1)
from Director d, MovieDirector md
where d.id = md.directorID
group by d.firstName || ' ' || d.lastName
having count(*) > 200;

----------------------------------------------------------------------------------------------
-- | Id  | Operation            | Name          | Rows  | Bytes |TempSpc| Cost (%CPU)| Time     |
------------------------------------------------------------------------------------------
-- |   0 | SELECT STATEMENT     |               | 19033 |   483K|       |  1833   (1)| 00:00:22 |
-- |*  1 |  FILTER              |               |       |       |       |			 |          |
-- |   2 |   HASH GROUP BY      |               | 19033 |   483K|    11M|  1833   (1)| 00:00:22 |
-- |*  3 |    HASH JOIN         |               |   380K|  9665K|  2800K|   745   (1)| 00:00:09 |
-- |   4 |     TABLE ACCESS FULL| DIRECTOR      | 86880 |  1781K|       |    86   (2)| 00:00:02 |
-- |   5 |     TABLE ACCESS FULL| MOVIEDIRECTOR |   380K|  1858K|       |   215   (1)| 00:00:03 |
----------------------------------------------------------------------------------------------

-- I also tested using count(1) instead of count(*), however, it did no tmake a difference.
-- I also tested selecting and grouping by d.firstName, d.lastName instead of concatenating them, however, this did not appear to make a difference in the performance times.


create index roleIndex on Role (actorId, movieID);

select a.firstName || ' ' || a.lastName as actor, avg(m.rank)
from Actor a, Role r, Movie m
where a.id = r.actorId
and r.movieId = m.id
group by a.firstName || ' ' || a.lastName
having avg(m.rank) > 8.5
and count(m.id) >= 10;

drop index roleIndex;

-- original execution plan:
---------------------------------------------------------------------------------------
-- | Id  | Operation             | Name  | Rows  | Bytes |TempSpc| Cost (%CPU)| Time     |
---------------------------------------------------------------------------------------
-- |   0 | SELECT STATEMENT      |       |  8537 |   316K|       | 26374   (1)| 00:05:17 |
-- |*  1 |  FILTER               |       |       |       |       |            |			|
-- |   2 |   HASH GROUP BY       |       |  8537 |   316K|   156M| 26374   (1)| 00:05:17 |
-- |*  3 |    HASH JOIN          |       |  3414K|   123M|    25M| 14442   (1)| 00:02:54 |
-- |   4 |     TABLE ACCESS FULL | ACTOR |   817K|    16M|       |   845   (1)| 00:00:11 |
-- |*  5 |     HASH JOIN         |       |  3432K|    55M|  7208K|  7592   (1)| 00:01:32 |
-- |   6 |      TABLE ACCESS FULL| MOVIE |   388K|  2654K|       |   498   (1)| 00:00:06 |
-- |   7 |      TABLE ACCESS FULL| ROLE  |  3432K|    32M|       |  3155   (1)| 00:00:38 |
---------------------------------------------------------------------------------------
-- this is extremely slow (takes 2.6 secs)

-- tried to create index roleIndex on Role (actorId, movieID), but was given the following error:
-- ORA-01652: unable to extend temp segment by 128 in tablespace SYSTEM

create index mRank on Movie (rank, id);

select a.firstName || ' ' || a.lastName as actor, avg(m.rank)
from Actor a, Role r, Movie m
where a.id = r.actorId
and r.movieId = m.id
group by a.firstName || ' ' || a.lastName
having avg(m.rank) > 8.5
and count(*) >= 10;

drop index mRank;
-- this time replacing count(m.id) with count(*) did not actually decrease the time at all. 
-- Adding the mRank index did remove a TABLE ACCESS FULL operation and replace it with an INDEX FAST FULL SCAN. It also decreased the times of almost all of the other operations as well. The new execution plan is as follows:

------------------------------------------------------------------------------------------
-- | Id  | Operation                | Name  | Rows  | Bytes |TempSpc| Cost (%CPU)|Time     |
------------------------------------------------------------------------------------------
-- |   0 | SELECT STATEMENT         |       |  8537 |   316K|       | 26131   (1)| 00:05:14 |
-- |*  1 |  FILTER                  |       |       |       |       |            |			|
-- |   2 |   HASH GROUP BY          |       |  8537 |   316K|   156M| 26131   (1)|00:05:14 |
-- |*  3 |    HASH JOIN             |       |  3414K|   123M|    25M| 14199   (1)|00:02:51 |
-- |   4 |     TABLE ACCESS FULL    | ACTOR |   817K|    16M|       |   845   (1)|00:00:11 |
-- |*  5 |     HASH JOIN            |       |  3432K|    55M|  7208K|  7349   (1)|00:01:29 |
-- |   6 |      INDEX FAST FULL SCAN| MRANK |   388K|  2654K|       |   254   (1)|00:00:04 |
-- |   7 |      TABLE ACCESS FULL   | ROLE  |  3432K|    32M|       |  3155   (1)|00:00:38 |
------------------------------------------------------------------------------------------


create index actorIndex on Actor (firstName, lastName, id);

select a.firstName || ' ' || a.lastName as actor, avg(m.rank)
from Actor a, Role r, Movie m
where a.id = r.actorId
and r.movieId = m.id
group by a.firstName || ' ' || a.lastName
having avg(m.rank) > 8.5
and count(*) >= 10;

drop index actorIndex;

-- adding the actorIndex in this case did not increase the optimization in any way.