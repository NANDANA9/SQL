

CREATE TABLE email(
    id serial,
    name_s VARCHAR(225),
    email VARCHAR(225),
    phone BIGINT
);
SELECT * FROM email;
INSERT INTO email(
    name_s,
    email,
    phone 
)VALUES
    ('Rahul','rahul@example.com',9839473902),
    ('Rohit','rohit@example.com',9883782971),
    ('Suresh','rahul@example.com',7654321098),
    ('Manish','manish@example.com',8927394619),
    ('amit','amit@example.com',9399303840),
    ('Rahul','rahul@example.com',9737466147);
    
CREATE VIEW delete_duplicate AS

SELECT id,email,row_number() OVER(PARTITION BY email) AS Row_Number
FROM email;

SELECT * FROM delete_duplicate;


DELETE  FROM email 
WHERE id IN (SELECT id FROM delete_duplicate WHERE Row_Number >1);

SELECT * FROM email;

