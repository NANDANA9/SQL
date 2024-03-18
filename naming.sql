CREATE TABLE naming(
    name_s VARCHAR(225)
);

INSERT INTO naming(
    name_s
)VALUES
    ('rAVI kUMAR'),
    ('priya sharma'),
    ('amit PATEL'),
    ('NEHA gupta');
SELECT * FROM naming;

UPDATE naming
SET name_s= initcap( name_s);