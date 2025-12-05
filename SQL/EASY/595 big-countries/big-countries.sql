-- Write your MySQL query statement below
SELECT Class
FROM Courses
GROUP BY class HAVING COUNT(student) >= 5