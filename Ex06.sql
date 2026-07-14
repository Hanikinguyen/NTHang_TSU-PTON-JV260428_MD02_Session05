-- [Bài tập] Phân tích doanh thu bán hàng
-- Hiển thị mã đơn hàng, tên khách hàng, tổng tiền của đơn hàng
SELECT
    o.order_id,
    c.customer_name,
    SUM(oi.quantity * oi.price) AS total_amount
FROM Orders_ss05 o
JOIN Customers c
ON o.customer_id = c.customer_id
JOIN Order_itemsss05 oi
ON o.order_id = oi.order_id
GROUP BY
    o.order_id,
    c.customer_name;
    
-- Tính tổng doanh thu của mỗi khách hàng
SELECT
    c.customer_id,
    c.customer_name,
    SUM(oi.quantity * oi.price) AS total_revenue
FROM Customers c
JOIN orders_ss05 o
ON c.customer_id = o.customer_id
JOIN Order_itemsss05 oi
ON o.order_id = oi.order_id
GROUP BY
    c.customer_id,
    c.customer_name;
    
-- Chỉ hiển thị các khách hàng có tổng doanh thu lớn hơn 20.000.000
SELECT
    c.customer_id,
    c.customer_name,
    SUM(oi.quantity * oi.price) AS total_revenue
FROM Customers c
JOIN Orders_ss05 o
ON c.customer_id = o.customer_id
JOIN Order_itemsss05 oi
ON o.order_id = oi.order_id
GROUP BY
    c.customer_id,
    c.customer_name
HAVING SUM(oi.quantity * oi.price) > 20000000;

-- Hiển thị khách hàng có doanh thu cao nhất
SELECT
    c.customer_id,
    c.customer_name,
    SUM(oi.quantity * oi.price) AS total_revenue
FROM Customers c
JOIN Orders_ss05 o
ON c.customer_id = o.customer_id
JOIN Order_itemsss05 oi
ON o.order_id = oi.order_id
GROUP BY
    c.customer_id,
    c.customer_name
HAVING SUM(oi.quantity * oi.price) = (
    SELECT MAX(total_revenue)
    FROM (
        SELECT
            SUM(oi.quantity * oi.price) AS total_revenue
        FROM Orders_ss05 o
        JOIN Order_itemsss05 oi
        ON o.order_id = oi.order_id
        GROUP BY o.customer_id
    ) AS temp
);
