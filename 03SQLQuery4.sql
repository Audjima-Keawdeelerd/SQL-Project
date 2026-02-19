--1.แสดงจำนวนลูกค้าทั้งหมด
SELECT count(customer_id) as total_customer
FROM customers;

--2.มีออเดอร์ทั้งหมดกี่ออเดอร์
SELECT count(order_id) as total_order
FROM orders;

--3.มีกี่ product category
SELECT product_category, count(order_item_id) as total_orderItem
FROM order_items
group by product_category;

--4.
select sum(total_amount) as ยอดขายรวมทั้งหมดของบริษัท
from order_items;

--5.
SELECT c.customer_name,
       SUM(oi.total_amount) AS ยอดเงินรวม
FROM customers AS c
INNER JOIN orders AS o
    ON c.customer_id = o.customer_id
INNER JOIN order_items AS oi
    ON o.order_id = oi.order_id
GROUP BY c.customer_name;

--6.ลูกค้าที่ใช้เงินมากสุด TOP 5
select top(5) c.customer_id,c.customer_name, sum(oi.total_amount) As ยอดรวม
from customers as c
inner join orders as o
on c.customer_id = o.customer_id
inner join order_items as oi
on o.order_id = oi.order_id
group by c.customer_id, c.customer_name;

--7.หมวดสินค้าที่ทำเงินมากสุด
select top(1)product_category, sum(total_amount) as ยอดรวม
from order_items
group by product_category;

--8.แต่ละออเดอร์มีมูลค่ารวมกี่บาท
SELECT o.order_id,SUM(oi.total_amount) AS order_value
FROM orders o
JOIN order_items oi
    ON o.order_id = oi.order_id
GROUP BY o.order_id
ORDER BY o.order_id;

--9.ค่าใช้จ่ายเฉลี่ยต่อออเดอร์
SELECT AVG(order_total) AS avg_order_value
FROM (
    SELECT 
        order_id,
        SUM(total_amount) AS order_total
    FROM order_items
    GROUP BY order_id
) t;

--10.ลูกค้าแต่ละคนมีกี่ออเดอร์
SELECT c.customer_id, c.customer_name, COUNT(o.order_id) AS total_orders
FROM customers AS c
LEFT JOIN orders AS o
ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name
ORDER BY total_orders DESC;

--11.รายได้รวมต่อเดือน
SELECT  
    FORMAT(o.purchase_date,'yyyy-MM') AS order_month,
    SUM(oi.total_amount) AS revenue
FROM orders AS o
JOIN order_items AS oi
ON o.order_id = oi.order_id
GROUP BY FORMAT(o.purchase_date,'yyyy-MM')
ORDER BY order_month;

--12.ออเดอร์ที่มูลค่าเกิน 5000
SELECT o.order_id, SUM(oi.total_amount) AS total_value
FROM orders AS o
JOIN order_items AS oi
ON o.order_id = oi.order_id
GROUP BY o.order_id
HAVING SUM(oi.total_amount) > 5000;

--13.สินค้าที่ขายได้มากที่สุด
SELECT TOP(1) product_category, SUM(quantity) AS total_sold
FROM order_items
GROUP BY product_category
ORDER BY total_sold DESC;

--14.ลูกค้าที่ไม่เคยสั่งซื้อ
SELECT c.customer_id, c.customer_name
FROM customers AS c
LEFT JOIN orders AS o
ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;

--15.มูลค่ารวมต่อหมวดสินค้าต่อเดือน
SELECT oi.product_category,
FORMAT(o.purchase_date, 'yyyy-MM') AS month,
SUM(oi.total_amount) AS revenue
FROM order_items AS oi
JOIN orders AS o
ON oi.order_id = o.order_id
GROUP BY oi.product_category, FORMAT(o.purchase_date, 'yyyy-MM')
ORDER BY month;













