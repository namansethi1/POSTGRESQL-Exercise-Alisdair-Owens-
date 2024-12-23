-- Query 1: Find Facility with Highest Total Slots
SELECT facid, SUM(slots) AS total_slots
FROM cd.bookings
GROUP BY facid
ORDER BY SUM(slots) DESC
LIMIT 1;


-- ############### OR ###############


-- Query 2: Use a CTE to Find the Facility with the Maximum Total Slots
WITH sum AS (
    SELECT facid, SUM(slots) AS total_slots
    FROM cd.bookings
    GROUP BY facid
)
SELECT facid, total_slots AS "Total Slots"
FROM sum
WHERE total_slots = (SELECT MAX(total_slots) FROM sum);
