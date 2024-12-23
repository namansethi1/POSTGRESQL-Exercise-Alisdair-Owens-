WITH total_slots AS (
    SELECT
        facid,
        SUM(slots)  -- Calculate the total slots for each facility
    FROM
        cd.bookings
    GROUP BY
        facid
)
-- Retrieve the facility with the maximum total slots
SELECT facid, sum AS total 
FROM total_slots 
WHERE sum = (SELECT MAX(sum) FROM total_slots);


-- ############### OR ###############


SELECT facid, sum AS total 
FROM (
    SELECT
        facid,
        SUM(slots) AS sum,  -- Calculate total slots for each facility
        RANK() OVER (ORDER BY SUM(slots) DESC) AS rank  -- Rank facilities by total slots in descending order
    FROM
        cd.bookings
    GROUP BY
        facid
) AS total_slots 
WHERE rank = 1;
