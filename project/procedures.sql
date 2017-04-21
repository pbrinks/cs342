
-- create trip sequence
CREATE SEQUENCE tripSequence 
	START WITH 20
	INCREMENT BY 1;

-- this creates an Trip and then automatically adds the cost
-- of that trip to the total cost of the program that trip is associated with
-- this is useful for the professor, because when planning a program abroad
-- everytime the plan another mandatory trip (ie weekend trip, day trip) they 
-- do not neet to update the Program cost as well.
-- trip costs must be nonnegative
CREATE OR REPLACE PROCEDURE addTrip(
									p_programID Program.ID%type,
									p_location Trip.location%type,
									p_timeLength Trip.timeLength%type,
									p_totalCost Trip.totalCost%type,
									p_description Trip.description%type
									)
AS
	invalidAmount EXCEPTION;
BEGIN
	-- make sure this does not result in a program with a negative cost
	IF p_totalCost < 0 THEN
		raise invalidAmount;
	END IF;
	
	INSERT INTO Trip
	VALUES (tripSequence.nextval, p_programID, p_location, p_timeLength, p_totalCost, p_description);
	COMMIT;
	
	UPDATE Program
	SET cost = cost + p_totalCost;
	COMMIT;
	
EXCEPTION
	WHEN invalidAmount THEN
		raise_application_error (-20001,'Cost must be nonnegative.');
END;
/


-- test procedure
-- select cost from Program
-- where dept = 'CS'
-- and courseNumber = 333;

-- BEGIN
	-- addTrip(1,'Northern Peninsula','8 hrs','100.00','Visit the beautiful northern peninsula.');
-- END;
-- /

-- select cost from Program
-- where dept = 'CS'
-- and courseNumber = 333;

-- select * from Trip
-- where id = (select max(id) from Trip);
