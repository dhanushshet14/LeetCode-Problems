# 181. Employees Earning More Than Their Managers

## Problem Statement

Table: Employee

```
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| name        | varchar |
| salary      | int     |
| managerId   | int     |
+-------------+---------+
```

- `id` is the primary key (column with unique values) for this table.
- Each row of this table indicates the ID of an employee, their name, salary, and the ID of their manager.

Write a solution to find the employees who earn more than their managers.

Return the result table in any order.

## Example

**Input:**

Employee table:
```
+----+-------+--------+-----------+
| id | name  | salary | managerId |
+----+-------+--------+-----------+
| 1  | Joe   | 70000  | 3         |
| 2  | Henry | 80000  | 4         |
| 3  | Sam   | 60000  | Null      |
| 4  | Max   | 90000  | Null      |
+----+-------+--------+-----------+
```

**Output:**
```
+----------+
| Employee |
+----------+
| Joe      |
+----------+
```

## Explanation

Joe is the only employee who earns more than his manager (Sam).

## Solution Approach

Use a self-join to compare each employee's salary with their manager's salary:

```sql
SELECT e1.name AS Employee
FROM Employee e1
JOIN Employee e2 ON e1.managerId = e2.id
WHERE e1.salary > e2.salary;
```

This query:
1. Joins the Employee table with itself (e1 = employee, e2 = manager)
2. Matches employees with their managers using the managerId
3. Filters for cases where the employee earns more than their manager
