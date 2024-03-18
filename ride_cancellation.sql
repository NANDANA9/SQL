DROP TABLE trips;

CREATE TABLE trips(
    id serial,
    client_id INT,
    driver_id INT,
    city_id	INT,
    status VARCHAR(225),
    request_at date
);

INSERT INTO trips(
    client_id,
    driver_id,
    city_id,
    status,
    request_at
)VALUES
    (1,10,1,'completed','2023-07-12'),
    (2,11,1,'cancelled_by_driver','2023-07-12'),
    (3,12,6,'completed','2023-07-12'),
    (4,13,6,'cancelled_by_client','2023-07-12'),
    (1,10,1,'completed','2023-07-13'),
    (2,11,6,'completed','2023-07-13'),
    (3,12,6,'completed','2023-07-13'),
    (2,12,12,'completed','2023-07-14'),
    (3,10,12,'completed','2023-07-14'),
    (4,13,12,'cancelled_by_driver','2023-07-14');
    
SELECT *FROM trips;

CREATE TABLE users(
    users_id INT,
    banned VARCHAR(225),
    roles  VARCHAR(225)
);

INSERT  INTO users(
    users_id,
    banned,
    roles
)VALUES
    (1,'No','client'),
    (2,'Yes','client'),
    (3,'No','client'),
    (4,'No','client'),
    (10,'No','driver'),
    (11,'No','driver'),
    (12,'No','driver'),
    (13,'No','driver');
    
SELECT * FROM users;

DROP VIEW Cancelled;

CREATE VIEW rips AS ( 
    SELECT
        t.request_at AS DAY,
        COUNT(CASE WHEN t.status LIKE 'cancelled%' THEN 1 END) AS canceled_requests,
        COUNT(*) AS total_requests
    FROM
        trips t
        JOIN users u1 ON t.client_id = u1.users_id
        JOIN users u2 ON t.driver_id = u2.users_id
    WHERE
        u1.banned = 'No' AND u2.banned = 'No'
    GROUP BY
        t.request_at
);

    
SELECT * FROM  rips;

  SELECT DAY , round(canceled_requests::NUMERIC/total_requests,2) AS Cancelled_Rate
  FROM rips
  GROUP BY DAY,Cancelled_Rate;
  
