SELECT (Nbr_male.Male)/(Nbr_total.Total) AS 'Average Male', (Nbr_female.Female)/(Nbr_total.Total) AS 'Average Female'
FROM
(SELECT count(id_customer)  AS 'Male'
FROM STEP NATURAL JOIN TRAVEL NATURAL JOIN customer
WHERE customer_gender = 'Male' AND (departure_date BETWEEN DATE_SUB(NOW(), INTERVAL 6 MONTH) AND NOW())
group by customer_gender) AS Nbr_male,

(SELECT count(id_customer)  AS 'Female'
FROM STEP NATURAL JOIN TRAVEL NATURAL JOIN customer
WHERE customer_gender = 'Female' AND (departure_date BETWEEN DATE_SUB(NOW(), INTERVAL 6 MONTH) AND NOW())
group by customer_gender) AS Nbr_female,

(SELECT count(id_customer)  AS 'Total'
FROM STEP NATURAL JOIN TRAVEL NATURAL JOIN customer
WHERE (departure_date BETWEEN DATE_SUB(NOW(), INTERVAL 6 MONTH) AND NOW())) AS Nbr_total;