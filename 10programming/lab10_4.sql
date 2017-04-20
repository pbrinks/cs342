-- Paige Brinks
-- cs 342
-- lab 10 part 4 (homework)
-- 4/20/2107

drop procedure incrementRank;

CREATE OR REPLACE PROCEDURE incrementRank
	(movieIdIn IN Movie.id%type, 
	 deltaIn IN integer
    ) AS
	x Movie.rank%type;
BEGIN
	FOR i IN 1..50000 LOOP
		SELECT rank INTO x FROM Movie WHERE id=movieIdIn;
		UPDATE Movie SET rank=x+deltaIn WHERE id=movieIdIn;
		COMMIT;
	END LOOP;
END;
/

EXECUTE incrementRank(238071, .01);

-- this did not run correctly. When I ran it simultaneously in both terminals 
-- it should have given me a final rank of 1008.5 however it gave me 852.81; 
-- meaning several of the added values from the loops were lost. This violates isolation.

drop procedure incrementRank2;

CREATE OR REPLACE PROCEDURE incrementRank2
	(movieIdIn IN Movie.id%type, 
	 deltaIn IN integer
    ) AS
	x Movie.rank%type;
BEGIN
	FOR i IN 1..50000 LOOP
		SELECT rank INTO x 
		FROM Movie 
		WHERE id=movieIdIn
		FOR UPDATE OF rank;
		
		UPDATE Movie 
		SET rank=x+deltaIn 
		WHERE id=movieIdIn;
		COMMIT;
	END LOOP;
END;
/

EXECUTE incrementRank2(238071, .01);

-- the final result is now 508.5. It will only run one at a time, which does not allow
-- anything to only get half commited, therefore insuring isolation.