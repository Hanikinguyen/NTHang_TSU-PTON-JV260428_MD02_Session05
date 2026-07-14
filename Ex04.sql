-- [Bài tập] Truy vấn dữ liệu trên nhiều bảng
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL
);
CREATE TABLE Orders_ss05 (
    order_id INT PRIMARY KEY,
    order_date DATE NOT NULL,
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);
CREATE TABLE Order_itemsss05 (
    order_id INT,
    product_name VARCHAR(100) NOT NULL,
    quantity INT NOT NULL,
    price DECIMAL(15,2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES Orders_ss05(order_id)
);

INSERT INTO Customers (customer_id, customer_name)
VALUES
(1, 'Nguyen Van A'),
(2, 'Tran Thi B'),
(3, 'Le Van C');
INSERT INTO Orders_ss05 (order_id, order_date, customer_id)
VALUES
(101, '2025-07-01', 1),
(102, '2025-07-02', 2),
(103, '2025-07-03', 1);
INSERT INTO Order_itemsss05 (order_id, product_name, quantity, price)
VALUES
(101, 'Laptop', 1, 15000000),
(101, 'Mouse', 2, 300000),
(102, 'Keyboard', 1, 800000),
(102, 'Monitor', 2, 3500000),
(103, 'Headphone', 3, 1200000);
-- Hiển thị mã đơn hàng, ngày đặt hàng, tên khách hàng
SELECT
    o.order_id,
    o.order_date,
    c.customer_name
FROM Orders_ss05 o
JOIN Customers c
ON o.customer_id = c.customer_id;

-- Hiển thị danh sách sản phẩm trong mỗi đơn hàng
SELECT
    o.order_id,
    oi.product_name,
    oi.quantity,
    oi.price
FROM Orders_ss05 o
JOIN Order_itemsss05 oi
ON o.order_id = oi.order_id;

-- Tính tổng tiền của mỗi đơn hàng
SELECT
    o.order_id,
    o.order_date,
    c.customer_name,
    SUM(oi.quantity * oi.price) AS total_amount
FROM Orders_ss05 o
JOIN Customers c
ON o.customer_id = c.customer_id
JOIN Order_itemsss05 oi
ON o.order_id = oi.order_id
GROUP BY
    o.order_id,
    o.order_date,
    c.customer_name;
-- Hiển thị các đơn hàng có tổng tiền lớn hơn 10.000.000
SELECT
    o.order_id,
    o.order_date,
    c.customer_name,
    SUM(oi.quantity * oi.price) AS total_amount
FROM Orders_ss05 o
JOIN Customers c
ON o.customer_id = c.customer_id
JOIN Order_itemsss05 oi
ON o.order_id = oi.order_id
GROUP BY
    o.order_id,
    o.order_date,
    c.customer_name
HAVING SUM(oi.quantity * oi.price) > 10000000;