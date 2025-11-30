CREATE TABLE sales_sample (
    product_id    INT,
    region        VARCHAR(50),
    date          DATE,
    sales_amount  NUMERIC
);


INSERT INTO sales_sample (product_id, region, date, sales_amount) VALUES
(1, 'East',  '2025-01-01', 1000),
(1, 'West',  '2025-01-01',  800),
(2, 'East',  '2025-01-02', 1200),
(2, 'North', '2025-01-02',  900),
(3, 'South', '2025-01-03', 1500),
(1, 'East',  '2025-01-03',  700),
(3, 'West',  '2025-01-04', 1100),
(2, 'South', '2025-01-04',  950),
(1, 'North', '2025-01-05', 1300),
(3, 'East',  '2025-01-05', 1600);

SELECT
    region,
    product_id,
    SUM(sales_amount) AS total_sales
FROM sales_sample
GROUP BY region, product_id
ORDER BY region, product_id;

SELECT
    region,
    SUM(sales_amount) AS total_sales
FROM sales_sample
GROUP BY region
ORDER BY region;


SELECT
    region,
    SUM(sales_amount) AS total_sales
FROM sales_sample
GROUP BY ROLLUP (region)
ORDER BY region;


SELECT
    product_id,
    region,
    date,
    SUM(sales_amount) AS total_sales
FROM sales_sample
GROUP BY CUBE (product_id, region, date)
ORDER BY product_id, region, date;


SELECT
    product_id,
    region,
    date,
    sales_amount
FROM sales_sample
WHERE region = 'East'
  AND date BETWEEN '2025-01-01' AND '2025-01-03'
ORDER BY date, product_id;


SELECT
    product_id,
    region,
    date,
    sales_amount
FROM sales_sample
WHERE product_id IN (1, 3)
  AND region IN ('East', 'West')
  AND date BETWEEN '2025-01-01' AND '2025-01-05'
ORDER BY product_id, region, date;




