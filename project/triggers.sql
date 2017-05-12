-- trigger checks that student cannot create a review unless they 
-- were previously a participant of that program.
CREATE TRIGGER reviewTrigger BEFORE INSERT ON Review FOR EACH ROW
DECLARE
	ppCounter INTEGER;
	invalidReview EXCEPTION;
BEGIN
	SELECT COUNT(*) INTO ppCounter 
	FROM Review r
	WHERE r.programID = :new.programID
	AND r.participantID = :new.participantID;
	
	IF ppCounter < 1 THEN
		raise invalidReview;
	END IF;
	
EXCEPTION	
	WHEN invalidReview THEN
		RAISE_APPLICATION_ERROR(-20001, 'Student cannot review an abroad program they did not enroll in.');
END;
/

-- tests

-- this should work fine
-- INSERT INTO Review VALUES (22,2,1,'This should work fine.', 4.5);

-- this should raise exception
-- INSERT INTO Review VALUES (23,3,1,'This should not work.', 4.5);

-- select * from Review;