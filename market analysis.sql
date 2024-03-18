CREATE TABLE merket(
    customer_id INT,
    product_id VARCHAR(225),
    purchase_date date,
    quantity INT,
    revenue INT
);

SELECT * FROM merket;

INSERT INTO merket(
    customer_id,
    product_id,
    purchase_date,
    quantity,
    revenue
)VALUES
    (1,'A','2023-01-01',5,100),
    (2,'B','2023-01-02',3,50),
    (3,'A','2023-01-03',2,30),
    (4,'C','2023-01-03',1,20),
    (1,'B','2023-01-04',4,80);
    
SELECT 
    sum(revenue) AS total_revenue
FROM merket;

SELECT 
    product_id,
    sum(quantity) AS total_quantity,
    sum(revenue) AS total_revenue
    
FROM merket
GROUP BY 
    product_id;
    
SELECT 
    customer_id,
    sum(revenue) AS total_revenue
FROM merket
GROUP BY 
    customer_id;