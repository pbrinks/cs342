-- Paige Brinks
-- cs 342
-- lab 09
-- 4/07/2017

SET AUTOTRACE ON; 
SET SERVEROUTPUT ON;
SET TIMING ON;


select count(1) from Movie;

DECLARE
	op varchar(200);
BEGIN
	FOR i IN 1..1000 LOOP
		select count(1)
		into op
		from Movie;
	END LOOP;
END;
/

select count(*) from Movie;

DECLARE
	op varchar(200);
BEGIN
	FOR i IN 1..1000 LOOP
		select count(*)
		into op
		from Movie;
	END LOOP;
END;
/

select count(1) from Movie;

DECLARE
	op varchar(200);
BEGIN
	FOR i IN 1..1000 LOOP
		select sum(1)
		into op
		from Movie;
	END LOOP;
END;
/

-- ouput: 
-- PL/SQL procedure successfully completed.
-- Elapsed: 00:00:05.46

-- PL/SQL procedure successfully completed.
-- Elapsed: 00:00:05.42

-- PL/SQL procedure successfully completed.
-- Elapsed: 00:00:12.89

-- concludes that count(1) and count(*) are equally efficient, however, using sum takes significantly longer. Even though they have the same execution plan, sum takes significantly longer. This must be because of implementation differences between the two funnctions (even though they have the same execution plans).
