DROP TABLE ads;

CREATE TABLE ads(
    adid serial,
    views_s INT,
    click INT,
    cost_t FLOAT
);
INSERT INTO ads(
    views_s,
    click,
    cost_t
)VALUES
    (1000,50,20.5),
    (800,30,15.2),
    (1200,80,25.7),
    (600,20,10.9),
    (1500,120,40.3);
    
SELECT * FROM ads;

SELECT 
    adid,
    concat(round((click::DECIMAL/views_s)*100,1),'%')AS CTR,
    views_s,
    click,
    cost_t
FROM ads
ORDER BY ctr;