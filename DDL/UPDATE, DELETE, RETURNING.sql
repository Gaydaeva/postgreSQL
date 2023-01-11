-- Изменение данных

UPDATE author
SET full_name = 'Elias', rating = 5
	WHERE author_id = 1;
	
SELECT * FROM author

-- Удаление данных

DELETE FROM author
	WHERE rating < 4.5;

SELECT * FROM author

-- Удаление всех данных

DELETE FROM author -- есть логи

TRUNCATE TABLE author -- нет логов

-- Возврат вставленных данных (эквивалентно логам)

DROP TABLE book;

CREATE TABLE book
(
	book_id serial,
	title text NOT NULL,
	isbn character varying (32) NOT NULL,
	publisher_id integer NOT NULL,
	
	CONSTRAINT PK_book_book_id PRIMARY KEY(book_id)
);

INSERT INTO book (title, isbn, publisher_id)
VALUES ('title', 'isbn', 3)
RETURNING *;

INSERT INTO author
VALUES (1, 'full_name', 4);

UPDATE author
SET full_name = 'Walter', rating = 5
WHERE author_id = 1
RETURNING author_id;

DELETE FROM author
WHERE rating = 5
RETURNING *;