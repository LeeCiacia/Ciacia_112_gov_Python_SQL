DROP TABLE student; /*不要原本的student*/

CREATE TABLE IF NOT EXISTS student(
	id SERIAL PRIMARY KEY,
	name VARCHAR(20),
	Chinese INT, /*也可以用SMALLINT*/
	English INT,
	Math INT
);

INSERT INTO student (name, chinese, english, math)
VALUES('李蝦蝦',75,89,70);

SELECT *
FROM student