-- Categorize facilities into revenue levels (high, average, low) based on total revenue, using NTILE for ranking
SELECT 
    name, 
    CASE 
        WHEN rank = 1 THEN 'high' 
        WHEN rank = 2 THEN 'average' 
        ELSE 'low' 
    END AS revenue
FROM (
    SELECT
        name,
        NTILE(3) OVER (
            ORDER BY SUM(
                CASE 
                    WHEN m.memid = 0 THEN slots * guestcost 
                    ELSE slots * membercost 
                END
            ) DESC
        ) AS rank
    FROM 
        cd.members m
    JOIN 
        cd.bookings b 
        ON m.memid = b.memid
    JOIN 
        cd.facilities f 
        ON b.facid = f.facid
    GROUP BY 
        f.facid
) AS subquery
ORDER BY 
    rank, 
    name;
