SELECT (intra.Travel_intra)/(num.Travel) AS 'Proportion_Intra-city', (inter.Travel_inter)/(num.Travel) AS 'Proportion_Inter-city'
FROM
(SELECT count(travel_number) AS 'Travel_intra'
FROM travel 
where number_cities = 1) intra,

(SELECT count(travel_number) AS 'Travel_inter'
FROM travel 
where number_cities > 1) inter,

(SELECT count(travel_number) AS 'Travel'
FROM travel) num;