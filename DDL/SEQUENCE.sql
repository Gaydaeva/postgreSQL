-- Последовательности

CREATE SEQUENCE seq1;

SELECT nextval('seq1'); -- первое значение
SELECT currval('seq1'); -- текущее значение
SELECT lastval(); -- последнее значение, не принимает аргументы

SELECT setval('seq1', 16, true); -- задаем значение последовательности, по умолчанию true
SELECT currval('seq1'); -- 16
SELECT nextval('seq1'); -- 17

SELECT setval('seq1', 16, false); -- задаем значение последовательности, по умолчанию true
SELECT currval('seq1'); -- 17, не модифицируется, хранится старое значение
SELECT nextval('seq1'); -- 16

-- Создаем счетчик с инкрементом

CREATE SEQUENCE IF NOT EXISTS seq2 INCREMENT 16;
SELECT nextval('seq2');

CREATE SEQUENCE IF NOT EXISTS seq3 
	INCREMENT 16
	MINVALUE 0
	MAXVALUE 128
	START WITH 0;
	
SELECT nextval('seq3');

-- Переименование последовательности

ALTER SEQUENCE seq3 RENAME TO seq4;

-- Сброс последовательности

ALTER SEQUENCE seq4 RESTART WITH 16;

SELECT nextval('seq4')

-- Удаление последовательности

DROP SEQUENCE seq4