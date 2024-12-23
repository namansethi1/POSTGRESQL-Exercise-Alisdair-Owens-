-- Calculate total slots for each facility grouped by month for the year 2012
SELECT
    facid,
    EXTRACT(month FROM starttime) AS month,
    SUM(slots) AS slots
FROM
    cd.bookings
WHERE
    EXTRACT(year FROM starttime) = 2012
GROUP BY
    facid, month

UNION ALL

-- Calculate total slots for each facility for the entire year 2012
SELECT
    facid,
    NULL AS month, -- Month is NULL as this is for the entire year
    SUM(slots) AS slots
FROM
    cd.bookings
WHERE
    EXTRACT(year FROM starttime) = 2012
GROUP BY
    facid, EXTRACT(YEAR FROM starttime)

UNION ALL

-- Calculate total slots across all facilities for the entire year 2012
SELECT
    NULL AS facid, -- Facility is NULL as this is across all facilities
    NULL AS month, -- Month is NULL as this is for the entire year
    SUM(slots) AS slots
FROM
    cd.bookings
WHERE
    EXTRACT(year FROM starttime) = 2012

-- Order the results by facility and month, NULL values will appear last
ORDER BY
    facid, month;


-- ############### OR ###############


-- Calculate total slots for each facility and month in 2012, including subtotals and grand totals
SELECT
    facid,
    EXTRACT(month FROM starttime) AS month,
    SUM(slots) AS slots
FROM
    cd.bookings
WHERE
    EXTRACT(year FROM starttime) = 2012
GROUP BY
    ROLLUP(facid, EXTRACT(month FROM starttime))
ORDER BY
    facid, month;
