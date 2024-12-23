-- Removes characters '-', '(', ')', and space from the telephone column.
SELECT
    memid,
    TRANSLATE(telephone, '-() ', '') AS telephone
FROM
    cd.members
ORDER BY
    memid;
