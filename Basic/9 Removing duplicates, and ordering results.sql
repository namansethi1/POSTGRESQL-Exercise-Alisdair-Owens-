-- Retrieve the first 10 unique surnames of members in alphabetical order.
SELECT DISTINCT 
    surname 
FROM 
    cd.members 
ORDER BY 
    surname 
LIMIT 10;
