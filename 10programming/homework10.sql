-- Paige Brinks
-- cs 342
-- homework 10 part 1 
-- 4/20/2107

create or replace procedure transferRank(
						sourceMovieId IN INTEGER, 
						destMovieID IN INTEGER,
						transferAmount IN FLOAT
										)
AS 
	x1 Movie.rank%type;
	-- exceptions
	tooLargeTransferAmount EXCEPTION;
	negTransferAmount EXCEPTION;
	-- do not need to create an exception for an invalid movieID, because Oracle does 
	-- that automatically
BEGIN
	SELECT rank INTO x1 FROM Movie WHERE id=sourceMovieId
	FOR UPDATE OF rank;
	
	-- cannot transfer a higher rank than the movie has
	IF transferAmount > x1 THEN
		RAISE tooLargeTransferAmount;
	ELSIF transferAmount < 0 THEN
		RAISE negTransferAmount;
	END IF;

	UPDATE Movie
	SET rank = (rank - transferAmount)
	WHERE id=sourceMovieId;
	commit;
	
	UPDATE Movie
	SET rank = (rank + transferAmount)
	WHERE id=destMovieID;
	commit;
	
EXCEPTION
	WHEN tooLargeTransferAmount THEN
		raise_application_error (-20001,'Transfer amount is too large.');
	WHEN negTransferAmount THEN
		raise_application_error (-20002,'Transfer amount must be non-negative.');
END;
/
COMMIT;

-- test tooLargeTransferAmount exception
-- BEGIN
	-- transferRank(176711, 176712, 10);
-- END;
-- /

-- test negTransferAmount exception
-- BEGIN
	-- transferRank(176711, 176712, -1);
-- END;
-- /

select * from Movie where id = 176711;
select * from Movie where id = 176712;

BEGIN
	FOR i IN 1..10000 LOOP
		transferRank(176712, 176711, 0.1);
		COMMIT;
		transferRank(176711, 176712, 0.1);
		COMMIT;
	END LOOP;
END;
/

select * from Movie where id = 176711;
select * from Movie where id = 176712;
