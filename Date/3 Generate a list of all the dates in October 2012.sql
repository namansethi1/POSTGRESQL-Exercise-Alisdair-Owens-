-- Generate a series of timestamps for each day in October 2012
SELECT 
    generate_series('2012-10-01', '2012-10-31', INTERVAL '1 day') AS ts;
