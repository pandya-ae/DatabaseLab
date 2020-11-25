CREATE DATABASE IF NOT EXISTS grades;

USE grades;

CREATE TABLE IF NOT EXISTS student(
    nim INT(5) PRIMARY KEY,
    name VARCHAR(15) NOT NULL,
    study_program VARCHAR(15),
    birthdate DATE
);

CREATE TABLE IF NOT EXISTS course(
    course_code INT(3) PRIMARY KEY,
    course_name VARCHAR(15) NOT NULL,
    credits INT(1) NOT NULL
);

CREATE TABLE IF NOT EXISTS score(
    nim INT(5) NOT NULL,
    course_code INT(3) NOT NULL,
    score INT(3),
    FOREIGN KEY(nim) REFERENCES student(nim),
    FOREIGN KEY(course_code) REFERENCES course(course_code)
);

INSERT INTO
    student(nim, name, study_program, birthdate)
VALUES
    (1000, 'Devano', 'Statistics', '2001-01-01'),
    (1050, 'Cindy', 'Computer', '1997-02-03'),
    (1088, 'Fahri', 'Electronics', '1999-07-07'),
    (1111, 'Meisya', 'Computer', '2001-11-12');

INSERT INTO
    course(course_code, course_name, credits)
VALUES
    (111, 'Programming', 3),
    (112, 'Database', 2),
    (113, 'Calculus', 3);

INSERT INTO
    score(nim, course_code, score)
VALUES
    (1000, 112, 70),
    (1000, 113, 80),
    (1050, 111, 100),
    (1050, 112, 80),
    (1050, 113, 90),
    (1088, 111, 60),
    (1088, 112, 100),
    (1111, 113, 100);
 
SELECT
    score.nim, 
    course.course_name
FROM
    score
INNER JOIN
    course 
    ON 
    score.course_code = course.course_code
ORDER BY
    nim;
 
SELECT
    name, 
    study_program
FROM
    student
ORDER BY
    birthdate;
 
SELECT
    name, 
    study_program, 
    birthdate
FROM
    student
ORDER BY
    birthdate DESC
LIMIT 1;
 
SELECT
    score.nim, 
    student.name, 
    MAX(score.score) AS maxScore
FROM
    score
INNER JOIN
    student 
    ON 
    score.nim = student.nim
GROUP BY
    score.nim, 
    student.name
HAVING
    maxScore < 100;
 
SELECT DISTINCT
    student.name, 
    student.study_program
FROM
    score
INNER JOIN
    student 
    ON 
    score.nim = student.nim
WHERE
    score.score BETWEEN 70 AND 80;
 
SELECT
    student.name, 
    COUNT(*) AS courseTaken
FROM
    student
INNER JOIN
    score 
    ON 
    student.nim = score.nim
GROUP BY
    student.name;
 
SELECT
    student.name, 
    SUM(credits) AS totalCredits
FROM ((
    student 
INNER JOIN 
    score ON student.nim = score.nim) 
    INNER JOIN 
        course ON score.course_code = course.course_code) 
GROUP BY
    student.name;
 
SELECT
    course.course_name, 
    COUNT(*) AS studentsTaking
FROM
    course
INNER JOIN
    score ON course.course_code = score.course_code
GROUP BY
    course.course_name;
 
SELECT
    student.name,  
    student.study_program,   
    AVG(score.score) AS avgScore
FROM ((
    student 
INNER JOIN 
    score ON student.nim = score.nim) 
    INNER JOIN 
        course ON score.course_code = course.course_code) 
GROUP BY
    student.name
HAVING
    avgScore BETWEEN 80 AND 100;
 
SELECT  
    student.study_program
FROM ((
    student 
INNER JOIN 
    score ON student.nim = score.nim) 
    INNER JOIN 
        course ON score.course_code = course.course_code) 
GROUP BY
    student.name
ORDER BY
    AVG(score.score) DESC
LIMIT 1;
 
SELECT
    name
FROM
    student
WHERE
    year(birthdate) = 2001;
 
SELECT
    student.name, 
    MAX(score.score) AS maxScore
FROM ((
    student 
INNER JOIN 
    score ON student.nim = score.nim) 
    INNER JOIN 
        course ON score.course_code = course.course_code)
GROUP BY
    student.name,
    score.course_code
HAVING
    score.course_code = 113
ORDER BY
    maxScore DESC 
LIMIT
    1;
 
SELECT
    Student.name,
    SUM(course.credits*score.score/25)/SUM(course.credits) AS GPA
FROM ((
    student 
INNER JOIN 
    score ON student.nim = score.nim) 
    INNER JOIN 
        course ON score.course_code = course.course_code)
GROUP BY
    student.name;