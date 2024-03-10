/*取出payment的所有客戶的customer_id(不重複)*/
SELECT customer_id, COUNT(*) AS 筆數
FROM payment
GROUP BY customer_id

/*取出payment的所有客戶的應收帳款總合,SUM()*/
SELECT customer_id, SUM(amount) AS 總合
FROM payment
GROUP BY customer_id
ORDER BY 總合 DESC;

/*取出payment的所有客戶的應收帳款總合,把first_name跟last_name合併*/
SELECT first_name ||' '|| last_name AS full_name,
SUM(amount) AS 總合
FROM payment LEFT JOIN customer ON payment.customer_id=customer.customer_id
GROUP BY full_name /*因為first_name跟last_name合併，所以這邊也要改為full_name*/
ORDER BY 總合 DESC;

/*取出payment的所有客戶的應收帳款總合,把ON改為USING，整合使用customer_id*/
SELECT first_name ||' '|| last_name AS full_name,
SUM(amount) AS 總合
FROM payment LEFT JOIN customer USING (customer_id)
GROUP BY full_name
ORDER BY 總合 DESC;

/*取出payment的所有客戶的應收帳款總合,用HAVING來篩選*/
SELECT first_name ||' '|| last_name AS full_name,
SUM(amount) AS 總合
FROM payment LEFT JOIN customer USING (customer_id)
GROUP BY full_name
HAVING SUM(amount) >=200 /*用HAVING來篩選總合大於等於200*/
ORDER BY 總合 DESC;