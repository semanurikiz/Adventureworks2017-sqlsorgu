SELECT c.CustomerID, p.FirstName, p.LastName
FROM Sales.SalesOrderHeader c
JOIN Person.Person p ON c.CustomerID = p.BusinessEntityID
WHERE LEN(p.LastName) < 5; 



SELECT 
    p.BusinessEntityID,
    p.FirstName + ' ' + p.LastName AS EmployeeName,
    e.HireDate,
    d.Name AS DepartmentName
FROM 
    HumanResources.Employee e
JOIN 
    Person.Person p ON e.BusinessEntityID = p.BusinessEntityID
JOIN 
    HumanResources.EmployeeDepartmentHistory edh ON e.BusinessEntityID = edh.BusinessEntityID
JOIN 
    HumanResources.Department d ON edh.DepartmentID = d.DepartmentID
ORDER BY 
    e.HireDate DESC;




	SELECT
    e.JobTitle,
    COUNT(DISTINCT soh.CustomerID) AS CustomerCount
FROM
    HumanResources.Employee e
INNER JOIN
    Sales.SalesOrderHeader soh ON e.BusinessEntityID = soh.SalesPersonID
GROUP BY
    e.JobTitle
ORDER BY
    CustomerCount DESC;

