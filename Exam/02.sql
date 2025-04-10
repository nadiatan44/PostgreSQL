INSERT INTO
	spaceships (name, manufacturer, speed)
SELECT
    CONCAT(REVERSE(c.last_name), c.identity) AS name,
    CONCAT(UPPER(SUBSTRING(c.first_name, 1, 2)), TO_CHAR(c.birth_date, 'MM')) AS manufacturer,
    EXTRACT(YEAR FROM c.birth_date) + 100 AS speed
FROM
    colonists AS c
WHERE
    c.birth_date > '2001-01-01';