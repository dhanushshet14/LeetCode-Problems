# 183. Customers Who Never Order

## Problem Statement

Table: Customers

```
+-------------+---------+
| Column Name | Type    |
-------------+---------+
| id          | int     |
| name        | varchar |
-------------+---------+
```

- `id` is the primary key (column with unique values) for this table.
- Each row of this table indicates the ID and name of a customer.

Table: Orders

```
+-------------+------+ 
| Column Name | Type |
-------------+------+
| id          | int  |
| customerId  | int  |
-------------+------+
```

- `id` is the primary key for the Orders table.
- `customerId` is a foreign key referencing `Customers.id`.
- Each row of Orders indicates an order and the customer who made it.

Write a solution to find all customers who never order anything.

Return the result table in any order.

## Example

**Input:**

Customers table:
```
+----+-------+
| id | name  |
+----+-------+
| 1  | Joe   |
| 2  | Henry |
| 3  | Sam   |
| 4  | Max   |
+----+-------+
```

Orders table:
```
+----+------------+
| id | customerId |
+----+------------+
| 1  | 3          |
| 2  | 1          |
+----+------------+
```

**Output:**
```
+-----------+
| Customers |
+-----------+
| Henry     |
| Max       |
+-----------+
```

## Solution (SQL)

Use a LEFT JOIN to find customers without matching orders, or NOT EXISTS for a correlated subquery.

Left join approach:

```sql
SELECT c.name AS Customers
FROM Customers c
LEFT JOIN Orders o ON c.id = o.customerId
WHERE o.id IS NULL;
```

Not exists approach:

```sql
SELECT name AS Customers
FROM Customers c
WHERE NOT EXISTS (
  SELECT 1 FROM Orders o WHERE o.customerId = c.id
);
```

Both return customers who never placed an order.
