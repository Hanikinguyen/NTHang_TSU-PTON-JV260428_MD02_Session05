-- [Bài tập] Truy vấn lồng (SubQuery)
SELECT * FROM products6;
-- Hiển thị các sản phẩm có: giá cao hơn giá trung bình của tất cả sản phẩm
SELECT * FROM products6
WHERE price > (
    SELECT AVG(price)
    FROM products6
);
-- Hiển thị sản phẩm có: giá cao nhất trong từng loại sản phẩm
SELECT * FROM products6 p1
WHERE price = (
    SELECT MAX(price)
    FROM products6 p2
    WHERE p1.category = p2.category
);
-- Hiển thị các sản phẩm thuộc loại: có ít nhất một sản phẩm giá trên 20.000.000
SELECT * FROM products6
WHERE category IN (
    SELECT DISTINCT category
    FROM products6
    WHERE price > 20000000
);