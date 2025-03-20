SELECT
	peak_name,
	RIGHT(peak_name, 4) AS positiv_right,
	RIGHT(peak_name, -4) AS negtiv_right

FROM
	peaks