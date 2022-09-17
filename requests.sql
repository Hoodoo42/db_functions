INSERT INTO dealership (name, location, date_established) VALUES('Dale\'s Dealership', 'Detroit', '1983-02-23'), ('Carl\'s Cars', 'Carolina', '2002-06-14'), ('Otto\'s Automotives', 'Orlando', '1994-10-11');
INSERT INTO for_sale_cars (dealership_id, make, model, `year`) 
VALUES (2, 'Toyota', 'Corolla', '2002'),(3,'BMW', 'Z4', '2018'),(3, 'Lexus', 'ES 350', '2013'),(1, 'toyota', 'Camry', '2020'),(2,'BMW', 'M8 Gran Coupe', '1988'),(1,'Chevrolet', 'Camaro', '1967'),(1,'Ford', 'Bronco', '2022'),(2,'Ford', 'Mustang', '1970'),(3,'Toyota', 'RAV4', '2009'),(2,'Lexus', 'GX 460', '2022');

SELECT make, model, `year` FROM for_sale_cars fsc ORDER BY `year` DESC ;

SELECT name, location FROM dealership d ORDER BY date_established ASC LIMIT 1;

SELECT d.name, d.location, fsc.make, fsc.model, fsc.`year` 
FROM dealership d  INNER JOIN for_sale_cars fsc ON fsc.dealership_id = d.id 
WHERE fsc.`year` >= '2021-01-01' ORDER BY fsc.`year` ; 

SELECT COUNT(id) FROM for_sale_cars fsc WHERE `year` = 2019;

SELECT COUNT(fsc.id) 
FROM for_sale_cars fsc INNER JOIN dealership d ON fsc.dealership_id = d.id 
GROUP BY d.id 
ORDER BY d.date_established DESC LIMIT 1;



SELECT COUNT(fsc.id) 
FROM for_sale_cars fsc INNER JOIN dealership d ON fsc.dealership_id =d.id 
GROUP BY fsc.dealership_id;


SELECT COUNT(fsc.id) 
FROM for_sale_cars fsc INNER JOIN dealership d ON fsc.dealership_id =d.id 
GROUP BY fsc.dealership_id
HAVING COUNT(fsc.id) >= 10;

SELECT COUNT(fsc.id), d.id
FROM for_sale_cars fsc INNER JOIN dealership d ON fsc.dealership_id =d.id 
WHERE fsc.`year` > '2020' 
GROUP BY d.id
HAVING COUNT(fsc.id) >= 1;

SELECT COUNT(fsc.id), d.id
FROM for_sale_cars fsc INNER JOIN dealership d ON fsc.dealership_id =d.id 
WHERE fsc.`year` > '2020' AND fsc.model LIKE ('%x%') 
GROUP BY d.id
HAVING COUNT(fsc.id) >= 5;