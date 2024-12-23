-- Find the downward recommendation chain starting from the member with recommendedby = 1
WITH RECURSIVE downgrade_recommendation AS (
  -- Base case: find members directly recommended by member 1
  SELECT memid, firstname, surname, recommendedby
  FROM cd.members 
  WHERE recommendedby = 1
  
  UNION ALL
  
  -- Recursive case: find members recommended by the members already in the chain
  SELECT m.memid, m.firstname, m.surname, m.recommendedby
  FROM cd.members m
  JOIN downgrade_recommendation r ON r.memid = m.recommendedby
)
-- Select the final results from the recursive query
SELECT
    memid,
    firstname,
    surname
FROM
    downgrade_recommendation
ORDER BY
    memid;
