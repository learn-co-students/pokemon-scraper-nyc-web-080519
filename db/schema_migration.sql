-- Write your sql commands to create your db schema here.
-- It should create a table in a new table in the db/ directory.


-- since we are in a .sql file we can just create the table 
CREATE TABLE IF NOT EXISTS pokemon (
    id INTEGER PRIMARY KEY,
    name TEXT,
    type TEXT
);