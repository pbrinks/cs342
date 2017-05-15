-- this procedure creates an Trip and then automatically adds the cost
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

CURSOR c1
IS 
	SELECT cost
	FROM Program
	WHERE id = p_programID
	FOR UPDATE;
	
v_cost Trip.totalCost%type;
pcount integer;

invalidAmount EXCEPTION;
invalidProgram EXCEPTION;
BEGIN
	SAVEPOINT sp;
	
	-- cost cannot be negative
	IF p_totalCost < 0 THEN
		raise invalidAmount;
	END IF;
	
	OPEN c1;
		FETCH c1 INTO v_cost;
	
		-- check that program exists
		SELECT count(*) INTO pcount
		FROM Program p
		WHERE p.id = p_programID;
		
		IF pcount < 1 THEN
			raise invalidProgram;
		END IF;
		
		INSERT INTO Trip
		VALUES (tripSequence.nextval, p_programID, p_location, p_timeLength, p_totalCost, p_description);
		
		UPDATE Program
		SET cost = (v_cost + p_totalCost)
		WHERE ID = p_programID;
		
	CLOSE c1;
	
	COMMIT;

EXCEPTION
	WHEN invalidAmount THEN
		raise_application_error (-20001,'Cost must be nonnegative.');
		ROLLBACK TO sp;
	WHEN invalidProgram	THEN
		raise_application_error(-20003, 'Program does not exist.');
		ROLLBACK TO sp;
	WHEN OTHERS THEN
		raise_application_error(-20003, 'Invalid transaction!');
		ROLLBACK TO sp;
END;
/

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
