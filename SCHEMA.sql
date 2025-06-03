CREATE TABLE products (
product_id int PRIMARY KEY ,
product_name varchar(100) , 
price decimal(10, 2) );

CREATE  TABLE ingredients (
ingredient_id int PRIMARY KEY ,
ingredient_name varchar(100)
);

CREATE TABLE customers (
cust_id int PRIMARY KEY,
name varchar(100) , 
email varchar(100) ,
phone_number varchar(100));

CREATE TABLE orders (
order_id int PRIMARY KEY ,
cust_id int REFERENCES customers (cust_id),
order_date DATE ,
total_price decimal(10,2));

CREATE TABLE order_items (
order_item_id int PRIMARY KEY ,
order_id int REFERENCES orders (order_id),
product_id int REFERENCES products (product_id),
quantity int );

CREATE TABLE product_ingredients (
product_id int REFERENCES products (product_id) ,
ingredient_id int REFERENCES ingredients (ingredient_id));
         

CREATE TABLE PRODUCT_INGREDIENT_details (
id int PRIMARY KEY , 
product_id int REFERENCES products(product_id) , 
ingredient_id int REFERENCES ingredients(ingredient_id) , 
quantity_gram number(5) , 
is_optional char(1) CHECK (is_optional IN ('Y' , 'N')));

SELECT * FROM PRODUCT_INGREDIENT_details;

CREATE TABLE  feedback_customers (
feedback_id int PRIMARY KEY , 
cust_id int REFERENCES customers (cust_id), 
order_id int REFERENCES orders (order_id), 
rating decimal(10,2) , 
 comm varchar2(100) , 
feedback_date DATE );

ALTER TABLE FEEDBACK_CUSTOMERS 
RENAME COLUMN comm
TO  feedback_comment;
ALTER TABLE FEEDBACK_CUSTOMERS 
MODIFY (feedback_comment VARCHAR2(200));