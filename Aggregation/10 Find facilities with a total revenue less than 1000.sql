-- Calculate revenue for each facility, filtering those with revenue less than 1000 using a subquery
SELECT name, revenue
FROM (
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
) AS total_revenue
WHERE revenue < 1000  -- Filter for facilities with total revenue less than 1000
ORDER BY revenue;


-- ############### OR ###############


-- Calculate revenue for each facility, filtering those with revenue less than 1000
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
HAVING SUM(CASE 
        WHEN m.memid = 0 THEN b.slots * f.guestcost  -- Guest cost calculation
        ELSE b.slots * f.membercost                  -- Member cost calculation
    END) < 1000  -- Filter for facilities with total revenue less than 1000
ORDER BY revenue;
