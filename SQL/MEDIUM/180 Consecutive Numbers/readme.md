# 180. Consecutive Numbers

Table: Logs

```
+-------------+---------+
| Column Name | Type    |
-------------+---------+
| id          | int     |
| num         | varchar |
-------------+---------+
```

In SQL, `id` is the primary key for this table.
`id` is an autoincrement column starting from 1.

Find all numbers that appear at least three times consecutively.

Return the result table in any order.

The result format is in the following example.

Example 1:

Input: 
Logs table:
```
+----+-----+
| id | num |
+----+-----+
| 1  | 1   |
| 2  | 1   |
| 3  | 1   |
| 4  | 2   |
| 5  | 1   |
| 6  | 2   |
| 7  | 2   |
+----+-----+
```
Output: 
```
+-----------------+
| ConsecutiveNums |
+-----------------+
| 1               |
+-----------------+
```
Explanation: 1 is the only number that appears consecutively for at least three times.

---

Hint / Example Solutions:

1) A straightforward (portable) approach uses self-joins comparing consecutive ids:

```
SELECT DISTINCT l1.num AS ConsecutiveNums
FROM Logs l1
JOIN Logs l2 ON l2.id = l1.id + 1 AND l2.num = l1.num
JOIN Logs l3 ON l3.id = l1.id + 2 AND l3.num = l1.num;
```

2) Using window functions (MySQL 8+, PostgreSQL, etc.) you can use LAG/LEAD to check neighbors:

```
SELECT DISTINCT num AS ConsecutiveNums
FROM (
	SELECT num,
				 LAG(num,1) OVER (ORDER BY id) AS prev1,
				 LAG(num,2) OVER (ORDER BY id) AS prev2
	FROM Logs
) t
WHERE num = prev1 AND num = prev2;
```

Both queries return the numbers that appear at least three times consecutively.

