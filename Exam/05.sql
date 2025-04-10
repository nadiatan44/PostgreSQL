SELECT
	id,
	last_name,
	identity
FROM
	colonists
WHERE
	identity LIKE '%00%'
  		AND
	last_name LIKE '%s'
ORDER BY
	last_name DESC,
	identity ASC
;
