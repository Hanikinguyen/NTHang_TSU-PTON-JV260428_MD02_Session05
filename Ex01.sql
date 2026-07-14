-- [Bài tập] Sử dụng các hàm SQL thông dụng
CREATE TABLE students_Ss05 (
    student_id VARCHAR(10) PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    birth_year INT NOT NULL,
    gender VARCHAR(10) NOT NULL,
    score DECIMAL(4,2) NOT NULL
);
INSERT INTO students_Ss05 (student_id, full_name, birth_year, gender, score)
VALUES
('SV001', 'Nguyen Van An', 2003, 'Nam', 8.25),
('SV002', 'Tran Thi Binh', 2004, 'Nu', 7.80),
('SV003', 'Le Minh Anh', 2005, 'Nam', 9.15),
('SV004', 'Pham Thi Hoa', 2002, 'Nu', 6.95),
('SV005', 'Hoang Gia Bao', 2003, 'Nam', 8.60);

-- Hiển thị mã sinh viên và họ tên viết hoa toàn bộ
SELECT student_id,
       UPPER(full_name) AS full_name
FROM students_Ss05;

-- Hiển thị họ tên và số tuổi của sinh viên
SELECT full_name,
       YEAR(CURDATE()) - birth_year AS age
FROM students_Ss05;

-- Hiển thị điểm trung bình làm tròn 1 chữ số thập phân
SELECT full_name,
       ROUND(score, 1) AS average_score
FROM students_Ss05;

-- Hiển thị tổng số sinh viên, điểm cao nhất và điểm thấp nhất
SELECT
    COUNT(*) AS total_students,
    MAX(score) AS highest_score,
    MIN(score) AS lowest_score
FROM students_Ss05;