-- CREATE DATABASE gc2;

-- CREATE countries TABLE
CREATE TABLE countries(
	country_id SERIAL PRIMARY KEY,
	country VARCHAR(30) NOT NULL
);
-- INPUT DATA TO countries TABLE
COPY countries(country)
FROM 'E:\Download\countries.csv'
DELIMITER ','
CSV HEADER;

-- CREATE segment TABLE
CREATE TABLE segment(
	segment_id SERIAL PRIMARY KEY,
	segment VARCHAR(30) NOT NULL
);
-- INPUT DATA TO segment TABLE
COPY segment(segment)
FROM 'E:\Download\segment.csv'
DELIMITER ','
CSV HEADER;


-- CREATE dates TABLE
CREATE TABLE dates(
	date_id SERIAL PRIMARY KEY,
	month_name VARCHAR(30) NOT NULL,
	year INTEGER NOT NULL,
	month_number INTEGER NOT NULL,
	date VARCHAR(10) NOT NULL
);
-- INPUT DATA TO dates TABLE
COPY dates(month_name, year, month_number, date)
FROM 'E:\Download\dates.csv'
DELIMITER ','
CSV HEADER;


-- CREATE discount_band TABLE
CREATE TABLE discount(
	discount_id SERIAL PRIMARY KEY,
	discount_band VARCHAR(10) NOT NULL
);
-- INPUT DATA TO dates TABLE
COPY discount(discount_band)
FROM 'E:\Download\discount.csv'
DELIMITER ','
CSV HEADER;


-- CREATE product_info TABLE
CREATE TABLE product_info(
	product_id SERIAL PRIMARY KEY,
	product VARCHAR(20) NOT NULL,
	manufacturing_price FLOAT NOT NULL,
	sale_price FLOAT NOT NULL,
	discount_id SERIAL REFERENCES discount(discount_id)
);
-- INPUT DATA TO product_info TABLE
COPY product_info(product, manufacturing_price, sale_price)
FROM 'E:\Download\product_info.csv'
DELIMITER ','
CSV HEADER;


-- CREATE sales_information TABLE
CREATE TABLE sales_information(
	sale_id SERIAL PRIMARY KEY,
	units_sold FLOAT NOT NULL,
	gross_sales FLOAT NOT NULL,
	discounts FLOAT NOT NULL,
	sales FLOAT NOT NULL,
	cogs FLOAT NOT NULL,
	profit FLOAT NOT NULL,
	product_id SERIAL REFERENCES product_info(product_id),
	date_id SERIAL REFERENCES dates(date_id)
);
-- INPUT DATA TO sales_information TABLE
COPY sales_information(units_sold, gross_sales, discounts, sales, cogs, profit)
FROM 'E:\Download\sales_information.csv'
DELIMITER ','
CSV HEADER;


-- PEMBUATAN USER AND PASSWORD
CREATE USER user1 WITH PASSWORD '123456'; -- USER ADMIN
CREATE USER user2 WITH PASSWORD '654321';

GRANT ALL PRIVILEGES ON 
countries, segment, discount, product_info, sales_information, product_info
TO user1;

GRANT SELECT ON
countries, segment, discount, product_info, sales_information, product_info
TO user2;
