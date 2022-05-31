SELECT (Nbr_senior.Senior)/(6) AS 'Average Senior'
FROM
(SELECT count(id_customer)  AS 'Senior'
FROM STEP NATURAL JOIN TRAVEL NATURAL JOIN customer
WHERE (customer_birthdate >= DATE_SUB(NOW(), interval 50 year)AND NOW()) AND (departure_date BETWEEN DATE_SUB(NOW(), INTERVAL 6 MONTH) AND NOW())) AS Nbr_senior;
