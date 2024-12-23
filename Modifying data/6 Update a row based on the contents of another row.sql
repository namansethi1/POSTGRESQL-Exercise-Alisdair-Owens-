-- Increase guestcost and membercost by 10% for the facility named 'Tennis Court 2'.
UPDATE cd.facilities
SET 
    guestcost = guestcost + (0.1 * guestcost),
    membercost = membercost + (0.1 * membercost)
WHERE 
    name = 'Tennis Court 2';
