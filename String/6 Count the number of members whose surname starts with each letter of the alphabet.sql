-- Counts the number of members for each first letter of their surname.
SELECT
    SUBSTRING(surname FROM 1 FOR 1) AS letter,
    COUNT(*)
FROM
    cd.members
GROUP BY
    SUBSTRING(surname FROM 1 FOR 1)
ORDER BY
    letter;
