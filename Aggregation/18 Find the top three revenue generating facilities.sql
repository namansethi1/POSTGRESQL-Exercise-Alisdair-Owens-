-- Retrieve the top 3 facilities ranked by total revenue, considering guest and member costs
SELECT 
    name, 
    rank 
FROM (
    SELECT 
        facs.name AS name, 
        RANK() OVER (
            ORDER BY SUM(
                CASE
                    WHEN memid = 0 THEN slots * facs.guestcost
                    ELSE slots * facs.membercost
                END
            ) DESC
        ) AS rank
    FROM 
        cd.bookings bks
    INNER JOIN 
        cd.facilities facs
        ON bks.facid = facs.facid
    GROUP BY 
        facs.name
) AS subq
WHERE 
    rank <= 3
ORDER BY 
    rank;
