DROP TABLE IF EXISTS book;

CREATE TABLE book
(
	book_id int NOT NULL,
	title text NOT NULL,
	isbn varchar(32) NOT NULL,
	publisher_id int NOT NULL,
	
	CONSTRAINT PK_book_book_id PRIMARY KEY(book_id)
);

SELECT * FROM book;

CREATE SEQUENCE IF NOT EXISTS book_book_id_seq
START WITH 1 OWNED BY book.book_id;

-- В столбце "book_id" отношения "book" нарушает ограничение NOT NULL

INSERT INTO book(title, isbn, publisher_id)
VALUES('title', 'isbn', 1);

-- Устанавливаем ограничение

ALTER TABLE book
ALTER COLUMN book_id SET DEFAULT nextval('book_book_id_seq')

-- Автоинкрементация через serial

DROP TABLE IF EXISTS book;

CREATE TABLE book
(
	book_id serial NOT NULL,
	title text NOT NULL,
	isbn varchar(32) NOT NULL,
	publisher_id int NOT NULL,
	
	CONSTRAINT PK_book_book_id PRIMARY KEY(book_id)
);

INSERT INTO book(title, isbn, publisher_id)
VALUES('title1', 'isbn1', 1);

INSERT INTO book(title, isbn, publisher_id)
VALUES('title2', 'isbn2', 1);

SELECT * FROM book;

-- Внутренний SEQUENCE не синхронизирован

INSERT INTO book
VALUES(3, 'title1', 'isbn1', 1);

-- Повторяющееся значение ключа нарушает ограничение уникальности "pk_book_book_id"

INSERT INTO book(title, isbn, publisher_id)
VALUES('title2', 'isbn2', 1);

-- Автоинкремент (ALWAYS=BY DEFAULT)

DROP TABLE IF EXISTS book;

CREATE TABLE book
(
	book_id int GENERATED ALWAYS AS IDENTITY NOT NULL,
	title text NOT NULL,
	isbn varchar(32) NOT NULL,
	publisher_id int NOT NULL,
	
	CONSTRAINT PK_book_book_id PRIMARY KEY(book_id)
);

INSERT INTO book(title, isbn, publisher_id)
VALUES('title1', 'isbn1', 1);

INSERT INTO book(title, isbn, publisher_id)
VALUES('title2', 'isbn2', 1);

SELECT * FROM book;

-- В столбец "book_id" можно вставить только значение по умолчанию
-- Столбец "book_id" является столбцом идентификации со свойством GENERATED ALWAYS

INSERT INTO book
VALUES(3, 'title1', 'isbn1', 1);

INSERT INTO book
OVERRIDING SYSTEM VALUE
VALUES(3, 'title1', 'isbn1', 1);

-- Внутренний автоинкремент

DROP TABLE IF EXISTS book;

CREATE TABLE book
(
	book_id int GENERATED ALWAYS AS IDENTITY (START WITH 10 INCREMENT BY 2) NOT NULL,
	title text NOT NULL,
	isbn varchar(32) NOT NULL,
	publisher_id int NOT NULL,
	
	CONSTRAINT PK_book_book_id PRIMARY KEY(book_id)
);

INSERT INTO book(title, isbn, publisher_id)
VALUES('title1', 'isbn1', 1);

INSERT INTO book(title, isbn, publisher_id)
VALUES('title2', 'isbn2', 1);

SELECT * FROM book;
