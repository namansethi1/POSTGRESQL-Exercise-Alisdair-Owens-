-- Find the upward recommendation chain for member ID 27, excluding the base case
WITH RECURSIVE recommendation_chain AS (
    SELECT
        m.memid,
        m.firstname,
        m.surname,
        m.recommendedby
    FROM
        cd.members m
    WHERE
        m.memid = 27
    
    UNION ALL

    SELECT
        m.memid,
        m.firstname,
        m.surname,
        m.recommendedby
    FROM
        cd.members m
    JOIN
        recommendation_chain rc ON m.memid = rc.recommendedby
)
-- Select the final results from the recursive query
SELECT
    memid,
    firstname,
    surname
FROM
    recommendation_chain
WHERE
    memid <> 27
ORDER BY
    memid DESC;
