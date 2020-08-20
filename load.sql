DROP TABLE delivery;
DROP TABLE categorys;
DROP TABLE customer;
DROP TABLE orders;
DROP TABLE delivery;
DROP TABLE products;
DROP TABLE payment;
DROP TABLE employees;

CREATE TABLE customer
       (customer_ID INT PRIMARY KEY,
       fname VARCHAR(25),
       mname VARCHAR(25),
       lname VARCHAR(25),
       dob DATE,
       email VARCHAR(25),
       phone_num VARCHAR(15),
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
       total_Price NUMERIC(15,2));

CREATE TABLE delivery
       (delivery_ID INT PRIMARY KEY,
       delivery_date DATE,
       delivery_street_num VARCHAR(30),
       delivery_suburb VARCHAR(30),
       delivery_country VARCHAR(30),
       delivery_street_name VARCHAR(30));

CREATE TABLE categorys
       (category_ID INT PRIMARY KEY,
       category_name VARCHAR(15));

CREATE TABLE products
       (product_ID INT PRIMARY KEY,
       category_ID INT REFERENCES categorys(category_ID),
       item_description VARCHAR(20),
       product_name VARCHAR(20),
       price NUMERIC(15,2),
       wholesale_cost NUMERIC(15,2));

CREATE TABLE payment
       (payment_ID INT PRIMARY KEY,
       credit_card_num VARCHAR(20),
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
       employee_suburb VARCHAR(30),
       employee_street_name VARCHAR(30),
       employee_country VARCHAR(30),
       employee_phone_num VARCHAR(15),
       position VARCHAR(15));



COMMIT;

