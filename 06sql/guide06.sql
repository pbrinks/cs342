-- Advanced SQL (Section 7.1, continued) — Write sample queries that:

-- 1.	Implement an inner join (Section 7.1.6).
select Movie.title from Movie, Casting
where Movie.id = Casting.movieId;
	
-- 2.	Implement an outer join (Section 7.1.6).
select Performer.name, Casting.status 
from (Performer left outer join Casting
	on Performer.id = Casting.performerId);

-- 3.	Use an aggregate function (Section 7.1.7).
select max(score) from Movie;

-- 4.	Use grouping (Section 7.1.8).
select status, count(*)
from Casting
group by status;