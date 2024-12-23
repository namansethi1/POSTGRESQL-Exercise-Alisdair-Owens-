-- Calculate the total number of slots booked for each facility, ordered by facid.
SELECT facid, SUM(slots) AS "Total Slots"
FROM cd.bookings
GROUP BY facid
ORDER BY facid;
