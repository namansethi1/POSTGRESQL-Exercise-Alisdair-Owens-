-- Retrieve all facility details for specific facility IDs 1 and 5.
SELECT 
    * 
FROM 
    cd.facilities 
WHERE 
    facid IN (1, 5);
