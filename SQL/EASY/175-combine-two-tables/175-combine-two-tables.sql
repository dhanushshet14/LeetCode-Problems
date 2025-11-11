-- code for the SQL problem "Combine Two Tables" with excution speed of 319ms

SELECT Person.firstName,Person.lastName,Address.city,Address.state
FROM Person 
LEFT JOIN Address
ON Person.personId = Address.personId;
