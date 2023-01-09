--PRIMARY KEY

DROP TABLE IF EXISTS chair;

CREATE TABLE chair
(
	chair_id serial PRIMARY KEY,
	chair_name varchar,
	dean varchar
);

INSERT INTO chair
VALUES (1, 'name', 'dean');

SELECT * FROM chair;

--PRIMARY KEY накладывает ограничение на вставку повторяющихся значений, нарушает ограничение уникальности "chair_pkey"
--Ключ "(chair_id)=(1)" уже существует

INSERT INTO chair
VALUES (1, 'name2', 'dean2');

--PRIMARY KEY накладывает ограничение на вставку NULL-значений, PK всегда NOT NULL

INSERT INTO chair
VALUES (NULL, 'name2', 'dean2');

INSERT INTO chair
VALUES (2, 'name2', 'dean2');

--UNIQUE (почти эквивалент PK)

CREATE TABLE chair
(
	chair_id serial UNIQUE NOT NULL,
	chair_name varchar,
	dean varchar
);

INSERT INTO chair
VALUES (1, 'name', 'dean');

SELECT * FROM chair;

--значение NULL в столбце "chair_id" отношения "chair" нарушает ограничение NOT NULL

INSERT INTO chair
VALUES (NULL, 'name2', 'dean2');

--повторяющееся значение ключа нарушает ограничение уникальности "chair_chair_id_key"
--Ключ "(chair_id)=(1)" уже существует

INSERT INTO chair
VALUES (1, 'name2', 'dean2');

--Выясним, какие ограничения есть в таблице

SELECT constraint_name
FROM information_schema.key_column_usage
WHERE table_name = 'chair'
	AND table_schema = 'public'
	AND column_name = 'chair_id'

--Можно задать ограничение вручную 'table_name'_'column_mame'_key (если есть)

CREATE TABLE chair
(
	chair_id serial,
	chair_name varchar,
	dean varchar
	
	CONSTRAINT PK_chair_chair_id PRIMARY KEY(chair_id)
)

--Удаление ограничения

ALTER TABLE chair
DROP CONSTRAINT chair_chair_id_key

--Добавление ограничения

ALTER TABLE chair
ADD PRIMARY KEY(chair_id)
