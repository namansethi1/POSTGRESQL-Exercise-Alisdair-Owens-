-- Combine unique surnames from members and names from facilities into a single list.
SELECT 
    surname 
FROM 
    cd.members
UNION
SELECT 
    name 
FROM 
    cd.facilities;
