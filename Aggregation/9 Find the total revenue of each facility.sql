-- Calculate revenue generated from bookings, based on member or guest status, grouped by facility and ordered by revenue.
SELECT 
    f.name, 
    SUM(CASE 
        WHEN m.memid = 0 THEN b.slots * f.guestcost  -- Guest cost calculation
        ELSE b.slots * f.membercost                  -- Member cost calculation
    END) AS revenue
FROM cd.members m
JOIN cd.bookings b ON m.memid = b.memid
JOIN cd.facilities f ON b.facid = f.facid
GROUP BY f.facid
ORDER BY revenue;
