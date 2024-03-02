/*Field constraint*/
/*
PRIMARY KEY其實有以下三個功能
NOT NULL (不可以空白)
UNIQUE (不可以重複)
DEFAULT (新增值時，可以不設)
*/

DROP TABLE student;

CREATE TABLE student(
	student_id SERIAL PRIMARY KEY,
	name VARCHAR(20) NOT NULL,
	major VARCHAR(20)UNIQUE

);

SELECT *
FROM student