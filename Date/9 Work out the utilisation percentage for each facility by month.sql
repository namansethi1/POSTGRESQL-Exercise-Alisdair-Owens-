-- The query calculates the monthly utilisation percentage of each facility based on the sum of slots, 
-- adjusted by the number of days in the month.

SELECT
    f.name,  -- Facility name
    date_trunc('month', b.starttime) AS month,
    ROUND(
        (sum(b.slots) * 100) / 
        (25 * EXTRACT(DAY FROM (date_trunc('month', b.starttime) + interval '1 month' - date_trunc('month', b.starttime)))), 
        1
    ) AS utilisation  
FROM
    cd.bookings b  
JOIN
    cd.facilities f ON b.facid = f.facid 
GROUP BY
    f.name, month 
ORDER BY
    f.name, month; 
