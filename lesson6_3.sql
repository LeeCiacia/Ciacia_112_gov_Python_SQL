/*取出payment的所有客戶的customer_id(不重複)*/
SELECT customer_id, COUNT(*) AS 筆數
FROM payment
GROUP BY customer_id