-- Вставка по всем столбцам

INSERT INTO author
VALUES (10, 'John Silver', 4.5);

SELECT * FROM author

-- Вставка в несколько столбцов

INSERT INTO author (author_id, full_name)
VALUES (11, 'Bob Gray');

SELECT * FROM author

-- Вставка нескольких данных в несколько столбцов

INSERT INTO author (author_id, full_name)
VALUES 
(12, 'Name 1'),
(13, 'Name 2'),
(14, 'Name 3');

SELECT * FROM author

-- Создание таблицы из выборки

SELECT * INTO best_authors
FROM author
	WHERE rating >= 4.5
	
SELECT * FROM best_authors

-- Вставка выборки в уже существующую

INSERT INTO best_authors
SELECT * FROM author
	WHERE rating < 4.5
