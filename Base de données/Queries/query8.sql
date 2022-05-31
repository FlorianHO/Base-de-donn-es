select count(substr(order_date, 6, 2)) as attractiveness, substr(order_date, 6, 2) as months	
from travel
group by months
order by attractiveness desc;