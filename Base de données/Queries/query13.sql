SELECT (Nbr_kids.kids)/(6) AS 'Average Kids'
FROM
(SELECT count(id_customer)  AS 'Kids'
FROM STEP NATURAL JOIN TRAVEL NATURAL JOIN customer
WHERE (customer_birthdate BETWEEN DATE_SUB(NOW(), interval 18 YEAR) AND NOW()) AND (departure_date BETWEEN DATE_SUB(NOW(), INTERVAL 6 MONTH) AND NOW())) AS Nbr_kids;
