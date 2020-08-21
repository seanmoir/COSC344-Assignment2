DROP TABLE employee_phone_num;
DROP TABLE customer_phone_num;
DROP TABLE address;
DROP TABLE contains;
DROP TABLE orders;
DROP TABLE products;
DROP TABLE categorys;
DROP TABLE payment;
DROP TABLE delivery;
DROP TABLE employees;
DROP TABLE customer;

CREATE TABLE customer
       (customer_ID INT PRIMARY KEY,
       address_ID INT REFERENCE address(address_ID),
       fname VARCHAR(25) NOT NULL,
       mname VARCHAR(25),
       lname VARCHAR(25) NOT NULL,
       dob DATE NOT NULL,
       email VARCHAR(25) NOT NULL,
       );

CREATE TABLE delivery
       (delivery_ID INT PRIMARY KEY,
       delivery_date DATE NOT NULL,
       address_ID INT REFERENCE address(address_ID));
				
CREATE TABLE categorys
       (category_ID INT PRIMARY KEY,
       category_name VARCHAR(15) NOT NULL);

CREATE TABLE products
       (product_name VARCHAR(25) PRIMARY KEY, 
       category_ID INT REFERENCES categorys(category_ID),
       item_description VARCHAR(20),
       price NUMERIC(15,2) NOT NULL,
       wholesale_cost NUMERIC(15,2) NOT NULL);

CREATE TABLE payment
       (payment_ID INT PRIMARY KEY,
       credit_card_num INT NOT NULL,
       name_on_card VARCHAR(25) NOT NULL,
       expiry_month INT NOT NULL,
       expiry_year INT NOT NULL,
       crc_num INT NOT NULL);
			      
CREATE TABLE employees
       (employee_ID INT PRIMARY KEY,
       employee_fname VARCHAR(30) NOT NULL,
       employee_mname VARCHAR(30),
       employee_lname VARCHAR(30) NOT NULL,
       employee_DOB DATE NOT NULL,
       start_date DATE NOT NULL,
       payment_account VARCHAR(20) NOT NULL,
       address_ID INT REFERENCE address(address_ID),
       employee_position VARCHAR(15) NOT NULL);

CREATE TABLE orders
       (order_ID INT Primary KEY,
       order_Status VARCHAR(20) NOT NULL,
       order_Received DATE NOT NULL,
       price NUMERIC(15,2) NOT NULL,
       GST NUMERIC(15,2) NOT NULL,
       customer_ID INT REFERENCES customer(customer_ID),
       request_date DATE NOT NULL,
       payment_ID INT REFERENCES payment(payment_ID),
       payment_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
       delivery_ID INT REFERENCES delivery(delivery_ID),
       employee_ID INT REFERENCES employees(employee_ID)
       );

CREATE TABLE contains
       (order_ID INT REFERENCES orders,
       product_name VARCHAR(25) REFERENCES products(product_name),
       product_price INT NOT NULL,
       product_quantity INT NOT NULL);

CREATE TABLE employee_phone_num
       (employee_ID INT REFERENCES employees(employee_ID),
       phone_number INT NOT NULL);

CREATE TABLE customer_phone_num
       (customer_ID INT REFERENCES customer(customer_ID),
       phone_number INT NOT NULL);

CREATE TABLE address 
      (address_ID INT PRIMARY KEY,
       street_num VARCHAR(30) NOT NULL,
       street_name VARCHAR(30) NOT NULL,
       suburb VARCHAR(30) NOT NULL,
       country VARCHAR(30) NOT NULL);		 

INSERT INTO customer(customer_ID, fname, mname, lname, dob, email, street_num, suburb, street_name, country)
	VALUES(1, 'test', 'm', 'test', to_date('01/01/2001', 'DD/MM/YYYY'), 'test@xyz.com', '01', 'suburbia', 'yeet', 'NZ');

COMMIT;

