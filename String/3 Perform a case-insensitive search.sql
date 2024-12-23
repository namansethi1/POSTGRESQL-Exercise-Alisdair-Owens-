-- Retrieves all records from the cd.facilities table where the name starts with 'TENNIS' (case-insensitive).
SELECT * 
FROM cd.facilities 
WHERE name ILIKE 'TENNIS%';
