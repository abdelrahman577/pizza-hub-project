
DECLARE                                                  --- INSERT DATA IN TABLE (products)
  TYPE t_product IS RECORD (
    v_product_name products.product_name%TYPE,
    v_price products.price%TYPE
  );
v_id NUMBER:=1;
  TYPE t_product_list IS TABLE OF t_product;
  v_product_list t_product_list;
BEGIN
  v_product_list := t_product_list(
    t_product('Margherita', 25),
    t_product('pepperoni', 30.50),
    t_product('Veggie', 28.00),
    t_product('Vegetable Pizza', 20.00),
    t_product('Cheeseburger Pizza', 33.00),
    t_product('Spicy Pizza', 28.00),
    t_product('Supreme', 30.00),
    t_product('Chicken Ranch', 35.00),
    t_product('Shawarma', 25.00),
    t_product('Seafood', 35.00)
  );

  FOR i IN v_product_list.FIRST .. v_product_list.LAST LOOP
    INSERT INTO PRODUCTS (product_id ,product_name, price)
    VALUES (v_id,v_product_list(i).v_product_name, v_product_list(i).v_price);
  v_id:= v_id +1;
   END LOOP;
END;

SELECT * FROM PRODUCTS p ;


DECLARE  												--- INSERT DATA IN ingredients tabel 
  TYPE t_intgr IS RECORD (
    v_id ingredients.ingredient_id%TYPE,
    v_name ingredients.ingredient_name%TYPE
  );
  
  TYPE t_intgr_list IS TABLE OF t_intgr;
  v_intgr_list t_intgr_list;

BEGIN 
  v_intgr_list := t_intgr_list(
    t_intgr(1 , 'Mozzarella Cheese'),
    t_intgr(2 , 'Tomato Sauce'),
    t_intgr(3 , 'Pepperoni'),
    t_intgr(4 , 'Mushrooms'),
    t_intgr(5 , 'Bell Peppers'),
    t_intgr(6 , 'Olives'),
    t_intgr(7 , 'Chicken'),
    t_intgr(8 , 'Onions'),
    t_intgr(9 , 'Basil'),
    t_intgr(10, 'BBQ Sauce')
  );

  FOR i IN v_intgr_list.FIRST .. v_intgr_list.LAST LOOP
    INSERT INTO ingredients (ingredient_id, ingredient_name)
    VALUES (v_intgr_list(i).v_id, v_intgr_list(i).v_name);	
  END LOOP;
END;

SELECT * FROM INGREDIENTS ;
   													----- insert data  into PRODUCT_INGREDIENT_details
DECLARE 
  TYPE t_details IS RECORD (
    v_intgr_id ingredients.ingredient_id%TYPE,
    v_product_id products.product_id%TYPE, 
    v_gram product_ingredient_details.quantity_gram%TYPE,
    v_optional product_ingredient_details.is_optional%TYPE
  );
  
  TYPE t_map IS TABLE OF t_details;
  v_map t_map;
  v_id NUMBER := 1;

BEGIN 
  v_map := t_map(
    t_details(1, 1, 150, 'Y'),
    t_details(2, 2, 50, 'Y'),
    t_details(3, 3, 80, 'N'),
    t_details(4, 4, 85, 'Y'),
    t_details(5, 5, 100, 'Y'),
    t_details(6, 6, 40, 'N'),
    t_details(7, 7, 120, 'Y'),
    t_details(8, 8, NULL, 'N'),
    t_details(9, 9, 90, 'Y'),
    t_details(10, 10, 70, 'Y')
  );
  FOR i IN v_map.FIRST .. v_map.LAST LOOP 
    INSERT INTO product_ingredient_details (
      id, product_id, ingredient_id, quantity_gram, is_optional
    ) VALUES (
      v_id, v_map(i).v_product_id, v_map(i).v_intgr_id, v_map(i).v_gram, v_map(i).v_optional
    );
    
    v_id := v_id + 1;
  END LOOP;
  
END;

DECLARE 											--- INSERT DATA IN customers 
TYPE t_customer IS RECORD (
v_name customers.name%TYPE , 
v_email customers.email%TYPE ,
v_phone customers.phone_number%TYPE 
);
TYPE t_cust IS TABLE OF t_customer ;
v_cust t_cust ;

v_id NUMBER := 1;

