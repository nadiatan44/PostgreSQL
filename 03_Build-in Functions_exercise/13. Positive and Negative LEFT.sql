SELECT
	peak_name,
	LEFT(peak_name, 4) AS positiv_left,
	LEFT(peak_name, -4) AS negtiv_left

FROM
	peaks