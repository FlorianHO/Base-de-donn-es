delimiter //
create procedure query14
(in dat date)
SELECT payment_method, COUNT(*) AS mostpayment 
FROM payment_steps
where payment_date > dat
GROUP BY payment_method
ORDER BY mostpayment DESC;
end //
delimiter ;

call query14('2020-05-26');