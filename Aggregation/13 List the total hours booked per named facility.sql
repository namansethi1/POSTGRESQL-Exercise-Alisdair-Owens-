-- Calculate total hours used for each facility based on bookings, grouped by facility
SELECT
    f.facid,
    name,
    ROUND(SUM((0.5 * slots)), 2) AS "Total Hours"
FROM
    cd.bookings b
JOIN 
    cd.facilities f ON b.facid = f.facid
GROUP BY
    f.facid
ORDER BY
    f.facid;
