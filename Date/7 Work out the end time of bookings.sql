-- Calculate the end time by adding an interval (slots * 30 minutes) to the start time and order the results by end time and start time
SELECT
    starttime,
    starttime + (slots * 30 || ' min')::INTERVAL AS endtime
FROM
    cd.bookings
ORDER BY
    endtime DESC, starttime DESC
LIMIT
    10;
