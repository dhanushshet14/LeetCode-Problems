# 577. Employee Bonus

## Problem Statement

Table: Employee

```
+-------------+---------+
| Column Name | Type    |
-------------+---------+
| empId       | int     |
| name        | varchar |
| supervisor  | int     |
| salary      | int     |
-------------+---------+
```

- `empId` is the column with unique values for this table.
- Each row of this table indicates the name and the ID of an employee in addition to their salary and the id of their manager.

Table: Bonus

```
+-------------+------+ 
| Column Name | Type |
-------------+------+
| empId       | int  |
| bonus       | int  |
-------------+------+
```

- `empId` is the column of unique values for this table and a foreign key referencing `Employee.empId`.
- Each row of this table contains the id of an employee and their respective bonus.

Write a solution to report the name and bonus amount of each employee with a bonus less than 1000.

Return the result table in any order.

## Example

**Input:**

Employee table:
```
+-------+--------+------------+--------+
| empId | name   | supervisor | salary |
+-------+--------+------------+--------+
| 3     | Brad   | null       | 4000   |
| 1     | John   | 3          | 1000   |
| 2     | Dan    | 3          | 2000   |
| 4     | Thomas | 3          | 4000   |
+-------+--------+------------+--------+
```

Bonus table:
```
+-------+-------+
| empId | bonus |
+-------+-------+
| 2     | 500   |
| 4     | 2000  |
+-------+-------+
```

**Output:**
```
+------+-------+
| name | bonus |
+------+-------+
| Brad | null  |
| John | null  |
| Dan  | 500   |
+------+-------+
```

Explanation: Brad and John have no corresponding row in Bonus so their bonus is `NULL`. Dan has a bonus less than 1000 and is included. Thomas has a bonus >= 1000 so is excluded.

## Solution (SQL)

Use a LEFT JOIN to include employees without a Bonus row, then filter on bonus < 1000 or NULL:

```sql
SELECT e.name, b.bonus
FROM Employee e
LEFT JOIN Bonus b ON e.empId = b.empId
WHERE b.bonus < 1000 OR b.bonus IS NULL;
```

This returns employees with a bonus less than 1000 and those with no bonus row (NULL).
