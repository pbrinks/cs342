 -- StudyAbroad queries
 
-- This query gets the average rating of all the programs
-- This would be useful for students trying to decide what study abroad semester
-- They would like to participate in, to see if previous students enjoyed their
-- Semesters abroad
select  p.dept, p.courseNumber, avg(r.rating)
from Review r, Program p
where r.programID = p.ID
group by p.dept, p.courseNumber;
		

 
-- view of all students in a certain program, names, prog name, dept, etc
create view  
