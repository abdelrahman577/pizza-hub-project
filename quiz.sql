SELECT price , product_name 
FROM products;

SELECT c.name , o.order_date 
FROM CUSTOMERS c 
JOIN ORDERS o 
ON c.CUST_ID = o.CUST_ID ;

SELECT * FROM ORDERS 
WHERE TOTAL_PRICE > 60;

SELECT p.product_name  , i.ingredient_name 
FROM PRODUCTS p 
JOIN PRODUCT_INGREDIENT_DETAILS pid 
ON p.PRODUCT_ID = pid.PRODUCT_ID 
JOIN INGREDIENTS i 
ON i.INGREDIENT_ID = pid.INGREDIENT_ID ;

SELECT order_item_id , p.product_name , quantity
FROM ORDER_ITEMS oi 
JOIN PRODUCTS p 
ON p.PRODUCT_ID = oi.PRODUCT_ID ;

SELECT c.name ,COUNT(o.order_id) , sum(o.total_price) 
FROM CUSTOMERS c 
JOIN ORDERS o 
ON c.CUST_ID = o.CUST_ID 
GROUP BY c.NAME
FETCH FIRST 3 ROWS ONLY ;

SELECT p.product_name , p.PRODUCT_ID ,SUM(oi.quantity) *p.price  AS Total_sales 
FROM PRODUCTS p 
JOIN ORDER_ITEMS oi 
ON p.PRODUCT_ID = oi.PRODUCT_ID 
GROUP BY p.PRODUCT_NAME ,p.PRODUCT_ID 
ORDER BY total_sales DESC ;

SELECT p.product_name, p.product_id, SUM(oi.quantity) * p.price AS Total_sales
FROM products p
JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY p.product_name, p.product_id , p.PRICE 
ORDER BY Total_sales DESC;

SELECT c.name , count(o.ORDER_ID) AS number_orders  
FROM ORDERS o 
JOIN CUSTOMERS c 
ON c.cust_id = o.CUST_ID 
GROUP BY c.name 
ORDER BY number_orders DESC 
FETCH FIRST 3 ROWS ONLY ;

SELECT p. product_name, sum(oi.quantuty) AS num_sum
FROM products p
JOIN order_items oi
ON p. product_id = oi. product_id
GROUP BY p. 
product_name
ORDER BY num_sum desc 
FETCH FIRST 1 ROWS ONLY;
WITH INGREDIENT_USED AS (
SELECT i.ingredient_id , i.INGREDIENT_NAME , COUNT(DISTINCT pid.product_id) AS num_used
FROM INGREDIENTS i 
JOIN PRODUCT_INGREDIENT_DETAILS pid 
ON i.INGREDIENT_ID = pid.INGREDIENT_ID 
GROUP BY i.ingredient_id , i.INGREDIENT_NAME 
),
INGREDIENT_RANKED AS (
SELECT ingredient_id , ingredient_name , num_used ,
RANK()over(ORDER BY num_used ) AS used_rnk
FROM INGREDIENT_USED
)
SELECT *
FROM INGREDIENT_RANKED
WHERE used_rnk <= 3;

SELECT p.product_id , p.product_name , COUNT(pid.ingredient_id) num_cunt
FROM PRODUCTS p 
JOIN PRODUCT_INGREDIENT_DETAILS pid 
ON p.PRODUCT_ID = pid.PRODUCT_ID 
GROUP BY p.product_id , p.product_name
HAVING COUNT(pid.INGREDIENT_ID) > 3
ORDER BY num_cunt DESC ; 

 SELECT p.product_name , count(oi.order_id)
FROM products p 
JOIN ORDER_ITEMS oi  
ON p.PRODUCT_ID = oi.PRODUCT_ID 
GROUP BY p.PRODUCT_NAME ;

SELECT c.name , count(o.order_id) AS num_order
FROM CUSTOMERS c 
JOIN ORDERS o 
ON c.CUST_ID = o.CUST_ID 
GROUP BY c.name 
ORDER BY num_order DESC ;

SELECT 
  i.ingredient_name, 
  COUNT(DISTINCT pi.product_id) AS num_products
FROM 
  ingredients i
JOIN 
  product_ingredients pi ON i.ingredient_id = pi.ingredient_id
GROUP BY 
  i.ingredient_name
HAVING 
  COUNT(DISTINCT pi.product_id) > 3;
  
 SELECT p.product_name ,   i.ingredient_name  , pi.ingredient_id
 FROM PRODUCTS p 
 JOIN PRODUCT_INGREDIENTS pi
 ON p.PRODUCT_ID = pi.PRODUCT_ID 
 JOIN INGREDIENTS i 
 ON i.INGREDIENT_ID = pi.INGREDIENT_ID 
 WHERE i.INGREDIENT_NAME = 'TOMATO' ;
 
SELECT p.product_name , COUNT(pid.ingredient_id)
FROM PRODUCTS p 
JOIN PRODUCT_INGREDIENT_DETAILS pid
ON p.PRODUCT_ID = pid.PRODUCT_ID 
GROUP BY p.PRODUCT_NAME;

SELECT c.name , count(fc.feedback_id) AS num_feedback
FROM CUSTOMERS c 
JOIN FEEDBACK_CUSTOMERS fc 
ON c.CUST_ID = fc.CUST_ID 
GROUP BY c.NAME 
HAVING count(fc.FEEDBACK_ID) > 1 ;

SELECT p.product_name ,  oi.order_id 
FROM PRODUCTS p 
LEFT JOIN ORDER_ITEMS oi 
ON p.PRODUCT_ID = oi.PRODUCT_ID 
WHERE oi.ORDER_ID IS NULL ;

SELECT p.product_name, COUNT(pid.ingredient_id) AS num_ingredients
FROM PRODUCTS p 
JOIN PRODUCT_INGREDIENT_DETAILS pid
ON p.PRODUCT_ID = pid.PRODUCT_ID 
GROUP BY p.PRODUCT_NAME
ORDER BY num_ingredients ASC
FETCH FIRST 1 ROW ONLY;

SELECT i.ingredient_name , i.ingredient_id , 
RANK()over(ORDER BY count(pid.product_id) desc) AS rnk
FROM INGREDIENTS i 
JOIN PRODUCT_INGREDIENT_DETAILS pid 
ON i.INGREDIENT_ID =  pid.INGREDIENT_ID 
GROUP BY   i.ingredient_name , i.ingredient_id 
ORDER BY rnk;