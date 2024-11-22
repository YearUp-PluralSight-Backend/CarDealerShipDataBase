-- 1. -- find all dealerships
SELECT 
	*
FROM 
	dealership.dealerships; 

-- 1.1 show all the vehicles
SELECT 
	*
FROM 
	dealership.vehicles v ;
	
-- 1.2 show all the inventory
SELECT 
	*
FROM 
	dealership.inventory i ;


-- 2. -- find all vehicles for a specific delaership
SELECT 
    *
FROM 
    dealership.inventory i
JOIN
    dealership.dealerships d 
    ON i.dealership_id = d.dealership_id 
JOIN 
    dealership.vehicles v 
    ON i.vin = v.vin
WHERE 
    d.dealership_id = 2;

-- 3. -- get vehicle by vin number
SELECT
	*
FROM 
	dealership.vehicles v 
WHERE v.vin = '2T3ZF4DV4BW123456'  

-- 4. find the dealership where a certain car is located, by vin
SELECT 
	d.name,
	d.address,
	d.phone 
FROM 
	dealership.inventory i 
JOIN
	dealership.vehicles v 
	ON i.vin  = v.vin 
JOIN 
	dealership.dealerships d 
	ON i.dealership_id = d.dealership_id 
WHERE v.vin = '1HGCM82633A123456'

-- 5. 
	SELECT 
	d.name,
	d.address,
	d.phone 
FROM 
	dealership.inventory i 
JOIN
	dealership.vehicles v 
	ON i.vin  = v.vin 
JOIN 
	dealership.dealerships d 
	ON i.dealership_id = d.dealership_id 
WHERE v.color = 'Black' and v.make = 'Toyota'


-- 6.
SELECT 
	*
FROM 
	dealership.sales_contracts sc 
WHERE sc
