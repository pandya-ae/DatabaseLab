CREATE DATABASE academic;

CREATE TABLE IF NOT EXISTS student(
 NIM INT(6) NOT NULL AUTO_INCREMENT PRIMARY KEY,
 student_name VARCHAR(255),
 gender ENUM('L','P'),
 birth_place VARCHAR(50),
 birth_date DATE,
 address VARCHAR(255),
 phone VARCHAR(12)
);

CREATE TABLE IF NOT EXISTS lecturer(
 NIP INT(12) NOT NULL AUTO_INCREMENT PRIMARY KEY,
 lecturer_name VARCHAR(255),
 gender ENUM('L','P'),
 laboratory VARCHAR(50),
 interests VARCHAR(255),
 address VARCHAR(255),
 phone VARCHAR(12)
);

CREATE TABLE IF NOT EXISTS subject(
 course_code INT(4) NOT NULL AUTO_INCREMENT PRIMARY KEY,
 course_name VARCHAR(255),
 NIP INT(12),
 credits INT(2),
 day VARCHAR(20),
 hour TIME,
 classroom VARCHAR(20),
 description TEXT,
 FOREIGN KEY (NIP) REFERENCES lecturer(NIP)
);

CREATE TABLE KRS(
 KRS_id INT(10) NOT NULL AUTO_INCREMENT PRIMARY KEY,
 course_code INT(4),
 NIM INT(6),
 year INT(4),
 semester INT(1),
 FOREIGN KEY (course_code) REFERENCES subject(course_code),
 FOREIGN KEY (NIM) REFERENCES student(NIM)
);

SHOW TABLES;

DESCRIBE table
DESCRIBE lecturer
DESCRIBE subject
DESCRIBE krs

RENAME TABLE lecturer to professor

ALTER TABLE professor change lecturer_name prof_name
VARCHAR(255);

ALTER TABLE student
ADD COLUMN mother_name VARCHAR(255) NOT NULL
AFTER birth_date;

ALTER TABLE student
MODIFY COLUMN gender ENUM(‘male’,’female’);

ALTER TABLE student
MODIFY COLUMN phone INT;

ALTER TABLE subject
DROP COLUMN description;