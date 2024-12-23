-- Get the most recent join date by sorting member IDs in descending order.
SELECT 
    joindate AS latest 
FROM 
    cd.members 
ORDER BY 
    memid DESC 
LIMIT 1;


-- ###################### OR ######################


-- Get the most recent join date using the MAX function.
SELECT 
    MAX(joindate) AS latest 
FROM 
    cd.members;
