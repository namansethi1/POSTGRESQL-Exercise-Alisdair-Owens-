-- Categorize facilities as 'expensive' or 'cheap' based on their total monthly maintenance.
SELECT 
    name,
    CASE 
        WHEN SUM(monthlymaintenance) > 100 THEN 'expensive'
        ELSE 'cheap' 
    END AS cost
FROM 
    cd.facilities
GROUP BY 
    name;
