-- Retrieve the first booking date for each member after September 1, 2012
SELECT
    surname,
    firstname,
    m.memid,
    MIN(starttime) AS first_booking
FROM
    cd.members m
JOIN
    cd.bookings b ON m.memid = b.memid
WHERE
    starttime > '2012-09-01'
GROUP BY
    m.memid, surname, firstname
ORDER BY
    memid;
