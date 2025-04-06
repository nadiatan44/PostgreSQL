SELECT
    o.name,
    COUNT(a.id) AS count_of_animals
FROM
    owners o
LEFT JOIN
    animals a
ON
	o.id = a.owner_id
GROUP BY
    o.id
ORDER BY
    count_of_animals DESC,
    o.name ASC
LIMIT 5;
