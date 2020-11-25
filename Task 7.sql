CREATE DATABASE IF NOT EXISTS homework7;

USE homework7;

CREATE TABLE `tb_location` (
  `location_code` varchar(6) NOT NULL,
  `location_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`location_code`)
);

insert  into `tb_location`(`location_code`,`location_name`) values 
('INFO01','Laboratorium 1 M Informatika'),
('INFO02','Laboratorium 2 M Informatika'),
('INFO03','Ruang Dosen M Informatika');

CREATE TABLE `tb_product` (
  `type_code` varchar(6) NOT NULL,
  `location_code` varchar(6) NOT NULL,
  `product_code` varchar(6) NOT NULL,
  `product_name` varchar(100) DEFAULT NULL,
  `total` int(5) DEFAULT NULL,
  PRIMARY KEY (`type_code`,`location_code`,`product_code`)
);

insert  into `tb_product`(`type_code`,`location_code`,`product_code`,`product_name`,`total`) values 
('A001','INFO02','AP004','Papan Tulis',11),
('E001','INFO01','EK0014','Komputer',2),
('E001','INFO01','EK0015','Printer',3),
('E001','INFO01','EK0016','LCD Projector',1),
('E001','INFO02','EK0014','Komputer',8),
('E001','INFO02','EK0015','Printer',6),
('E001','INFO02','EK0016','LCD Projector',2),
('M001','INFO01','MM011','Meja Komputer',35),
('M001','INFO01','MM012','Kursi Hidrolik',30),
('M001','INFO02','MM011','Meja Komputer',45),
('M001','INFO03','MM012','Kursi Hidrolik',10);

CREATE TABLE `tb_type` (
  `type_code` varchar(6) NOT NULL,
  `type_name` varchar(100) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`type_code`)
);

insert  into `tb_type`(`type_code`,`type_name`,`description`) values 
('A001','ATK','alat tulis kantor'),
('E001','Alat-alat elektronik','alat elektronik'),
('M001','Mebeler','alat mebel');

SELECT
    product_code,
    product_name,
    total
FROM
    tb_product
WHERE
    location_code
    IN
    (SELECT
        location_code
    FROM
        tb_location
    WHERE
        location_name = 'Laboratorium 2 M Informatika');

SELECT
    location_name,
    type_name,
    product_code,
    product_name
FROM ((
    tb_location loc
    INNER JOIN
    tb_product pro
    ON
    loc.location_code = pro.location_code)
        INNER JOIN
        tb_type typ
        ON
        pro.type_code = typ.type_code)
WHERE
    type_name = 'Alat-alat elektronik'
    OR
    location_name = 'Ruang Dosen M Informatika';

SELECT
    location_name,
    type_name,
    product_code,
    product_name,
    total
FROM ((
    tb_location loc
    INNER JOIN
    tb_product pro
    ON
    loc.location_code = pro.location_code)
        INNER JOIN
        tb_type typ
        ON
        pro.type_code = typ.type_code)
WHERE
    type_name IN ('Alat-alat elektronik', 'Mebeler')
    AND
    location_name = 'Laboratorium 2 M Informatika';

SELECT
    pro.*,
    type_name,
    location_name
FROM ((
    tb_location loc
    INNER JOIN
    tb_product pro
    ON
    loc.location_code = pro.location_code)
        INNER JOIN
        tb_type typ
        ON
        pro.type_code = typ.type_code)
WHERE
    type_name != 'Mebeler'
    AND
    location_name = 'Laboratorium 2 M Informatika';

INSERT INTO
    tb_product(type_code, location_code, product_code, product_name, total)
VALUES(
    (SELECT
        b.type_code
    FROM
        tb_product a
    INNER JOIN
        tb_product b
    ON
        a.type_code = b.type_code AND
        a.location_code = b.location_code AND
        a.product_code = b.product_code AND
        a.product_name = b.product_name AND
        a.total = b.total 
    WHERE 
        a.product_name = 'Papan Tulis'),
    (SELECT
        b.location_code
    FROM
        tb_product a
    INNER JOIN
        tb_product b
    ON
        a.type_code = b.type_code AND
        a.location_code = b.location_code AND
        a.product_code = b.product_code AND
        a.product_name = b.product_name AND
        a.total = b.total 
    WHERE 
        a.product_name = 'Papan Tulis'),
    'AP005',
    'Spidol',
    (SELECT
        2*b.total
    FROM
        tb_product a
    INNER JOIN
        tb_product b
    ON
        a.type_code = b.type_code AND
        a.location_code = b.location_code AND
        a.product_code = b.product_code AND
        a.product_name = b.product_name AND
        a.total = b.total 
    WHERE 
        a.product_name = 'Papan Tulis'));

INSERT INTO
    tb_product(type_code, location_code, product_code, product_name, total)
VALUES(
    (SELECT
        type_code
    FROM
        tb_type
    WHERE
        type_name = 'Alat-alat elektronik'),
    (SELECT
        location_code
    FROM
        tb_location
    WHERE 
        location_name = 'Ruang Dosen M Informatika'),
    'EK0017',
    'Kabel',
    (SELECT
        SUM(b.total)
    FROM
        tb_product a
    INNER JOIN
        tb_product b
    ON
        a.type_code = b.type_code AND
        a.location_code = b.location_code AND
        a.product_code = b.product_code AND
        a.product_name = b.product_name AND
        a.total = b.total 
    WHERE 
        a.product_name = 'LCD Projector'));

UPDATE
    tb_product
SET
    total = (
        SELECT
            pro.total
        FROM
            (SELECT * FROM tb_product) as pro
        WHERE
            pro.product_name = 'Meja Komputer'
            AND
            location_code 
                IN
                (SELECT
                    loc.location_code
                FROM
                    tb_location loc
                WHERE 
                    loc.location_name = 'Laboratorium 1 M Informatika')
)
WHERE
    product_name = 'Komputer'
    AND
    location_code 
        IN
        (SELECT
            loc.location_code
        FROM
            tb_location loc
        WHERE 
            loc.location_name = 'Laboratorium 1 M Informatika');

UPDATE
    tb_product
SET
    total = (
        SELECT
            MIN(pro.total)
        FROM
            (SELECT * FROM tb_product) as pro
        WHERE
            pro.product_name = 'Meja Komputer'
)
WHERE
    product_name = 'Kursi Hidrolik'
    AND
    location_code 
        IN
        (SELECT
            loc.location_code
        FROM
            tb_location loc);

DELETE FROM
    tb_product_del
WHERE
    location_code
    IN
    (SELECT
        loc.location_code
    FROM
        tb_location loc
    WHERE 
        loc.location_name = 'Ruang Dosen M Informatika');

DELETE FROM
    tb_product_del
WHERE
    location_code
    IN
    (SELECT
        loc.location_code
    FROM
        tb_location loc
    WHERE 
        loc.location_name = 'Laboratorium 2 M Informatika')
    AND
    type_code
    IN
    (SELECT
        typ.type_code
    FROM
        tb_type typ
    WHERE 
        typ.type_name != 'Mebeler');