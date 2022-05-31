delimiter //
create procedure query16
(in num int(5))
select travel.travel_number, payment_amount, number_cities, min(departure_date)
from travel natural join payment_steps natural join step 
where travel.travel_number = num;
end //
delimiter ;

call query16(942);