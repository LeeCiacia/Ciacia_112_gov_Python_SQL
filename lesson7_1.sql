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


/*各站點進站人數最多的一筆*/
/*要用SELECT跟GROUP BY*/
SELECT 站點編號
FROM gate_count LEFT JOIN stations ON 站點編號 = 編號

/*要用SELECT把站點編號選出來，MAX取出最大值，然後用GROUP BY篩選出來*/
SELECT 站點編號,MAX(進站人數)
FROM gate_count 
GROUP BY 站點編號;

/*如果SELECT沒有站點編號，MAX取出最大值，然後用GROUP BY篩選出來，則站點可能會重複*/
SELECT 站點編號,MAX(進站人數)
FROM gate_count 
GROUP BY 站點編號;

/*SELECT全部，這樣寫會有242筆，因為同一站可能有都是最大筆的*/
SELECT *
FROM gate_count LEFT JOIN stations ON 站點編號 = 編號
WHERE (站點編號,進站人數) IN(
	SELECT 站點編號,MAX(進站人數)
	FROM gate_count 
	GROUP BY 站點編號
);
GROUP BY 站點編號,進站人數; /*如果加上這條，就會把站點點跟進站人數整合，就不會有上面的狀況*/
