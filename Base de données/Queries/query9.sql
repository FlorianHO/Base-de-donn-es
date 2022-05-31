SELECT MAX(transport.Means) AS 'Max_Means', transport.means_transport as 'Means_transport'
FROM
(SELECT count(means_transport) AS 'Means', means_transport
FROM STEP
WHERE departure_date BETWEEN DATE_SUB(NOW(),INTERVAL 3 MONTH) AND NOW()
GROUP BY (means_transport)
ORDER BY COUNT(means_transport) DESC) AS transport;