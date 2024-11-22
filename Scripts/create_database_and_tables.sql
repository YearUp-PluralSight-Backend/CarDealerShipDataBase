-- 1.
CREATE database IF NOT EXISTS dealership;

use dealership;

CREATE TABLE IF NOT EXISTS dealerships (
	dealership_id INT AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(50) NOT NULL,
	address VARCHAR(50) NOT NULL,
	phone VARCHAR(12) NOT NULL

);

CREATE TABLE IF NOT EXISTS vehicles (
    vehicle_id INT AUTO_INCREMENT PRIMARY KEY, 
    vin VARCHAR(17) UNIQUE,           
    year YEAR NOT NULL,
    make VARCHAR(50) NOT NULL,
    model VARCHAR(50) NOT NULL,
    vehicleType VARCHAR(50) NOT NULL,
    color VARCHAR(30) NOT NULL,
    odometer INT NOT NULL,
    price DECIMAL(10, 2) NOT NULL
);


CREATE TABLE IF NOT EXISTS inventory (
	inventory_id INT AUTO_INCREMENT PRIMARY KEY,
	dealership_id INT NOT NULL,
	vin VARCHAR(17) UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS sales_contracts (
    sale_contract_id INT AUTO_INCREMENT PRIMARY KEY,
    vehicle_id INT UNIQUE NOT NULL,
    dealership_id INT UNIQUE NOT NULL,
    sales_tax DECIMAL(10, 2) NOT NULL DEFAULT 0.00,
    total_price DECIMAL(10, 2) NOT NULL DEFAULT 0.00,
    recording_fee DECIMAL(10, 2) DEFAULT 100.00,
    processing_fee DECIMAL(10, 2) NOT NULL DEFAULT 0.00,
    monthly_payment DECIMAL(10, 2) NOT NULL DEFAULT 0.00,
    is_finance BOOLEAN NOT NULL DEFAULT FALSE,
    FOREIGN KEY (vehicle_id) REFERENCES vehicles(vehicle_id),
    FOREIGN KEY (dealership_id) REFERENCES dealerships(dealership_id)
);

CREATE TABLE IF NOT EXISTS lease_contracts (
    lease_contract_id INT AUTO_INCREMENT PRIMARY KEY,
    vehicle_id INT NOT NULL,
    dealership_id INT NOT NULL,
    excepted_ending_value DECIMAL(10, 2) NOT NULL DEFAULT 0.00,
    lease_fee DECIMAL(10, 2) NOT NULL DEFAULT 0.00,
    total_price DECIMAL(10, 2) NOT NULL DEFAULT 0.00,
    monthly_payment DECIMAL(10, 2) NOT NULL DEFAULT 0.00,
    lease_duration INT NOT NULL CHECK (lease_duration > 0) DEFAULT 12,
    is_lease BOOLEAN NOT NULL DEFAULT TRUE,
    FOREIGN KEY (vehicle_id) REFERENCES vehicles(vehicle_id),
    FOREIGN KEY (dealership_id) REFERENCES dealerships(dealership_id)
);



