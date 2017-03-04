 -- Load the StudyAbroad database. 
-- See ../README.md for details.

-- Drop the previous table declarations.
@drop         
commit;
-- Reload the table declarations.
@schema
commit;
-- Load the table data.
@data
commit;
-- Add constraints that cannot be added before the data.
-- @&sadb\constraints
-- commit;