BEGIN 
	v_cust := t_cust( 
	t_customer('omar mohamed ' , 'omar.mohamed@gmail.com' , '01012345678'),
	t_customer('omar alaa' , 'omar:mary.alaason@yahoo.com' , '01098765432'),
	t_customer('maha afifi' , 'maha.afifi@hotmail.com' , '01122334455'),
	t_customer('Ahmed Ali' , 'ahmed.ali@hotmail.com' , '01233445566'),
	t_customer('Sarah ahmed' , 	'sarah.ahmed@outlook.com' ,	'01233445566'),
	t_customer('khaled Mostafa' , 	'khaled.m@gmail.com' ,  '01233445566'),
	t_customer('Hassan ElShenawy' , 'hassan.els@gmail.com' , '01155667788'),
	t_customer('Fatma Adel' ,	'fatma.adel@yahoo.com' , 	'01234567890') ,
    t_customer('George Michael' , 'george.m@gmail.com' ,	'01077665544'),
	t_customer('Lina Youssef' , 'lina.youssef@outlook.com' , '01144332211')
	);
FOR i IN v_cust.FIRST.. v_cust.LAST LOOP 
	INSERT INTO customers ( cust_id , name , email , phone_number )
			VALUES (v_id , v_cust(i).v_name , v_cust(i).v_email, 
			v_cust(i).v_phone);
	v_id :=v_id + 1 ;
END LOOP;

END;

SELECT * from customers; 
UPDATE customers 
SET email = 'omar.alaason@yahoo.com'
WHERE cust_id = 2;


DECLARE 											--insert data to orders 
TYPE t_order IS RECORD (
v_cust_id orders.cust_id%TYPE ,
v_date orders.order_date%TYPE ,
v_total orders.total_price%TYPE );

TYPE o_order IS TABLE OF t_order ;
v_order o_order ;

v_id NUMBER := 1;

BEGIN 
	v_order := o_order (
	t_order (1	, to_date('2024-01-15','yyyy_mm_dd'), 60.00	) ,
	t_order (2 ,to_date('2024-01-18', 'yyyy_mm_dd') ,45.50 ) , 
	t_order (3 ,to_date( '2024-01-20', 'yyyy_mm_dd') ,90.00 ),
	t_order (4 ,to_date('2024-01-21' , 'yyyy_mm_dd') ,30.00 ),
	t_order (5 ,to_date('2024-01-23' , 'yyyy_mm_dd') ,120.00 ),
	t_order (6 ,to_date('2024-01-25' ,'yyyy_mm_dd'),50.00 ),
	t_order (7 ,to_date('2024-01-28' , 'yyyy_mm_dd') ,75.00 ),
	t_order (8 ,to_date( '2024-01-30' ,'yyyy_mm_dd'), 35.00 ),
	t_order (9 , to_date( '2024-02-01' ,'yyyy_mm_dd'), 55.00 ),
	t_order (10 ,to_date('2024-02-05' , 'yyyy_mm_dd'),80.00	)
);

FOR i IN v_order.FIRST .. v_order.LAST LOOP 
	INSERT INTO orders (order_id , cust_id , order_date , total_price)
			VALUES (v_id , v_order(i).v_cust_id , v_order(i).v_date , v_order(i).v_total);
v_id := v_id + 1;
		END LOOP;

END;

SELECT *  FROM orders;

DECLARE
TYPE t_order_items IS RECORD (
v_order_id order_items.order_id%TYPE,
v_product_id order_items.product_id%TYPE , 
v_quantity order_items.quantity%TYPE );
TYPE t_item IS TABLE OF t_order_items ;
v_item t_item ;
v_id NUMBER :=1;
BEGIN 
	v_item :=t_item (
	t_order_items (1 , 1 , 2),
	t_order_items (1 , 3 , 1),
	t_order_items (2 , 2 , 1), 
	t_order_items (2 , 5 , 2),
	t_order_items (3 , 4 , 3), 
	t_order_items (4 , 6 , 1),
	t_order_items (5 , 7 , 2),
	t_order_items (6 , 8 , 2),
	t_order_items (7 , 9 , 1),
	t_order_items (8 , 10 ,2)
	);
FOR i IN v_item.FIRST .. v_item.LAST LOOP 
	INSERT INTO order_items ( order_item_id , order_id ,product_id ,quantity)
	VALUES (v_id , v_item(i).v_order_id , v_item(i).v_product_id , v_item(i).v_quantity);
v_id := v_id + 1;
END LOOP;
	
END;

SELECT * FROM ORDER_ITEMS oi ;
