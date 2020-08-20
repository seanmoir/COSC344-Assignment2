DROP TABLE delivery;
DROP TABLE categorys;
DROP TABLE customer;
DROP TABLE orders;
DROP TABLE delivery;
DROP TABLE products;
DROP TABLE payment;
DROP TABLE employees;
DROP TABLE customer_phone_num
DROP TABLE customer_phone_num

CREATE TABLE customer
       (customer_ID INT PRIMARY KEY,
       fname VARCHAR(25),
       mname VARCHAR(25),
       lname VARCHAR(25),
       dob DATE,
       email VARCHAR(25),
       street_num VARCHAR(30),
       suburb VARCHAR(30),
       street_name VARCHAR(30),
       country VARCHAR(30)
       );

CREATE TABLE orders
       (order_ID INT Primary KEY,
       order_Status VARCHAR(20),
       order_Received DATE,
       price NUMERIC(15,2),
       GST NUMERIC(15,2),
       customer_ID INT REFERENCES customer(customer_ID),
       request_date DATE,
       payment_ID INT REFERENCES payment(payment_ID),
       payment_timestamp TIMESTAMP DEFAULT TIMESTAMP,
       delivery_ID INT REFERENCES delivery(delivery_ID),
       employee_ID INT REFERENCES employee(employee_ID)
       );
       

CREATE TABLE delivery
       (delivery_ID INT PRIMARY KEY,
       delivery_date DATE,
       delivery_street_num VARCHAR(30),
       delivery_street_name VARCHAR(30),
       delivery_suburb VARCHAR(30),
       delivery_country VARCHAR(30));

CREATE TABLE categorys
       (category_ID INT PRIMARY KEY,
       category_name VARCHAR(15));

CREATE TABLE products
       (product_name VARCHAR(25) PRIMARY KEY, 
       category_ID INT REFERENCES categorys(category_ID),
       item_description VARCHAR(20),
       product_name VARCHAR(20),
       price NUMERIC(15,2),
       wholesale_cost NUMERIC(15,2));

CREATE TABLE payment
       (payment_ID INT PRIMARY KEY,
       credit_card_num INT,
       name_on_card VARCHAR(25),
       expiry_month INT,
       expiry_year INT,
       crc_num INT);



CREATE TABLE employees
       (employee_ID INT PRIMARY KEY,
       employee_fname VARCHAR(30),
       employee_mname VARCHAR(30),
       employee_lname VARCHAR(30),
       employee_DOB DATE,
       start_date DATE,
       payment_account VARCHAR(20),
       employee_street_num VARCHAR(30),
       employee_street_name VARCHAR(30),
       employee_suburb VARCHAR(30),
       employee_country VARCHAR(30),
       employee_position VARCHAR(15));

CREATE TABLE contain
       (order_ID INT REFERENCES orders,
       product_name VARCHAR(25) REFERENCES products(products_name),
       product_price INT,
       product_quantity INT);


CREATE TABLE employee_phone_num
       (employee_ID INT REFERENCES employees(employee_ID),
       phone_number INT);


CREATE TABLE customer_phone_num
       (customer_ID INT REFERENCES customer(customer_ID),
       phone_number INT);
       
COMMIT;

