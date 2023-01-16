-- 1. Создать таблицу exam с полями:
-- - идентификатора экзамена - автоинкрементируемый, уникальный, запрещает NULL;
-- - наименования экзамена
-- - даты экзамена

DROP TABLE IF EXISTS exam;

CREATE TABLE exam
(
	exam_id serial UNIQUE NOT NULL,
	exam_name varchar(256),
	exam_date date
)

-- 2. Удалить ограничение уникальности с поля идентификатора

ALTER TABLE exam
DROP CONSTRAINT exam_exam_id_key;

-- 3. Добавить ограничение первичного ключа на поле идентификатора

ALTER TABLE exam
ADD PRIMARY KEY(exam_id);

-- 4. Создать таблицу person с полями
-- - идентификатора личности (простой int, первичный ключ)
-- - имя
-- - фамилия

DROP TABLE IF EXISTS person;

CREATE TABLE person
(
	person_id int NOT NULL,
	first_name varchar(64) NOT NULL,
	last_name varchar(64) NOT NULL,
	
	CONSTRAINT pk_person_person_id PRIMARY KEY(person_id)
);

-- 5. Создать таблицу паспорта с полями:
-- - идентификатора паспорта (простой int, первичный ключ)
-- - серийный номер (простой int, запрещает NULL)
-- - регистрация
-- - ссылка на идентификатор личности (внешний ключ)

DROP TABLE IF EXISTS passport;

CREATE TABLE passport
(
	passport_id int,
	serial_number int NOT NULL,
	registration text NOT NULL,
	person_id int NOT NULL,
	
	CONSTRAINT pk_passport_passport_id PRIMARY KEY(passport_id),
	CONSTRAINT FK_passport_person FOREIGN KEY(person_id) REFERENCES person(person_id)
)

-- 6. Добавить колонку веса в таблицу book с ограничением, проверяющим вес (больше 0 но меньше 100)

ALTER TABLE book
ADD COLUMN weight decimal CONSTRAINT chk_book_weight CHECK (weight > 0 AND weight < 100);

-- 7. Убедиться в том, что ограничение на вес работает

INSERT INTO book
VALUES (128, 'title', 'isbn', 1, 120)

-- 8. Создать таблицу student с полями:
-- - идентификатора (автоинкремент)
-- - полное имя
-- - курс (по умолчанию 1)

DROP TABLE IF EXISTS student;

CREATE TABLE student
(
	student_id serial,
	full_name varchar,
	grade int DEFAULT 1
);

-- 9. Вставить запись в таблицу студентов и убедиться, что ограничение на вставку значения по умолчанию работает

INSERT INTO student
VALUES (1, 'Vasia');

SELECT * FROM student;

-- 10. Удалить ограничение "по умолчанию" из таблицы студентов

ALTER TABLE student
ALTER COLUMN grade DROP DEFAULT;

-- 11. Подключиться к БД northwind и добавить ограничение на поле unit_price таблицы products (цена должна быть больше 0)

ALTER TABLE products
ADD CONSTRAINT chk_products_price CHECK(unit_price > 0);

-- 12. "Навесить" автоинкрементируемый счётчик на поле product_id таблицы products (БД northwind). Счётчик должен начинаться с числа следующего за максимальным значением по этому столбцу.

SELECT MAX(product_id) FROM products;

CREATE SEQUENCE IF NOT EXISTS products_product_id_seq
START WITH 78 OWNED BY products.product_id;

ALTER TABLE products
ALTER COLUMN product_id SET DEFAULT nextval('products_product_id_seq');

-- 13. Произвести вставку в products (не вставляя идентификатор явно) и убедиться, что автоинкремент работает. Вставку сделать так, чтобы в результате команды вернулось значение, сгенерированное в качестве идентификатора.

INSERT INTO products(product_name, supplier_id, category_id, quantity_per_unit,
					 unit_price, units_in_stock, units_on_order, reorder_level, discontinued)
VALUES
('prod', 1, 1, 10, 20, 20, 10, 1, 0)
RETURNING product_id;