SELECT count(*) AS 'Number travel plane'
FROM
(select travel_number from step 
where travel_number NOT IN (SELECT travel_number from step where means_transport != 'Plane') group by travel_number) AS Plane;
