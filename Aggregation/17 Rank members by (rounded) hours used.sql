-- Calculate adjusted booking hours for each member and assign ranks based on the calculated hours
SELECT 
    firstname, 
    surname,
    ((SUM(bks.slots) + 10) / 20) * 10 AS hours,
    RANK() OVER (ORDER BY ((SUM(bks.slots) + 10) / 20) * 10 DESC) AS rank
FROM 
    cd.bookings bks
INNER JOIN 
    cd.members mems
    ON bks.memid = mems.memid
GROUP BY 
    mems.memid
ORDER BY 
    rank, surname, firstname;
