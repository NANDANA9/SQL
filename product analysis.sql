DROP TABLE product;

CREATE TABLE product(
    product_id INT,
    product_name VARCHAR(225),
    price FLOAT
);
SELECT * FROM product;

INSERT INTO product(
    product_id,
    product_name,
    price
)VALUES
    (1,'Apple',2.50),
    (2,'Banana',1.50),
    (3,'0range',3.00),
    (4,'Mango',2.00);
DROP TABLE orders;
CREATE  TABLE orders(
    order_id INT,
    product_id INT,
    quantity INT,
    sales FLOAT
);
SELECT * FROM orders;

INSERT INTO orders(
    order_id,
    product_id,
    quantity,
    sales
)VALUES
    (1,1,10,25.00),
    (2,1,5,12.50),
    (3,2,8,12.00),
    (4,3,12,36.00),
    (5,4,6,12.00);
    
SELECT product_name, sum(sales) AS total_revenue FROM product AS P 
JOIN orders AS o ON p.product_id=o.product_id
GROUP BY 
    product_name;
