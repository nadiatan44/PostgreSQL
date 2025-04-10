SELECT
    CONCAT(c.first_name, ' ', c.last_name) AS full_name,
    c.identity,
    CONCAT('Manager/', a.journey_id) AS role
FROM
    colonists AS c
JOIN
    assignments AS a
ON
	c.id = a.colonist_id
WHERE
    a.task = 'Management'
ORDER BY
    role DESC,
    c.identity ASC;