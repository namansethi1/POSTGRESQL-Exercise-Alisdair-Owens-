-- This query counts the number of bookings for each month, grouped by the start of the month.
SELECT 
    date_trunc('month', starttime) AS month,  
    COUNT(*)  
FROM 
    cd.bookings  
GROUP BY 
    month  
ORDER BY 
    month;
