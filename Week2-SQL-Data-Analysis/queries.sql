USE week2_sales;

-- 1. BASIC QUERIES
SELECT * FROM customers;

SELECT * FROM orders
WHERE quantity > 2;

SELECT * FROM orders
ORDER BY unit_price DESC;

SELECT order_id, product, category, quantity, unit_price
FROM orders
WHERE category = 'Electronics';

-- 2. AGGREGATIONS
SELECT ROUND(SUM(quantity * unit_price),2) AS total_revenue
FROM orders;

SELECT ROUND(AVG(quantity * unit_price),2) AS average_order_value
FROM orders;

SELECT COUNT(*) AS total_orders FROM orders;

SELECT SUM(quantity) AS total_quantity_sold FROM orders;

-- 3. GROUP BY
SELECT category, ROUND(SUM(quantity * unit_price),2) AS revenue
FROM orders
GROUP BY category
ORDER BY revenue DESC;

SELECT category, COUNT(*) AS order_count
FROM orders
GROUP BY category
ORDER BY order_count DESC;

SELECT category, ROUND(AVG(quantity * unit_price),2) AS average_order_value
FROM orders
GROUP BY category
ORDER BY average_order_value DESC;

-- 4. JOIN
SELECT c.customer_name, c.city, o.order_id, o.product,
       o.category, o.quantity, o.unit_price,
       ROUND(o.quantity * o.unit_price,2) AS order_value
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
ORDER BY o.order_id;

-- 5. TOP CUSTOMERS
SELECT c.customer_id, c.customer_name,
       ROUND(SUM(o.quantity * o.unit_price),2) AS total_spent
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name
ORDER BY total_spent DESC
LIMIT 5;

-- 6. SUBQUERY: ABOVE-AVERAGE CUSTOMERS
SELECT c.customer_name,
       ROUND(SUM(o.quantity * o.unit_price),2) AS total_spent
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name
HAVING SUM(o.quantity * o.unit_price) >
(
    SELECT AVG(customer_total)
    FROM (
        SELECT SUM(quantity * unit_price) AS customer_total
        FROM orders
        GROUP BY customer_id
    ) AS totals
)
ORDER BY total_spent DESC;

-- 7. CASE STATEMENT
SELECT order_id,
       ROUND(quantity * unit_price,2) AS order_value,
       CASE
           WHEN quantity * unit_price >= 50000 THEN 'High Value'
           WHEN quantity * unit_price >= 10000 THEN 'Medium Value'
           ELSE 'Low Value'
       END AS order_value_category
FROM orders
ORDER BY order_value DESC;

-- 8. YEARLY SALES
SELECT YEAR(order_date) AS order_year,
       ROUND(SUM(quantity * unit_price),2) AS yearly_revenue
FROM orders
GROUP BY YEAR(order_date)
ORDER BY order_year;

-- 9. ASSIGNMENT: TOP CUSTOMERS
SELECT c.customer_name,
       ROUND(SUM(o.quantity * o.unit_price),2) AS total_spent
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name
ORDER BY total_spent DESC
LIMIT 5;

-- 10. ASSIGNMENT: AVERAGE ORDER VALUE
SELECT ROUND(AVG(quantity * unit_price),2) AS average_order_value
FROM orders;
