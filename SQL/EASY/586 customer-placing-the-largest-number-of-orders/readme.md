# Customer Placing the Largest Number of Orders

## Problem Statement

Table: Orders

```
+-----------------+----------+
| Column Name     | Type     |
-----------------+----------+
| order_number    | int      |
| customer_number | int      |
-----------------+----------+
```

`order_number` is the primary key (column with unique values) for this table. This table contains information about the order ID and the customer ID.

Write a solution to find the `customer_number` for the customer who has placed the largest number of orders.

The test cases are generated so that exactly one customer will have placed more orders than any other customer.

Return the result table in any order.

## Example

**Input:**

Orders table:
```
+--------------+-----------------+
| order_number | customer_number |
+--------------+-----------------+
| 1            | 1               |
| 2            | 2               |
| 3            | 3               |
| 4            | 3               |
+--------------+-----------------+
```

**Output:**
```
+-----------------+
| customer_number |
+-----------------+
| 3               |
+-----------------+
```

Explanation: The customer with number 3 has two orders; all others have fewer.

## Follow-up

If more than one customer has the largest number of orders, you can return all such `customer_number` values. One approach uses window functions:

```sql
WITH counts AS (
  SELECT customer_number, COUNT(*) AS cnt
  FROM Orders
  GROUP BY customer_number
), ranked AS (
  SELECT customer_number, cnt, RANK() OVER (ORDER BY cnt DESC) AS r
  FROM counts
)
SELECT customer_number
FROM ranked
WHERE r = 1;
```

For the single-winner (original) problem you can use:

```sql
SELECT customer_number
FROM Orders
GROUP BY customer_number
ORDER BY COUNT(*) DESC
LIMIT 1;
```
