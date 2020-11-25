CREATE DATABASE IF NOT EXISTS store;

USE store;

CREATE TABLE IF NOT EXISTS customer(
    customerNumber VARCHAR(5) NOT NULL PRIMARY KEY,
    customerName VARCHAR(255) NOT NULL,
    city VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS product(
    productNumber VARCHAR(5) NOT NULL PRIMARY KEY,
    productName VARCHAR(100) NOT NULL,
    stock INT(3) DEFAULT 15
);

CREATE TABLE IF NOT EXISTS transaction(
    transactionNumber VARCHAR(5) NOT NULL,
    transactionDate DATE,
    customerNumber VARCHAR(5),
    PRIMARY KEY(transactionNumber),
    FOREIGN KEY(customerNumber) REFERENCES customer(customerNumber)
);

INSERT INTO 
    customer(customerNumber, customerName, city)
VALUES
    ('C-003','Geneva Electronic','Bandung'),
    ('C-007','Gama Store','Yogyakarta'),
    ('C-009','Family Mart','Medan'),
    ('C-011','Star Store','Bandung');

INSERT INTO 
    product(productNumber, productName, stock)
VALUES
    ('P-100','Monitor 17',15),
    ('P-120','Keyboard Ps2',20),
    ('P-123','Mouse Ps2',15),
    ('P-125','Memory 512',10);

INSERT INTO 
    transaction(transactionNumber, transactionDate, customerNumber)
VALUES
    ('T-001','2019-10-19','C-011'),
    ('T-002','2020-01-10','C-003'),
    ('T-003','2020-08-07','C-009'),
    ('T-004','2020-09-09','C-007');

SELECT DISTINCT
    city
FROM
    customer;

UPDATE customer
SET
    customerName = 'HappyFamily Mart',
    city = 'Jakarta'
WHERE
    customerNumber = 'C-009'


INSERT INTO
    product(productNumber, productName, stock)
VALUES
    ('P-130','NIC D-Link',DEFAULT);

INSERT INTO 
    transaction(transactionNumber, transactionDate, customerNumber)
VALUES
    ('T-005',CURRENT_DATE(),'C-003'),
    ('T-006',CURRENT_DATE(),'C-011');

DELETE FROM 
    transaction
ORDER BY 
    transactionNumber
LIMIT 2;