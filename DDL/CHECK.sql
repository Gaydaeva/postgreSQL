DROP TABLE IF EXISTS book;

CREATE TABLE book
(
	book_id int,
	title text NOT NULL,
	isbn varchar(32) NOT NULL,
	publisher_id int,
	
	CONSTRAINT PK_book_book_id PRIMARY KEY(book_id)
);

ALTER TABLE book
ADD COLUMN price decimal CONSTRAINT CHK_book_price CHECK (price >= 0);

-- Новая строка в отношении "book" нарушает ограничение-проверку "chk_book_price"

INSERT INTO book
VALUES
(1, 'title', 'isbn', 1, -1.5)

INSERT INTO book
VALUES
(1, 'title', 'isbn', 1, 1.5)

SELECT * FROM book