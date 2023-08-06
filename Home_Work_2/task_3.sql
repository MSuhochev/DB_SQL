/* Создать таблицу “orders”, заполнить ее значениями. 
Показать “полный” статус заказа, используя оператор CASE */

DROP TABLE IF EXISTS orders;

CREATE TABLE orders (
	ID INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    employee_id CHAR(3) NOT NULL,
    amount DECIMAL (5,2) NOT NULL,
    order_status VARCHAR(9) NOT NULL
); 

INSERT INTO orders (employee_id, amount, order_status) VALUES
('e03', 15.00, 'OPEN'),
('e01', 25.50, 'OPEN'),
('e05', 100.70, 'CLOSED'),
('e02', 22.18, 'OPEN'),
('e04', 9.50, 'CANCELLED');

SELECT ID, employee_id, amount, order_status, CASE
		WHEN order_status = 'Open' THEN 'Order is in open state'
		WHEN order_status = 'CLOSED' THEN 'Order is closed'
		WHEN order_status = 'CANCELLED' THEN 'Order is cancelled'
        ELSE "Order has unknown state"
      END as full_order_status
FROM orders;