

create database transport_bus;
use transport_bus;
CREATE TABLE Registration (
    Id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    Name VARCHAR(20),
    Address VARCHAR(100),
    Email VARCHAR(50),
    Password VARCHAR(20),
    Profile_pic BLOB,
     FOREIGN KEY (bus_id) REFERENCES bus_info(bus_id),
    FOREIGN KEY (route_id) REFERENCES route(Route_id),
    bus_id INT,
    route_id INT,
    CONSTRAINT CHK_Password CHECK (
        LENGTH(Password) >= 8 AND
        Password LIKE '%[A-Z]%' AND
        Password LIKE '%[a-z]%' AND
        Password LIKE '%[0-9]%' AND
        Password LIKE '%[!@#$%^&*()-_=+{};:,<.>/?]%'
    ),
manager_id int,
FOREIGN KEY (manager_id) REFERENCES transport_manager(manager_id)


);
select*from registration;

CREATE TABLE bus_info (
    bus_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    model_no INT,
    bus_no VARCHAR(10),
    no_of_seats INT,
   
    driver_id INT,
 
    FOREIGN KEY (driver_id) REFERENCES driver(driver_id)
);

CREATE TABLE route (
    Route_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    starting_point VARCHAR(20),
    end_point VARCHAR(20),
    no_of_stops INT,
    stop_id INT,
    FOREIGN KEY (stop_id) REFERENCES stop(stop_id)
);

CREATE TABLE stop (
    stop_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    stop_name VARCHAR(20),
    stop_fee INT
);

CREATE TABLE driver (
    driver_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    driver_name VARCHAR(20),
    contact_no BIGINT
);

CREATE TABLE transport_manager (
    manager_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    manager_name VARCHAR(20),
    m_contact_no BIGINT,
    m_cnic BIGINT
  
);
