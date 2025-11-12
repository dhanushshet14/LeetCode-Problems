# 182. Duplicate Emails

## Problem Statement

Table: Person

```
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| email       | varchar |
+-------------+---------+
```

- `id` is the primary key (column with unique values) for this table.
- Each row of this table contains an email. The emails will not contain uppercase letters.

Write a solution to report all the duplicate emails. Note that it's guaranteed that the `email` field is not NULL.

Return the result table in any order.

## Example

**Input:**

Person table:
```
+----+---------+
| id | email   |
+----+---------+
| 1  | a@b.com |
| 2  | c@d.com |
| 3  | a@b.com |
+----+---------+
```

**Output:**
```
+---------+
| Email   |
+---------+
| a@b.com |
+---------+
```

Explanation: `a@b.com` is repeated two times.

## Solution (SQL)

You can find duplicate emails by grouping on `email` and keeping only groups with count > 1:

```sql
SELECT email AS Email
FROM Person
GROUP BY email
HAVING COUNT(*) > 1;
```

This returns each duplicate email once (order may vary).

## Notes

- The `email` column is guaranteed not to be NULL, so no NULL handling is required.
- The result can be returned in any order; use `ORDER BY` if you need deterministic output.
