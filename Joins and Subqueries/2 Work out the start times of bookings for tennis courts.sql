-- Retrieve the start time and name of facilities for bookings on '2012-09-21' for 'Tennis Court' facilities.
SELECT 
    booking.starttime AS start, 
    facility.name 
FROM 
    cd.facilities AS facility
JOIN 
    cd.bookings AS booking 
    ON facility.facid = booking.facid
WHERE 
    facility.name LIKE '%Tennis Court%' 
    AND DATE(booking.starttime) = '2012-09-21'
ORDER BY 
    start;
