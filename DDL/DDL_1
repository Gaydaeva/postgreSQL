-- Создать таблицу teacher с полями teacher_id serial, first_name varchar, last_name varchar, birthday date, phone varchar, title varchar

CREATE TABLE teacher
(
	teacher_id serial,
	first_name varchar,
	last_name varchar,
	birthday date,
	phone varchar,
	title varchar
)

-- Добавить в таблицу после создания колонку middle_name varchar

ALTER TABLE teacher
ADD COLUMN middle_name varchar

-- Удалить колонку middle_name

ALTER TABLE teacher
DROP COLUMN middle_name

-- Переименовать колонку birthday в birth_date

ALTER TABLE teacher
RENAME COLUMN birthday TO birth_date

-- Изменить тип данных колонки phone на varchar(32)

ALTER TABLE teacher
ALTER COLUMN phone SET DATA TYPE varchar(32)

-- Создать таблицу exam с полями exam_id serial, exam_name varchar(256), exam_date date

CREATE TABLE exam
(
	exam_id serial, 
	exam_name varchar(256), 
	exam_date date
)

-- Вставить три любых записи с автогенерацией идентификатора

INSERT INTO exam (exam_name, exam_date)
VALUES
('algebra', '2000-07-24'),
('programming', '2000-07-27'),
('data analysis', '2000-08-01')

-- Посредством полной выборки убедиться, что данные были вставлены нормально и идентификаторы были сгенерированы с инкрементом

SELECT * FROM exam

-- Удалить все данные из таблицы со сбросом идентификатора в исходное состояние

TRUNCATE TABLE exam RESTART IDENTITY
