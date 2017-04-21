-- procedure allows students to go back and update a previous review they submitted 
-- a program they are considering
-- this takes in the programDept and courseNumber, which would be more 
-- well known by a student than the programID
create or replace procedure getReview(
									programDept IN Program.dept%type, 
									courseNumber IN Program.courseNumber%type
									)
	
	select avg(rating)from Review
	where 
	
	
	