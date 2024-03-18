CREATE TABLE Sales(
    Product_id INT NOT NULL,
    product_name VARCHAR(225) NOT NULL,
    selling_price INT NOT NULL
);

SELECT *FROM sales;

INSERT INTO sales(
    Product_id,
    product_name,
    selling_price
)VALUES
    (1,'product A',100),
    (2,'product B',150),
    (1,'product A',120),
    (3,'product C',200),
    (2,'product B',180),
    (1,'product A',90),
    (3,'product C',210);
    
SELECT *FROM sales;

SELECT 
    product_name,
    avg(selling_price)
FROM
    sales
GROUP BY
    product_name;
