-- this procedure creates a Trip and then automatically adds the cost
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
	
v_cost Trip.totalCost%type;
pcount integer;
totalTripCost integer;

invalidAmount EXCEPTION;
invalidProgram EXCEPTION;
invalidProgramCost EXCEPTION;

BEGIN
	SAVEPOINT sp;
	
	SELECT cost into v_cost
		FROM Program
		WHERE id = p_programID
		FOR UPDATE;

	LOCK TABLE Trip IN EXCLUSIVE MODE;
	SELECT SUM(totalCost) INTO totalTripCost
		FROM Trip
		WHERE programID = p_programID;
	
	-- cost cannot be negative
	IF p_totalCost < 0 THEN
		raise invalidAmount;
	END IF;
	
	-- check that program exists
	SELECT count(*) INTO pcount
	FROM Program p
	WHERE p.id = p_programID;
	
	IF pcount < 1 THEN
		raise invalidProgram;
	END IF;
	
	-- the total amount of all trip for that program cannot be greater
	-- total cost of the program
	IF totalTripCost > v_cost THEN
		raise invalidProgramCost;
	END IF;
	
	INSERT INTO Trip VALUES (tripSequence.nextval, p_programID, p_location, p_timeLength, p_totalCost, p_description);
	
	UPDATE Program
	SET cost = (v_cost + p_totalCost)
	WHERE ID = p_programID;
	
	COMMIT;

EXCEPTION
	WHEN invalidAmount THEN
		raise_application_error (-20001,'Cost must be nonnegative.');
		ROLLBACK TO sp;
	WHEN invalidProgram	THEN
		raise_application_error(-20002, 'Program does not exist.');
		ROLLBACK TO sp;
	WHEN invalidProgramCost THEN
		raise_application_error(-20003, 'Program cost is less than total cost for trips!');
		ROLLBACK TO sp;
	WHEN OTHERS THEN
		raise_application_error(-20004, 'Invalid transaction!');
		ROLLBACK TO sp;
END;
/

SHOW ERRORS;
-- tests

select cost from Program
where dept = 'CS'
and courseNumber = 333;

BEGIN
	addTrip(1,'Northern Peninsula','8 hrs','100.00','Visit the beautiful northern peninsula.');
END;
/

BEGIN
	addTrip(1,'Northern Peninsula','8 hrs','-100.00','Visit the beautiful northern peninsula.');
END;
/

select cost from Program
where dept = 'CS'
and courseNumber = 333;

select * from Trip
where id = (select max(id) from Trip);

