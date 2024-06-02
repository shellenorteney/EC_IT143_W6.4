-- Step 1: Query a table in AdventureWorks2019 Database
USE AdventureWorks2019;
GO

-- Poorly performing query on an unindexed character field
SELECT *
FROM Person.Person
WHERE LastName = 'Smith';
GO

-- Step 3: Include the Actual Execution Plan
SET STATISTICS PROFILE ON;
SELECT *
FROM Person.Person
WHERE LastName = 'Smith';
SET STATISTICS PROFILE OFF;
GO

-- Step 5: Review the Execution Plan and Missing Index Recommendations
-- Viewing the Estimated Subtree Cost

-- Step 6: Opposite click on the Missing Index recommendation and select Missing Index Details
-- SQL Server will suggest an index similar to the following:
CREATE INDEX IX_LastName
ON Person.Person (LastName);
GO

-- Step 8: Re-run the query to see performance improvements
SET STATISTICS PROFILE ON;
SELECT *
FROM Person.Person
WHERE LastName = 'Smith';
SET STATISTICS PROFILE OFF;
GO
