# 176. Second Highest Salary

Table: Employee

```
+-------------+------+ 
| Column Name | Type |
-------------+------+ 
| id          | int  |
| salary      | int  |
-------------+------+ 
```

id is the primary key (column with unique values) for this table.
Each row of this table contains information about the salary of an employee.

Write a solution to find the second highest distinct salary from the Employee table. If there is no second highest salary, return null (return None in Pandas).

The result format is in the following example.

Example 1:

Input: 
Employee table:
```
+----+--------+
| id | salary |
+----+--------+
| 1  | 100    |
| 2  | 200    |
| 3  | 300    |
+----+--------+
```
Output: 
```
+---------------------+
| SecondHighestSalary |
+---------------------+
| 200                 |
+---------------------+
```

Example 2:

Input: 
Employee table:
```
+----+--------+
| id | salary |
+----+--------+
| 1  | 100    |
+----+--------+
```
Output: 
```
+---------------------+
| SecondHighestSalary |
+---------------------+
| null                |
+---------------------+
```

Notes / hints:
- One common SQL solution (MySQL) uses a subquery with DISTINCT and LIMIT/OFFSET:

```
SELECT (
	SELECT DISTINCT salary
	FROM Employee
	ORDER BY salary DESC
	LIMIT 1 OFFSET 1
) AS SecondHighestSalary;
```

- Another approach uses a nested MAX to find the maximum salary less than the overall maximum:

```
SELECT
	(SELECT MAX(salary) FROM Employee WHERE salary < (SELECT MAX(salary) FROM Employee))
	AS SecondHighestSalary;
```

Both return NULL when there is no second distinct salary.

