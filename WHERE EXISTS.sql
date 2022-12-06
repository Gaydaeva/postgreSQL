-- Найти все компании поставщиков из тех стран, из которых заказчики

SELECT DISTINCT country
FROM customers -- сначала подзапрос

SELECT company_name
FROM suppliers
WHERE country IN ('Argentina', 'Spain', '...')

SELECT company_name
FROM suppliers
WHERE country IN (SELECT DISTINCT country
				  FROM customers)

SELECT DISTINCT suppliers.company_name
FROM suppliers
	JOIN customers USING(country) -- эквивалент предыдущего запроса
	
-- Найти сумму единиц товара, разбитых на группы и 
-- лимитировать результирующий набор числом, которое необходимо вычислить (product_id+4)

SELECT category_name, SUM(units_in_stock)
FROM products
	INNER JOIN categories USING(category_id)
		GROUP BY category_name
			ORDER BY SUM(units_in_stock) DESC
				LIMIT (SELECT MIN(product_id) + 4 
					   FROM products)

-- Найти товары, количество которого в наличии больше среднего

SELECT AVG(units_in_stock)
FROM products -- сначала подзапрос

SELECT product_name, units_in_stock
FROM products
	WHERE units_in_stock > (SELECT AVG(units_in_stock)
							FROM products)
		ORDER BY units_in_stock

-- Найти компании и имена заказчиков, которые делали заказ весом от 50 до 100 кг

SELECT company_name, contact_name
FROM customers
	WHERE EXISTS (SELECT customer_id 
				  FROM orders
						WHERE customer_id = customers.customer_id
				 		AND freight BETWEEN 50 AND 100)
						
-- Найти компании и имена заказчиков, которые делали заказы в период 1 февраля и 15 февраля 1995 года

SELECT company_name, contact_name
FROM customers
	WHERE EXISTS (SELECT customer_id 
				  FROM orders
						WHERE customer_id = customers.customer_id
				 		AND order_date BETWEEN '1995-02-01' AND '1995-02-15') -- таких заказчиков не было

-- Выбрать товары, которые не покупались в период 1 февраля и 15 февраля 1995 года

SELECT product_name
FROM products
	WHERE NOT EXISTS (SELECT orders.order_id
					  FROM orders
					  	JOIN order_details USING (order_id)
					 		WHERE order_details.product_id = product_id
					 		  AND order_date BETWEEN '1995-02-01' AND '1995-02-15')
