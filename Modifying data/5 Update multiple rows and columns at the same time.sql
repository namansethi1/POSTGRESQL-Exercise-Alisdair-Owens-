-- Update membercost and guestcost for facilities with names containing 'Tennis Court'.
UPDATE cd.facilities
SET 
    membercost = 6,
    guestcost = 30
WHERE 
    name LIKE '%Tennis Court%';
