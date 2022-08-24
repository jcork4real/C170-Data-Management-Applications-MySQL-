-- Create Tables

CREATE TABLE COFFEE_SHOP (
  `shop_id` INT AUTO_INCREMENT NOT NULL,
  `shop_name` VARCHAR(50),
  `city` VARCHAR(50),
  `state` CHAR(2),
  PRIMARY KEY (`shop_id`)
);

CREATE TABLE EMPLOYEE (
  `employee_id` INT AUTO_INCREMENT NOT NULL,
  `first_name` VARCHAR(30),
  `last_name` VARCHAR(30),
  `hire_date` DATE,
  `job_title` VARCHAR(30),
  `shop_id` INT,
  PRIMARY KEY (`employee_id`),
  FOREIGN KEY (`shop_id`) REFERENCES COFFEE_SHOP(`shop_id`)
);

CREATE TABLE SUPPLIER (
  `supplier_id` INT AUTO_INCREMENT NOT NULL,
  `company_name` VARCHAR(50),
  `country` VARCHAR(30),
  `sales_contact_name` VARCHAR(60),
  `email` VARCHAR(50),
  PRIMARY KEY (`supplier_id`)
);

CREATE TABLE COFFEE (
  `coffee_id` INT AUTO_INCREMENT NOT NULL,
  `shop_id` INT,
  `supplier_id` INT,
  `coffee_name` VARCHAR(30),
  `price_per_pound` NUMERIC(5,2),
  PRIMARY KEY (`coffee_id`),
  FOREIGN KEY (`shop_id`) REFERENCES COFFEE_SHOP(`shop_id`),
  FOREIGN KEY (`supplier_id`) REFERENCES SUPPLIER(`supplier_id`)
);

-- Populate each table w/ three rows of data

INSERT INTO COFFEE_SHOP (shop_id, shop_name, city, state)
VALUES
  (NULL,'Bravo','Tustin','CA'),
  (NULL,'Echo','Irvine','CA'),
  (NULL,'Charlie','Newport','CA');
  
INSERT INTO EMPLOYEE (employee_id, first_name, last_name, 
                        hire_date, job_title, shop_id)
VALUES
  (NULL,'Jarone','McCorkle','2022-04-12','Software Engineer', 1),
  (NULL,'Nancy','Tran','2022-10-12','Receptionist', 2),
  (NULL,'Calvin','Klein','2022-09-12','Designer', 3);
  
INSERT INTO SUPPLIER (supplier_id, company_name, country, 
                      sales_contact_name, email)
VALUES
  (NULL,'Balenciaga','Italy','Post Malone','postmalone@gmail.com'),
  (NULL,'Nordstrom','France','Jay Z','jayz@yahoo.com'),
  (NULL,'Palace','United States','Kurt Cobain','kurtcobain@proton.me');
  
INSERT INTO COFFEE (coffee_id, shop_id, supplier_id, 
                      coffee_name, price_per_pound)
VALUES
  (NULL, 1, 1,'mocha', 9.25),
  (NULL, 2, 2, 'vanilla', 4.25),
  (NULL, 3, 3, 'decaf', 12.52);
  
-- Create View
CREATE VIEW Employee_View AS SELECT
CONCAT(first_name, ' ' , last_name) AS employee_full_name,
first_name, last_name, hire_date, job_title, shop_id
FROM EMPLOYEE;

-- Create Index
CREATE INDEX IDX_coffee_name
ON COFFEE (coffee_name);