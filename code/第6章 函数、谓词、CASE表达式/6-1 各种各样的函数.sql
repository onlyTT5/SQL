CREATE TABLE SampleMath
(
    m NUMERIC (10, 3),
    n INTEGER,
    p INTEGER
);

BEGIN TRANSACTION;

INSERT INTO SampleMath(m, n, p) VALUES (500, 0, NULL);
INSERT INTO SampleMath(m, n, p) VALUES (-180, 0, NULL);
INSERT INTO SampleMath(m, n, p) VALUES (NULL, NULL, NULL);
INSERT INTO SampleMath(m, n, p) VALUES (NULL, 7, 3);
INSERT INTO SampleMath(m, n, p) VALUES (NULL, 5, 2);
INSERT INTO SampleMath(m, n, p) VALUES (NULL, 4, NULL);
INSERT INTO SampleMath(m, n, p) VALUES (8, NULL, 3);
INSERT INTO SampleMath(m, n, p) VALUES (2.27, 0, NULL);
INSERT INTO SampleMath(m, n, p) VALUES (5.555, 2, NULL);
INSERT INTO SampleMath(m, n, p) VALUES (NULL, 1, NULL);
INSERT INTO SampleMath(m, n, p) VALUES (8.76, NULL, NULL);

COMMIT;

SELECT * FROM SampleMath;

UPDATE SampleMath
SET n = 1
WHERE m = 2.27;

SELECT m, ABS(m) AS abs_col
FROM SampleMath;

SELECT n, p, n % p AS mod_col
FROM SampleMath;

SELECT m, n, ROUND(m, n) AS round_col
FROM SampleMath;