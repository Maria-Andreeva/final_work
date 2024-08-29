-- Создаем базу данных
CREATE DATABASE People_friends;

-- Используем созданную базу данных
USE People_friends;

-- Создаем таблицы по иерархии
CREATE TABLE Pets (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    date_of_birth DATE
);

CREATE TABLE Dog (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    commands TEXT,
    date_of_birth DATE
);

CREATE TABLE Cat (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    commands TEXT,
    date_of_birth DATE
);

CREATE TABLE Humster (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    commands TEXT,
    date_of_birth DATE
);

CREATE TABLE Pack_animals (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    date_of_birth DATE
);

CREATE TABLE Horses (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    commands TEXT,
    date_of_birth DATE
);

CREATE TABLE Camel (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    commands TEXT,
    date_of_birth DATE
);

CREATE TABLE Donkeys (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    commands TEXT,
    date_of_birth DATE
);


INSERT INTO dog (name, commands, date_of_birth) VALUES ('Бобик', 'Сидеть, Лежать', '2021-05-10');
INSERT INTO cat (name, commands, date_of_birth) VALUES ('Мурка', 'Лежать', '2020-06-12');
INSERT INTO humster (name, commands, date_of_birth) VALUES ('Фунтик', '', '2019-11-01');

INSERT INTO horses (name, commands, date_of_birth) VALUES ('Буцефал', 'Бежать, Стой', '2018-08-21');
INSERT INTO camel (name, commands, date_of_birth) VALUES ('Шелк', 'Встать', '2017-02-03');
INSERT INTO donkeys (name, commands, date_of_birth) VALUES ('Аладдин', 'Повернуть', '2019-09-14');


-- Удаляем всех верблюдов
DELETE FROM camel;

-- Объединяем таблицы Лошади и Ослы
CREATE table horses_and_donkeys AS
SELECT * FROM horses
UNION ALL
SELECT * FROM donkeys;

CREATE TABLE young_animals AS
SELECT *, TIMESTAMPDIFF(MONTH, date_of_birth, CURDATE()) AS age_in_months
FROM (
    SELECT * FROM dog
    UNION ALL
    SELECT * FROM cat
    UNION ALL
    SELECT * FROM humster
    UNION ALL
    SELECT * FROM horses
    UNION ALL
    SELECT * FROM donkeys
) AS All_animals
WHERE TIMESTAMPDIFF(YEAR, date_of_birth, CURDATE()) > 1
AND TIMESTAMPDIFF(YEAR, date_of_birth, CURDATE()) < 3;

-- Объединяем таблицы 
CREATE TABLE All_animals AS
SELECT *, 'dog' AS тип FROM dog
UNION ALL
SELECT *, 'cat' AS тип FROM cat
UNION ALL
SELECT *, 'humster' AS тип FROM humster
UNION ALL
SELECT *, 'horses' AS тип FROM horses
UNION ALL
SELECT *, 'Ослы' AS тип FROM donkeys;


