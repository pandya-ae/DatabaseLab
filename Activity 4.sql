CREATE DATABASE IF NOT EXISTS data;

USE student;

CREATE TABLE IF NOT EXISTS student(
	nim INT(5) NOT NULL AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(255) NOT NULL,
	cityAddress VARCHAR(255) NOT NULL,
	age INT(2) NOT NULL,
	ipk DECIMAL(2,1) NOT NULL,
	department VARCHAR(255),
);

ALTER TABLE student AUTO_INCREMENT = 12345; 

INSERT INTO
	student(nim, name, cityAddress, age, ipk, department)
VALUES
	('Adi', 'Jakarta', 17, 2.5, 'Math'),
	('Ani', 'Yogyakarta', 20, 2.1, 'Math'),
	('Ari', 'Surabaya', 18, 2.5, 'Computer'),
	('Ali', 'Banjarmasin', 20, 3.5, 'Computer'),
	('Abi', 'Medan', 17, 3.7, 'Computer'),
	('Budi', 'Jakarta', 19, 3.8, 'Computer'),
	('Boni', 'Yogyakarta', 20, 3.2, 'Computer'),
	('Bobi', 'Surabaya', 17, 2.7, 'Computer'),
	('Beni', 'Banjarmasin', 18, 2.3, 'Computer'),
	('Cepi', 'Jakarta', 20, 2.2, NULL),
	('Coni', 'Yogyakarta', 22, 2.6, NULL),
	('Ceki', 'Surabaya', 21, 2.5, 'Math'),
	('Dodi', 'Jakarta', 20, 3.1, 'Math'),
	('Didi', 'Yogyakarta', 19, 3.2, 'Physics'),
	('Deri', 'Surabaya', 19, 3.3, 'Physics'),
	('Eli', 'Jakarta', 20, 2.9, 'Physics'),
	('Endah', 'Yogyakarta', 18, 2.8, 'Physics'),
	('Feni', 'Jakarta', 17, 2.7, NULL),
	('Farah', 'Yogyakarta', 18, 3.5, NULL),
	('Fandi', 'Surabaya', 19, 3.4, NULL);

SELECT DISTINCT
	cityAddress
FROM
	student
ORDER BY
	cityAddress;

SELECT
	name
FROM
	student
WHERE
	department = 'Computer';

SELECT
	nim,
	name,
	cityAddress,
	age
FROM
	student
ORDER BY
	age DESC;

SELECT
	name,
	age
FROM
	student
WHERE
	cityAddress = 'Jakarta'
ORDER BY
	age ASC
LIMIT 3;

SELECT
	name,
	ipk
FROM
	student
WHERE
	cityAddress = 'Jakarta'
	AND
	ipk < 2.5;

SELECT
	name
FROM
	student
WHERE
	cityAddress = 'Yogyakarta'
	OR
	age > 20;

SELECT
	name,
	cityAddress
FROM
	student
WHERE
	cityAddress NOT IN ('Jakarta', 'Surabaya');

SELECT
	name,
	age,
	ipk
FROM
	student
WHERE
	ipk BETWEEN 2.5 AND 3.5;

SELECT
	name
FROM
	student
WHERE
	name LIKE %a%;

SELECT
	nim
FROM
	student
WHERE
	department is NULL;