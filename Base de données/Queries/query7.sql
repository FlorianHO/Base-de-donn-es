SELECT COUNT(*) AS 'Number_Travel_Plane_Autobus' FROM
(SELECT travel_number
FROM step 
where travel_number NOT IN (select travel_number from step where means_transport != 'Plane' AND  means_transport != 'Autobus') 
AND travel_number  IN (select travel_number from step where means_transport != 'Plane' AND  means_transport != 'Plane')
AND travel_number  IN (select travel_number from step where means_transport != 'Autobus' AND  means_transport != 'Autobus')
group by travel_number
HAVING count(travel_number) > 1
ORDER BY travel_number) AS Plane_Autobus;