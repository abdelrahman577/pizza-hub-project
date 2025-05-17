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


