-- create the StudyAbroad user and database

-- Create the user.
DROP USER sadb CASCADE;
CREATE USER sadb IDENTIFIED BY bjarne;
GRANT 
	CONNECT,
	CREATE TABLE,
	CREATE SESSION,
	CREATE SEQUENCE,
	CREATE VIEW,
	CREATE MATERIALIZED VIEW,
	CREATE PROCEDURE,
	CREATE TRIGGER,
	UNLIMITED TABLESPACE
	TO sadb;

-- Connect to the user's account/schema.
CONNECT sadb/bjarne;

-- (Re)Create the database.
DEFINE sadb=S:\cs342\project
@load