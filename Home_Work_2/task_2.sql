/*
2. Для данных таблицы "sales" указать тип заказа в зависимости от количества: 
- Маленький заказ < 100
- Средний заказ от 100 до 300
- Большой заказ > 300.
*/

SELECT 
	ID
    , CASE
		WHEN count_product < 100 THEN "Маленький заказ"
		WHEN count_product BETWEEN 100 AND 300 THEN "Средний заказ"
		WHEN count_product > 300 THEN "Большой заказ"
	END as "order_type"
FROM sales;
