-- [Bài tập] Thống kê kết quả học tập sinh viên
CREATE TABLE scores (
    student_id INT,
    subject VARCHAR(100),
    score DECIMAL(4,2)
);
INSERT INTO scores (student_id, subject, score)
VALUES
(1, 'Toan', 8),
(1, 'Ly', 7),
(1, 'Hoa', 9),

(2, 'Toan', 6),
(2, 'Ly', 6.5),
(2, 'Hoa', 7),

(3, 'Toan', 9),
(3, 'Ly', 9.5),
(3, 'Hoa', 8.5),

(4, 'Toan', 7),
(4, 'Ly', 7),
(4, 'Hoa', 7);
-- Tính điểm trung bình của mỗi sinh viên
SELECT
    student_id,
    AVG(score) AS average_score
FROM scores
GROUP BY student_id;

-- Chỉ hiển thị các sinh viên có điểm trung bình ≥ 7.0
SELECT
    student_id,
    AVG(score) AS average_score
FROM scores
GROUP BY student_id
HAVING AVG(score) >= 7.0;

-- Hiển thị sinh viên có điểm trung bình cao nhất trong toàn bộ danh sách
SELECT
    student_id,
    AVG(score) AS average_score
FROM scores
GROUP BY student_id
HAVING AVG(score) = (
    SELECT MAX(avg_score)
    FROM (
        SELECT AVG(score) AS avg_score
        FROM scores
        GROUP BY student_id
    ) AS temp
);

-- Hiển thị các sinh viên có điểm trung bình cao hơn điểm trung bình chung của tất cả sinh viên
SELECT AVG(score) FROM scores;
SELECT
    student_id,
    AVG(score) AS average_score
FROM scores
GROUP BY student_id
HAVING AVG(score) > (
    SELECT AVG(score)
    FROM scores
);