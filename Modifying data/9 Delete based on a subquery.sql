-- Delete members who do not have any bookings.
DELETE FROM cd.members m
WHERE m.memid NOT IN (
    SELECT b.memid
    FROM cd.bookings b
);
