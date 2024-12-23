-- Retrieve member, facility, and cost for bookings on '2012-09-14' where the cost exceeds 30.
SELECT 
    member, 
    facility, 
    cost 
FROM (
    SELECT
        m.firstname || ' ' || m.surname AS member, 
        f.name AS facility, 
        CASE 
            WHEN m.memid = 0 THEN b.slots * f.guestcost 
            ELSE b.slots * f.membercost 
        END AS cost
    FROM 
        cd.members AS m
    JOIN 
        cd.bookings AS b ON m.memid = b.memid
    JOIN 
        cd.facilities AS f ON b.facid = f.facid
    WHERE 
        DATE(b.starttime) = '2012-09-14'
) AS bookings
WHERE 
    cost > 30
ORDER BY 
    cost DESC;
