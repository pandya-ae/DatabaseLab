
CREATE DATABASE IF NOT EXISTS library

USE library

CREATE TABLE IF NOT EXISTS books(
    bookID INT(3) PRIMARY KEY,
    bookTitle VARCHAR(50),
    authorName VARCHAR(50),
    borrowedStatus ENUM('borrowed', 'available')
);

CREATE TABLE IF NOT EXISTS user(
    userID INT(3) PRIMARY KEY,
    userName VARCHAR(50),
    numberOfBorrowing INT(1),
    numberOfReturning INT(1)
);

CREATE TABLE IF NOT EXISTS flow(
    flowID INT(3) PRIMARY KEY,
    userIDBorrowing INT(3),
    bookIDBorrowed INT(3),
    borrowDate DATE,
    returnDate DATE,
    FOREIGN KEY(userIDBorrowing) REFERENCES user(userID),
    FOREIGN KEY(bookIDBorrowed) REFERENCES books(bookID)
);

INSERT INTO
    books(bookID, bookTitle, authorName, borrowedStatus)
VALUES
    (101, 'Book 1', 'Author 1', 'borrowed'),
    (102, 'Book 2', 'Author 2', 'available'),
    (103, 'Book 3', 'Author 3', 'borrowed'),
    (104, 'Book 4', 'Author 4', 'available'),
    (105, 'Book 5', 'Author 5', 'borrowed'),
    (106, 'Book 6', 'Author 6', 'available'),
    (107, 'Book 7', 'Author 7', 'borrowed'),
    (108, 'Book 8', 'Author 8', 'available'),
    (109, 'Book 9', 'Author 9', 'borrowed');

INSERT INTO
    user(userID, userName, numberOfBorrowing, numberOfReturning)
VALUES
    (201, 'Nama 1', 4, 0),
    (202, 'Nama 2', 1, 0),
    (203, 'Nama 3', 1, 1),
    (204, 'Nama 4', 1, 1),
    (205, 'Nama 5', 1, 1),
    (206, 'Nama 6', 1, 1),
    (207, 'Nama 7', 4, 4),
    (208, 'Nama 8', 0, 0),
    (209, 'Nama 9', 0, 0);

INSERT INTO
    flow(flowID, userIDBorrowing, bookIDBorrowed, borrowDate, returnDate)
VALUES
    (314, 201, 101, DATE_SUB(CURDATE(), INTERVAL 1 DAY), DATE_ADD(CURDATE(), INTERVAL 4 DAY)),
    (313, 201, 103, DATE_SUB(CURDATE(), INTERVAL 2 DAY), DATE_ADD(CURDATE(), INTERVAL 3 DAY)),
    (312, 201, 105, DATE_SUB(CURDATE(), INTERVAL 3 DAY), DATE_ADD(CURDATE(), INTERVAL 2 DAY)),
    (311, 201, 107, DATE_SUB(CURDATE(), INTERVAL 4 DAY), DATE_ADD(CURDATE(), INTERVAL 1 DAY)),
    (309, 202, 109, DATE_SUB(CURDATE(), INTERVAL 2 DAY), DATE_ADD(CURDATE(), INTERVAL 2 DAY)),
    (308, 203, 102, '2020-10-30', '2020-10-31'),
    (307, 204, 104, '2020-10-28', '2020-10-29'),
    (306, 205, 106, '2020-10-26', '2020-10-27'),
    (305, 206, 108, '2020-10-24', '2020-10-25'),
    (304, 207, 102, '2020-10-22', '2020-10-23'),
    (303, 207, 104, '2020-10-20', '2020-10-21'),
    (302, 207, 106, '2020-10-18', '2020-10-19'),
    (301, 207, 108, '2020-10-16', '2020-10-17');

SELECT
    bookTitle,
    borrowedStatus,
    borrowDate
FROM
    books b
INNER JOIN
    flow f
    ON
    b.bookID = f.bookIDBorrowed
WHERE
    b.borrowedStatus = 'borrowed' AND borrowDate = DATE_SUB(CURDATE(), INTERVAL 1 DAY);

SELECT
    bookTitle,
    borrowedStatus,
    userIDBorrowing,
    returnDate
FROM
    books b
INNER JOIN
    flow f
    ON
    b.bookID = f.bookIDBorrowed
GROUP BY
    bookTitle;

SELECT
    userID,
    bookID,
    bookTitle,
    returnDate,
    borrowedStatus
FROM ((
    user u
    LEFT JOIN
    flow f
    ON
    u.userID = f.userIDBorrowing)
        LEFT JOIN
        books b
        ON
        f.bookIDBorrowed = b.bookID);

SELECT
    bookTitle,
    userIDBorrowing,
    borrowedStatus,
    numberOfBorrowing
FROM ((
    user u
    LEFT JOIN
    flow f
    ON
    u.userID = f.userIDBorrowing)
        LEFT JOIN
        books b
        ON
        f.bookIDBorrowed = b.bookID)
WHERE
    borrowedStatus = 'borrowed' AND numberOfBorrowing > 3;