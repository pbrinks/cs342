-- Paige Brinks
-- cs 342
-- homework 8 part 2
-- 4/06/2017

select * from Actor
where firstName = 'Kevin'
and lastName = 'Bacon';
-- KB ID: 22591


drop procedure computeBN;
drop table BaconTable;

create table BaconTable (
	actorId integer PRIMARY KEY,
	baconNumber integer
);


create procedure computeBN(p_actorId IN INTEGER, status IN INTEGER) IS
	counter INTEGER default 0;
BEGIN
	-- check if current actor is kevin bacon
	IF p_actorId = 22591 THEN 
		INSERT INTO BaconTable VALUES (p_actorId, 0);
	END IF;
	
	-- select all actors in all movies that p_actor is in
	FOR actor in 
		(select distinct actorId from role where movieID IN 
				(select movieID from role where p_actorId = actorId))	
	LOOP	
		-- make sure current actor is not already in table
		select count(*) into counter from BaconTable bt
		where actor.actorId = bt.actorId;

		-- there are only 41 movies in the db, therefore actors cannot be more than 41 movies away
		IF counter < 1 and status < 41 THEN
			INSERT INTO BaconTable VALUES (actor.actorId, (status+1));
			computeBN(actor.actorId, (status+1));
		ELSE
			update BaconTable 
				set baconNumber = (status+1)
				where actor.actorId = BaconTable.actorId
				and BaconTable.baconNumber > (status+1);
		END IF;
	END LOOP;
END;
/


begin 
	computeBN(22591, 0);
end;
/