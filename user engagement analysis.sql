
DROP TABLE engagement;
DROP TABLE reaction;
CREATE TABLE engagement(
    post_ids serial,
    post_content VARCHAR(225),
    post_date TIMESTAMP
);

INSERT INTO engagement(
    post_content,
    post_date
)VALUES
    ('Lorem ipsum dolor sit amet','2023-08-25 10:00:00'),
    ('Exploring the beauty of nature','2023-08-26 15:30:00'),
    ('Unveiling the latest tech trends','2023-08-27 12:00:00'),
    ('Journey into the world of literature','2023-08-28 09:45:00'),
    ('Capturing the essence of city life','2023-08-29 16:20:00');
    
SELECT * FROM engagement;

CREATE TABLE reaction(
    reaction_id	serial,
    user_id	INT,
    post_id	INT,
    reaction_type VARCHAR(225),
    reaction_date TIMESTAMP 
    
);

INSERT INTO reaction(
    user_id,
    post_id,
    reaction_type,
    reaction_date
)VALUES
    (101,1,'like','2023-08-25 10:15:00'),
    (102,1,'comment','2023-08-25 11:30:00'),
    (103,1,'share','2023-08-26 12:45:00'),
    (101,2,'like','2023-08-26 15:45:00'),
    (102,2,'comment','2023-08-27 09:20:00'),
    (104,2,'like','2023-08-27 10:00:00'),
    (105,3,'comment','2023-08-27 14:30:00'),
    (101,3,'like','2023-08-28 08:15:00'),
    (103,4,'like','2023-08-28 10:30:00'),
    (105,4,'share','2023-08-29 11:15:00'),
    (104,5,'like','2023-08-29 16:30:00'),
    (101,5,'comment','2023-08-30 09:45:00');
    
SELECT * FROM reaction;

SELECT   
    post_id,
    post_content,
    count(CASE WHEN r.reaction_type='like' THEN 1 END) AS num_likes,
    count(CASE WHEN r.reaction_type='comment' THEN 1 END) AS num_comment,
    count(CASE WHEN r.reaction_type='share' THEN 1 END) AS num_share
    
FROM engagement AS e
JOIN reaction AS r ON e.post_ids=r.post_id
WHERE post_id=2
GROUP BY
    post_id ,
    post_content;
    
SELECT  
    date(reaction_date) AS reaction_day,
    count(DISTINCT user_id) AS distinct_user,
    count(reaction_type) AS total_reaction
FROM reaction
GROUP BY 
    date(reaction_date);
    
SELECT   
    post_id,
    post_content,
    count(r.reaction_type) AS total_reaction
    
FROM engagement AS e
JOIN reaction AS r ON e.post_ids=r.post_id

GROUP BY
    post_id ,
    post_content
ORDER BY total_reaction DESC
LIMIT 3;
