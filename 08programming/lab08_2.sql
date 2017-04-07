-- Paige Brinks
-- cs 342
-- lab 8 part 2 (homework)
-- 4/06/2017


-- Insert your results into this table.
CREATE TABLE SequelsTemp (
  id INTEGER,
  name varchar2(100),
  PRIMARY KEY (id)
 );
 
CREATE OR REPLACE PROCEDURE getSequels (movieIdIn IN Movie.id%type) is
	-- Fill this in based on:
	--     the cursor example in class exercise 8.2.b.
	--     the recursive procedure example in class exercise 8.3.b.

	cursor seq_curs is
		select s.id, s.name from Movie m, Movie s
		where m.id = movieIdIn
		and m.sequelId = s.id;
	begin
		for seq in seq_curs loop
			if seq.id IS NOT NULL then 
				insert into SequelsTemp values (seq.id, seq.name);
				getSequels(seq.id);
			end if;
		end loop;
END;
/

-- Get the sequels for Ocean's 11, i.e., 4 of them.
BEGIN  getSequels(238071);  END;
/
SELECT * FROM SequelsTemp;

-- Get the sequels for Ocean's Fourteen, i.e., none.
BEGIN  getSequels(238075);  END;
/
SELECT * FROM SequelsTemp;

-- Clean up.
DROP TABLE SequelsTemp;