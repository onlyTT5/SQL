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

CREATE TABLE SampleStr
(
    str1 VARCHAR(40),
    str2 VARCHAR(40),
    str3 VARCHAR(40)
);

BEGIN TRANSACTION;

INSERT INTO SampleStr (str1, str2, str3) VALUES ('opx', 'rt', NULL);
INSERT INTO SampleStr (str1, str2, str3) VALUES ('abc', 'def', NULL);
INSERT INTO SampleStr (str1, str2, str3) VALUES ('山田', '太郎', '是我');
INSERT INTO SampleStr (str1, str2, str3) VALUES ('aaa', NULL, NULL);
INSERT INTO SampleStr (str1, str2, str3) VALUES (NULL, 'xyz', NULL);
INSERT INTO SampleStr (str1, str2, str3) VALUES ('@!#$%', NULL, NULL);
INSERT INTO SampleStr (str1, str2, str3) VALUES ('ABC', NULL, NULL);
INSERT INTO SampleStr (str1, str2, str3) VALUES ('aBC', NULL, NULL);
INSERT INTO SampleStr (str1, str2, str3) VALUES ('abc太郎', 'abc', 'ABC');
INSERT INTO SampleStr (str1, str2, str3) VALUES ('abcdefabc', 'abc', 'ABC');
INSERT INTO SampleStr (str1, str2, str3) VALUES ('micmic', 'i', 'I');

COMMIT;

SELECT * FROM SampleStr;

SELECT str1, str2, str1 + str2 AS str_concat
FROM SampleStr;

SELECT str1, str2, str3, str1 + str2 + str3 AS str_concat
FROM SampleStr;

SELECT str1, LEN(str1) AS len_str
FROM SampleStr;

SELECT str1, LOWER(str1) AS low_str
FROM SampleStr
WHERE str1 IN ('ABC', 'aBC', 'abc', '山田');

SELECT str1, str2, str3, REPLACE(str1, str2, str3) AS rep_str
FROM SampleStr;

SELECT str1, SUBSTRING(str1, 3, 2)
FROM SampleStr;

SELECT str1, UPPER(str1) AS up_str
FROM SampleStr
WHERE str1 IN ('ABC', 'aBC', 'abc', '山田');

SELECT CAST(CURRENT_TIMESTAMP AS DATE) AS CUR_DATE;

SELECT CAST(CURRENT_TIMESTAMP AS TIME) AS CUR_TIME;

SELECT CURRENT_TIMESTAMP;

SELECT CURRENT_TIMESTAMP,
    DATEPART(YEAR, CURRENT_TIMESTAMP) AS year,
    DATEPART(MONTH, CURRENT_TIMESTAMP) AS month,
    DATEPART(DAY, CURRENT_TIMESTAMP) AS day,
    DATEPART(HOUR, CURRENT_TIMESTAMP) AS hour,
    DATEPART(MINUTE, CURRENT_TIMESTAMP) AS minute,
    DATEPART(SECOND, CURRENT_TIMESTAMP) AS second;

SELECT CAST('0001' AS INTEGER) AS int_col;

SELECT CAST('2009-12-14' AS DATE) AS date_col;

SELECT COALESCE(NULL, 1) AS col_1,
COALESCE(NULL, 'test', NULL) AS col_2,
COALESCE(NULL, NULL, '2009-11-01') AS col_3;

SELECT * FROM SampleStr;

SELECT COALESCE(str2, 'NULL')
FROM SampleStr;