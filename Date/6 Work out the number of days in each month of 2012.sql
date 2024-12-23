-- Calculate the number of days remaining in the current month
SELECT 
    (
        date_trunc('month', TIMESTAMP '2012-02-11 01:00:00') + INTERVAL '1 month'
    ) - date_trunc('day', TIMESTAMP '2012-02-11 01:00:00') AS days_remaining;
