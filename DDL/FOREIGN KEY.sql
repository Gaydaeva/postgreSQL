DROP TABLE publisher;

DROP TABLE book_author;

DROP TABLE book

CREATE TABLE publisher
(
	publisher_id int, --лучше указывать serial, чтобы вручную не прописывать id (в старых версиях postgreSQL)
	publisher_name varchar(128) NOT NULL,
	address text,
	
	CONSTRAINT PK_publisher_publisher_id PRIMARY KEY(publisher_id)
);

CREATE TABLE book
(
	book_id int,
	title text NOT NULL,
	isbn varchar(32) NOT NULL,
	publisher_id int,
	
	CONSTRAINT PK_book_book_id PRIMARY KEY(book_id)
);

INSERT INTO publisher
VALUES
(1, 'Everyman''s Library', 'NY'),
(2, 'Oxford University Press', 'NY'),
(3, 'Grand Central Publishing', 'Washington'),
(4, 'Simon & Schuster', 'Chicago');

INSERT INTO book
VALUES
(1, 'The Diary of a Young Girl', '0199535566', 10) --id никуда не ссылается

SELECT * FROM book

TRUNCATE TABLE book

-- Добавим внешний ключ

ALTER TABLE book
ADD CONSTRAINT FK_book_publisher FOREIGN KEY(publisher_id) REFERENCES publisher(publisher_id)

-- Нарушает ограничение внешнего ключа "fk_books_publisher"
-- Ключ (publisher_id)=(10) отсутствует в таблице "publisher"
INSERT INTO book
VALUES
(1, 'The Diary of a Young Girl', '0199535566', 10)

-- Добавление ограничения внешнего ключа при создании таблицы

DROP TABLE book;

CREATE TABLE book
(
	book_id int,
	title text NOT NULL,
	isbn varchar(32) NOT NULL,
	publisher_id int,
	
	CONSTRAINT PK_book_book_id PRIMARY KEY(book_id),
	CONSTRAINT FK_book_publisher FOREIGN KEY(publisher_id) REFERENCES publisher(publisher_id)
);

-- Удаление ограничения

ALTER TABLE book
DROP CONSTRAINT FK_book_publisher
