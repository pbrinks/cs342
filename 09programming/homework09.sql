-- Paige Brinks
-- cs 342
-- homework 9
-- 4/13/2017

SET AUTOTRACE ON; 
SET SERVEROUTPUT ON;
SET TIMING ON;

select m.id, m.name, m.year from Director d, Movie m, MovieDirector md
where d.firstName = 'Clint'
and d.lastName = 'Eastwood'
and d.id = md.directorID
and md.movieId = m.id;


select d.firstName || ' ' || d.lastName as director, count(*)
from Director d, MovieDirector md
where d.id = md.directorID
group by d.firstName || ' ' || d.lastName
having count(*) > 200;


select a.firstName || ' ' || a.lastName as actor, avg(m.rank)
from Actor a, Role r, Movie m
where a.id = r.actorId
and r.movieId = m.id
group by a.firstName || ' ' || a.lastName
having avg(m.rank) > 8.5;