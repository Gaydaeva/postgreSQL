-- запрос выдаст тот же результат, что и INNER JOIN

SELECT company_name, product_name
FROM suppliers
LEFT JOIN products ON suppliers.supplier_id = products.supplier_id;

-- две компании не делали никаких заказов

SELECT company_name, order_id
FROM customers
LEFT JOIN orders ON orders.customer_id = customers.customer_id
WHERE order_id IS NULL;

SELECT company_name, order_id
FROM orders
RIGHT JOIN customers ON orders.customer_id = customers.customer_id
WHERE order_id IS NULL;

-- следующим запросом убеждаемся, что в компании нет работников, которые не задействованы ни в каких заказах

SELECT COUNT(*)
FROM employees
LEFT JOIN orders ON orders.employee_id = employees.employee_id
WHERE order_id IS NULL;