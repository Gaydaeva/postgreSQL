CREATE TABLE customer
(
	customer_id serial,
	full_name text,
	status char DEFAULT 'r', --regular
	
	CONSTRAINT PK_customer_customer_id PRIMARY KEY(customer_id),
	CONSTRAINT CHK_customer_status CHECK (status = 'r' OR status = 'p')
);

INSERT INTO customer (full_name)
VALUES 
('name');

SELECT * FROM customer

-- INSERT содержит больше выражений, чем целевых столбцов

INSERT INTO customer (full_name)
VALUES 
('name', 'd');

-- Удаляем условие DEFAULT

ALTER TABLE customer
ALTER COLUMN status DROP DEFAULT

-- В столбце status теперь NULL

INSERT INTO customer (full_name)
VALUES 
('name');

SELECT * FROM customer

-- Добавляем условие DEFAULT

ALTER TABLE customer
ALTER COLUMN status SET DEFAULT 'r';

INSERT INTO customer (full_name)
VALUES 
('name');

SELECT * FROM customer