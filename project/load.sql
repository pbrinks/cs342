 -- Load the grading database. 
-- See ../README.md for details.

-- Drop the previous table declarations.
@&sadb\drop         
commit;
-- Reload the table declarations.
@&sadb\schema
commit;
-- Load the table data.
@&sadb\data
commit;
-- Add constraints that cannot be added before the data.
-- @&sadb\constraints
-- commit;