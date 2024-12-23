-- Retrieve the first name and surname of members along with the first name and surname of their recommenders.
SELECT 
    m.firstname AS memfname, 
    m.surname AS memsname, 
    rec.firstname AS recfname, 
    rec.surname AS recsname
FROM 
    cd.members AS m
LEFT JOIN 
    cd.members AS rec 
    ON m.recommendedby = rec.memid
ORDER BY 
    m.surname, m.firstname;
