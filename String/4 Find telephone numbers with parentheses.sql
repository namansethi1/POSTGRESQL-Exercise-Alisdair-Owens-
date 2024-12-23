-- Retrieves the memid and telephone for members whose telephone number starts with the pattern '(___)'.
SELECT
    memid,
    telephone
FROM
    cd.members
WHERE
    telephone LIKE '(___)%'  -- Matches telephone numbers starting with the format '(...)'
ORDER BY
    memid;
