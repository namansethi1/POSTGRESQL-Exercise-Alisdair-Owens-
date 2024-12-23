-- Calculate the average daily revenue for August 2012 based on bookings and a 15-day rolling window

SELECT 
    dategen.date, 
    (
        SUM(
            CASE 
                WHEN memid = 0 THEN slots * guestcost 
                ELSE slots * membercost 
            END
        ) / 15
    ) AS revenue
FROM 
    (
        -- Generate a list of dates in August 2012
        SELECT 
            CAST(
                generate_series(
                    TIMESTAMP '2012-08-01', 
                    TIMESTAMP '2012-08-31', 
                    '1 day'
                ) AS DATE
            ) AS date
    ) AS dategen
JOIN 
    cd.bookings b ON b.starttime BETWEEN (dategen.date - INTERVAL '14 days') AND (dategen.date + INTERVAL '1 day')
JOIN 
    cd.facilities f ON f.facid = b.facid
GROUP BY 
    dategen.date
ORDER BY 
    dategen.date;
