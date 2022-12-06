-- Найти заказчиков и обслуживающих их заказы сотрудников таких, что и заказчики и сотрудники из города London, 
-- а доставка идёт компанией Speedy Express. Вывести компанию заказчика и ФИО сотрудника.

SELECT c.company_name, CONCAT(e.first_name, ' ', e.last_name) AS FIO
FROM orders AS o
	JOIN customers AS c USING(customer_id)
	JOIN employees AS e USING(employee_id)
	JOIN shippers AS s ON s.shipper_id = o.ship_via
		WHERE c.city = 'London' AND e.city = 'London' AND s.company_name = 'Speedy Express'

-- Найти активные (см. поле discontinued) продукты из категории Beverages и Seafood, которых в продаже менее 20 единиц. 
-- Вывести наименование продуктов, кол-во единиц в продаже, имя контакта поставщика и его телефонный номер.

SELECT category_name, product_name, units_in_stock, contact_name, phone
FROM products
	JOIN categories USING(category_id)
	JOIN suppliers USING(supplier_id)
		WHERE category_name IN('Beverages', 'Seafood') AND discontinued <> 1
			GROUP BY category_name, product_name, units_in_stock, contact_name, phone
				HAVING units_in_stock < 20
				
SELECT category_name, product_name, units_in_stock, contact_name, phone
FROM products
	JOIN categories USING(category_id)
	JOIN suppliers USING(supplier_id)
		WHERE category_name IN('Beverages', 'Seafood') AND discontinued = 0 AND units_in_stock < 20
			ORDER BY units_in_stock			

-- Найти заказчиков, не сделавших ни одного заказа. Вывести имя заказчика и order_id.

SELECT contact_name, order_id
FROM customers
	LEFT JOIN orders USING(customer_id)
		WHERE order_id IS NULL

-- Переписать предыдущий запрос, использовав симметричный вид джойна.

SELECT contact_name, order_id
FROM orders
	RIGHT JOIN customers USING(customer_id)
		WHERE order_id IS NULL