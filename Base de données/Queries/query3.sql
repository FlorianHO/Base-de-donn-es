SELECT AVG(p_sum.Sum)
FROM
(SELECT SUM(payment_amount) AS 'Sum'
FROM payment_steps 
GROUP BY (travel_number)) p_sum;