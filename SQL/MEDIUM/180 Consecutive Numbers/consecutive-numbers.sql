-- code for the SQL problem "Consecutive Numbers"

-- Write your MySQL query statement below
SELECT DISTINCT a.Num as ConsecutiveNums FROM Logs a
JOIN Logs b ON a.Id=b.Id + 1 AND a.Num = b.Num
JOIN Logs c ON a.Id = c.Id + 2 AND a.Num = c.Num