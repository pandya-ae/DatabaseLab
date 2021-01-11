/* Using sample database */
/* Number 1 */
DELIMITER $$
CREATE PROCEDURE price_increase (
    IN productCategory INT(255),
    IN percentageIncrease INT(255)
)
BEGIN
    UPDATE products
    SET buyPrice = buyPrice * (1 + percentageIncrease / 100)
    WHERE productLine = productCategory;
END $$
DELIMITER ;
    
/* Number 2 */
DELIMITER $$
CREATE PROCEDURE orderReport (
    IN charString VARCHAR(255),
    IN monthInput INT(2),
    IN yearInput INT(4),
    OUT reportResult INT(255)
)
BEGIN
    SELECT COUNT(*) as amount
    INTO reportResult
    FROM orders
    INNER JOIN customers
        ON customers.customerNumber = orders.customerNumber
    WHERE MONTH(orderDate) = monthInput AND YEAR(orderDate) = yearInput AND customerName LIKE CONCAT('%',charString,'%');
END $$
DELIMITER ;

/* Number 3 */
DELIMITER $$
CREATE PROCEDURE limit_change (
    IN countryInput VARCHAR(255),
    IN percentageChange INT(255) /* If decrease, it will be negative */
)
BEGIN
    UPDATE customers
    SET creditLimit = creditLimit * (1 + percentageChange / 100)
    WHERE country = countryInput;
END $$
DELIMITER ;