SELECT
	title
FROM
	books
WHERE
	 title LIKE 'The%'
--WHERE substring(title, 1, 3) = 'The'--
--WHERE left(title, 3) = 'The'--
ORDER BY
	id