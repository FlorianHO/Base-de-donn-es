SELECT COUNT(arrival_city), arrival_city 
FROM STEP
group by arrival_city
order by count(arrival_city) desc;

