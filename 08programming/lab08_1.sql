-- Paige Brinks
-- cs 342
-- lab08 part 1
-- 3/31/2017


drop procedure cast_role;

CREATE PROCEDURE cast_role(p_actorID IN Role.actorID%type, p_movieID IN 
							Role.movieID%type, p_role IN Role.role%type)
IS
BEGIN
	INSERT INTO Role
		(actorID, movieID, role)
	VALUES
		(p_actorID, p_movieID, p_role);
		
	dbms_output.put_line('Casting actorID'  || p_actorID || ' in movieID ' 
				|| p_movieID  || ' as ' || p_role);
END;
/


drop trigger roleTrigger;

CREATE TRIGGER roleTrigger BEFORE INSERT ON Role FOR each row
DECLARE 
	actorCounter INTEGER;
	castingCounter INTEGER;
	duplicateActor EXCEPTION;
	movieFull EXCEPTION;
BEGIN
	SELECT COUNT(*) INTO actorCounter FROM Role 
		WHERE actorID = :new.actorID
		AND movieID = :new.movieID;
	IF actorCounter >= 1 THEN
		raise duplicateActor;
	END IF;
	
	SELECT COUNT(*) INTO castingCounter FROM Role
	WHERE movieId = :new.movieID;
	IF castingCounter >= 230 THEN
		raise movieFull;
	END IF;
	
	EXCEPTION
		WHEN duplicateActor THEN
			RAISE_APPLICATION_ERROR(-20001, 'Actor already cast in this movie.');
		WHEN movieFull THEN
			RAISE_APPLICATION_ERROR(-20002, 'Movie already has 230 castings.');
END;
/



-- a. Cast George Clooney (# 89558) as “Danny Ocean” in Oceans Eleven (#238072). N.b., he’s already cast in this movie.

BEGIN
	cast_role(89558, 238072, 'Danny Ocean');
END;
/

-- b. Cast George Clooney as “Danny Ocean” in Oceans Twelve (#238073). N.b., he’s not currently cast in this movie.
BEGIN
	cast_role(89558, 238073, 'Danny Ocean');
END;
/

-- c. Cast George Clooney as “Danny Ocean” in JFK (#167324). N.b., this movie already has 230 castings.
BEGIN
	cast_role(89558, 167324, 'Danny Ocean');
END;
/
