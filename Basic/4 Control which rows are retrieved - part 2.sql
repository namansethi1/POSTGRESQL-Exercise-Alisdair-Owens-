-- Retrieve facilities with a non-zero member cost less than 2% of monthly maintenance.
SELECT 
    facid, 
    name, 
    membercost, 
    monthlymaintenance 
FROM 
    cd.facilities 
WHERE 
    membercost != 0 
    AND membercost < (1.0 / 50) * CAST(monthlymaintenance AS FLOAT);
