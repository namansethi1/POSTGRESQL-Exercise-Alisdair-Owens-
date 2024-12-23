-- Retrieve distinct first names and surnames of members who were recommended by other members.
SELECT 
    DISTINCT recommender.firstname, 
    recommender.surname
FROM 
    cd.members AS member
JOIN 
    cd.members AS recommender 
    ON member.recommendedby = recommender.memid
ORDER BY 
    recommender.surname, recommender.firstname;
