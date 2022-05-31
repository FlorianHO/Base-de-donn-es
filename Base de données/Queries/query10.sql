select avg(ticket_fare) as average_cost, means_transport
from step
group by means_transport;