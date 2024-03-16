/*參考火車站點.csv和火車進出人數資料*/

DROP TABLE IF EXISTS gate_count;
DROP TABLE IF EXISTS stations;

CREATE TABLE IF NOT EXISTS stations(
	編號 INT PRIMARY KEY,
	名稱 VARCHAR(20),
	英文名稱 VARCHAR(100),
	地名 VARCHAR(20),
	英文地名 VARCHAR(100),
	地址 VARCHAR(100),
	英文地址 VARCHAR(255),
	電話 VARCHAR(100),
	gps VARCHAR(255),
	youbike BOOL

);
	
CREATE TABLE IF NOT EXISTS gate_count(
	id SERIAL,
	日期 DATE NOT NULL,
	站點編號 INT,
	進站人數 INT DEFAULT 0,
	出站人數 INT DEFAULT 0,
	PRIMARY KEY(id),
	FOREIGN KEY(站點編號)REFERENCES stations(編號)
	ON DELETE SET NULL
	ON UPDATE CASCADE

);


SELECT * FROM stations;
SELECT * FROM gate_count;

SELECT *
FROM gate_count LEFT JOIN stations ON 站點編號=編號;

/*全省各站點2022年進站總人數*/
SELECT EXTRACT(YEAR FROM 日期) AS 年,名稱, 
SUM (進站人數) AS 總合
FROM gate_count LEFT JOIN stations ON 站點編號=編號
WHERE (日期 BETWEEN '2022-01-01' AND '2022-12-31')
GROUP BY EXTRACT(YEAR FROM 日期),名稱
ORDER BY 總合 DESC;


/*全省各站點2022年進站總人數大於5佰萬人的站點*/
SELECT EXTRACT (YEAR FROM 日期),名稱, SUM (進站人數) AS 總合
FROM gate_count LEFT JOIN stations ON 站點編號=編號
WHERE (日期 BETWEEN '2022-01-01' AND '2022-12-31')
GROUP BY EXTRACT (YEAR FROM 日期),名稱
HAVING SUM(進站人數) >=5000000 /*用HAVING來篩選總合大於等於*/ 
ORDER BY 總合 DESC;

/*基隆火車站2020年,每月份進站人數*/
SELECT 名稱,EXTRACT (YEAR FROM 日期), EXTRACT(MONTH FROM 日期) AS 月份,
SUM (進站人數) AS 每月進站人數
FROM gate_count LEFT JOIN stations ON 站點編號=編號
WHERE 名稱='基隆' AND EXTRACT(YEAR FROM 日期)=2020
GROUP BY 名稱,EXTRACT (YEAR FROM 日期),EXTRACT(MONTH FROM 日期)
ORDER BY 月份;


/*基隆火車站2020年,每月份進站人數,由多至少*/
SELECT 名稱, EXTRACT (YEAR FROM 日期),EXTRACT(MONTH FROM 日期) AS 月份,
SUM (進站人數) AS 每月份進站人數
FROM gate_count LEFT JOIN stations ON 站點編號=編號
WHERE 名稱='基隆' AND EXTRACT(YEAR FROM 日期)=2020
GROUP BY 名稱,EXTRACT (YEAR FROM 日期),EXTRACT(MONTH FROM 日期)
ORDER BY 每月份進站人數 DESC;


/*基隆火車站2020,2021,2022,每年進站人數*/
SELECT 名稱,EXTRACT(YEAR FROM 日期) AS 年,
SUM(進站人數) AS 每年進站人數
FROM gate_count LEFT JOIN stations ON 站點編號=編號
WHERE 名稱='基隆'
GROUP BY 名稱,EXTRACT(YEAR FROM 日期)
ORDER BY 年;


/*基隆火車站,臺北火車站2020,2021,2022,每年進站人數*/
SELECT 名稱, EXTRACT(YEAR FROM 日期) AS 年, SUM(進站人數)AS 每年進站人數
FROM gate_count LEFT JOIN stations ON 站點編號=編號
WHERE 名稱 IN ('基隆','臺北')
GROUP BY 名稱,EXTRACT(YEAR FROM 日期)
ORDER BY 名稱; 
