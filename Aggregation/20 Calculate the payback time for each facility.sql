-- Calculate the number of months it takes for each facility to recover its initial investment, based on monthly revenue and maintenance costs.
SELECT 
    name,
    (initialoutlay / (monthlyrevenue - monthlymaintenance)) AS months
FROM (
    SELECT
        name,
        initialoutlay,
        SUM(
            CASE 
                WHEN memid = 0 THEN slots * guestcost 
                ELSE slots * membercost 
            END
        ) / 3 AS monthlyrevenue,
        monthlymaintenance
    FROM 
        cd.facilities f
    JOIN 
        cd.bookings b 
        ON f.facid = b.facid
    GROUP BY 
        f.facid
) AS subquery
ORDER BY 
    name, 
    months;
