CREATE OR REPLACE VIEW
	view_addresses
AS
SELECT
	CONCAT(
		e.first_name,
		' ',
		e.last_name
	) AS full_name,
	department_id,
	CONCAT(
		a.number,
		' ',
		a.street
	) AS address
FROM
	employees AS e, addresses AS a
WHERE
	a.id = e.address_id
ORDER BY
	address