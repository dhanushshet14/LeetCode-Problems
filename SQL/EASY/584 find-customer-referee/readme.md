# 584. Find Customer Referee

## Problem Statement

Table: Customer

```
+-------------+---------+
| Column Name | Type    |
-------------+---------+
| id          | int     |
| name        | varchar |
| referee_id  | int     |
-------------+---------+
```

In SQL, `id` is the primary key column for this table. Each row indicates the id of a customer, their name, and the id of the customer who referred them (`referee_id`).

Find the names of the customers that are either:

- referred by any customer with `id != 2`, or
- not referred by any customer (`referee_id` is NULL).

Return the result table in any order.

## Example

**Input:**

Customer table:
```
+----+------+------------+
| id | name | referee_id |
----+------+------------+
| 1  | Will | null       |
| 2  | Jane | null       |
| 3  | Alex | 2          |
| 4  | Bill | null       |
| 5  | Zack | 1          |
| 6  | Mark | 2          |
----+------+------------+
```

**Output:**
```
+------+
| name |
------+
| Will |
| Jane |
| Bill |
| Zack |
------+
```

## Explanation

- `Will`, `Jane`, and `Bill` are not referred by anyone (`referee_id` is NULL).
- `Zack` is referred by `1` (which is not `2`), so he is included.
- `Alex` and `Mark` are referred by customer `2`, so they are excluded.

## Solution (SQL)

Select customers whose `referee_id` is NULL or not equal to 2:

```sql
SELECT name
FROM Customer
WHERE referee_id IS NULL OR referee_id <> 2;
```

This returns every customer who either has no referrer or whose referrer has an id other than 2. Order is not guaranteed; add `ORDER BY` if needed.
