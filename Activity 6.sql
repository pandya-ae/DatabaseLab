SELECT
    name,
    product_code,
    product_name
FROM
    distributor as di
INNER JOIN
    product as pr
ON
    di.distributor_code = pr.distributor_code
ORDER BY
    name ASC;
	
SELECT 
    name, 
    city, 
    address
FROM 
    distributor
WHERE 
    distributor_code 
    NOT IN 
    (SELECT 
        distributor_code
    FROM product);

SELECT 
    distributor.distributor_code, 
    name, 
    COUNT(product.distributor_code) AS frequency
FROM 
    distributor 
LEFT JOIN 
    product 
ON
    distributor.distributor_code=product.distributor_code
GROUP BY 
    distributor_code
ORDER BY 
    frequency DESC;
	
SELECT 
    distributor.distributor_code, 
    name, 
    COUNT(product.distributor_code) AS frequency
FROM 
    distributor 
RIGHT JOIN 
    product 
ON
    distributor.distributor_code = product.distributor_code
GROUP BY 
    distributor_code
ORDER BY 
    frequency ASC;
	
SELECT 
    distributor_code 
FROM 
    product
UNION ALL
SELECT 
    distributor_code 
FROM 
    distributor;