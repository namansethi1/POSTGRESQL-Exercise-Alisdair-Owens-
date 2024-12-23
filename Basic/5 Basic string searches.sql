-- Retrieve all facility details where the name includes 'Tennis'.
SELECT 
    * 
FROM 
    cd.facilities 
WHERE 
    name LIKE '%Tennis%';
