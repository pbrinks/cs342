The folder contains the command files for loading the Study Abroad Database (sadb).

Contains the following command files:
	create.sql - creates the sadb user, connects to that account and loads the loads the database, assuming that you've logged in as system.
	load.sql - reloads the database, assuming that you've logged in as sadb user. Calls drop.sql, schema.sql, data.sql.
	drop.sql - drops all tables in sadb
	schema.sql - defines the full sadb schema
	data.sql - loads the raw data into sadb using INSERT commands
	procedures.sql - creates sadb procedures
	triggers.sql - creates sadb triggers
	queries.sql - queries associated with the sadb database
	
	
Load/process the database as follows:
	1.	cd into cs342/project
	2.	Login to SQLPlus using the Orcle system account.
		sqlplus system/<password>
	3.	Create sadb
		@create