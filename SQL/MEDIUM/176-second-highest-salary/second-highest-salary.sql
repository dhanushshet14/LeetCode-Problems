-- code for the SQL problem "SECOND HIGHEST SALARY" with excution speed of 319ms

SELECT IFNULL((
    SELECT DISTINCT salary
    FROM Employee
    ORDER BY salary DESC
    LIMIT 1 OFFSET 1), NULL) AS SecondHighestSalary 