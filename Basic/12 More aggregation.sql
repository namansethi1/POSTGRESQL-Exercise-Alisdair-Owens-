-- Retrieve the details of the member who joined most recently.
SELECT 
    firstname, 
    surname, 
    joindate 
FROM 
    cd.members 
WHERE 
    joindate = 
    (SELECT MAX(joindate) 
     FROM cd.members);


-- ###################### OR ######################


-- Retrieve the details of the member with the highest member ID.
SELECT 
    firstname, 
    surname, 
    joindate 
FROM 
    cd.members 
ORDER BY 
    memid DESC 
LIMIT 1;
