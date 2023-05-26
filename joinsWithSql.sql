/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */

/*SELECT * FROM Products
LEFT JOIN Categories
ON Products.CategoryID = Categories.CategoryID
WHERE Categories.Name = 'Computers';*/

SELECT P.Name, C.Name
FROM Products AS P
INNER JOIN Categories AS C
ON C.CategoryID = P.CategoryID
WHERE C.Name = 'Computers';

 
/* joins: find all product names, product prices, and products ratings that have a rating of 5 */

/*SELECT P.Name, P.Price, R.Rating FROM Products AS P
INNER JOIN Reviews AS R ON R.ProductID = P.ProductID
WHERE R.Rating = 5;*/

/*SELECT Products.Name AS 'Product Names', Products.Price AS 'Product Prices', Reviews.Rating AS 'Product Rating Of 5' FROM Products
INNER JOIN Reviews ON Reviews.ProductID = Products.ProductID
WHERE Reviews.Rating = 5;*/

 
/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */

SELECT SUM(Sales.Quantity) AS 'TotalSales', Sales.EmployeeID, Employees.FirstName, Employees.LastName FROM Sales
INNER JOIN Employees ON Sales.EmployeeID = Employees.EmployeeID
GROUP BY Employees.EmployeeID
ORDER BY TotalSales Desc
LIMIT 2;


/* joins: find the name of the department, and the name of the category for Appliances and Games */


select Departments.Name AS 'Department Name', Categories.Name AS 'Category Name' FROM Departments
INNER JOIN Categories ON departments.departmentID = Categories.departmentID
WHERE categories.Name = 'Appliances' OR categories.Name = 'Games';





/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */

/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */


-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return:
-  the employeeID
-  the employee's first and last name
-  the name of each product
-  and how many of that product they sold */