-- Retrieve distinct member names and their booked 'Tennis Court' facilities.
SELECT 
    DISTINCT m.firstname || ' ' || m.surname AS member, 
    f.name AS facility
FROM 
    cd.members AS m
JOIN 
    cd.bookings AS b 
    ON m.memid = b.memid
JOIN 
    cd.facilities AS f 
    ON b.facid = f.facid
WHERE 
    f.name LIKE '%Tennis Court%'
ORDER BY 
    member, facility;
