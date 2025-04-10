SELECT
	d.first_name,
	d.last_name,
	c.make,
	c.model,
	c.mileage
FROM
	cars_drivers AS cd
JOIN
	cars AS c
ON
	cd.car_id = c.id
JOIN
	drivers AS d
ON
	d.id = cd.driver_id
WHERE
	c.mileage is NOT NULL
ORDER BY
	c.mileage DESC,
	d.first_name ASC


