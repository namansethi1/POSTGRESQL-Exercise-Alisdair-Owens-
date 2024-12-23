-- Concatenates surname and firstname as "surname, firstname" for each member.
SELECT
    surname || ', ' || firstname AS name
FROM
    cd.members;
