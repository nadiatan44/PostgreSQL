SELECT
    CONCAT('Planet: ', p.name) AS planet_name,
    COUNT(s.id) AS station_count,
    TRUNC(AVG(s.max_capacity), 2) AS avg_capacity
FROM
    planets AS p
LEFT JOIN
    stations AS s
ON
	p.id = s.planet_id
GROUP BY
    p.name
ORDER BY
    station_count DESC,
    avg_capacity DESC,
    planet_name ASC
;