DELETE FROM
	colonists
WHERE
	id NOT IN (SELECT colonist_id FROM assignments)
;