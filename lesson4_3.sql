DROP TABLE student;

CREATE TABLE student(
	student_id SERIAL PRIMARY KEY,
	name VARCHAR(20), 
	major VARCHAR(20),
	score INT
);

INSERT INTO student VALUES(1,'小白','英語',50);
INSERT INTO student VALUES(2,'小黃','生物',90);
INSERT INTO student VALUES(3,'小綠','歷史',70);
INSERT INTO student VALUES(4,'小藍','英語',80);
INSERT INTO student VALUES(5,'小黑','化學',20);

SELECT *
FROM student

SELECT name
FROM student

SELECT name,major
FROM student

SELECT name AS 姓名,major AS 主修
FROM student

SELECT *
FROM student
ORDER BY score ASC;

SELECT *
FROM student
ORDER BY score DESC;

SELECT *
FROM student
ORDER BY score DESC
LIMIT 3;

SELECT *
FROM student
ORDER BY score
LIMIT 2;

/*主修英文及分數<60的同學*/
SELECT *
FROM student
WHERE major = '英語'
ORDER BY score DESC
LIMIT 1

/*主修英文及分數<60的同學*/
SELECT *
FROM student
WHERE major = '英語' AND score < 60

/*主修英文或分數>60的同學*/
SELECT *
FROM student
WHERE major = '英語' OR score > 60

/*主修英文或生物或歷史的同學*/
SELECT *
FROM student
WHERE major = '英語' OR major = '生物' OR major = '歷史'

/*可以把OR改寫成IN*/
SELECT *
FROM student
WHERE major IN('英語','生物','歷史')

/*80~100*/
SELECT *
FROM student
WHERE score >= 80 AND score <= 100

/*可以把上面的區間改寫成between*/
SELECT *
FROM student
WHERE score between 80 AND 100

/*尋找小黃*/
SELECT *
FROM student
WHERE name ='小黃'

/*尋找不是小黃*/
SELECT *
FROM student
WHERE NOT name ='小黃'

/*尋找有黃的*/
SELECT *
FROM student
WHERE name LIKE '%黃%'


