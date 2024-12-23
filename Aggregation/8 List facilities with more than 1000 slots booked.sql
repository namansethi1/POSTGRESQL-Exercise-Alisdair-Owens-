-- Calculate the total number of slots booked for each facility, 
-- showing only facilities with total slots greater than 1000, ordered by facid.
SELECT facid, SUM(slots) AS "Total Slots"
FROM cd.bookings
GROUP BY facid
HAVING SUM(slots) > 1000
ORDER BY facid;
