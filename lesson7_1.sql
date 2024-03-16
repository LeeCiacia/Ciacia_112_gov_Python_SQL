/*今天學SubSquery*/

/*進站人數最多的一筆*/

/*1.先把兩個資料串連*/
SELECT *
FROM gate_count LEFT JOIN stations ON 站點編號 = 編號
WHERE 進站人數 = 82586  /*先用下面的SELECT MAX去求的*/

/*2.直接利用SELECT+MAX取進站人數最多的一筆*/
SELECT MAX (進站人數)
FROM gate_count

/*3.上面兩個程式整合*/
SELECT *
FROM gate_count LEFT JOIN stations ON 站點編號 = 編號
WHERE 進站人數 =(
	SELECT MAX (進站人數)
	FROM gate_count
);
