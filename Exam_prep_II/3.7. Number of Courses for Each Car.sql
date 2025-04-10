SELECT
	c.id AS car_id,
	c.make,
	c.mileage,
	COUNT(cu.id) AS count_of_courses,
	ROUND(AVG(cu.bill), 2) AS average_bill
FROM
	cars AS c
LEFT JOIN
	courses AS cu
ON
	cu.car_id = c.id
GROUP BY
	c.id
HAVING
	COUNT(cu.id) <> 2
ORDER BY
	count_of_courses DESC,
	c.id ASC



