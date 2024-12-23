-- Pads the zipcode with leading zeros to ensure it has a total length of 5 characters.
SELECT
    repeat('0', 5 - length(CAST(zipcode AS TEXT))) || CAST(zipcode AS TEXT) AS zip
FROM
    cd.members
ORDER BY
    zipcode;
