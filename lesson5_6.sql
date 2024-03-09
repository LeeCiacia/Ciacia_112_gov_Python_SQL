DROP TABLE IF EXISTS stations;

CREATE TABLE IF NOT EXISTS stations(
	編號 INT PRIMARY KEY,
	名稱 VARCHAR(20) NOT NULL,
	英文名稱 VARCHAR(50),
	地名 VARCHAR(20),
	英文地名 VARCHAR(50),
	地址 VARCHAR(255),
	英文地址 VARCHAR(255),
	電話 VARCHAR(20),
	gps VARCHAR(50),
	youbike BOOL
);

/*stationa資料*/
SELECT * FROM stations;
/*計算stationa筆數*/
SELECT COUNT(*)AS 筆數
FROM stations;