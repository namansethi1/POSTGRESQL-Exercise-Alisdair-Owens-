-- Count the number of members recommended by each person, excluding NULL values in recommendedby.
SELECT recommendedby, COUNT(*)
FROM cd.members
WHERE recommendedby IS NOT NULL
GROUP BY recommendedby
ORDER BY recommendedby;
