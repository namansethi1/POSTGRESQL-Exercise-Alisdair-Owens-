-- Get the total number of members along with their first and last names, grouped by member ID
SELECT
    (SELECT count(*) FROM cd.members) AS total_members,  -- Subquery to count total members
    firstname,
    surname
FROM
    cd.members
GROUP BY
    memid, firstname, surname 
ORDER BY
    joindate;


-- -- ############### OR ###############


-- Get the total number of members as a window function, along with first and last names, grouped by member ID
SELECT
    count(*) OVER () AS total_members,  -- Window function to count the total number of members
    firstname,
    surname
FROM
    cd.members
GROUP BY
    memid, firstname, surname 
ORDER BY
    joindate;
