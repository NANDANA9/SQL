CREATE TABLE customer(
    id INT,
    name_cus VARCHAR(225)
);
SELECT *FROM customer;

INSERT INTO customer(
    id,
    name_cus
)VALUES
    (1,'Joe'),
    (2,'Henry'),
    (3,'Sam'),
    (4,'Max');
    
CREATE  TABLE orders(
    id INT,
    customr_id INT);
SELECT *FROM orders;

INSERT INTO orders(
    id,
    customr_id
)VALUES
    (2,1),
    (1,3);
    
SELECT name_cus FROM customer AS c
LEFT JOIN orders AS o ON c.id=o.customr_id
WHERE customr_id IS NULL;