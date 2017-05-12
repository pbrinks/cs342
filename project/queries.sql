-- StudyAbroad queries
 
-- This query gets the average rating of all the programs
-- This would be useful for students trying to decide what study abroad semester
-- They would like to participate in, to see if previous students enjoyed their
-- Semesters abroad
select  p.dept, p.courseNumber, avg(r.rating)
from Review r, Program p
where r.programID = p.ID
group by p.dept, p.courseNumber;
-- I would not implement this a different way
		
 
-- This shows all the written reviews for semester abroad class IS 192 
-- this would be helpful for a student wanting to look up the reviews 
-- of a specific program they are interested in participating in
-- (could change the prog.dept and prog.courseNumber to look at any program)
select  part.firstName || ' ' || part.lastName as name,
        prog.dept || ' ' || prog.courseNumber as course,
		r.text
from Participant part, Program prog, Review r
where r.participantID = part.ID
and r.programID = prog.ID
and prog.dept = 'IS'
and prog.courseNumber = '192';
-- I would probably prefer to implement this as a procedure 
-- which would take in the program dept and courseNumber as parameters
-- and would therefore be more adaptable per student.
-- I did not create a procedure because that is included in the next 
-- project deliverable 
 
 
-- query of the count of all the Participants who are currently registered for each semester abroad
-- this would be useful for the professors to reference who are planning the semester and for the 
-- registrar to look up participant counts
select prog.dept, prog.courseNumber, count(r.participantID)
from Program prog LEFT OUTER JOIN Review r
ON r.programID =  prog.ID
group by prog.dept, prog.courseNumber;
-- I would not implement this another way

-- This table gives all of the attractions visited during a trip during the semester abraod
-- couse  CS 333. This query is useful because by switching out the dept, courseNumber and date, 
-- the professor leading the program can see which attractions they will be visiting during which trips
-- and what date they will be travelling
select ta.visit_date, a.name, t.location, a.timeLength, a.cost from Trip t, 
        Attraction a, TripAttraction ta, program p
where p.dept = 'CS'
and p.courseNumber = 333
and ta.visit_Date = '03-JUN-10'
and t.programID = p.ID
and ta.tripID = t.ID
and ta.attractionID = a.ID;

-- This recieves all semester abroad programs where the cost is null (meaning the cost is not yet known) 
-- This would be useful for financial services to figure out what
-- programs still need to have their budget finalized
select prog.dept, prog.courseNumber from Program prog
where cost IS NULL;
				
-- This finds all students in one program, this would be useful for a student trying to see what other 
-- students will be going abroad with them (like class pictures)
-- can switch out program dept and coursenumber to look up other programs
select firstName from Participant part, Review r1, Program prog
where r1.programID = prog.ID
and prog.dept = 'CS'
and prog.courseNumber = 333
and r1.participantID = part.ID
and exists (select * from Review r2
			where r2.programID = r1.programID
			and r1.participantID <> part.ID
			);
-- this query is actually possible in a much simpler way:
-- select firstName from Participant part, Review r1, Program prog
-- where pp1.programID = prog.ID
-- and prog.dept = 'CS'
-- and prog.courseNumber = 333
-- and pp1.participantID = part.ID;
-- which I would have preferred to use, but I used a subselect because I needed one for the project
-- I would also like to create this as a procedure that takes in the Program dept and courseNumber as parameter

-- I optimized this query. The final result:
create index progInd on Program (ID, dept, courseNumber);

select firstName from Participant part, Review r1, Program prog
where r1.programID = prog.ID
and prog.dept = 'CS'
and prog.courseNumber = 333
and r1.participantID = part.ID;


-- this is a view which shows all students in a semester abroad and what program they are taking part in
-- along with some basic information about that program
-- this could be used by the registrar, to see what students are enrolled in what programs
drop view part_progs;

create view part_progs as
select part.firstName || ' ' || part.lastName as student, 
		prog.dept || ' ' || prog.courseNumber as course,
		prof.firstName || ' ' || prof.lastName as professor, 
		prog.city || ', ' || prog.country as location,
		prog.semester
from Participant part, Program prog, Review r, Professor prof
where prog.professorID = prof.ID
and r.programID = prog.ID
and r.participantID = part.ID;
-- I used a non-materialized view because the registrar would always want a current version
-- of what student is enrolled in what