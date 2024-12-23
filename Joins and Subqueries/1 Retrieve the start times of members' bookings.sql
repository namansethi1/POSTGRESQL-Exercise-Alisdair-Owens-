-- Retrieve the start time of bookings for the member 'David Farrell'.
SELECT 
    booking.starttime 
FROM 
    cd.members AS member
JOIN 
    cd.bookings AS booking 
    ON member.memid = booking.memid
WHERE 
    member.surname = 'Farrell' 
    AND member.firstname = 'David';
