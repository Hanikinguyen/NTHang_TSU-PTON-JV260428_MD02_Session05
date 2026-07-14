-- [Bài tập] Group by và Having
-- Thống kê: mỗi phòng ban có bao nhiêu nhân viên
SELECT department,
       COUNT(*) AS total_employees
FROM employees
GROUP BY department;
-- Tính: mức lương trung bình của từng phòng ban
SELECT department,
       AVG(salary) AS average_salary
FROM employees
GROUP BY department;
-- Chỉ hiển thị: các phòng ban có trên 3 nhân viên
SELECT department,
       COUNT(*) AS total_employees
FROM employees
GROUP BY department
HAVING COUNT(*) > 3;
-- Chỉ hiển thị: các phòng ban có lương trung bình lớn hơn 12.000.000
SELECT department,
       AVG(salary) AS average_salary
FROM employees
GROUP BY department
HAVING AVG(salary) > 12000000;

