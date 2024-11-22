
INSERT INTO dealership.dealerships (name, address, phone) 
VALUES 
    ('Fast Wheels Dealership', '123 Main St, Springfield', '123-456-7890'),
    ('Premium Auto Sales', '456 Elm St, Shelbyville', '987-654-3210'),
    ('Luxury Motors', '789 Oak St, Capital City', '555-123-4567'),
    ('EcoDrive Autos', '101 Maple St, Greenfield', '222-333-4444'),
    ('High Performance Garage', '202 Birch St, Metro City', '777-888-9999');
    
   
INSERT INTO dealership.vehicles (vin, year, make, model, vehicleType, color, odometer, price) 
VALUES 
    ('1HGCM82633A123456', 2019, 'Honda', 'Civic', 'Sedan', 'Blue', 45000, 18000.00),
    ('1FAFP4041WF123789', 2021, 'Ford', 'Mustang', 'Coupe', 'Red', 12000, 35000.00),
    ('2T3ZF4DV4BW123456', 2020, 'Toyota', 'RAV4', 'SUV', 'White', 25000, 28000.00),
    ('3GNEK18Z91G123456', 2018, 'Chevrolet', 'Tahoe', 'SUV', 'Black', 60000, 32000.00),
    ('5N1AT2MV3KC123456', 2022, 'Nissan', 'Rogue', 'SUV', 'Silver', 5000, 25000.00),
    ('1J4FA49S76P123456', 2017, 'Jeep', 'Wrangler', 'Off-road', 'Green', 75000, 29000.00),
    ('4T1BE46K58U123456', 2016, 'Toyota', 'Camry', 'Sedan', 'Gray', 80000, 15000.00),
    ('3VW2B7AJ9HM123456', 2019, 'Volkswagen', 'Jetta', 'Sedan', 'White', 30000, 19000.00);
    
INSERT INTO dealership.inventory (dealership_id, vin) 
VALUES 
    (1, 1), -- Fast Wheels Dealership has Honda Civic
    (1, 3), -- Fast Wheels Dealership has Toyota RAV4
    (2, 2), -- Premium Auto Sales has Ford Mustang
    (2, 5), -- Premium Auto Sales has Nissan Rogue
    (3, 4), -- Luxury Motors has Chevrolet Tahoe
    (3, 6), -- Luxury Motors has Jeep Wrangler
    (4, 7), -- EcoDrive Autos has Toyota Camry
    (5, 8); -- High Performance Garage has Volkswagen Jetta
    
INSERT INTO dealership.sales_contracts (vehicle_id, dealership_id, sales_tax, total_price, recording_fee, processing_fee, monthly_payment, is_finance) 
VALUES 
    (1, 1, 1080.00, 19080.00, 100.00, 200.00, 0.00, FALSE), -- Honda Civic sold by Fast Wheels
    (2, 2, 2100.00, 37100.00, 100.00, 250.00, 0.00, FALSE), -- Ford Mustang sold by Premium Auto Sales
    (3, 1, 1680.00, 29680.00, 100.00, 150.00, 0.00, FALSE), -- Toyota RAV4 sold by Fast Wheels
    (4, 3, 1920.00, 33920.00, 100.00, 300.00, 0.00, FALSE); -- Chevrolet Tahoe sold by Luxury Motors
    

INSERT INTO dealership.lease_contracts (vehicle_id, dealership_id, excepted_ending_value, lease_fee, total_price, monthly_payment, lease_duration, is_lease) 
VALUES 
    (5, 2, 15000.00, 500.00, 26500.00, 450.00, 36, TRUE), -- Nissan Rogue leased by Premium Auto Sales
    (6, 3, 18000.00, 800.00, 29800.00, 500.00, 24, TRUE), -- Jeep Wrangler leased by Luxury Motors
    (7, 4, 10000.00, 300.00, 15300.00, 200.00, 48, TRUE), -- Toyota Camry leased by EcoDrive Autos
    (8, 5, 14000.00, 400.00, 19400.00, 380.00, 36, TRUE); -- Volkswagen Jetta leased by High Performance Garage
    
    
    
    
 -- adding more data for problem 5
    
 -- Adding a vehicle for sale
INSERT INTO dealership.vehicles (vin, year, make, model, vehicleType, color, odometer, price)
VALUES ('1HGBH41JXMN123456', 2021, 'Toyota', 'Camry', 'Sedan', 'Black', 15000, 25000.00);

-- Adding a vehicle for lease
INSERT INTO dealership.vehicles (vin, year, make, model, vehicleType, color, odometer, price)
VALUES ('1HGCM82633A123780', 2021, 'Toyota', 'Camry', 'Sedan', 'Black', 12000, 24000.00);

-- Adding the vehicle for sale to dealership with ID 1
INSERT INTO dealership.inventory (dealership_id, vin)
VALUES (1, '1HGBH41JXMN123456');

-- Adding the vehicle for lease to dealership with ID 2
INSERT INTO dealership.inventory (dealership_id, vin)
VALUES (2, '1HGCM82633A123780');

INSERT INTO dealership.sales_contracts (vehicle_id, dealership_id, sales_tax, total_price, recording_fee, processing_fee, monthly_payment, is_finance)
VALUES (
    (SELECT vehicle_id FROM dealership.vehicles WHERE vin = '1HGBH41JXMN123456'), 
    1, 
    1500.00, 
    26500.00, 
    100.00, 
    495.00, 
    0.00, 
    FALSE
);

INSERT INTO dealership.lease_contracts (vehicle_id, dealership_id, excepted_ending_value, lease_fee, total_price, monthly_payment, lease_duration, is_lease)
VALUES (
    (SELECT vehicle_id FROM dealership.vehicles WHERE vin = '1HGCM82633A123780'), 
    2, 
    12000.00, 
    500.00, 
    24500.00, 
    450.00, 
    36, 
    TRUE
);