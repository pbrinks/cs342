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
	-- insert current actor
	INSERT INTO BaconTable VALUES (p_actorId, status);
	
	-- select all actors in all movies that p_actor is in
	FOR actor in 
		(select distinct actorId from role where movieID IN 
				(select movieID from role where p_actorId = actorId))	
	LOOP	
		-- make sure current actor is not already in table
		select count(*) into counter from BaconTable bt
		where actor.actorId = bt.actorId;

		-- there are only 41 movies in db, if actor has greater bacon number than 41, skip them for now (otherwise throws error: maximum open cursors exceeded). They should be connected by another actor in the same movie and therefore be added later
		 IF counter = 0 and status < 41 THEN
			computeBN(actor.actorId, (status+1));
		 ELSE
			-- if actor already exists, but has a higher number, update it
			-- if they do not exist yet, this won't do anything
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

-- tests

-- kevin bacon: should be 0
select * from BaconTable
where actorID = 22591;

-- should be 1
select * from BaconTable
where actorID = 36005;
