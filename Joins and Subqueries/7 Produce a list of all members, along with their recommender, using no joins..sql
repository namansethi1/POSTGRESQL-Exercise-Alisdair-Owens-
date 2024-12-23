-- Retrieve distinct members and their recommenders (if any).
SELECT 
    DISTINCT m.firstname || ' ' || m.surname AS member,
    (SELECT rec.firstname || ' ' || rec.surname 
     FROM cd.members AS rec 
     WHERE m.recommendedby = rec.memid) AS recommender
FROM 
    cd.members AS m
ORDER BY 
    member;
